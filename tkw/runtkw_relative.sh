#!/bin/bash
#
# usage [<listenport> [<forwarding ip address> [<forwarding port>]]]
#
# defaults 4854              127.0.0.1            5000
#
	
CONFIG_FILE=config/GP_CONNECT/tkw-x-forwarding.properties
cp -f config/GP_CONNECT/tkw-x.properties $CONFIG_FILE

# change the listenport number
if [[ ! "$1" == "" ]]
then
	sed -i -e /listenport/s/4854/$1/g $CONFIG_FILE
fi

FORWARDING_IP=127.0.0.1
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
FORWARDING_PORT=5000
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

# dont want lots of redundant digests
JAVA_OPTIONS="-Dtks.skipsignlogs=Y -Djava.net.preferIPv4Stack=true -Dnetworkaddress.cache.ttl=43200"

cd ..
java $JAVA_OPTIONS -jar TKW_ROOT/TKW-x.jar TKW_ROOT/$CONFIG_FILE -httpinterceptor
