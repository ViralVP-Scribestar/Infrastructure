New-NetFirewallRule -DisplayName "Web Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 80, 443
$env:COMPUTERNAME