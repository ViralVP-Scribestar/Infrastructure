param([string]$server)

Invoke-Command -ComputerName $server -ScriptBlock     {
    Write-Host "Installing Firewall Rules!"
    New-NetFirewallRule -DisplayName "RabbitMQ Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5672, 15672
}

Write-Host "All Done!"