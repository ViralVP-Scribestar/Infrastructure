$EmailFrom = "DoNotReply@scribestar.com"
$EmailTo = "Scribestar-Infrastructure@scribestar.com"
$ErrorActionPref = "stop"
$SMTPServer = "smtp-relay.gmail.com"

$MyDateTime = Get-Date -UFormat %Y:%m:%d:%H:%M:%S
$Year = $MyDatetime.Split(":")[0]; $Month = $MyDateTime.Split(":")[1]; $Day = $MyDateTime.Split(":")[2]
$Hour = $MyDateTime.Split(":")[3]; $Minute = $MyDateTime.Split(":")[4]; $Second = $MyDateTime.Split(":")[5]
$StartDateTime = Get-Date

$NewVMErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NewVMErrorLogs\$Year\$Month\$Day\"
$NewVMErrorLog = "$NewVMErrorPath\NewVMError-$Hour.$Minute.$Second.log"
if(-not(Test-Path $NewVMErrorPath)){md $NewVMErrorPath}

$NetworkLabelErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NetworkLabelErrorLogs\$Year\$Month\$Day\"
$NetworkLabelErrorLog = "$NetworkLabelErrorPath\NetworkLabelError-$Hour.$Minute.$Second.log"
if(-not(Test-Path $NetworkLabelErrorPath)){md $NetworkLabelErrorPath}

$NetworkInterfaceErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NetworkInterfaceErrorLogs\$Year\$Month\$Day\"
$NetworkInterfaceErrorLog = "$NetworkInterfaceErrorPath\NetworkInterfaceError-$Hour.$Minute.$Second.log"
if(-not(Test-Path $NetworkInterfaceErrorPath)){md $NetworkInterfaceErrorPath}

$StartVMErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\StartVMErrorLogs\$Year\$Month\$Day\"
$StartVMErrorLog = "$StartVMErrorPath\StartVMError-$Hour.$Minute.$Second.log"
if(-not(Test-Path $StartVMErrorPath)){md $StartVMErrorPath}

$NewVMHardDiskErrorPath = "\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NewVMHardDiskErrorLogs\$Year\$Month\$Day\"
$NewVMHardDiskErrorLog = "$NewVMHardDiskErrorPath\NewVMHardDiskError-$Hour.$Minute.$Second.log"
if(-not(Test-Path $NewVMHardDiskErrorPath)){md $NewVMHardDiskErrorPath}

Function New-ScribestarVM
{
	Param([Parameter(Mandatory=$true)][string] $Name,
	[Parameter(Mandatory=$true)][string] $Datastore,
	[Parameter(Mandatory=$true)][string] $Template,
	[Parameter(Mandatory=$true)][string] $Location,
	[Parameter(Mandatory=$true)][string] $ResourcePool)



	try {
		New-VM -Name $Name -ResourcePool $ResourcePool -Template $Template -Datastore $Datastore -Location $Location -ErrorAction $ErrorActionPref
	} catch {
		$Name + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $NewVMErrorLog -Append
		$Name + "$FailedItem = $_.Exception.ItemName" | Out-File -FilePath $NewVMErrorLog  -Append
        Send-ErrorEmail -Subject "VM Creation Error $MyDateTime" -ErrorLog $NewVMErrorLog
	}
}

Function Set-ScribestarNetwork
{
	Param([Parameter(Mandatory=$true)][string] $VMName,
	[Parameter(Mandatory=$true)][string] $Network)

	try {
		Get-VM $VMName | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName $Network -Confirm:$false -ErrorAction $ErrorActionPref
	} catch {
		$Network + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $NetworkLabelErrorLog -Append
        $Network + "$FailedItem = $_.Exception.ItemName" | Out-File -FilePath $NetworkLabelErrorLog -Append
        Send-ErrorEmail -Subject "Network Label Error $MyDateTime" -ErrorLog $NetworkLabelErrorLog
	}
}

