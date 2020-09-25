@echo off
rem
rem use nssm to install/edit the GP Connect demonstrator runnignas a docker service
rem
set NSSM=c:\nssm-2.24\win64\nssm
set SERVICE=GPC.TKW.For.Demo.v1.5.0

if "%1" == "D" (
	rem remove old service
	%NSSM% remove %SERVICE% confirm
) else if "%1" == "I" (
	rem install
	set PT=C:\TKW_ROOT\runtkw_relative.cmd
	%NSSM% install %SERVICE% %PT%
) else if "%1" == "U" (
	rem update parameters
	%NSSM% set %SERVICE% DisplayName GPC TKW For Demonstrator 1.5.0
	%NSSM% set %SERVICE% AppStdout "C:\TKW_ROOT\logs\stdout_TKW-For-Demo.1.5.0.log"
	%NSSM% set %SERVICE% AppStderr "C:\TKW_ROOT\logs\stderr_TKW-For-Demo.1.5.0.log"
	%NSSM% set %SERVICE% AppStdoutCreationDisposition 4
	%NSSM% set %SERVICE% AppStderrCreationDisposition 4
	%NSSM% set %SERVICE% AppRotateFiles 1
	%NSSM% set %SERVICE% AppRotateOnline 0
	%NSSM% set %SERVICE% AppRotateSeconds 0
	%NSSM% set %SERVICE% AppRotateBytes 0
) else (
	rem GUI editor
	rem
	%NSSM% edit %SERVICE%
)
