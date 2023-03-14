#!/bin/bash

set -e

# Change to parent directory
cd "$(dirname "$0")/../"

docker build -t tobegit3hub/portable-openmldb -f ./docker/Dockerfile .
