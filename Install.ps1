
#CREATE DIRECTORY
New-Item -Path "C:\Program Files\Sysmon" -ItemType Directory
$Path = "C:\Program Files\Sysmon"
Set-Location $Path
Write-Host "Location set $path"

#WEB REQUEST SYSTOOLS FROM MS UZIP AND MOVE TO LOCATION
Write-Host "Retrieving Sysmon..."
Invoke-WebRequest -Uri https://download.sysinternals.com/files/Sysmon.zip -Outfile Sysmon.zip
Write-Host "Sysmon Retrived"
Write-Host "Unzip Sysmon..."
Expand-Archive Sysmon.zip
Set-Location $path\Sysmon
Write-Host "Unzip Complete."

#WEBREQUEST CONFIG FILE FROM 
Write-Host "Retrieving Configuration File..."
Invoke-WebRequest -Uri .\.AndroidStudio4.0https://raw.githubusercontent.com/TheITCloudGuy/Intune-Sysmon-Installation/main/sysmonconfig-export.xml -Outfile sysmonconfig-export.xml
Write-Host "Configuration File Retrieved."

#INSTALL SYSMON IN DIRECTORY
Write-Host "Installing Sysmon..."
.\sysmon64.exe -accepteula -i sysmonconfig-export.xml
Write-Host "Sysmon Installed!"