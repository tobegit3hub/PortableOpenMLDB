#!/bin/bash

set -xe
cd "$(dirname "$0")"
source ./openmldb.env

# Stop all serevices
./stop.sh

# Remove ZooKeeper files
rm -rf ./zookeeper_data/

# Remove log files
rm -rf $OPENMLDB_HOME/logs/

# Remove Tablet files
rm -rf ./tablet-1/db/ ./tablet-1/logs/ ./tablet-1/recycle/
rm -rf ./tablet-2/db/ ./tablet-2/logs/ ./tablet-2/recycle/

# Remove TaskManager files
rm -rf $OPENMLDB_HOME/taskmanager/bin/logs/
rm -rf ./openmldb_offline_data/
