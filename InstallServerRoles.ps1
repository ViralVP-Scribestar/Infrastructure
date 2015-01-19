param([switch]$Elevated)

Function Test-Admin {
  $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) 
    {
        # tried to elevate, did not work, aborting
    } 
    else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}

exit
}


$Role = Read-Host "Please Enter: Web, App, SQL, etc."
$fileName = "\\NAS\Shared Resource\Infrastructure\Operations\Systems\Scripts\PowerShell\RolesXML\{0}_RnF.xml" -f $Role

If (Test-Path $fileName) {
    Import-Module Servermanager
    Get-Command -Module Servermanager

    Write-Host -fore Green "Installing $Role Features and Roles"
    #Import-Clixml $fileName | Add-WindowsFeature
}
    Else {
        Write-Host -fore Red "Please Enter A Valid Server Role!"
        Write-Host -fore Red "Web, App, SQL, RabbitMQ, NEO, or Raven!"
        Write-Host -fore Red "$fileName does NOT exist!"
        break;
    }