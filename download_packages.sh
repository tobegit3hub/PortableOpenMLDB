#!/bin/bash

set -xe
cd "$(dirname "$0")"

export OPENMLDB_VERSION="0.8.0"

#wget http://topic-land.com:39137/zookeeper/3.8.1/apache-zookeeper-3.8.1-bin.tar.gz
#wget https://openmldb.ai/download/v${OPENMLDB_VERSION}/spark-3.2.1-bin-openmldbspark.tgz
#wget https://github.com/4paradigm/OpenMLDB/releases/download/v${OPENMLDB_VERSION}/openmldb-${OPENMLDB_VERSION}-linux.tar.gz
#wget https://github.com/4paradigm/OpenMLDB/releases/download/v${OPENMLDB_VERSION}/openmldb-${OPENMLDB_VERSION}-darwin.tar.gz

wget --no-check-certificate https://www.openmldb.com/download/v${OPENMLDB_VERSION}/spark-3.2.1-bin-openmldbspark.tgz
wget --no-check-certificate https://www.openmldb.com/download/v${OPENMLDB_VERSION}/openmldb-${OPENMLDB_VERSION}-darwin.tar.gz
wget --no-check-certificate https://www.openmldb.com/download/v${OPENMLDB_VERSION}/openmldb.tar.gz

