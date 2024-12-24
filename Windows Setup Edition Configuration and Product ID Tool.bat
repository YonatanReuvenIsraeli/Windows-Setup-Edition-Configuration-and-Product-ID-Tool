@echo off
setlocal
title Windows Setup Edition Configuration and Product ID Tool
echo Program Name: Windows Setup Edition Configuration and Product ID Tool
echo Version: 1.0.0
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli 
net session > nul 2>&1
goto "Start"

:"Start"
echo.
echo [1] Check Windows Setup Edition Configuration and Product ID files.
echo [2] Set Windows Setup Edition Configuration and Product ID files.
echo [3] Delete Windows Setup Edition Configuration and Product ID files.
echo [4] Exit.
echo.
set Start=
set /p Start="What do you want to do? (1-4) "
if /i "%Start%"=="1" goto "DriveLetter"
if /i "%Start%"=="2" goto "DriveLetter"
if /i "%Start%"=="3" goto "DriveLetter"
if /i "%Start%"=="4" goto "Exit"
echo Invalid syntax!
goto "Start"

:"DriveLetter"
echo.
set DriveLetter=
set /p DriveLetter="What is the drive letter of your Windows Installation Media? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="B:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="C:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="D:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="E:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="F:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="G:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="H:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="I:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="J:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="K:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="L:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="M:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="N:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="O:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="P:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Q:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="R:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="S:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="T:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="U:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="V:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="W:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="X:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Y:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Z:" goto "SureDriveLetter"
echo Invalid syntax!
goto "DriveLetter"

:"SureDriveLetter"
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Installation Media? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CheckExistDriveLetter"
if /i "%SureDriveLetter%"=="No" goto "DriveLetter"
echo Invalid syntax!
goto "SureDriveLetter"

:"CheckExistDriveLetter"
if not exist "%DriveLetter%" goto "NotExist"
goto "Bit"

:"NotExist"
echo "%DriveLetter%" does not exist. Please try again.
goto "DriveLetter"

:"Bit"
if exist "%DriveLetter%\sources" if /i "%Start%"=="1" goto "1"
if exist "%DriveLetter%\x86\sources" if /i "%Start%"=="1" goto "1Both"
if exist "%DriveLetter%\x64\sources" if /i "%Start%"=="1" goto "1Both"
if exist "%DriveLetter%\sources" if /i "%Start%"=="2" goto "2"
if exist "%DriveLetter%\x86\sources" if /i "%Start%"=="2" goto "2"
if exist "%DriveLetter%\x64\sources" if /i "%Start%"=="2" goto "2"
if /i "%Start%"=="3" goto "3EICheck"
echo "%DriveLetter%" is not a Windows Installation Media!
goto "DriveLetter"

:"1"
echo.
echo Edition configuration details:
if exist "%DriveLetter%\sources\EI.cfg" type "%DriveLetter%\sources\EI.cfg"
if not exist "%DriveLetter%\sources\EI.cfg" echo Edition configuratrion does not exist.
if exist "%DriveLetter%\sources\EI.cfg" echo.
echo.
echo Product ID details:
if exist "%DriveLetter%\sources\PID.txt" type "%DriveLetter%\sources\PID.txt"
if not exist "%DriveLetter%\sources\PID.txt" echo Product ID does not exist.
goto "Start"

:"1Both"
echo.
echo Edition configuration (x86) details:
if exist "%DriveLetter%\x86\sources\EI.cfg" type "%DriveLetter%\x86\sources\EI.cfg"
if not exist "%DriveLetter%\x86\sources\EI.cfg" echo Edition configuratrion does not exist.
if exist "%DriveLetter%\x86\sources\EI.cfg" echo.
echo.
echo Product ID (x86) details:
if exist "%DriveLetter%\x86\sources\PID.txt" type "%DriveLetter%\x86\sources\PID.txt"
if not exist "%DriveLetter%\x86\sources\PID.txt" echo Product ID does not exist.
echo.
echo Edition configuration (x64) details:
if exist "%DriveLetter%\x64\sources\EI.cfg" type "%DriveLetter%\x64\sources\EI.cfg"
if not exist "%DriveLetter%\x64\sources\EI.cfg" echo Edition configuratrion does not exist.
if exist "%DriveLetter%\x64\sources\EI.cfg" echo.
echo.
echo Product ID (x64) details:
if exist "%DriveLetter%\x64\sources\PID.txt" type "%DriveLetter%\x64\sources\PID.txt"
if not exist "%DriveLetter%\x64\sources\PID.txt" echo Product ID does not exist.
goto "Start"

