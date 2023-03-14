#!/bin/bash

set -xe
cd "$(dirname "$0")"

cd ./udisk/

./cleanup.sh

tar czf ./portable_openmldb.tar.gz ./*

mv ./portable_openmldb.tar.gz ..
