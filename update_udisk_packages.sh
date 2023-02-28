#!/bin/bash

set -xe
cd "$(dirname "$0")"

export OPENMLDB_VERSION="0.7.2"

rm -rf ./udisk/apache-zookeeper-3.8.1-bin/
tar xzf ./apache-zookeeper-3.8.1-bin.tar.gz
mv ./apache-zookeeper-3.8.1-bin/ ./udisk/

rm -rf ./udisk/spark-3.2.1-bin-openmldbspark/
tar xzf ./spark-3.2.1-bin-openmldbspark.tgz
mv ./spark-3.2.1-bin-openmldbspark/ ./udisk/

rm -rf ./udisk/openmldb-linux/
tar xzf ./openmldb-${OPENMLDB_VERSION}-linux.tar.gz
mv ./openmldb-${OPENMLDB_VERSION}-linux/ ./udisk/openmldb-linux/

rm -rf ./udisk/openmldb-darwin/
tar xzf ./openmldb-${OPENMLDB_VERSION}-darwin.tar.gz
mv ./openmldb-${OPENMLDB_VERSION}-darwin/ ./udisk/openmldb-darwin/

