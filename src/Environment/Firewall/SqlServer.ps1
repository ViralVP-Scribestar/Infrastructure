param([string]$server)

Invoke-Command -ComputerName $server -ScriptBlock     {
    Write-Host "Installing Firewall Rules!"
    New-NetFirewallRule -DisplayName "SQL Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 1433
}

Write-Host "All Done!"