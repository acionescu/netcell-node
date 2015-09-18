#!/bin/bash
source conf.sh
##java -Dlog4j.configuration=file:log4j.properties -Djgroups.udp.mcast_addr=228.11.11.10 -Djgroups.udp.mcast_port=51110 -cp .:target/dependency/* net.segoia.util.bootstrap.GenericBootstrap bootstrap.properties
java -Dlog4j.configuration=file:log4j.properties -Djgroups.udp.mcast_addr=$JGROUPS_MCAST_ADDRESS -Djgroups.udp.mcast_port=$JGROUPS_MCAST_PORT -cp .:repository/:target/dependency/* net.segoia.netcell.control.NodeStarter
