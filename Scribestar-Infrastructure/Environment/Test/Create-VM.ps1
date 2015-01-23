param([string] $Name, [string] $ServerType, [string] $IP, [string] $Gateway);

Add-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue

Import-Module "..\..\Modules\Scribestar-Functions.psm1" -ErrorAction Stop

$GuestUser = "administrator"
$GuestPassword = "G00gle1t"
$HostUser = "root"
$HostPassword = "scribestar"

Connect-VIServer -Server VCS-PROD -User "SCRIBESTAR\SVCVMADMIN" -Password ":l07xF)x>?44q}ucR-Vs6"


$Role = Import-ScribestarRole $ServerType

$VMExists = Get-VM -Name $Name -ErrorAction SilentlyContinue

if($VMExists.Name -eq $Name) {
    Write-Host "ERROR: $Name Already exists" -ForegroundColor Red
} else {
    Write-Host "Creating VM $Name with role $RoleFile" -ForegroundColor Green

    New-ScribestarVM -Name $Name -ResourcePool $Role.Resource -Datastore $Role.Datastore -Template $Role.Template -Location $Role.Location
    
	Write-Host "Sleeping for 30s" -ForegroundColor Green

    Start-Sleep -Seconds 30

	Set-ScribestarNetwork -VMName $Name -Network $Network

    # thin by default
    New-ScribestarHardDisk -Name $Name -CapacityGB $Role.CapacityGB

	Write-Host "Starting VM and waiting 60s" -ForegroundColor Green

    Start-VM -VM $Name

    Start-Sleep -Seconds 60

	Write-Host "Creating HDD" -ForegroundColor Green

    $DiskSetupScript = Get-ScribestarRemoteDiskSetupScript($Name)

    Invoke-VMScript -VM $Name -ScriptText $DiskSetupScript -ScriptType Powershell -GuestUser $GuestUser -GuestPassword $GuestPassword -HostUser $HostUser -HostPassword $HostPassword

    Write-Host "Rebooting VM and waiting 120s" -ForegroundColor Green

    Restart-VMGuest -VM $Name -Confirm:$false

    Start-Sleep -Seconds 120

    $NetworkSetupScript = Get-ScribestarRemoteNetworkSetupScript($IP, $Gateway)
	
	Write-Host "Applying network settings" -ForegroundColor Green
    
	Invoke-VMScript -VM $Name -ScriptText $NetWorkSetupScript -ScriptType Powershell -GuestUser $GuestUser -GuestPassword $GuestPassword -HostUser $HostUser -HostPassword $HostPassword

	Write-Host "Rebooting" -ForegroundColor Green	

    Restart-VMGuest -VM $Name -Confirm:$false

	Write-Host "Done!" -ForegroundColor Green
}