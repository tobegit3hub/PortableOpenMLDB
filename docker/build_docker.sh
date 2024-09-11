#!/bin/bash

set -e

# Cleanup running files
../udisk/cleanup.sh

# Change to parent directory
cd "$(dirname "$0")/../"

docker build -t registry.cn-shenzhen.aliyuncs.com/tobe43/portable-openmldb -f ./docker/Dockerfile .
