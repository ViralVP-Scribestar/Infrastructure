New-NetFirewallRule -DisplayName "SQL Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 1433
$env:COMPUTERNAME