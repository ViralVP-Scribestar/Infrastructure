@echo off
@rem RCS version: @(#)$Id: $
@rem *****************************************************************
@rem *
@rem *  Command Utility for Catalogic DPX silent install on Windows 
@rem *  **Supported only for fresh install**
@rem *
@rem *  Usage:Make sure that this file is in the same directory as 
@rem *	      the setup file
@rem *	      Modify values based on your Windows installation type
@rem *	      Run winsilent.bat file 	
@rem *
@rem *        This script can be used by other deployment tools 
@rem *****************************************************************

ECHO
ECHO Starting silent install.....
:PREFSET
@rem #############################  MODIFY THIS SECTION ONLY ############################################
@rem ####################################################################################################
@rem ###############
@rem ###############
@rem README !!!!!
@rem ###############
@rem ###############
@rem For MasterServer INSTALLLEVEL=100, for Client INSTALLLEVEL=1
@rem INSTALLER:Enter the full path to the installer on your file system
@rem The installer file you choose depends upon your enterprise. If you wish to deploy 
@rem only basic clients with no additional features such as VAP etc, you can choose the the client-only 
@rem install. If you would like to deploy addtional features supported by silent install 
@rem please use the full installer.
@rem      For example:
@rem      For 32-bit INSTALLER=C:\tmp\DPX-*-win-x86-installer.exe 
@rem      For 64-bit INSTALLER=C:\tmp\DPX-*-win-x64-installer.exe
@rem MASTERSRV: Enter the hostname or IP of your MasterServer
@rem PRODUCTKEY: Only applicable to silently installing Master Server
@rem PRODUCTDIR: Installing the product on a root partition is not supported for example C:\ drive
@rem Setting VAP to Yes installs Virtualization Proxy Server feature, default value is No
@rem for Catalogic DPX clients.
@rem ....Virtualization Proxy Server feature is installed by default for Catalogic DPX Master.
@rem ....Virtualization Proxy Server feature is available only as part of the full installer package.
@rem ....If VAP is set to Yes, BEX_VIRPROXY needs to be set to Yes.
@rem ....If VAP is set to No, BEX_VIRPROXY needs to be set to No.
@rem
@rem Silent install is currently NOT supported for clients with:
@rem         Microsoft Sharepoint
@rem         Microsoft Cluster
@rem Silent install is currently NOT supported for:
@rem         AROS Server
@rem
@rem REBOOT_THE_MACHINE: Setting value to No does not reboot the machine, this is the default value
@rem 			 Setting value to Yes will reboot the machine
@rem ####################################################################################################
@rem ####################################################################################################
@set INSTALLLEVEL=1
@set INSTALLER=DPX-4.3.0-win-x64-clientonly-installer.exe
@set MASTERSRV=10.1.254.40
@set PRODUCTDIR=\"C:\Program Files\DPX\"
@set PRODUCTKEY=
@set VAP=No
@set BEX_VIRPROXY=No
@set REBOOT_THE_MACHINE=No
@rem ####################################################################################################
@rem ####################################################################################################

@rem #############################  DO NOT MODIFY THIS SECTION ##########################################
@rem ###################################  DEFAULT VALUES ################################################
@set ALLUSERS=1
@set REINSTALL=ALL
@set REINSTALLMODE=vamus
@set BEXCJ=cscj
@set BEXREPLICA=No
@set BEX_FORCECJ=Yes
@set SILENTMODE=Yes
@rem ####################################################################################################
@rem ####################################################################################################

set #=%PRODUCTDIR%
set length=0

:loop
if defined # (
    rem shorten string by one character
    set #=%#:~1%
    rem increment the string count variable %length%
    set /A length += 1
    rem repeat until string is null
    goto loop
)

if %length% == 3 goto ROOTPARTNOTSUPP

@set CM=CMAGENTService%COMPUTERNAME%0

:CHKFORNULL
if [%INSTALLLEVEL%] == [] goto NULLVALUES
if [%INSTALLER%] == [] goto NULLVALUES
if [%MASTERSRV%] == [] goto NULLVALUES
if not exist %INSTALLER% goto NOSETUPFILE
ECHO Running silent install.........

