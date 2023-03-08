#!/bin/bash

set -ex
cd "$(dirname "$0")"
source ./openmldb.env

# Stop OpenMLDB
$OPENMLDB_HOME/sbin/stop-all.sh

# Stop ZooKeeper
$ZOOKEEPER_HOME/bin/zkServer.sh stop

