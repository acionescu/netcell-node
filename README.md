# Description

This illustrates how to install and setup a netcell node

# Requirements

Java , Maven

# Installation

## Clone this repository:

```
git clone git@github.com:acionescu/netcell-node.git
```

## Get the dependencies:

```
mvn clean dependency:copy-dependencies
```

# Configuration

Basically everything should work out of the box. 

You can configure the uderlying JGroups multicast address and port by updating **JGROUPS_MCAST_ADDRESS** and **JGROUPS_MCAST_PORT**
variables in **conf.sh**, but the defaults should work just fine.

You can also change the cluster name where the node will connect to by modifying  **group.name** in **node.properties**.


# Running

Currently there are scripts only for linux.

## Starting the node as a foreground process:

```
./start.sh
```

The output will be availabe in console. Type Ctrl C to exit.

## Starting the node as a background process:

```
./netcell-start.sh
```

The output will be routed to **netcell.out** and the errors to **netcell.err** .

To stop the process:

```
./netcell-stop.sh
```

## Check the logs for a successful start:

If the node has sucessfully started, you should see in the output something like this:

```
[INFO] main - 2015-09-18 11:03:58,126 DistributedServicesManager info - DistributedServicesManager successfuly initialized
```

and 

```
[INFO] Thread-3 - 2015-09-18 11:03:58,178 SocketReceiver info - Started Simple Command Receiver on port 9000
[INFO] Thread-4 - 2015-09-18 11:03:58,179 SocketReceiver info - Started JSON-RPC Command Receiver on port 9010
[INFO] Thread-5 - 2015-09-18 11:03:58,339 RmiCommandReceiver info - Started RMI command receiver using 192.168.0.102 as rmi hostname and 2001 as bind port.
```

## Executing the first command

```
telnet localhost 9000
execute(fid=test.sorting.quick-sort, input=[2,0,1,5])  
rc0[exit=exit, result=[0, 1, 2, 5]]
Ctrl]
quit
```

# What next

Take a look at the [Netcell GUI](https://github.com/acionescu/netcell-gui)

# Troubleshooting

You may see in the logs something like this :

```
Sep 18, 2015 10:42:24 AM org.jgroups.protocols.UDP setBufferSize
WARNING: JGRP000015: the send buffer of socket DatagramSocket was set to 5MB, but the OS only allocated 212.99KB. This might lead to performance problems. Please set your max send buffer in the OS correctly (e.g. net.core.wmem_max on Linux)
Sep 18, 2015 10:42:24 AM org.jgroups.protocols.UDP setBufferSize
WARNING: JGRP000015: the receive buffer of socket DatagramSocket was set to 5MB, but the OS only allocated 212.99KB. This might lead to performance problems. Please set your max receive buffer in the OS correctly (e.g. net.core.rmem_max on Linux)
```

On Linux, you can run (as root):
```
sysctl -w net.core.rmem_max=5000000
sysctl -w net.core.wmem_max=5000000
```

To permanently modify these parameters, add the following lines to **/etc/sysctl.conf**
```
net.core.rmem_max=5000000
net.core.wmem_max=5000000
```
