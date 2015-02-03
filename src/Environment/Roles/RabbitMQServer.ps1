param([string]$server)

$file = ".\Data\RabbitMQServer-Role.xml"
Copy-Item -Path $file -Destination \\$server\c$\roles.xml;

Invoke-Command -ComputerName $server -ScriptBlock     {
    C:\Windows\system32\reg.exe export "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" c:\WUPol.reg
    Remove-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Recurse -Force

    Import-Module Servermanager
    Get-Service WUAUServ,BITS | Stop-Service -PassThru -Verbose |Start-Service -PassThru -Verbose

    Write-Host -fore Green "Installing RabbitMQ Features and Roles"
    Import-Clixml C:\roles.xml | Install-WindowsFeature -Source "Windows Update"

    sleep -Seconds 10

    regedit /s C:\WUPol.reg
    
    Remove-Item C:\WUPol.reg -Force
    Remove-Item C:\roles.xml -Force

    Write-Host "Restarting Server!"
    Restart-Computer -Force
}

Write-Host "All Done!"