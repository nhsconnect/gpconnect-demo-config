1. Install JDK11
2. Install NSSM
3. Unpack the TKW-x.zip file
4. Copy gpcdemo-v1-5\files\config\gpconnect-demonstrator.api.environment.properties files into TKW_ROOT\config\GP_CONNECT\internal\ so the TKW knows the context path of where it is served up.
5. Update the JDK path in TKW_ROOT\runtkw_relative.cmd
6. CD into TKW_ROOT\config\GP_CONNECT and run a 'git pull' to update the GP Connect config files.
7. Check the paths in install-tkw-service.cmd are correct.
8. Run 'install-tkw-service.cmd I' then when the NSSM GUI opens close it
9. Run 'install-tkw-service.cmd I' again, this time it will install the service
10. Run 'install-tkw-service.cmd U' to update the service parameters
