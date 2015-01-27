New-NetFirewallRule -DisplayName "NEO" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 7474, 5001, 6001

New-NetFirewallRule -DisplayName "Raven" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 8080

New-NetFirewallRule -DisplayName "SQL" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 1433

New-NetFirewallRule -DisplayName "App" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 80, 443

New-NetFirewallRule -DisplayName "Web" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 80, 443

$env:COMPUTERNAME