Function New-ScribestarHardDisk
{
	Param([Parameter(Mandatory=$true)][string] $VMName,
	[Parameter(Mandatory=$true)][string] $CapacityGB,
	[Parameter(Mandatory=$false)][switch] $Thick)

	# default to thin disks
    if ($Thick) { $StorageFormat = "Thick" }
    else		{ $StorageFormat = "Thin" }

    try {
        New-HardDisk -VM $VMName -CapacityGB $CapacityGB -StorageFormat $StorageFormat -Persistence Persistent -ErrorAction $ErrorActionPref
    } catch {
        $Name + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $NewHardDiskErrorLog -Append
        $Name + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $NewHardDiskErrorLog -Append

        Send-ErrorEmail -Subject "New Hard Disk Error $MyDateTime" -ErrorLog $NewHardDiskErrorLog
    }
}

Function Import-ScribestarServerCSV
{
	Param([string] $CSVFilename)

	$ServerSettings = Import-Csv $CSVFilename -ErrorAction $ErrorActionPref

	return $ServerSettings
}



Function Send-ErrorEmail
{
	Param([Parameter(Mandatory=$true)][string] $Subject,
	[Parameter(Mandatory=$true)][string] $ErrorLog)

    Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $Subject -Attachments $ErrorLog -SmtpServer $SMTPServer
}

