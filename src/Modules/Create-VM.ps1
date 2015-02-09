param([string]$Name,[string]$ServerConfigFile,[string]$Network);
$Name.ToUpper()
$Network.ToUpper()
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


$Role = Import-ScribestarServerCSV $ServerConfigFile

$VMExists = Get-VM -Name $Name -ErrorAction SilentlyContinue

if($VMExists.Name -eq $Name) {
    Write-Host "ERROR: $Name Already exists" -ForegroundColor Red
} else {
    Write-Host "Creating VM $Name with role $RoleFile" -ForegroundColor Green
    
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

	Set-ScribestarNetwork -VMName $Name -Network $Network

    # thin by default

    if($Role.CapacityGB -eq "0") {Write-Host "The $Name has secondary drive" -ForegroundColor Yellow}
    else {
    New-ScribestarHardDisk -VMName $Name -CapacityGB $Role.CapacityGB
    }


Write-Host "Powering $Name" -ForegroundColor Yellow

Start-VM -VM $Name

Start-Sleep -Seconds 60


Write-Host "Renaming Server & Configuring Hard Disk" -ForegroundColor Yellow

$RenameComputer = (Rename-ScribestarVM -Name $Name)
Invoke-VMScript -VM $Name -ScriptText $RenameComputer -ScriptType Powershell -GuestUser $guestuser -GuestPassword $guestpassword -HostUser $hostuser -HostPassword $hostpassword

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
$ScriptText = $ScriptText.Replace("Name",$Name)

Invoke-VMScript -VM $Name -ScriptText $ScriptText -ScriptType Powershell -GuestUser $guestuser -GuestPassword $guestpassword -HostUser $hostuser -HostPassword $hostpassword



Write-Host "Done!" -ForegroundColor Green
}