:"2"
echo.
set SureDelete=
set /p SureDelete="Warning! This will delete existing edition configuration and Product ID files. Are you sure you want to continue? (Yes/No) "
if /i "%SureDelete%"=="Yes" if exist "%DriveLetter%\sources" goto "2EI"
if /i "%SureDelete%"=="Yes" if exist "%DriveLetter%\x86\sources" goto "2EIBoth"
if /i "%SureDelete%"=="Yes" if exist "%DriveLetter%\x64\sources" goto "2EIBoth"
if /i "%SureDelete%"=="No" goto "Start"
echo Invalid syntax!
goto "2"

:"2EI"
echo.
set EI=
set /p EI="Do you want to set an edition configuration file? (Yes/No) "
if /i "%EI%"=="Yes" goto "Install"
if /i "%EI%"=="No" goto "PID"
echo Invalid syntax!
goto "2EI"

:"Install"
if exist "%DriveLetter%\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\sources\install.wim" set Install=install.wim
goto "DISM"

:"DISM"
if exist "%cd%\Index.txt" goto "IndexExist"
echo.
echo Getting edition details for Windows Installation Media "%DriveLetter%".
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\%Install%" | find /c /i "Index" > "%cd%\Edition.txt"
set /p EditionNumber=< "%cd%\Edition.txt"
del "%cd%\Edition.txt" /f /q > nul 2>&1
echo Got edition details for Windows Installation Media "%DriveLetter%".
if "%Edition%"=="True" goto "IndexDone"
if "%EditionNumber%"=="3" goto "Edition4"
if "%EditionNumber%"=="7" goto "Edition8"
if "%EditionNumber%"=="11" goto "Edition12"
echo.
echo Invalid Windows Disk Image!
goto "Start"

:"IndexExist"
set Edition=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\Edition.txt" in order for this batch file to proceed. "%cd%\Edition.txt" is not a system file. Press any key to continue when "%cd%\Edition.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "2"

:"IndexDone"
echo.
echo You can now rename or move back the file back to "%cd%\Edition.txt".
if "%EditionNumber%"=="3" goto "Edition4"
if "%EditionNumber%"=="7" goto "Edition8"
if "%EditionNumber%"=="11" goto "Edition12"
echo.
echo Invalid Windows Disk Image!
goto "Start"

:"2EIBoth"
set Both=True
echo.
set EI=
set /p EI="Do you want to set an edition configuration file? (Yes/No) "
if /i "%EI%"=="Yes" goto "Edition8"
if /i "%EI%"=="No" goto "PID"
echo Invalid syntax!
goto "2EIBoth"

:"Edition4"
echo.
echo [1] Set in Windows Setup
echo [2] Home
echo [3] Home Single Language
echo [4] Pro
echo.
set Edition4=
set /p Edition4="Which edition do you want? (1-4) "
if /i "%Edition4%"=="1" goto "SureEdition4"
if /i "%Edition4%"=="2" goto "SureEdition4"
if /i "%Edition4%"=="3" goto "SureEdition4"
if /i "%Edition4%"=="4" goto "SureEdition4"
echo Invalid syntax!
goto "Edition4"

:"SureEdition4"
echo.
set EditionSure=
if /i "%Edition4%"=="1" set /p EditionSure="Are you sure you want to set in Windows Setup? (Yes/No) "
if /i "%Edition4%"=="2" set /p EditionSure="Are you sure you want Home edition? (Yes/No) "
if /i "%Edition4%"=="3" set /p EditionSure="Are you sure you want Home Single Language edition? (Yes/No) "
if /i "%Edition4%"=="4" set /p EditionSure="Are you sure you want Pro edition? (Yes/No) "
if /i "%EditionSure%"=="Yes" goto "RetailOEM"
if /i "%EditionSure%"=="No" goto "Edition3"
echo Invalid syntax!
goto "SureEdition4"

