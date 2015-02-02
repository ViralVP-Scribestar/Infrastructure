param([string]$Name)
##Installing Catalogic##

##Check if the ports are open

try {
	Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
} catch {}

Import-Module ".\Scribestar-Functions.psm1" -ErrorAction Stop

$Role = Import-ScribestarServerCSV $ServerConfigFile

$ports = "6123","10000","10566"



foreach ($port in $ports) {
                            $status = Test-ScribestarPort -ComputerName AD3 -Port $port -Protocol TCP
                            if($status.Equals("Connection successful")){'blah'}
                            
                            }

                            