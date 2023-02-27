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
rm -rf ./tablet-1/db/ ./tablet-1/logs/ ./tablet-1/recycle/ ./tablet-1/db_hdd/ ./tablet-1/recycle_hdd/
rm -rf ./tablet-2/db/ ./tablet-2/logs/ ./tablet-2/recycle/ ./tablet-2/db_hdd/ ./tablet-2/recycle_hdd/

# Remove TaskManager files
rm -rf $OPENMLDB_HOME/taskmanager/bin/logs/
rm -rf ./openmldb_offline_data/