:"Edition8"
echo.
echo [1] Set in Windows Setup
echo [2] Home
echo [3] Home N
echo [4] Home Single Language
echo [5] Education
echo [6] Education N
echo [7] Pro
echo [8] Pro N
echo.
set Edition8=
set /p Edition8="Which edition do you want? (1-8) "
if /i "%Edition8%"=="1" goto "SureEdition8"
if /i "%Edition8%"=="2" goto "SureEdition8"
if /i "%Edition8%"=="3" goto "SureEdition8"
if /i "%Edition8%"=="4" goto "SureEdition8"
if /i "%Edition8%"=="5" goto "SureEdition8"
if /i "%Edition8%"=="6" goto "SureEdition8"
if /i "%Edition8%"=="7" goto "SureEdition8"
if /i "%Edition8%"=="8" goto "SureEdition8"
echo Invalid syntax!
goto "Edition8"

:"SureEdition8"
echo.
set EditionSure=
if /i "%Edition8%"=="1" set /p EditionSure="Are you sure you want to set in Windows Setup? (Yes/No) "
if /i "%Edition8%"=="2" set /p EditionSure="Are you sure you want Home edition? (Yes/No) "
if /i "%Edition8%"=="3" set /p EditionSure="Are you sure you want Home N edition? (Yes/No) "
if /i "%Edition8%"=="4" set /p EditionSure="Are you sure you want Home Single Language edition? (Yes/No) "
if /i "%Edition8%"=="5" set /p EditionSure="Are you sure you want Education edition? (Yes/No) "
if /i "%Edition8%"=="6" set /p EditionSure="Are you sure you want Education N? (Yes/No) "
if /i "%Edition8%"=="7" set /p EditionSure="Are you sure you want Pro edition? (Yes/No) "
if /i "%Edition8%"=="8" set /p EditionSure="Are you sure you want Pro N edition? (Yes/No) "
if /i "%EditionSure%"=="Yes" goto "RetailOEM"
if /i "%EditionSure%"=="No" goto "Edition7"
echo Invalid syntax!
goto "SureEdition8"

:"Edition12"
echo.
echo [1] Set in Windows Setup
echo [2] Home
echo [3] Home N
echo [4] Home Single Language
echo [5] Education
echo [6] Education N
echo [7] Pro
echo [8] Pro N
echo [9] Pro Education
echo [10] Pro Education N
echo [11] Pro for Workstations
echo [12] Pro for Workstations N
echo.
set Edition12=
set /p Edition12="Which edition do you want? (1-12) "
if /i "%Edition12%"=="1" goto "SureEdition12"
if /i "%Edition12%"=="2" goto "SureEdition12"
if /i "%Edition12%"=="3" goto "SureEdition12"
if /i "%Edition12%"=="4" goto "SureEdition12"
if /i "%Edition12%"=="5" goto "SureEdition12"
if /i "%Edition12%"=="6" goto "SureEdition12"
if /i "%Edition12%"=="7" goto "SureEdition12"
if /i "%Edition12%"=="8" goto "SureEdition12"
if /i "%Edition12%"=="9" goto "SureEdition12"
if /i "%Edition12%"=="10" goto "SureEdition12"
if /i "%Edition12%"=="11" goto "SureEdition12"
if /i "%Edition12%"=="12" goto "SureEdition12"
echo Invalid syntax!
goto "Edition12"

:"SureEdition12"
echo.
set EditionSure=
if /i "%Edition12%"=="1" set /p EditionSure="Are you sure you want Home edition? (Yes/No) "
if /i "%Edition12%"=="2" set /p EditionSure="Are you sure you want Home N edition? (Yes/No) "
if /i "%Edition12%"=="3" set /p EditionSure="Are you sure you want Home Single Language edition? (Yes/No) "
if /i "%Edition12%"=="4" set /p EditionSure="Are you sure you want Education edition? (Yes/No) "
if /i "%Edition12%"=="5" set /p EditionSure="Are you sure you want Education N? (Yes/No) "
if /i "%Edition12%"=="6" set /p EditionSure="Are you sure you want Pro edition? (Yes/No) "
if /i "%Edition12%"=="7" set /p EditionSure="Are you sure you want Pro N edition? (Yes/No) "
if /i "%Edition12%"=="8" set /p EditionSure="Are you sure you want Pro Education edition? (Yes/No) "
if /i "%Edition12%"=="9" set /p EditionSure="Are you sure you want Pro Education N editon? (Yes/No) "
if /i "%Edition12%"=="10" set /p EditionSure="Are you sure you want Pro for Workstations editon? (Yes/No) "
if /i "%Edition12%"=="11" set /p EditionSure="Are you sure you want Pro for Workstations edition? (Yes/No) "
if /i "%EditionSure%"=="Yes" goto "RetailOEM"
if /i "%EditionSure%"=="No" goto "Edition12"
echo Invalid syntax!
goto "SureEdition12"

