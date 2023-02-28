#!/bin/bash

set -e
cd "$(dirname "$0")"
source ./openmldb.env

echo "Current version: "
openmldb-darwin/bin/openmldb --version

tag=`curl -sL https://api.github.com/repos/4paradigm/openmldb/releases/latest | jq -r ".tag_name"`
echo "Latest version: ${version}"
version="${tag:1}"
echo $version

do_upgrade() {
  set -x
  echo "Step1: Stop service and cleanup all data"
  ./cleanup.sh

  echo "Step2: Download the Spark distribution"
  if [ -f ./spark-3.2.1-bin-openmldbspark.tgz ] ; then
    rm ./spark-3.2.1-bin-openmldbspark.tgz
  fi
  wget "https://github.com/4paradigm/spark/releases/download/v3.2.1-openmldb${version}/spark-3.2.1-bin-openmldbspark.tgz"
  rm -rf ./spark-3.2.1-bin-openmldbspark/
  tar xzf ./spark-3.2.1-bin-openmldbspark.tgz
  rm spark-3.2.1-bin-openmldbspark.tgz

  echo "Step3: Download the OpenMLDB package"
  if [[ "$OSTYPE" =~ ^darwin ]]; then
    if [ -f "./openmldb-${version}-darwin.tar.gz" ] ; then
      rm "./openmldb-${version}-darwin.tar.gz"
    fi
    wget "https://github.com/4paradigm/OpenMLDB/releases/download/v${version}/openmldb-${version}-darwin.tar.gz"
    rm -rf ./openmldb-darwin/
    tar xzf "./openmldb-${version}-darwin.tar.gz"
    mv "./openmldb-${version}-darwin/" ./openmldb-darwin
    rm "./openmldb-${version}-darwin.tar.gz"
  elif [[ "$OSTYPE" =~ ^linux ]]; then
    if [ -f "./openmldb-${version}-linux.tar.gz" ] ; then
      rm "./openmldb-${version}-linux.tar.gz"
    fi
    wget "https://github.com/4paradigm/OpenMLDB/releases/download/v${version}/openmldb-${version}-linux.tar.gz"
    rm -rf ./openmldb-linux/
    tar xzf "./openmldb-${version}-linux.tar.gz"
    mv "./openmldb-${version}-linux/" ./openmldb-linux
    rm "./openmldb-${version}-linux.tar.gz"
  fi

  echo "Success to upgrade OpenMLDB"
}

while true; do
    read -p "Do you want to cleanup all data and upgrad now? (Y/N) " yn
    case $yn in
        [Yy]* ) do_upgrade; break ;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

