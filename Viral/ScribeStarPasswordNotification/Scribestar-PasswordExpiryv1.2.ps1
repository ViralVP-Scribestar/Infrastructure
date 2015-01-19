#Password Expiry Notification
$smtpserver="smtp-relay.gmail.com"
$emailfrom = "DoNotReply@scribestar.com"
$expireindays = @("30","14","5","4","3","2","1")
$ErrorActionPreference = "stop"

## Directory Creation

$MyDateTime = Get-Date -UFormat %Y:%m:%d:%H:%M:%S
$year = $MyDateTime.Split(":")[0];$month = $MyDateTime.Split(":")[1];$day = $MyDateTime.Split(":")[2]
$hour = $MyDateTime.Split(":")[3];$minute = $MyDateTime.Split(":")[4];$sec = $MyDateTime.Split(":")[5]
$startDateTime = Get-Date

##Log Location
$adfinegrainfailure = "\\nas.scribestar.internal\Shared Resource\Infrastructure\PasswordNotification\ADFineGrainPolicy\ADFineGrainErrorLogs\$year\$month\$day"
$workingpath1 = "$adfinegrainfailure\ADFineGrainErrorLogs-$hour.$minute.$sec.log"
if(-not(Test-Path $adfinegrainfailure)){md $adfinegrainfailure}

$notmemberofGroup = "\\nas.scribestar.internal\Shared Resource\Infrastructure\PasswordNotification\ADFineGrainPolicy\UserMemberGroupErrorLogs\$year\$month\$day"
$workingpath2 = "$notmemberofGroup\UserMemberGroupErrorLogs-$hour.$minute.$sec.log"
if(-not(Test-Path $notmemberofGroup)){md $notmemberofGroup}

$nousermail = "\\nas.scribestar.internal\Shared Resource\Infrastructure\PasswordNotification\ADFineGrainPolicy\NoUserEmailAddressError\$year\$month\$day"
$workingpath3 = "$nousermail\NoUserEmailAddressError-$hour.$minute.$sec.log"
if(-not(Test-Path $nousermail)){md $nousermail}

$collectingusers = "\\nas.scribestar.internal\Shared Resource\Infrastructure\PasswordNotification\ADFineGrainPolicy\PopulatingUserError\$year\$month\$day"
$workingpath4 = "\\$collectingusers\PopulatingUserError-$hour.$minute.$sec.log"
if(-not(Test-Path $collectingusers)){md $collectingusers}

$PasswordNeverExpiresUsersLog = "\\nas.scribestar.internal\Shared Resource\Infrastructure\PasswordNotification\ADFineGrainPolicy\PasswordNeverExpiresUsers\$year\$month\$day"
$workingpath5 = "\\$PasswordNeverExpiresUsersLog\PasswordNeverExpiresUsers-$hour.$minute.$sec.log"
if(-not(Test-Path $PasswordNeverExpiresUsersLog)){md $PasswordNeverExpiresUsersLog}

$PasswordNotRequiredUsersLog = "\\nas.scribestar.internal\Shared Resource\Infrastructure\PasswordNotification\ADFineGrainPolicy\PasswordNotRequired\$year\$month\$day"
$workingpath7 = "\\$PasswordNotRequiredUsersLog\PasswordNotRequiredUsers-$hour.$minute.$sec.log"
if(-not(Test-Path $PasswordNeverExpiresUsersLog)){md $PasswordNotRequiredUsersLog}

Import-Module ActiveDirectory

try {$policy = Get-ADFineGrainedPasswordPolicy -Identity StaffFineGrainPolicy -Properties * -ErrorAction $ErrorActionPreference}

catch { "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $workingpath1 -Append
        "$FailedItem = $_.Exception.ItemName" | Out-File -FilePath $workingpath1 -Append
        Send-MailMessage -From $emailfrom -To viral.patel@scribestar.com -Subject "Failure To Find AD FineGrained Policy" -Attachments $workingpath1 -SmtpServer $smtpserver
        }

$policyname = $policy.Name
$maxPasswordAge = $policy.MaxPasswordAge.Days

$string1 = ($policy.AppliesTo).Trim("CN=")
[string]$string2 = ($string1 -split ",OU=SecurityGroups,DC=SCRIBESTAR,DC=INTERNAL")
$string3 = $string2.TrimEnd(" ")

$groupmember1 = Get-ADGroupMember -Identity $string3
$group = $groupmember1.SamAccountName


try {
    $users = Get-ADGroupMember $group | Get-ADUser -Properties Name, SamAccountName, PasswordNeverExpires, PasswordExpired, PasswordLastSet, PasswordNotRequired, EmailAddress -ErrorAction $ErrorActionPreference | Where-Object {$_.Enabled -eq "True"}

    }

catch {
        $users + "$ErrorMessage = $_.Exception.Message" | Out-File -FilePath $workingpath4 -Append
        $users + "$FailedItem = $_.Exception.ItemName" | Out-File -FilePath $workingpath4 -Append

        }

