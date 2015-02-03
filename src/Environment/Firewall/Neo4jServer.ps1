param([string]$server)

Invoke-Command -ComputerName $server -ScriptBlock     {
    Write-Host "Installing Firewall Rules!"
    New-NetFirewallRule -DisplayName "Neo4j Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 7474, 5001, 6001
}

Write-Host "All Done!"