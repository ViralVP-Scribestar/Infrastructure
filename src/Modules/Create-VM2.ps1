param([string]$Name,[string]$ServerConfigFile,[string]$Network,[string]$IPAddress,[string]$Prefix,[string]$Gateway);
Add-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue

try {
	Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
} catch {}

Import-Module ".\Scribestar-Functions.psm1" -ErrorAction Stop

Connect-VIServer -Server VCS-PROD -User "SCRIBESTAR\SVCVMADMIN" -Password ":l07xF)x>?44q}ucR-Vs6"

######Authentication##########
$guestuser = "administrator"
$guestpassword = "G00gle1t"
$hostuser = "root"
$hostpassword = "scribestar"
##############################

$Roles = Import-ScribestarServerCSV $ServerConfigFile | Where-Object {$_.Required -eq $true}

foreach ($Role in $Roles) {

$Name = $Role.Name
$IPAddress = $Role.IPAddress
$Gateway = $Role.Gateway

$pattern= @"
^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$
"@

if ($IPAddress -notmatch $pattern){Write-Host "Invalid IP Address." -ForegroundColor Red;break}
if($Gateway -notmatch $pattern){Write-Host "Invalid Gateway IP Address." -ForegroundColor Red;break}

$VMExists = Get-VM -Name $Name -ErrorAction SilentlyContinue

if($VMExists.Name -eq $Name) {
    Write-Host "ERROR: $Name Already exists" -ForegroundColor Red
} else {
    Write-Host "Creating VM $Name" -ForegroundColor Green
    
    if (-not(Get-Folder $Role.Folder -ErrorAction SilentlyContinue)) {
                                                                       Write-Host "Creating VM Folder" -ForegroundColor Blue
                                                                       New-Folder $Role.Location -Location VM
                                                                       Start-Sleep -Seconds 20 
                                                                       }

    New-ScribestarVM -Name $Name -ResourcePool $Role.Resource -Datastore $Role.Datastore -Template $Role.Template -Location $Role.Location

    do {

           $VMCreation = Get-VM $Name -ErrorAction Stop
           
           
            Write-Host "$Name Still In Creation Process" -ForegroundColor Yellow
            Start-Sleep -Seconds 60
            

            }

            until ($VMCreation.UsedSpaceGB -ne "-1")

	Set-ScribestarNetwork -VMName $Name -Network $Role.Network

    # thin by default

    if($Role.CapacityGB -eq "0") {Write-Host "The $Name has secondary drive" -ForegroundColor Yellow}
    else {
    New-ScribestarHardDisk -VMName $Name -CapacityGB $Role.CapacityGB
    }


Write-Host "Powering $Name" -ForegroundColor Yellow

Start-VM -VM $Name

Start-Sleep -Seconds 60


Write-Host "Renaming Server & Configuring Hard Disk" -ForegroundColor Yellow

$ScriptText = @'
                        $Computerinfo = Get-WmiObject -Class Win32_ComputerSystem
                        $Computerinfo.Rename("Name")
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
'@
$ScriptText = $ScriptText.Replace("Name",($Name).ToUpper())

Invoke-VMScript -VM $Name -ScriptText $ScriptText -ScriptType Powershell -GuestUser $guestuser -GuestPassword $guestpassword -HostUser $hostuser -HostPassword $hostpassword

Write-Host "Rebooting $Name" -ForegroundColor Yellow

Restart-VMGuest -VM $Name -Confirm:$false

Start-Sleep -Seconds 120

Write-Host "Add $Name To Domain" -ForegroundColor Yellow

$ScriptText = @'
$IP= ("#IPAddress#")
$Prefix = ("#Prefix#")
$Gateway = ("#Gateway#")
$DNS1 = "10.1.2.34"
$DNS2 = "10.1.2.35"
$Domain = "SCRIBESTAR.INTERNAL"
$OUPath = ("#OUPath#")
$domainuser = "SVCJOINDOMAIN"
$domainpassword = "7UUBDUNQHtJzVxtwtPN01" | ConvertTo-SecureString -AsPlainText -Force
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress $IP -PrefixLength $Prefix -DefaultGateway $Gateway
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ($DNS1,$DNS2)
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $domainuser,$domainpassword
Start-Sleep -Seconds 10
Add-Computer -DomainName $Domain -OUPath $OUPath -Credential $cred

'@

$ScriptText = $ScriptText.Replace("#IPAddress#",$Role.IPAddress).Replace("#Prefix#",$Role.Prefix).Replace("#Gateway#",$Role.Gateway).Replace("#OUPath#",$Role.OUPath)

Invoke-VMScript -VM $Name -ScriptText $ScriptText -ScriptType Powershell -GuestUser $guestuser -GuestPassword $guestpassword -HostUser $hostuser -HostPassword $hostpassword

Write-Host "Rebooting $Name" -ForegroundColor Yellow

Restart-VMGuest -VM $Name -Confirm:$false

Write-Host "Done!" -ForegroundColor Green

}

}