:"RetailOEM"
echo.
set RetailOEM=
set /p RetailOEM="Do you want a Retail, OEM version or set in Windows Setup? (Retail/OEM/Set) "
if /i "%RetailOEM%"=="Retail" goto "SureRetailOEM"
if /i "%RetailOEM%"=="OEM" goto "SureRetailOEM"
if /i "%RetailOEM%"=="Set" goto "SureRetailOEM"
echo Invalid syntax!
goto "RetailOEM"

:"SureRetailOEM"
echo.
set SureRetailOEM=
if /i "%RetailOEM%"=="Retail" set /p SureRetailOEM="Are you sure you want a Retail version? (Yes/No) "
if /i "%RetailOEM%"=="OEM" set /p SureRetailOEM="Are you sure you want a OEM version? (Yes/No) "
if /i "%RetailOEM%"=="Set" set /p SureRetailOEM="Are you sure you want to set in Windows Setup? (Yes/No) "
if /i "%SureRetailOEM%"=="Yes" goto "Volume"
if /i "%SureRetailOEM%"=="No" goto "RetailOEM"
echo Invalid syntax!
goto "SureRetailOEM"

:"Volume"
echo.
set Volume=
set /p Volume="Is this a volume license? (Yes/No/Set) "
if /i "%Volume%"=="Yes" goto "SureVolume"
if /i "%Volume%"=="No" goto "SureVolume"
if /i "%Volume%"=="Set" goto "SureVolume"
echo Invalid syntax!
goto "Volume"

:"SureVolume"
echo.
set SureVolume=
if /i "%Volume%"=="Yes" set /p SureVolume="Are you sure this is a volume license? (Yes/No) "
if /i "%Volume%"=="No" set /p SureVolume="Are you sure this is not a volume license? (Yes/No) "
if /i "%Volume%"=="Set" set /p SureVolume="Are you want to set in Windows setup? (Yes/No) "
if /i "%SureVolume%"=="Yes" goto "PID"
if /i "%SureVolume%"=="No" goto "Volume"
echo Invalid syntax!
goto "SureVolume"

:"PID"
echo.
set PID=
set /p PID="Do you want to set up a Product ID file? (Yes/No) "
if /i "%PID%"=="Yes" goto "PIDKey"
if /i "%PID%"=="No" goto "EICheck"
echo Invalid syntax!
goto "PID"

:"PIDKey"
echo.
set PIDKey=
set /p PIDKey="What is your Windows product key (leave blank if you want to set in Windows Setup)? (XXXXX-XXXXX-XXXXX-XXXXX-XXXXX) "
if /i "%PIDKey%"=="" goto "SurePIDKeyBlank"
goto "SurePIDKey"

:"SurePIDKey"
echo.
set SurePIDKey=
set /p SurePIDKey="Are you sure %PIDKey% is your Windows product key? (Yes/No) "
if /i "%SurePIDKey%"=="Yes" goto "EICheck"
if /i "%SurePIDKey%"=="No" goto "PIDKey"
echo Invalid syntax!
goto "SurePIDKey"

:"SurePIDKeyBlank"
echo.
set SurePIDKeyBlank=
set /p SurePIDKeyBlank="Are you sure you want to set in Windows Setup? (Yes/No) "
if /i "%SurePIDKeyBlank%"=="Yes" goto "EICheck"
if /i "%SurePIDKeyBlank%"=="No" goto "PIDKey"
echo Invalid syntax!
goto "SurePIDKeyBlank"

