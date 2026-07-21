#!/bin/bash
#
# usage [<listenport> [<forwarding ip address> [<forwarding port>]]]
#
# defaults 4848              gpconnect-api            19191
#
	
CONFIG_FILE=config/GP_CONNECT/tkw-x.properties

# change the listenport number
if [[ ! "$1" == "" ]]
then
	sed -i -e /listenport/s/4848/$1/g $CONFIG_FILE
fi

FORWARDING_IP=gpconnect-api
# change the forwarding ip address
if [[ ! "$2" == "" ]]
then
	FORWARDING_IP=$2
	sed -i -e /forwardingaddress/s/127.0.0.1/$2/g $CONFIG_FILE
else
	# default
	sed -i -e /forwardingaddress/s/127.0.0.1/$FORWARDING_IP/g $CONFIG_FILE
fi

# change the forwarding port number
FORWARDING_PORT=19191
if [[ ! "$3" == "" ]]
then
	FORWARDING_PORT=$3
	sed -i -e /forwardingport/s/5000/$3/g $CONFIG_FILE
else
	# default
	sed -i -e /forwardingport/s/5000/$FORWARDING_PORT/g $CONFIG_FILE
fi

# replace the forwarding rule config
sed -i -e /rules.configuration.file/s/test_tks_rule_config.txt/test_tks_rule_forwarder_config.txt/g $CONFIG_FILE

# wait until the gpconnect docker is up before starting
./wait-for-it.sh -t 0 $FORWARDING_IP:$FORWARDING_PORT

# dont want lots of redundant digests
JAVA_OPTIONS=-Dtks.skipsignlogs=Y

echo java $JAVA_OPTIONS -jar TKW-x.jar -httpinterceptor $CONFIG_FILE
java $JAVA_OPTIONS -jar TKW-x.jar -httpinterceptor $CONFIG_FILE
