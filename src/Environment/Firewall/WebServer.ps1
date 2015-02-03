param([string]$server)
##Check if the ports are open

try {
	Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
} catch {}

Import-Module "..\..\Modules\Scribestar-Functions.psm1" -ErrorAction Stop

$WebPorts = "Web Ports", "80", "443"
#$web = ,("Web Ports", $WebPorts)
#$Ports = "6123","10000","10566"

$sb = {
  param($p1, $p2)
  $OFS = ','
  "p1 is $p1, p2 is $p2, $p3 rest of args: $args"
}
#& $sb 1 2 3 4
#& $sb -p2 2 -p1 1 3 4
Invoke-Command $sb -ArgumentList 1,2,3,4



foreach ($Port in $WebPorts) {
                            if($Port -is [int]){
                                Write-Host ".$Port. is an integer"
                            }
                                else{
                                Write-Host ".$Port. is NOT an integer"
                                }
                            <#
                            try{
                            $Status = Test-ScribestarPort -Computer $server -Port $Port -TCP
                            # $ServerName = $Status.Server
                            }

                            catch {
                                    "The port is not open on this $server"
                                    }

                                    if($Status.Open -eq "True") {Write-Host "Ports Are Already Open"}
                                    
                                    else {
                                            Invoke-Command -ComputerName $server -ScriptBlock     {
                                                Write-Host "Adding rule - allow TCP $Port!"
                                                #New-NetFirewallRule -DisplayName "Web Ports" -Direction Inbound -Protocol TCP -Action Allow -LocalPort $Ports
                                                }
                                            }
                            #>
                            }

#Write-Host "web = .$web."
Write-Host "All Done!"


                            
<#
Invoke-Command -ComputerName $server -ScriptBlock     {
    Write-Host "Installing Firewall Rules!"
#   New-NetFirewallRule -DisplayName "Web Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 80, 443
}


#>