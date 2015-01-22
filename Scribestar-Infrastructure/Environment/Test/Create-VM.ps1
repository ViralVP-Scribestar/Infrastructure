param([string] $Name, [string] $ServerType, [string] $IP, [string] $Gateway);

if(-not (Get-PSSnapin VMware.VimAutomation.Core))
{
   Add-PSSnapin VMware.VimAutomation.Core
}

Import-Module "..\..\Modules\Scribestar-Functions.psm1" -ErrorAction Stop

$GuestUser = "administrator"
$GuestPassword = "G00gle1t"
$HostUser = "root"
$HostPassword = "scribestar"

Connect-VIServer -Server VCS-PROD -User "SCRIBESTAR\SVCVMADMIN" -Password ":l07xF)x>?44q}ucR-Vs6"
$Role = Import-ScribestarRole $RoleFile

$VMExists = Get-VM -Name $Name -ErrorAction SilentlyContinue

if($VMExists.Name -eq $Name) {
    Write-Host "ERROR: $Name Already exists"
} else {
    Write-Host "Creating VM $Name with role $RoleFile" -ForegroundColor Green

    New-ScribestarVM -Name $Name -ResourcePool $Role.Resource -Datastore $Role.Datastore -Template $Role.Template -Location $Role.Location
    
    Start-Sleep -Seconds 30

	Set-ScribestarNetwork -VMName $Name -Network $Network

    # thin by default
    New-ScribestarHardDisk -Name $Name -CapacityGB $Role.CapacityGB

    Start-VM -VM $Name

    Start-Sleep -Seconds 60

    $DiskSetupScript = Get-ScribestarRemoteDiskSetupScript($Name)

    Invoke-VMScript -VM $Name -ScriptText $DiskSetupScript -ScriptType Powershell -GuestUser $GuestUser -GuestPassword $GuestPassword -HostUser $HostUser -HostPassword $HostPassword

    Write-Host "Rebooting VM's" -ForegroundColor Green

    Restart-VMGuest -VM $Name

    Start-Sleep -Seconds 120

    $NetworkSetupScript = Get-ScribestarRemoteNetworkSetupScript($IP, $Gateway)

    Invoke-VMScript -VM $Name -ScriptText $NetWorkSetupScript -ScriptType Powershell -GuestUser $GuestUser -GuestPassword $GuestPassword -HostUser $HostUser -HostPassword $HostPassword

    Restart-VMGuest -VM $Name -Confirm:$false
}