param([string]$Name)
##Installing Catalogic##

##Check if the ports are open

try {
	Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
} catch {}

Import-Module ".\Scribestar-Functions.psm1" -ErrorAction Stop

$Ports = "6123","10000","10566"

foreach ($Port in $Ports) {
                            try{
                            $Status = Test-ScribestarPort -Computer $Name -Port $Port -TCP
                            $ServerName = $Status.Server
                            }

                            catch {
                                    "The port is not open on this $ServerName"
                                    }

                                    if($status.Open -eq "True") {Write-Host "Ports Are Already Open"}
                                    
                                    else {
                                            New-NetFirewallRule -DisplayName "Catalogic" -Direction Inbound -Protocol TCP -Action Allow -LocalPort $Ports
                                            }
                            
                            }


                            