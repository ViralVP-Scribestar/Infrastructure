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
#{Set-ExecutionPolicy RemoteSigned}
$Role = Read-Host "Please Enter: Web, App, SQL, etc."
Import-Module Servermanager

Get-Command -Module Servermanager
Write-Host "$Role"

if ($Role -like "Web")  {
Write-Host "Installing Web Features and Roles"
#Import-Clixml C:\RnF.xml | Add-WindowsFeature
    } 
    ElseIf ($Role -like "App"){
    Write-Host "Installing App Features and Roles"
#Import-Clixml C:\RnF.xml | Add-WindowsFeature
    }
    else {
Write-Host "Please Enter A Valid Server Role!"
}

