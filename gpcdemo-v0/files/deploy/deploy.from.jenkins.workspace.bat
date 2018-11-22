net stop "gpcdemo-v0"

set JENKINS_WORKSPACE=C:\Program Files (x86)\Jenkins\workspace\gpconnect-demonstrator-v0
set GPC_V0_HOME=C:\gpcdemo-v0

xcopy "%JENKINS_WORKSPACE%\config" "%GPC_V0_HOME%\files\config" /s /y /EXCLUDE:%GPC_V0_HOME%\files\deploy\exclusions.txt
xcopy "%JENKINS_WORKSPACE%\gpconnect-demonstrator-api\target\gpconnect-demonstrator-api.war" "%GPC_V0_HOME%" /y

call powershell -Command "Get-ChildItem -Path \"%GPC_V0_HOME%\files\config\sql \" -Filter \"*.sql\" | ForEach-Object { (Get-Content $_.FullName) | ForEach-Object { $_ -replace 'gpconnect', 'gpconnect0' } | Set-Content $_.FullName } "
call powershell -Command "Get-ChildItem -Path \"%GPC_V0_HOME%\files\config \" -Filter \"gpconnect-demonstrator-api.properties\" | ForEach-Object { (Get-Content $_.FullName) | ForEach-Object { $_ -replace 'gpconnect', 'gpconnect0' } | Set-Content $_.FullName } "

net start "gpcdemo-v0"