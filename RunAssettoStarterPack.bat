@echo off
echo Downloading and running Assetto Corsa starter pack script...

REM Download the PowerShell script to a temporary location
powershell -Command Invoke-WebRequest -Uri 'httpsraw.githubusercontent.comyourusernameyourrepomainassetto_corsa_starter_pack.ps1' -OutFile '$envTEMPassetto_corsa_starter_pack.ps1'

REM Run the script with PowerShell
powershell -NoExit -Command Start-Process powershell -ArgumentList '-NoExit', '-File', '$envTEMPassetto_corsa_starter_pack.ps1' -Verb RunAs

REM Clean up the downloaded script
del f q $envTEMPassetto_corsa_starter_pack.ps1

pause
