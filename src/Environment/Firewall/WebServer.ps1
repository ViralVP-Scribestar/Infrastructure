param([string]$server)
##Check if the ports are open

if(Test-Connection $server -ea 0 -Quiet) {
    try {
	    Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
    } catch {}

    Import-Module "..\..\Modules\Scribestar-Functions.psm1" -ErrorAction Stop

    $WebPorts = "Web Ports", "80", "443"

    foreach ($Port in $WebPorts) {
                                try { $MyPort = [int]$Port }
                                catch {
                                    $RuleName = $Port
                                    Write-Host "$Port is NOT an integer" 
                                }
                                
                                if($MyPort -is [int]){
                                    try{ $Status = Test-ScribestarPort -Computer $server -Port $Port -TCP }
                                    catch { Write-Host "CATCH!!!" }
                                
                                    if($Status.Open -eq "True") {Write-Host "$MyPort is already open on $server"}

                                    else {
                                        Write-host "Port $MyPort is not open on $server" 
                                        Write-Host "r $RuleName displ $DisplayName p $MyPort"
                                        Invoke-Command -ComputerName $server -ArgumentList $RuleName, $MyPort -ScriptBlock {
                                            $DisplayName = "$RuleName TCP $MyPort"
                                            Write-Host "r $RuleName displ $DisplayName p $MyPort"
                                            #New-NetFirewallRule -DisplayName $DisplayName -Direction Inbound -Protocol TCP -Action Allow -LocalPort $MyPort
                                        }#End Invoke
                                    } #End Else $MyPort open

                                } # End If $MyPort is integer
    } #End For Loop
                                
} # End IF Server Online

else {
    Write-Host "$server is OFFLINE!"
}                            
   
Write-Host "All Done!"