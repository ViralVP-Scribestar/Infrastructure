.\Create-VM.ps1 -Name BETAWIN-APP01 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\AppServer.ps1 -server BETAWIN-APP01
..\Environment\Firewall\AppServer.ps1 -server BETAWIN-APP01
.\Create-VM.ps1 -Name BETAWIN-APP02 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\AppServer.ps1 -server BETAWIN-APP02
..\Environment\Firewall\AppServer.ps1 -server BETAWIN-APP02
.\Create-VM.ps1 -Name BETAWIN-WEB01 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\WebServer.ps1 -server BETAWIN-WEB01
..\Environment\Firewall\WebServer.ps1 -server BETAWIN-WEB01
.\Create-VM.ps1 -Name BETAWIN-WEB02 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\WebServer.ps1 -server BETAWIN-WEB02
..\Environment\Firewall\WebServer.ps1 -server BETAWIN-WEB02
.\Create-VM.ps1 -Name BETAWIN-MQ01 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\RabbitMQServer.ps1 -server BETAWIN-MQ01
..\Environment\Firewall\RabbitMQServer.ps1 -server BETAWIN-MQ01
.\Create-VM.ps1 -Name BETAWIN-MQ02 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\RabbitMQServer.ps1 -server BETAWIN-MQ02
..\Environment\Firewall\RabbitMQServer.ps1 -server BETAWIN-MQ02
.\Create-VM.ps1 -Name BETAWIN-RAVEN01 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\RavenDBServer.ps1 -server BETAWIN-RAVEN01
..\Environment\Firewall\RavenDBServer.ps1 -server BETAWIN-RAVEN01
.\Create-VM.ps1 -Name BETAWIN-RAVEN02 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\RavenDBServer.ps1 -server BETAWIN-RAVEN02
..\Environment\Firewall\RavenDBServer.ps1 -server BETAWIN-RAVEN02
.\Create-VM.ps1 -Name BETAWIN-NEO01 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\Neo4jServer.ps1 -server BETAWIN-NEO01
..\Environment\Firewall\Neo4jServer.ps1 -server BETAWIN-NEO01
.\Create-VM.ps1 -Name BETAWIN-NEO02 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\Neo4jServer.ps1 -server BETAWIN-NEO02
..\Environment\Firewall\Neo4jServer.ps1 -server BETAWIN-NEO02
.\Create-VM.ps1 -Name BETAWIN-SQL01 -ServerConfigFile ..\Environment\Data\Alpha-Beta.csv
..\Environment\Roles\SqlServer.ps1 -server BETAWIN-SQL01
..\Environment\Firewall\SqlServer.ps1 -server BETAWIN-SQL01