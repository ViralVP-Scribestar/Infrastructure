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
<<<<<<< HEAD
                                    
                                    
                                            Invoke-Command -ComputerName $Name -ScriptBlock {
                                                                                                       
                                                                                                   $Ports = "6123","10000","10566"
                                                                                                   New-NetFirewallRule -DisplayName "Catalogic" -Direction Inbound -Protocol TCP -Action Allow -LocalPort $Ports
=======
                                            Invoke-Command -ComputerName $Name -ScriptBlock {
                                                                                                   New-NetFirewallRule -DisplayName "Catalogic" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 6123,10000,10566
>>>>>>> 3a498ee9f4283dda944e4812b66fe3d98d0ede1a
                                                                                     }
                            }