:"EICheck"
if /i not "%Both%"=="True" if /i "%EI%"=="Yes" goto "EISet"
if /i "%Both%"=="True" if /i "%EI%"=="Yes" goto "EISetBoth"
if /i "%EI%"=="No" goto "PIDCheck"

:"EISet"
echo.
echo Setting Windows Setup Edition Configuration file.
(echo [EditionID]) > "%DriveLetter%\sources\EI.cfg"
if /i "%Edition4%"=="1" echo. >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition4%"=="2" (echo Core) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition4%"=="3" (echo CoreSingleLanguage) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition4%"=="4" (echo Professional) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition8%"=="1" echo. >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition8%"=="2" (echo Core) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition8%"=="3" (echo CoreN) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition8%"=="4" (echo CoreSingleLanguage) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition8%"=="5" (echo Education) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition8%"=="6" (echo EducationN) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition8%"=="7" (echo Professional) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition8%"=="8" (echo ProfessionalN) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="1" echo. >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="2" (echo Core) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="3" (echo CoreN) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="4" (echo CoreSingleLanguage) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="5" (echo Education) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="6" (echo EducationN) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="7" (echo Professional) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="8" (echo ProfessionalN) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="9" (echo ProfessionalEducation) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="10" (echo ProfessionalEducationN) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="11" (echo ProfessionalWorkstations) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Edition12%"=="12" (echo ProfessionalWorkstationsN) >> "%DriveLetter%\sources\EI.cfg"
(echo [Channel]) >> "%DriveLetter%\sources\EI.cfg"
if /i "%RetailOEM%"=="Retail" (echo Retail) >> "%DriveLetter%\sources\EI.cfg"
if /i "%RetailOEM%"=="OEM" (echo OEM) >> "%DriveLetter%\sources\EI.cfg"
if /i "%RetailOEM%"=="Set" echo. >> "%DriveLetter%\sources\EI.cfg"
(echo [VL]) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Volume%"=="Yes" (echo 1) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Volume%"=="No" (echo 0) >> "%DriveLetter%\sources\EI.cfg"
if /i "%Volume%"=="Set" echo. >> "%DriveLetter%\sources\EI.cfg"
echo Set up Windows Setup Edition Configuration file.
goto "PIDCheck"

:"EISetBoth"
echo.
echo Setting Windows Setup Edition Configuration file.
(echo [EditionID]) > "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition4%"=="1" echo. >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition4%"=="2" (echo Core) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition4%"=="3" (echo CoreSingleLanguage) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition4%"=="4" (echo Professional) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition8%"=="1" echo. >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition8%"=="2" (echo Core) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition8%"=="3" (echo CoreN) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition8%"=="4" (echo CoreSingleLanguage) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition8%"=="5" (echo Education) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition8%"=="6" (echo EducationN) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition8%"=="7" (echo Professional) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition8%"=="8" (echo ProfessionalN) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="1" echo. >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="2" (echo Core) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="3" (echo CoreN) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="4" (echo CoreSingleLanguage) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="5" (echo Education) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="6" (echo EducationN) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="7" (echo Professional) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="8" (echo ProfessionalN) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="9" (echo ProfessionalEducation) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="10" (echo ProfessionalEducationN) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="11" (echo ProfessionalWorkstations) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Edition12%"=="12" (echo ProfessionalWorkstationsN) >> "%DriveLetter%\x86\sources\EI.cfg"
(echo [Channel]) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%RetailOEM%"=="Retail" (echo Retail) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%RetailOEM%"=="OEM" (echo OEM) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%RetailOEM%"=="Set" echo. >> "%DriveLetter%\x86\sources\EI.cfg"
(echo [VL]) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Volume%"=="Yes" (echo 1) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Volume%"=="No" (echo 0) >> "%DriveLetter%\x86\sources\EI.cfg"
if /i "%Volume%"=="Set" echo. >> "%DriveLetter%\x86\sources\EI.cfg"
(echo [EditionID]) > "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition4%"=="1" echo. >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition4%"=="2" (echo Core) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition4%"=="3" (echo CoreSingleLanguage) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition4%"=="4" (echo Professional) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition8%"=="1" echo. >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition8%"=="2" (echo Core) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition8%"=="3" (echo CoreN) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition8%"=="4" (echo CoreSingleLanguage) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition8%"=="5" (echo Education) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition8%"=="6" (echo EducationN) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition8%"=="7" (echo Professional) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition8%"=="8" (echo ProfessionalN) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="1" echo. >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="2" (echo Core) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="3" (echo CoreN) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="4" (echo CoreSingleLanguage) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="5" (echo Education) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="6" (echo EducationN) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="7" (echo Professional) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="8" (echo ProfessionalN) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="9" (echo ProfessionalEducation) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="10" (echo ProfessionalEducationN) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="11" (echo ProfessionalWorkstations) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Edition12%"=="12" (echo ProfessionalWorkstationsN) >> "%DriveLetter%\x64\sources\EI.cfg"
(echo [Channel]) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%RetailOEM%"=="Retail" (echo Retail) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%RetailOEM%"=="OEM" (echo OEM) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%RetailOEM%"=="Set" echo. >> "%DriveLetter%\x64\sources\EI.cfg"
(echo [VL]) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Volume%"=="Yes" (echo 1) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Volume%"=="No" (echo 0) >> "%DriveLetter%\x64\sources\EI.cfg"
if /i "%Volume%"=="Set" echo. >> "%DriveLetter%\x64\sources\EI.cfg"
echo Set up Windows Setup Edition Configuration file.
goto "PIDCheck"

