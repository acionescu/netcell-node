#!/bin/sh
java -Dlog4j.configuration=file:log4j.properties -Djgroups.udp.mcast_addr=228.11.11.10 -Djgroups.udp.mcast_port=51110 -cp .:target/dependency/* ro.zg.util.bootstrap.GenericBootstrap 
bootstrap.properties
