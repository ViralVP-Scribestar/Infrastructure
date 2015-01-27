New-NetFirewallRule -DisplayName "RabbitMq Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5672, 15672
$env:COMPUTERNAME