$EmailFrom = "DoNotReply@scribestar.com"
$EmailTo = "Scribestar-Infrastructure@scribestar.com"
$ErrorActionPref = "stop"
$SMTPServer = "smtp-relay.gmail.com"

$MyDateTime = Get-Date -UFormat %Y:%m:%d:%H:%M:%S
$Year = $MyDatetime.Split(":")[0]; $Month = $MyDateTime.Split(":")[1]; $Day = $MyDateTime.Split(":")[2]
$Hour = $MyDateTime.Split(":")[3]; $Minute = $MyDateTime.Split(":")[4]; $Second = $MyDateTime.Split(":")[5]
$StartDateTime = Get-Date

$NewVMErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NewVMErrorLogs\$Year\$Month\$Day\"
$NewVMErrorLog = "$NewVMErrorPath\NewVMError-$Hour.$Minute.$Second.log"

$NetworkLabelErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NetworkLabelErrorLogs\$Year\$Month\$Day\"
$NetworkLabelErrorLog = "$NetworkLabelErrorPath\NetworkLabelError-$Hour.$Minute.$Second.log"

$NetworkInterfaceErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NetworkInterfaceErrorLogs\$Year\$Month\$Day\"
$NetworkInterfaceErrorLog = "$NetworkInterfaceErrorPath\NetworkInterfaceError-$Hour.$Minute.$Second.log"

$StartVMErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\StartVMErrorLogs\$Year\$Month\$Day\"
$StartVMErrorLog = "$StartVMErrorPath\StartVMError-$Hour.$Minute.$Second.log"

$NewVMHardDiskErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NewVMHardDiskErrorLogs\$Year\$Month\$Day\"
$NewVMHardDiskErrorLog = "$NewVMHardDiskErrorPath\NewVMHardDiskError-$Hour.$Minute.$Second.log"

Function New-ScribestarVM([string] $Name = $null, [string] $Datastore = $null, [string] $Template = $null, [string] $Location = $null, [string] $ResourcePool = $null) {
    if (-not($Name)) { Write-Host "No name provided"; break }
    if (-not($Datastore)) { Write-Host "No datastore provided"; break } 
    if (-not($Template)) { Write-Host "No template provided"; break }
    if (-not($Location)) { Write-Host "No location provided"; break }
    if (-not($ResourcePool)) { Write-Host "No resource pool provided"; break }

    try {
        if(-not(Get-Folder $Location -ErrorAction $ErrorActionPref)){New-Folder $Location -Location VM} ##Creates the folder location within VM if it does not exist
        New-VM -Name $Name -ResourcePool $ResourcePool -Template $Template -Datastore $Datastore -Location $Location -ErrorAction $ErrorActionPref
    } catch {
        $Name + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $NewVMErrorLog -Append
        $Name + "$FailedItem = $_.Exception.ItemName" | Out-File -FilePath $NewVMErrorLog  -Append
        Send-ErrorEmail "VM Creation Error" $NewVMErrorLog
    }
}

Function Set-ScribestarNetwork ([string] $VMName = $null, [string] $Network = $null) {

    if (-not($VMName)) {Write-Host "No VMName provided"; break }
    if (-not($Network)) {Write-Host "No Network provded"; break }

    try {
        Get-VM $VMName | Get-NetworkAdapter | Set-NetWorkAdapter -NetworkName $Network -Confirm:$false -ErrorAction $ErrorActionPref
    } catch {
        $Network + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $NetworkLabelErrorLog -Append
        $Network + "$FailedItem = $_.Exception.ItemName" | Out-File -FilePath $NetworkLabelErrorLog -Append
        Send-ErrorEmail "Network Label Error" $NetworkLabelErrorLog
    }
}