:"PIDCheck"
if /i not "%Both%"=="True" if /i "%PID%"=="Yes" if /i not "%PIDKey%"=="" goto "PIDSet"
if /i not "%Both%"=="True" if /i "%PID%"=="Yes" if /i "%PIDKey%"=="" goto "PIDSetBlank"
if /i "%Both%"=="True" if /i "%PID%"=="Yes" if /i not "%PIDKey%"=="" goto "PIDSetBoth"
if /i "%Both%"=="True" if /i "%PID%"=="Yes" if /i "%PIDKey%"=="" goto "PIDSetBothBlank"
if /i "%PID%"=="No" goto "Start"

:"PIDSet"
echo.
echo Setting Windows Product ID file.
(echo [PID]) > "%DriveLetter%\sources\PID.txt"
(echo %PIDKey%) >> "%DriveLetter%\sources\PID.txt"
echo Set up Windows Product ID file.
goto "Start"

:"PIDSetBlank"
echo.
echo Setting Windows Product ID file.
(echo [PID]) > "%DriveLetter%\sources\PID.txt"
echo. >> "%DriveLetter%\sources\PID.txt"
echo Set up Windows Product ID file.
goto "Start"

:"PIDSetBoth"
echo.
echo Setting Windows Product ID file.
(echo [PID]) > "%DriveLetter%\x86\sources\PID.txt"
(echo %PIDKey%) >> "%DriveLetter%\x86\sources\PID.txt"
(echo [PID]) > "%DriveLetter%\x64\sources\PID.txt"
(echo %PIDKey%) >> "%DriveLetter%\x64\sources\PID.txt"
echo Set up Windows Product ID file.
goto "Start"

:"PIDSetBothBlank"
echo.
echo Setting Windows Product ID file.
(echo [PID]) > "%DriveLetter%\x86\sources\PID.txt"
echo. >> "%DriveLetter%\x86\sources\PID.txt"
(echo [PID]) > "%DriveLetter%\x64\sources\PID.txt"
echo. >> "%DriveLetter%\x64\sources\PID.txt"
echo Set up Windows Product ID file.
goto "Start"

:"3EICheck"
echo.
set EI=
set /p EI="Do you want to delete edition configuration file? (Yes/No) "
if /i "%EI%"=="Yes" goto "3SureEI"
if /i "%EI%"=="No" goto "3PIDCheck"
echo Invalid syntax
goto "3EICheck"

:"3SureEI"
echo.
set SureEI=
set /p SureEI="Are you sure you want to delete edition configuration file? (Yes/No) "
if /i "%SureEI%"=="Yes" goto "3PIDCheck"
if /i "%SureEI%"=="No" goto "3EICheck"
echo Invalid syntax!
goto "3SureEI"

