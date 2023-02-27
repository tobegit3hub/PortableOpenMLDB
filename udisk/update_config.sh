#!/bin/bash

set -xe
cd "$(dirname "$0")"
source ./openmldb.env

# Update ZooKeeper config
sed -i '' '/dataDir=/d' $ZOOKEEPER_HOME/conf/zoo.cfg
echo "dataDir=${CURRENT_ROOT}/zookeeper_data" >> $ZOOKEEPER_HOME/conf/zoo.cfg

# Update OpenMLDB env config
sed -i '' '/export OPENMLDB_ZK_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_ZK_HOME=${ZOOKEEPER_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sed -i '' '/export OPENMLDB_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_HOME=${OPENMLDB_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sed -i '' '/export SPARK_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export SPARK_HOME=${SPARK_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh

# Update OpenMLDB host config
sed -i '' '/tablet/d' $OPENMLDB_HOME/conf/hosts
echo "[tablet]" >> $OPENMLDB_HOME/conf/hosts
echo "localhost:10921 ${CURRENT_ROOT}/tablet-1" >> $OPENMLDB_HOME/conf/hosts
echo "localhost:10922 ${CURRENT_ROOT}/tablet-2" >> $OPENMLDB_HOME/conf/hosts

# Update TaskManager config
sed -i '' '/offline.data.prefix=/d' $OPENMLDB_HOME/conf/taskmanager.properties
echo "offline.data.prefix=${CURRENT_ROOT}/openmldb_offline_data/" >> $OPENMLDB_HOME/conf/taskmanager.properties
sed -i '' '/spark.home=/d' $OPENMLDB_HOME/conf/taskmanager.properties
echo "spark.home=${SPARK_HOME}" >> $OPENMLDB_HOME/conf/taskmanager.properties

