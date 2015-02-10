param([string]$server)
##Check if the ports are open

if(Test-Connection $server -ea 0 -Quiet) {
    try {
	    Remove-Module Scribestar-Functions -ErrorAction SilentlyContinue
    } catch {}

    Import-Module "..\..\Modules\Scribestar-Functions.psm1" -ErrorAction Stop

    $RavenPorts = 8080

    foreach ($Port in $RavenPorts) {
                              try{ $Status = Test-ScribestarPort -Computer $server -Port $Port -TCP }
                                catch { }

                              if($Status.Open -eq "True") { Write-Host "$Port is already open on $server" }
                              
                              else {
                                   Invoke-Command -ComputerName $server -ScriptBlock {
                                        New-NetFirewallRule -DisplayName "RavenDB Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 8080
                                    } #End Invoke
                                } #End Else port is open
    } #End For Loop

} # End IF Server Online

else {
    Write-Host "$server is OFFLINE!"
}                            

Write-Host "All Done!"