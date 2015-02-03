param([string]$server)

Invoke-Command -ComputerName $server -ScriptBlock     {
    Write-Host "Installing Firewall Rules!"
    New-NetFirewallRule -DisplayName "App" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 80, 443
}

Write-Host "All Done!"