#!/bin/bash

set -xe
cd "$(dirname "$0")"
source ./openmldb.env

# Update config for current path
./update_config.sh

$OPENMLDB_HOME/sbin/start-all.sh
