Add-PSSnapin VMware.VimAutomation.Core
Connect-VIServer -Server VCS-PROD -User "SCRIBESTAR\SVCVMADMIN" -Password ":l07xF)x>?44q}ucR-Vs6"
$smtpserver = "smtp-relay.gmail.com"
$ErrorActionPreference = "stop"
$EmailTo = "Scribestar-Infrastructure@scribestar.com"

##Directory Creation
$MyDateTime = Get-Date -UFormat %Y:%m:%d:%H:%M:%S
$year = $MyDateTime.Split(":")[0];$month = $MyDateTime.Split(":")[1];$day = $MyDateTime.Split(":")[2]
$hour = $MyDateTime.Split(":")[3];$minute = $MyDateTime.Split(":")[4];$sec = $MyDateTime.Split(":")[5]
$startDateTime = Get-Date

#Log Location
$newvmfaillogs = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NewVMErrorLogs\$year\$month\$day\"
$workingpath1 = "$newvmfaillogs\NewVMError-$hour.$minute.$sec.log"
if(-not(Test-Path $newvmfaillogs)) {md $newvmfaillogs}
$neworklabelfail = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\NetworkLabelErrorLogs\$year\$month\$day\"
$workingpath2 = "$neworklabelfail\NetworkLabelFail-$hour.$minute.$sec.log"
if(-not(Test-Path $neworklabelfail)){md $neworklabelfail}
$networkinterface = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\NetworkInterfaceErrorLogs\$year\$month\$day\"
$workingpath3 = "$networkinterface\NetworkinterfaceError-$hour.$minute.$sec.log"
if(-not(Test-Path $networkinterface)) {md $networkinterface}
$startvmerrorlogs = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\StartVMErrorLogs\$year\$month\$day\"
$workingpath4 = "$startvmerrorlogs\StartVMError-$hour.$minute.$sec.log"
if(-not(Test-Path $startvmerrorlogs)) {md $startvmerrorlogs}
$newvmharddiskerrorlogs = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\NewVMHardDiskErrorLogs\$year\$month\$day\"
$workingpath5 = "$newvmharddiskerrorlogs\NewHardDiskError-$hour.$minute.$sec.log"
if(-not(Test-Path $newvmharddiskerrorlogs)) {md $newvmharddiskerrorlogs}

#Creating VM
Function New-ScribestarVM {
param([string]$Name=$null,[string]$Datastore=$null,[string]$Template=$null,[string]$Location=$null,[string]$ResourcePool=$null)
if(-not($Name)){Write-Host "No Name Provided";break}
if(-not($Datastore)){Write-Host "No Datastore Provided";break}
if(-not($Template)){Write-Host "No Template Provided";break}
if(-not($Location)){Write-Host "No Location Provided";break}
if(-not($ResourcePool)){Write-Host "ResourcePool Not Provided";break}


try {
        New-VM -Name $Name -ResourcePool $ResourcePool -Template $Template -Datastore $Datastore -Location $Location -ErrorAction $ErrorActionPreference

        }

catch { 
        $Name + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $workingpath1 -Append
        $Name + "$FailedItem = $_.Exception.ItemName" | Out-File -FilePath $workingpath1 -Append
        Send-MailMessage -From "DoNotReply@scribestar.com" -To $EmailTo -Subject "New VM Creation Fail" -Attachments $workingpath1 -SmtpServer $smtpserver
         }

}

##Change Network Label

Function Set-ScribestarNetwork {
param([string]$VMName=$null,[string]$Network=$null)
if(-not($VMName)){Write-Host "VMname Not Provided"}
if(-not($Network)){Write-Host "Network Name Not Provided"}

try {

        Get-VM $VMName | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName $Network -Confirm:$false -ErrorAction $ErrorActionPreference

        }

catch {
        
        $Network + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $workingpath2 -Append
        $Network + "$FailedItem = $_.Exception.ItemName" | Out-File $workingpath2 -Append
        Send-MailMessage -From "DoNotReply@scribestar.com" -To $EmailTo -Subject "Network Label Error" -Attachments $workingpath2 -SmtpServer $smtpserver
        
        }


        }


##Add New HardDisk

Function New-ScribestarHardDisk {
param([string]$Name=$null,[string]$CapacityGB=$null,[switch]$Thin,[switch]$Thick)

if(-not($CapacityGB)){Write-Host "Must Specify Storage Capacity";break}
if($Thin -eq $true -and $Thick -eq $true){Write-Host "Cannot Specify Two Storage Formats";break}
if($Thin -eq $true){$StorageFormat = "Thin"}
if($Thick -eq $true){$StorageFormat = "Thick"}
if($Thin -eq $false -and $Thick -eq $false){Write-Host "Must Specify StorageFormat";break}



try {
        New-HardDisk -VM $Name -CapacityGB $CapacityGB -StorageFormat $StorageFormat -Persistence Persistent -ErrorAction $ErrorActionPreference

        }

        catch {
                    $Name + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $workingpath5 -Append
                    $Name + "$FailedItem = $_.Exception.ItemName" | Out-File -FilePath $workingpath5 -Append
                    Send-MailMessage -From "DoNotReply@scribestar.com" -To $EmailTo -Subject "New HardDisk Error" -Attachments $workingpath5 -SmtpServer $smtpserver

                    }

}

################VM Details###################
$VM="BETAWIN-MQ02"
$Resource = "Resources"
$Template = "WIN2012R2-TEMPLATE"
$Folder = "BETA"
$Network = "DMZ_WEB"
$CapacityGB = "10"
$Location = "BETA"
$Datastore = "VMS-DATASTORE"
$OUPath = "OU=BETA,OU=Servers,OU=United Kingdom,OU=Resource,DC=SCRIBESTAR,DC=INTERNAL"
#############################################

$VMExists = Get-VM -Name $VM -ErrorAction SilentlyContinue
if($VMExists.Name -eq $VM){Write-Host "$VM All Ready Exists"}

else {


Write-Host "Creating VM's" -ForegroundColor Blue -BackgroundColor Yellow

New-ScribestarVM -Name $VM -ResourcePool $Resource -Datastore $Datastore -Template $Template -Location $Location
Start-Sleep -Seconds 30
Set-ScribestarNetwork -VMName $VM -Network $Network
New-ScribestarHardDisk -Name $VM -CapacityGB $CapacityGB -Thin
Start-VM -VM $VM
Start-Sleep -Seconds 60

######Authentication##########
$guestuser = "administrator"
$guestpassword = "G00gle1t"
$hostuser = "root"
$hostpassword = "scribestar"
##############################

$VMBETAMQ02 = @'
$Computerinfo = Get-WmiObject -Class Win32_ComputerSystem
$Computerinfo.Rename("BETAWIN-MQ02")
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
Invoke-VMScript -VM $VM -ScriptText $VMBETAMQ02 -ScriptType Powershell -GuestUser $guestuser -GuestPassword $guestpassword -HostUser $hostuser -HostPassword $hostpassword

Write-Host "Rebooting VM's" -BackgroundColor Cyan -ForegroundColor DarkMagenta

Restart-VMGuest -VM $VM -Confirm:$false
Start-Sleep -Seconds 120

$VMBETAMQ02 = @'
$IP="10.1.9.37"
$Prefix = "24"
$Gateway = "10.1.9.1"
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

'@
Invoke-VMScript -VM $VM -ScriptText $VMBETAMQ02 -ScriptType Powershell -GuestUser $guestuser -GuestPassword $guestpassword -HostUser $hostuser -HostPassword $hostpassword
Restart-VMGuest -VM $VM -Confirm:$false

                              
                              }