Function New-ScribestarHardDisk([string] $Name = $null, [string] $CapacityGB = $null, [switch] $Thick) {
    if (-not($Name)) { Write-Host "No name provided"; break }
    if (-not($CapacityGB)) { Write-Host "No disk capacity (GB) provided"; break }
    
    # default to thin disks
    if ($Thick) { $StorageFormat = "Thick" }
    else { $StorageFormat = "Thin" }

    try {
        New-HardDisk -VM $Name -CapacityGB $CapacityGB -StorageFormat $StorageFormat -Persistence Persistent -ErrorAction $ErrorActionPref
    } catch {
        $Name + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $NewHardDiskErrorLog -Append
        $Name + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $NewHardDiskErrorLog -Append

        Send-ErrorEmail "New Hard Disk Error" $NewHardDiskErrorLog
    }
}

Function Import-ScribestarRole([string] $RoleFile) {

    $RoleData = Import-Csv $RoleFile -Delimiter "|" -ErrorAction $ErrorActionPref

    $RoleData
}

Function Get-ScribestarRemoteDiskSetupScript([string] $Name) {

    $ScriptText = @"
        $Computerinfo = Get-WmiObject -Class Win32_ComputerSystem
        $Computerinfo.Rename($Name)
    
        if((Get-WmiObject Win32_cdromdrive).drive -eq "D:") 
        {
            (Get-WmiObject Win32_cdromdrive).drive | ForEach-Object {$a = mountvol $_ /l;mountvol $_ /d; $a = $a.Trim();mountvol R: $a}
        
            }                  
                $volume = Get-Volume
                if(($volume.DriveLetter -eq "D") -and ($volume.DriveType -eq "Fixed")){Write-Host "Driver Letter All Ready Exists"}
                else {
                $offlinedisk = Get-Disk | Where-Object {$_.OperationalStatus -eq "Offline"}
                Set-Disk -Number $offlinedisk.Number -IsOffline $false
                Initialize-Disk -Number $offlinedisk.Number -PartitionStyle MBR
                New-Partition -DiskNumber $offlinedisk.Number -AssignDriveLetter -UseMaximumSize
                $diskvolume = Get-Volume | Where-Object {($_.FileSystem -ne "NTFS" -and $_.Size -like "0*" -and $_.DriveType -eq "Fixed")} 

            try {
                Set-Partition -DriveLetter $diskvolume.DriveLetter -NewDriveLetter D -ErrorAction SilentlyContinue        
            }
            catch {
                    $env:COMPUTERNAME + "The requested access path is already in use."
            }
        
            Format-Volume -DriveLetter D -FileSystem NTFS -Confirm:$false
        }
"@

    $ScriptText
}

Function Get-ScribestarRemoteNetworkSetupScript([string] $IPAddr, [string] $GatewayAddr) {

    $ScriptText = @"
        $IP="$IPAddr"
        $Prefix = "24"
        $Gateway = "$GatewayAddr"
        $DNS1 = "10.1.2.34"
        $DNS2 = "10.1.2.35"
        $Domain = "SCRIBESTAR.INTERNAL"
        $OUPath = "OU=BETA,OU=Servers,OU=United Kingdom,OU=Resource,DC=SCRIBESTAR,DC=INTERNAL"
        $domainuser = "SVCJOINDOMAIN"
        $domainpassword = "7UUBDUNQHtJzVxtwtPN01" | ConvertTo-SecureString -AsPlainText -Force
        New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress $IP -PrefixLength $Prefix -DefaultGateway $Gateway
        Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ($DNS1,$DNS2)
        $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $domainuser,$domainpassword
        Start-Sleep -Seconds 10
        Add-Computer -DomainName $Domain -OUPath $OUPath -Credential $cred
"@

    $ScriptText
}

Function Send-ErrorEmail([string] $Subject, [string] $ErrorLog) {
    Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $Subject -Attachments $ErrorLog -SmtpServer $SMTPServer
}

Export-ModuleMember -Function New-ScribestarVM, Set-ScribestarNetwork, New-ScribestarHardDisk, Import-ScribestarRole
