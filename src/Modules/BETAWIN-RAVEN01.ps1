Add-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue
Connect-VIServer -Server VCS-PROD -User "SCRIBESTAR\SVCVMADMIN" -Password ":l07xF)x>?44q}ucR-Vs6"

######Authentication##########
$guestuser = "administrator"
$guestpassword = "G00gle1t"
$hostuser = "root"
$hostpassword = "scribestar"
##############################

$server = "BETAWIN-RAVEN01"


      
                        $ScriptText = @'
                        $Computerinfo = Get-WmiObject -Class Win32_ComputerSystem
                        $Computerinfo.Rename("BETAWIN-RAVEN01")
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
Invoke-VMScript -VM $server -ScriptText $ScriptText -ScriptType Powershell -GuestUser $guestuser -GuestPassword $guestpassword -HostUser $hostuser -HostPassword $hostpassword

Write-Host "Rebooting VM" -ForegroundColor Yellow
Restart-VMGuest -VM $server -Confirm:$false

Start-Sleep -Seconds 120

$ScriptText = @'
$IP="10.1.9.37"
$Prefix = "24"
$Gateway = "10.1.0.32"
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

Invoke-VMScript -VM $server -ScriptText $ScriptText -ScriptType Powershell -GuestUser $guestuser -GuestPassword $guestpassword -HostUser $hostuser -HostPassword $hostpassword
Restart-VMGuest -VM $server -Confirm:$false
Write-Host "Done" -ForegroundColor Green
