#!/bin/bash

set -xe
cd "$(dirname "$0")"
source ./openmldb.env

$OPENMLDB_HOME/bin/openmldb --zk_cluster=127.0.0.1:2181 --zk_root_path=/openmldb --role=sql_client

