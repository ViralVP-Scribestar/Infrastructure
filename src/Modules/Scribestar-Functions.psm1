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

Function Test-ScribestarPort
{
    Param(
        [parameter(ParameterSetName='ComputerName', Position=0)]
        [string]$ComputerName,
        [parameter(ParameterSetName='IP', Position=0)]
        [System.Net.IPAddress]$IPAddress,
        [parameter(Mandatory=$true , Position=1)]
        [int]$Port,
        [parameter(Mandatory=$true, Position=2)]
        [ValidateSet("TCP", "UDP")]
        [string]$Protocol)

    $RemoteServer = If ([string]::IsNullOrEmpty($ComputerName)) {$IPAddress} 
    
    else {$ComputerName};

    If ($Protocol -eq 'TCP')
    {
        $test = New-Object System.Net.Sockets.TcpClient;
        Try
        {
            Write-Host "Connecting to "$RemoteServer":"$Port" (TCP)..";
            $test.Connect($RemoteServer, $Port);
            Write-Host "Connection successful";
        }
        Catch
        {
            Write-Host "Connection failed";
        }
        Finally
        {
            $test.Dispose();
        }
    }

    If ($Protocol -eq 'UDP')
    {
        $test = New-Object System.Net.Sockets.UdpClient;
        Try
        {
            Write-Host "Connecting to "$RemoteServer":"$Port" (UDP)..";
            $test.Connect($RemoteServer, $Port);
            Write-Host "Connection successful";
        }
        Catch
        {
            Write-Host "Connection failed";
        }
        Finally
        {
            $test.Dispose();
        }
    }
}

Export-ModuleMember -Function New-ScribestarVM, Set-ScribestarNetwork, New-ScribestarHardDisk, Import-ScribestarServerCSV, Test-ScribestarPort