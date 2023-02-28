#!/bin/bash

set -xe
cd "$(dirname "$0")"

cd ./udisk/

tar czf ./portable_openmldb.tar.gz ./*

mv ./portable_openmldb.tar.gz ..
