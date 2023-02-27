#!/bin/bash

set -xe
cd "$(dirname "$0")"
source ./openmldb.env

# Stop OpenMLDB
# TODO: Fail to get pid file and stop
# $OPENMLDB_HOME/sbin/stop-all.sh
ps aux | grep openmldb | grep -v grep | awk '{print $2}' | xargs kill -9
ps aux | grep taskmanager | grep -v grep | awk '{print $2}' | xargs kill -9

# Stop ZooKeeper
$ZOOKEEPER_HOME/bin/zkServer.sh stop

