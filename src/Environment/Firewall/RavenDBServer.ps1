param([string]$server)

Invoke-Command -ComputerName $server -ScriptBlock     {
    Write-Host "Installing Firewall Rules!"
    New-NetFirewallRule -DisplayName "RavenDB Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 8080
}

Write-Host "All Done!"