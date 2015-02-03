param([string]$Name)
##Installing Catalogic##

##Check if the ports are open

try {
	Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
} catch {}

Import-Module ".\Scribestar-Functions.psm1" -ErrorAction Stop

$Ports = "6123","10000","10566"
                            
                            try{
                            $Status = Test-ScribestarPort -Computer $Name -Port $Ports -TCP -ErrorAction SilentlyContinue
                            $ServerName = $Status.Server
                            }

                            catch {
                                    "The port is not open on this $ServerName"
                                    }

                                    if($status.Open -eq "True") {Write-Host "Ports Are Already Open"}

                                    else {
                                    
                                    
                                            Invoke-Command -ComputerName $Name -ArgumentList $Ports -ScriptBlock {
                                                                                                
                                                                                                   New-NetFirewallRule -DisplayName "Catalogic" -Direction Inbound -Protocol TCP -Action Allow -LocalPort $Ports
                                                                                     }
                            
                            }