:"3PIDCheck"
echo.
set PID=
set /p PID="Do you want to delete Poduct ID file? (Yes/No) "
if /i "%PID%"=="Yes" goto "3SurePID"
if /i "%PID%"=="No" goto "3EIDelete"
echo Invalid syntax
goto "3PIDCheck"

:"3SurePID"
echo.
set SurePID=
set /p SurePID="Are you sure you want to delete Product ID file? (Yes/No) "
if /i "%SurePID%"=="Yes" goto "3EIDelete"
if /i "%SurePID%"=="No" goto "3PIDCheck"
echo Invalid syntax!
goto "3SurePID"

:"3EIDelete"
if /i "%EI%"=="Yes" if exist "%DriveLetter%\sources" goto "3EI"
if /i "%EI%"=="Yes" if exist "%DriveLetter%\x86\sources" goto "3BothEIx86"
if /i "%EI%"=="Yes" if exist "%DriveLetter%\x64\sources" goto "3BothEIx86"
if /i "%EI%"=="No" goto "3PIDDelete"

:"3EI"
echo.
if not exist "%DriveLetter%\sources\EI.cfg" echo Edition configuratrion does not exist.
if not exist "%DriveLetter%\sources\EI.cfg" goto "3PIDDelete"
echo Deleting edition configuration.
del "%DriveLetter%\sources\EI.cfg" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorEI"
echo Deleted edition configuration.
goto "3PIDDelete"

:"ErrorEI"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "3EI"

:"3BothEIx86"
echo.
if not exist "%DriveLetter%\x86\sources\EI.cfg" echo Edition configuratrion (x86) does not exist.
if not exist "%DriveLetter%\x86\sources\EI.cfg" goto "3BothEIx64"
echo Deleting edition configuration (x86).
del "%DriveLetter%\x86\sources\EI.cfg" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorBothEI"
echo Deleted edition configuration (x86).
goto "3BothEIx64"

:"3BothEIx64"
echo.
if not exist "%DriveLetter%\x64\sources\EI.cfg" echo Edition configuratrion (x64) does not exist.
if not exist "%DriveLetter%\x64\sources\EI.cfg" goto "3PIDDelete"
echo Deleting edition configuration (x64).
del "%DriveLetter%\x64\sources\EI.cfg" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorBothEI"
echo Deleted edition configuration (x64).
goto "3PIDDelete"

:"ErrorBothEI"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "3BothEIx86"

:"3PIDDelete"
if /i "%PID%"=="Yes" if exist "%DriveLetter%\sources" goto "3PID"
if /i "%PID%"=="Yes" if exist "%DriveLetter%\x86\sources" goto "3BothPIDx86"
if /i "%PID%"=="Yes" if exist "%DriveLetter%\x64\sources" goto "3BothPIDx86"
if /i "%PID%"=="No" goto "Start"

:"3PID"
echo.
if not exist "%DriveLetter%\sources\PID.txt" echo Product ID does not exist.
if not exist "%DriveLetter%\sources\PID.txt" goto "Start"
echo Deleting Product ID.
del "%DriveLetter%\sources\PID.txt" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorPID"
echo Deleted Product ID.
goto "Start"

:"ErrorPID"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "3PID"

:"3BothPIDx86"
echo.
if not exist "%DriveLetter%\x86\sources\PID.txt" echo Product ID (x86) does not exist.
if not exist "%DriveLetter%\x86\sources\PID.txt" goto "3BothPIDx64"
echo Deleting Product ID (x86).
del "%DriveLetter%\x86\sources\PID.txt" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorBothPID"
echo Deleted Product ID (x86).
goto "3BothPIDx64"

:"3BothPIDx64"
echo.
if not exist "%DriveLetter%\x64\sources\PID.txt" echo Product ID (x64) does not exist.
if not exist "%DriveLetter%\x64\sources\PID.txt" goto "Start"
echo Deleting Product ID (x64).
del "%DriveLetter%\x64\sources\PID.txt" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "ErrorBothPID"
echo Deleted Product ID (x64).
goto "Start"

:"ErrorBothPID"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "3BothPIDx86"

:"Exit"
endlocal
exit