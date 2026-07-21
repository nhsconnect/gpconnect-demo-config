@echo off
rem
rem usage [<listenport> [<forwarding ip address> [<forwarding port>]]]
rem
rem defaults 4854              127.0.0.1            5000
rem
rem
	
set CONFIG_FILE=config\GP_CONNECT\tkw-x-forwarding.properties

rem dont want lots of redundant digests
set JAVA_OPTIONS=-Dtks.skipsignlogs=Y -Djava.net.preferIPv4Stack=true -Dnetworkaddress.cache.ttl=43200

cd ..
"C:\Program Files\Java\jdk-11\bin\java" %JAVA_OPTIONS% -jar TKW_ROOT\TKW-x.jar TKW_ROOT\%CONFIG_FILE% -httpinterceptor
