#!/bin/bash

set -e
cd "$(dirname "$0")"
source ./openmldb.env

if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias sedi="sed -i ''"
elif [[ "$OSTYPE" =~ ^linux ]]; then
    alias sedi="sed -i"
fi
shopt -s expand_aliases

# Copy binary for OS
cp ${OPENMLDB_HOME}/bin/openmldb ./tablet-1/bin/openmldb
cp ${OPENMLDB_HOME}/bin/openmldb ./tablet-2/bin/openmldb

# Update ZooKeeper config
cp $ZOOKEEPER_HOME/conf/zoo_sample.cfg $ZOOKEEPER_HOME/conf/zoo.cfg
sedi '/dataDir=/d' $ZOOKEEPER_HOME/conf/zoo.cfg
echo "dataDir=${CURRENT_ROOT}/zookeeper_data" >> $ZOOKEEPER_HOME/conf/zoo.cfg

# Update OpenMLDB env config
sedi '/export OPENMLDB_MODE=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
# TODO: Append in the last line
echo -e "\nexport OPENMLDB_MODE=cluster" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sedi '/export OPENMLDB_USE_EXISTING_ZK_CLUSTER=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_USE_EXISTING_ZK_CLUSTER=true" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sedi '/export OPENMLDB_ZK_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_ZK_HOME=${ZOOKEEPER_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sedi '/export OPENMLDB_ZK_CLUSTER=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_ZK_CLUSTER=127.0.0.1:${ZOOKEEPER_PORT}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sedi '/export OPENMLDB_ZK_ROOT_PATH=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_ZK_ROOT_PATH=${ZOOKEEPER_ROOT_PATH}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sedi '/export OPENMLDB_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export OPENMLDB_HOME=${OPENMLDB_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh
sedi '/export SPARK_HOME=/d' $OPENMLDB_HOME/conf/openmldb-env.sh
echo "export SPARK_HOME=${SPARK_HOME}" >> $OPENMLDB_HOME/conf/openmldb-env.sh

# Update OpenMLDB host config
sedi '/tablet/d' $OPENMLDB_HOME/conf/hosts
echo -e "\n[tablet]" >> $OPENMLDB_HOME/conf/hosts
echo "localhost:${TABLET1_PORT} ${CURRENT_ROOT}/tablet-1" >> $OPENMLDB_HOME/conf/hosts
echo "localhost:${TABLET2_PORT} ${CURRENT_ROOT}/tablet-2" >> $OPENMLDB_HOME/conf/hosts

# Update NameServer config
cp $OPENMLDB_HOME/conf/nameserver.flags.template $OPENMLDB_HOME/conf/nameserver.flags
sedi '/--endpoint=/d' $OPENMLDB_HOME/conf/nameserver.flags
echo -e "\n--endpoint=0.0.0.0:7527" >> $OPENMLDB_HOME/conf/nameserver.flags

# Update Tablet config
sedi '/--endpoint=/d' ./tablet-1/conf/tablet.flags
echo -e "--endpoint=0.0.0.0:10921" >> ./tablet-1/conf/tablet.flags
sedi '/--endpoint=/d' ./tablet-2/conf/tablet.flags
echo -e "--endpoint=0.0.0.0:10922" >> ./tablet-2/conf/tablet.flags

# Update APIServer config
cp $OPENMLDB_HOME/conf/apiserver.flags.template $OPENMLDB_HOME/conf/apiserver.flags
sedi '/--endpoint=/d' $OPENMLDB_HOME/conf/apiserver.flags
echo -e "\n--endpoint=0.0.0.0:9080" >> $OPENMLDB_HOME/conf/apiserver.flags

# Update TaskManager config
cp $OPENMLDB_HOME/conf/taskmanager.properties.template $OPENMLDB_HOME/conf/taskmanager.properties
sedi '/offline.data.prefix=/d' $OPENMLDB_HOME/conf/taskmanager.properties
echo "offline.data.prefix=file://${CURRENT_ROOT}/openmldb_offline_data/" >> $OPENMLDB_HOME/conf/taskmanager.properties
sedi '/spark.home=/d' $OPENMLDB_HOME/conf/taskmanager.properties
echo "spark.home=${SPARK_HOME}" >> $OPENMLDB_HOME/conf/taskmanager.properties


