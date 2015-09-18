#!/bin/bash
nohup ./start.sh >> netcell.out 2> netcell.err < /dev/null & jobPid=$!
echo $jobPid > netcell.pid
exit 0
