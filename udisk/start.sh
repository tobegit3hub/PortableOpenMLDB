#!/bin/bash

set -xe
cd "$(dirname "$0")"
source ./openmldb.env

# Check the requirements
./check.sh

# Update config for current path
./update_config.sh

# Start ZooKeeper
# TODO: Check if ZooKeeper starts or not
$ZOOKEEPER_HOME/bin/zkServer.sh start

# Start OpenMLDB
$OPENMLDB_HOME/sbin/start-all.sh

