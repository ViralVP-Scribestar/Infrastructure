param([string]$server)

$file = ".\Data\WebServer-Role.xml"

Invoke-Command -ComputerName $server -ScriptBlock     {
    $file = ".\Data\WebServer-Role.xml"

    #  1. Backup the Windows Update policy
    Write-Host "1"
    C:\Windows\system32\reg.exe export "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" c:\WUPol.reg
    # 2. Remove it
    Write-Host "2"
    Remove-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Recurse -Force

    Write-Host "3"
    Import-Module Servermanager
    Write-Host "4"
    Get-Service WUAUServ,BITS | Stop-Service -PassThru -Verbose |Start-Service -PassThru -Verbose

    Write-Host "5"
    Write-Host -fore Green "Installing Web Features and Roles . $file . "
    Install-WindowsFeature -ConfigurationFilePath "C:\Users\gdrage\Documents\Data\SqlServer-Role.xml" -Source "Windows Update"

    Write-Host "Installing Firewall Rules!"
    New-NetFirewallRule -DisplayName "Web Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 80, 443

    Write-Host "6"
    #  3. Restore the Windows Update policy
    regedit /s C:\WUPol.reg
    Write-Host "7"
    #  4. Remove Backup
    Remove-Item C:\WUPol.reg -Force
}

Write-Host "All Done!"