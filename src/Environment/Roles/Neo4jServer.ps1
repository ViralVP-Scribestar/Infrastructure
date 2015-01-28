﻿param([switch]$Elevated)

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

$fileName = ".\Data\Neo4jServer-Role.xml"

If (Test-Path $fileName) {
    Import-Module Servermanager
    Get-Command -Module Servermanager

    Write-Host -fore Green "Installing Neo4J Features and Roles"
    Import-Clixml $fileName | Add-WindowsFeature

    Write-Host "Installing Firewall Rules!"
    New-NetFirewallRule -DisplayName "Neo4j Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 7474, 5001, 6001
}
    Else {
        Write-Host -fore Red "Unable to find Neo4J features xml file!"
        Write-Host -fore Red "$fileName does NOT exist!"
        break;
    }

Write-Host "All Done!"