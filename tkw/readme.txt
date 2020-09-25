1. Install JDK11
2. Unpack the TKW-x.zip file
3. Copy gpcdemo-v1-5\files\config\gpconnect-demonstrator.api.environment.properties files into TKW_ROOT\config\GP_CONNECT\internal\ so the TKW knows the context path of where it is served up.
4. Update the JDK path in TKW_ROOT\runtkw_relative.cmd
5. CD into TKW_ROOT\config\GP_CONNECT and run a 'git pull' to update the GP Connect config files.
6. Run TKW_ROOT\runtkw_relative.cmd