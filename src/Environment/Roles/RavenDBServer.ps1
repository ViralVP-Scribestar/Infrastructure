New-NetFirewallRule -DisplayName "Raven Db Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 8080

$env:COMPUTERNAME