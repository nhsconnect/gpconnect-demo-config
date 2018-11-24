net stop "gpcdemo-v1"

set JENKINS_WORKSPACE=C:\Program Files (x86)\Jenkins\workspace\gpconnect-demonstrator-v1
set GPC_V1_HOME=C:\gpcdemo-v1

xcopy "%JENKINS_WORKSPACE%\config" "%GPC_V1_HOME%\files\config" /s /y /EXCLUDE:%GPC_V1_HOME%\files\deploy\exclusions.txt
xcopy "%JENKINS_WORKSPACE%\gpconnect-demonstrator-api\target\gpconnect-demonstrator-api.war" "%GPC_V1_HOME%" /y

net start "gpcdemo-v1"