Function Test-ScribestarPort{   
   [cmdletbinding(DefaultParameterSetName = '',   
    ConfirmImpact = 'low'   
)]   
    Param(   
        [Parameter(   
            Mandatory = $True,   
            Position = 0,   
            ParameterSetName = '',   
            ValueFromPipeline = $True)]   
            [array]$Computer,   
        [Parameter(   
            Position = 1,   
            Mandatory = $True,   
            ParameterSetName = '')]   
            [array]$Port,   
        [Parameter(   
            Mandatory = $False,   
            ParameterSetName = '')]   
            [int]$TCPtimeout=1000,   
        [Parameter(   
            Mandatory = $False,   
            ParameterSetName = '')]   
            [int]$UDPtimeout=1000,              
        [Parameter(   
            Mandatory = $False,   
            ParameterSetName = '')]   
            [switch]$TCP,   
        [Parameter(   
            Mandatory = $False,   
            ParameterSetName = '')]   
            [switch]$UDP                                     
        )   
    Begin {   
        If (-not$TCP -AND !$UDP) {$TCP = $True}   
        $ErrorActionPreference = "SilentlyContinue"   
        $report = @()   
    }   
    Process {      
        ForEach ($c in $Computer) {   
            ForEach ($p in $port) {   
                If ($TCP) {     
                    #Create temporary holder    
                    $temp = "" | Select Server, Port, TypePort, Open, Notes   
                    #Create object for connecting to port on computer   
                    $tcpobject = new-Object system.Net.Sockets.TcpClient   
                    #Connect to remote machine's port                 
                    $connect = $tcpobject.BeginConnect($c,$p,$null,$null)   
                    #Configure a timeout before quitting   
                    $wait = $connect.AsyncWaitHandle.WaitOne($TCPtimeout,$false)   
                    #If timeout   
                    If(!$wait) {   
                        #Close connection   
                        $tcpobject.Close()   
                        Write-Verbose "Connection Timeout"   
                        #Build report   
                        $temp.Server = $c   
                        $temp.Port = $p   
                        $temp.TypePort = "TCP"   
                        $temp.Open = "False"   
                        $temp.Notes = "Connection to Port Timed Out"   
                    } Else {   
                        $error.Clear()   
                        $tcpobject.EndConnect($connect) | out-Null   
                        #If error   
                        If($error[0]){   
                            #Begin making error more readable in report   
                            [string]$string = ($error[0].exception).message   
                            $message = (($string.split(":")[1]).replace('"',"")).TrimStart()   
                            $failed = $true   
                        }   
                        #Close connection       
                        $tcpobject.Close()   
                        #If unable to query port to due failure   
                        If($failed){   
                            #Build report   
                            $temp.Server = $c   
                            $temp.Port = $p   
                            $temp.TypePort = "TCP"   
                            $temp.Open = "False"   
                            $temp.Notes = "$message"   
                        } Else{   
                            #Build report   
                            $temp.Server = $c   
                            $temp.Port = $p   
                            $temp.TypePort = "TCP"   
                            $temp.Open = "True"     
                            $temp.Notes = ""   
                        }   
                    }      
                    #Reset failed value   
                    $failed = $Null       
                    #Merge temp array with report               
                    $report += $temp   
                }       
                If ($udp) {   
                    #Create temporary holder    
                    $temp = "" | Select Server, Port, TypePort, Open, Notes                                      
                    #Create object for connecting to port on computer   
                    $udpobject = new-Object system.Net.Sockets.Udpclient 
                    #Set a timeout on receiving message  
                    $udpobject.client.ReceiveTimeout = $UDPTimeout  
                    #Connect to remote machine's port                 
                    Write-Verbose "Making UDP connection to remote server"  
                    $udpobject.Connect("$c",$p)  
                    #Sends a message to the host to which you have connected.  
                    Write-Verbose "Sending message to remote host"  
                    $a = new-object system.text.asciiencoding  
                    $byte = $a.GetBytes("$(Get-Date)")  
                    [void]$udpobject.Send($byte,$byte.length)  
                    #IPEndPoint object will allow us to read datagrams sent from any source.   
                    Write-Verbose "Creating remote endpoint"  
                    $remoteendpoint = New-Object system.net.ipendpoint([system.net.ipaddress]::Any,0)  
                    Try {  
                        #Blocks until a message returns on this socket from a remote host.  
                        Write-Verbose "Waiting for message return"  
                        $receivebytes = $udpobject.Receive([ref]$remoteendpoint)  
                        [string]$returndata = $a.GetString($receivebytes) 
                        If ($returndata) { 
                           Write-Verbose "Connection Successful"   
                            #Build report   
                            $temp.Server = $c   
                            $temp.Port = $p   
                            $temp.TypePort = "UDP"   
                            $temp.Open = "True"   
                            $temp.Notes = $returndata    
                            $udpobject.close()    
                        }                        
                    } Catch {  
                        If ($Error[0].ToString() -match "\bRespond after a period of time\b") {  
                            #Close connection   
                            $udpobject.Close()   
                            #Make sure that the host is online and not a false positive that it is open  
                            If (Test-Connection -comp $c -count 1 -quiet) {  
                                Write-Verbose "Connection Open"   
                                #Build report   
                                $temp.Server = $c   
                                $temp.Port = $p   
                                $temp.TypePort = "UDP"   
                                $temp.Open = "True"   
                                $temp.Notes = ""  
                            } Else {  
                                <#  
                                It is possible that the host is not online or that the host is online,   
                                but ICMP is blocked by a firewall and this port is actually open.  
                                #>  
                                Write-Verbose "Host maybe unavailable"   
                                #Build report   
                                $temp.Server = $c   
                                $temp.Port = $p   
                                $temp.TypePort = "UDP"   
                                $temp.Open = "False"   
                                $temp.Notes = "Unable to verify if port is open or if host is unavailable."                                  
                            }                          
                        } ElseIf ($Error[0].ToString() -match "forcibly closed by the remote host" ) {  
                            #Close connection   
                            $udpobject.Close()   
                            Write-Verbose "Connection Timeout"   
                            #Build report   
                            $temp.Server = $c   
                            $temp.Port = $p   
                            $temp.TypePort = "UDP"   
                            $temp.Open = "False"   
                            $temp.Notes = "Connection to Port Timed Out"                          
                        } Else {                       
                            $udpobject.close()  
                        }  
                    }      
                    #Merge temp array with report               
                    $report += $temp   
                }                                   
            }   
        }                   
    }   
    End {   
        #Generate Report   
        $report  
    } 
}

Export-ModuleMember -Function New-ScribestarVM, Set-ScribestarNetwork, New-ScribestarHardDisk, Import-ScribestarServerCSV, Test-ScribestarPort