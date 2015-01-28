param([string]$Name,[string]$ServerConfigFile,[string]$Network);

$GuestUser = "administrator"
$GuestPassword = "G00gle1t"
$HostUser = "root"
$HostPassword = "scribestar"

Add-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue

try {
	Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
} catch {}

Import-Module ".\Scribestar-Functions.psm1" -ErrorAction Stop


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

    if($Role.CapacityGB -eq "0") {Write-Host "The $Name has secondary drive" -ForegroundColor Yellow}
    else {
    New-ScribestarHardDisk -VMName $Name -CapacityGB $Role.CapacityGB
    }

Start-VM -VM $Name
Write-Host "Done!" -ForegroundColor Green
}