:CHKREBOOTVALUE
if /I [%REBOOT_THE_MACHINE%] == [No] (	
	@set REBOOT=1
	)
if /I [%REBOOT_THE_MACHINE%] == [Yes] (	
	@set REBOOT=0
	)

:CHK32MAS
IF %INSTALLLEVEL%==100 (IF %INSTALLER%==DPX-4.3.0-win-x86-installer.exe GOTO ERRORMSG)

:CHKMASPROKEY
IF %INSTALLLEVEL%==100 (IF [%PRODUCTKEY%] == [] GOTO PROERRMSG)

:CHKTYPE
if %INSTALLLEVEL% == 1 goto SILENTCLI
if %INSTALLLEVEL% == 100 goto SILENTMAS

:SILENTCLI
@sc query "%CM%" | FIND "STATE"
if %ERRORLEVEL% EQU 0 goto NOTSUPPEXISTS
ECHO Running client silent install......
%INSTALLER% /s /v"/qn ALLUSERS=%ALLUSERS% REINSTALL=ALL REINSTALLMODE=vamus INSTALLLEVEL=%INSTALLLEVEL% BEX_MASTER=%MASTERSRV% INSTBS=No AROS=No BEX_NO_REBOOT=%REBOOT% BEX_SNAPSHOT_DRIVER=%BEXCJ% VMAGENTLESSPROXY=%VAP% BEX_XRS_REPLICASRV=%BEXREPLICA% BEX_FORCECJUP=%BEX_FORCECJ% INSTALLDIR=%PRODUCTDIR% SILENTMODE=%SILENTMODE% BEX_VIRPROXY=%BEX_VIRPROXY% BEXLOGFILE=\"%userprofile%\\DPXISinstall.log\" /L*v \"%userprofile%\\DPXInstall.log\""
goto END

:SILENTMAS
@sc query "%CM%" | FIND "STATE"
if %ERRORLEVEL% EQU 0 goto NOTSUPPEXISTS
@dir "%windir%\explorer.exe"
if %ERRORLEVEL% EQU 1 goto NOTSUPPCORE
ECHO Running master silent install......
if exist %PRODUCTDIR% goto NOTSUPPEXISTS
%INSTALLER% /s /v"/qn ALLUSERS=%ALLUSERS% REINSTALL=ALL REINSTALLMODE=vamus INSTALLLEVEL=%INSTALLLEVEL% BEX_MASTER=%MASTERSRV% INSTBS=No AROS=No BEX_NEW_SSBE_KEY=%PRODUCTKEY% BEX_NO_REBOOT=%REBOOT% BEX_SNAPSHOT_DRIVER=%BEXCJ% VMAGENTLESSPROXY=Yes BEX_XRS_REPLICASRV=%BEXREPLICA% BEX_FORCECJUP=%BEX_FORCECJ% BEX_VIRPROXY=Yes INSTALLDIR=%PRODUCTDIR% SILENTMODE=%SILENTMODE% BEXLOGFILE=\"%userprofile%\\DPXISinstall.log\" /L*v \"%userprofile%\\DPXInstall.log\""
goto END

:NULLVALUES
ECHO 
ECHO Entries are incomplete to run this script
ECHO Open winsilent.bat and provide values for script to run correctly
pause
goto END3

:NOSETUPFILE
ECHO 
ECHO Product setup file cannot be found
ECHO Please make sure that this script resides in the same directory as the product setup file. 
pause
goto END

:NOTSUPPEXISTS
ECHO
ECHO Product already exists on the machine
ECHO This script is only supported for silently installing Catalogic DPX for the first time
pause
goto END

:NOTSUPPCORE
ECHO
ECHO Catalogic DPX Master Server is not supported on Windows CORE Editions
pause
goto END3

:ERRORMSG
ECHO
ECHO MASTER INSTALLER is not supported on 32bit platforms...
pause
goto END3

:PROERRMSG
ECHO
ECHO Product Key needs to be supplied for MASTER Server install...
pause
goto END3

:ROOTPARTNOTSUPP
ECHO
ECHO Installing Catalogic DPX on the root partition is not supported
goto END3

:END
ECHO Install logs are under %USERPROFILE%
pause
exit /B 0

:END2
pause
exit /B 0

:END3
exit /B 0
