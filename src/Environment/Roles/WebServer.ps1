param([string]$server)

$file = ".\Data\WebServer-Role.xml"

#If (Test-Path $fileName) {
    #Invoke-Command -ComputerName $server -ScriptBlock     {
    ##    Import-Module Servermanager
     #   Get-Command -Module Servermanager

        Write-Host -fore Green "Installing Web Features and Roles . $file . "
        Install-WindowsFeature -ComputerName $server -ConfigurationFilePath $file 

#        Import-Clixml $file | Add-WindowsFeature

        Write-Host "Installing Firewall Rules!"
        #New-NetFirewallRule -DisplayName "Web Server Rule" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 80, 443
    #}
#}
 #   Else {
  #      Write-Host -fore Red "Unable to find Web features xml file!"
   #     Write-Host -fore Red "$fileName does NOT exist!"
    #    break;
   # }

Write-Host "All Done!"