param([string]$Name,[string]$ServerConfigFile,[string]$IP,[string] $Gateway,[string]$Network);

$GuestUser = "administrator"
$GuestPassword = "G00gle1t"
$HostUser = "root"
$HostPassword = "scribestar"

Add-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue

try {
	Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
} catch {}

Import-Module "..\..\Modules\Scribestar-Functions.psm1" -ErrorAction Stop


Connect-VIServer -Server VCS-PROD -User "SCRIBESTAR\SVCVMADMIN" -Password ":l07xF)x>?44q}ucR-Vs6"


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

   New-ScribestarHardDisk -VMName $Name -CapacityGB $Role.CapacityGB

	Write-Host "Starting VM and waiting 60s" -ForegroundColor Green

    Start-VM -VM $Name

    Start-Sleep -Seconds 60

	Write-Host "Configuring HardDrive" -ForegroundColor Green

    $DiskSetupScript = Set-ScribestarRemoteHDDSetupScript($Name)

    Invoke-VMScript -VM $Name -ScriptText $DiskSetupScript -ScriptType Powershell -GuestUser $GuestUser -GuestPassword $GuestPassword -HostUser $HostUser -HostPassword $HostPassword

    Write-Host "Rebooting VM and waiting 120s" -ForegroundColor Green

    Restart-VMGuest -VM $Name -Confirm:$false

    Start-Sleep -Seconds 120

    $NetworkSetupScript = Set-ScribestarRemoteNetworkSetupScript($IP,$Gateway)
	
	Write-Host "Applying network settings" -ForegroundColor Green
    
	Invoke-VMScript -VM $Name -ScriptText $NetWorkSetupScript -ScriptType Powershell -GuestUser $GuestUser -GuestPassword $GuestPassword -HostUser $HostUser -HostPassword $HostPassword

	Write-Host "Rebooting" -ForegroundColor Green	

    Restart-VMGuest -VM $Name -Confirm:$false

	Write-Host "Done!" -ForegroundColor Green
}