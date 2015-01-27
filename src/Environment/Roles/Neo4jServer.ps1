New-NetFirewallRule -DisplayName "Neo4j Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 7474, 5001, 6001

$env:COMPUTERNAME