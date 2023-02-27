#!/bin/bash

set -xe
cd "$(dirname "$0")"
source ./openmldb.env

# Update ZooKeeper config
cp $ZOOKEEPER_HOME/conf/zoo_sample.cfg $ZOOKEEPER_HOME/conf/zoo.cfg
sed -i '' '/dataDir=/d' $ZOOKEEPER_HOME/conf/zoo.cfg
echo "dataDir=${CURRENT_ROOT}/zookeeper_data" >> $ZOOKEEPER_HOME/conf/zoo.cfg

# Update OpenMLDB env config
sed -i '' '/export OPENMLDB_MODE=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo 'export OPENMLDB_MODE=${OPENMLDB_MODE:=cluster}' >> $OPENMLDB_HOME/conf/openmldb-env.sh
sed -i '' '/export OPENMLDB_USE_EXISTING_ZK_CLUSTER=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_USE_EXISTING_ZK_CLUSTER=true" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sed -i '' '/export OPENMLDB_ZK_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_ZK_HOME=${ZOOKEEPER_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sed -i '' '/export OPENMLDB_ZK_CLUSTER=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_ZK_CLUSTER=127.0.0.1:${ZOOKEEPER_PORT}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sed -i '' '/export OPENMLDB_ZK_ROOT_PATH=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_ZK_ROOT_PATH=${ZOOKEEPER_ROOT_PATH}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sed -i '' '/export OPENMLDB_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_HOME=${OPENMLDB_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sed -i '' '/export SPARK_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export SPARK_HOME=${SPARK_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh

# Update OpenMLDB host config
sed -i '' '/tablet/d' $OPENMLDB_HOME/conf/hosts
echo "[tablet]" >> $OPENMLDB_HOME/conf/hosts
echo "localhost:${TABLET1_PORT} ${CURRENT_ROOT}/tablet-1" >> $OPENMLDB_HOME/conf/hosts
echo "localhost:${TABLET2_PORT} ${CURRENT_ROOT}/tablet-2" >> $OPENMLDB_HOME/conf/hosts

# Update TaskManager config
sed -i '' '/offline.data.prefix=/d' $OPENMLDB_HOME/conf/taskmanager.properties
echo "offline.data.prefix=${CURRENT_ROOT}/openmldb_offline_data/" >> $OPENMLDB_HOME/conf/taskmanager.properties
sed -i '' '/spark.home=/d' $OPENMLDB_HOME/conf/taskmanager.properties
echo "spark.home=${SPARK_HOME}" >> $OPENMLDB_HOME/conf/taskmanager.properties