foreach ($user in $users) 
{
    $Name = $user.Name
    $username = $user.SamAccountName
    $EmailAddress = $user.EmailAddress
    $PasswordSetDate = $user.PasswordLastSet.DayOfYear
                                        
                                        try {
                                              if($user.PasswordNeverExpires -eq $true) {
                                              "$username was set to never expire" | Out-File -FilePath $workingpath5 -Append
                                              Get-ADUser $user | Set-ADUser -PasswordNeverExpires $false -ErrorAction $ErrorActionPreference
                                              Send-MailMessage -From $emailfrom -To Viral.Patel@scribestar.com -Subject "$username Password Was Set To Never Expire" -SmtpServer $smtpserver
                                              }
                                              }

                                              catch {
                                                      "$PasswordNeverExpiresUser + $ErrorMessage = $_.Exception.Message" | Out-File -FilePath $workingpath5 -Append
                                                      "$PasswordNeverExpireUser + $FailedItem = $_.Exception.ItemName" | Out-File -FilePath $workingpath5 -Append
                                                      Send-MailMessage -From $emailfrom -To Viral.Patel@scribestar.com -Subject "Cannot Change Password Expiry Attribute" -Attachments $workingpath5 -SmtpServer $smtpserver
                                                     
                                                      }
                                                      
                                                      
                                              try
                                                   {
                                                   if($user.PasswordNotRequired -eq $true) {
                                                  "$username was set Password Not Required" | Out-File -FilePath $workingpath7 -Append
                                                  Get-ADUser $user | Set-ADUser -PasswordNotRequired $false -ErrorAction $ErrorActionPreference
                                                  Send-MailMessage -From $emailfrom -To Viral.Patel@scribestar.com -Subject "$username Password Was Set To Not Required" -SmtpServer $smtpserver
                                                    }
                                                    
                                                    }
                                                        catch {
                                                                 "$PasswordNotRequiredUser + $ErrorMessage = $_.Exception.Message" | Out-File -FilePath $workingpath7 -Append
                                                                 "$PasswordNotRequiredUser + $FailedItem = $_.Exception.ItemName" | Out-File -FilePath $workingpath7 -Append
                                                                 Send-MailMessage -From $emailfrom -To Viral.Patel@scribestar.com -Subject "Cannot Change Password Not Required Attribute" -Attachments $workingpath6 -SmtpServer $smtpserver

                                                                }




    
    
    
    $passwordnotification = "\\nas.scribestar.internal\Shared Resource\Infrastructure\PasswordNotification\ADFineGrainPolicy\PasswordExpiry\$year\$month\$day"
    $workingpath6 = "\\$passwordnotification\$username.log"
    if(-not(Test-Path $passwordnotification)){md $passwordnotification}
    
    try {
    $PasswordPolicy = (Get-ADUserResultantPasswordPolicy $user -ErrorAction $ErrorActionPreference)
    }
    catch {
            "$user + $ErrorMessage = $_.Exception.Message" | Out-File -FilePath $workingpath2 -Append
             "$user + $FailedItem = $_.Exception.ItemName" | Out-File -FilePath $workingpath2 -Append
             Send-MailMessage -From $emailfrom -To viral.patel@scribestar.com -Subject "Users Not In PasswordPolicy Group" -Attachments $workingpath2 -SmtpServer $smtpserver
             }

$PasswordPolicyName = $PasswordPolicy.Name
if($PasswordPolicyName -eq $policyname)

{

$expireson = $PasswordSetDate + $maxPasswordAge
$todaydate = (Get-Date).DayOfYear
$daystoexpire = $expireson - $todaydate

#Check Number of Days To Expire
$messagedays = $daystoexpire
if (($messagedays) -ge "1")
{
    $messagedays = "in " + "$daystoexpire" + " days."
    }

    else
         {
            $messagedays = "today"
            }

            #Email Subject
            $subject = "Your Password Will Expire $messagedays"
            #Email Body
            $body = "
            Dear $Name
            <p> Your Password for $username account will expire $messagedays.<br>
            To change your password on a PC press CTRL+ALT+Delete and choose Change Password. <br>
            <p> Please note to change your password you must be connected to the office network. You will not be able to change your password over VPN connection.<br>
            <p>Thank You <br>
            <p>ScribeStar IT Services <br>
            </P>"
if($EmailAddress -eq $null){$user.SamAccountName | Out-File -FilePath $workingpath3 -Append
Send-MailMessage -From $emailfrom -To viral.patel@scribestar.com -Subject "$username Has No Email Address" -Attachments $workingpath3 -SmtpServer $smtpserver}

if ($expireindays -contains $daystoexpire)

{
    "$username account Will Expire $messagedays" | Out-File -FilePath $workingpath6 -Append
    Send-MailMessage -From $emailfrom -To $EmailAddress -Bcc Infrastructure@scribestar.com -Subject $subject -Body $body -BodyAsHtml -Priority High -SmtpServer $smtpserver
    
    }
    
    }

    else {
            Send-MailMessage -from $emailfrom -To Viral.Patel@scribestar.com -Subject "$username not equal to $policyname" -SmtpServer $smtpserver
            }
    
    }