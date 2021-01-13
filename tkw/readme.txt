1. Install JDK11
2. Install NSSM
3. Unpack the TKW-x.zip file
4. Replace the TKW-x.jar with the newer version.
5. Copy gpcdemo-v1-5\files\config\gpconnect-demonstrator.api.environment.properties files into TKW_ROOT\config\GP_CONNECT\internal\ so the TKW knows the context path of where it is served up.
6. Update the JDK path in TKW_ROOT\runtkw_relative.cmd
7. CD into TKW_ROOT\config\GP_CONNECT and run a 'git pull' to update the GP Connect config files.
8. Check the paths in install-tkw-service.cmd are correct.
9. Run 'install-tkw-service.cmd I' then when the NSSM GUI opens close it
10. Run 'install-tkw-service.cmd I' again, this time it will install the service
11. Run 'install-tkw-service.cmd U' to update the service parameters
12. Run 'net start gpctkw-1-5' to start the TKW service