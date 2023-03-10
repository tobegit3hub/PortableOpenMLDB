#!/bin/bash

set -e
cd "$(dirname "$0")"
source ./openmldb.env

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

os=$(uname)

if [ "$os" = "Darwin" ]; then
  echo -e "${GREEN}MacOS checked!${NC}"
elif [ "$os" = "Linux" ]; then
  echo -e "${GREEN}Linux checked!${NC}"
elif [[ "$os" == CYGWIN* || "$os" == MINGW* ]]; then
  echo -e "${RED}OS checked fail, Windows is not supported yet!${NC}"
else
  echo -e "${RED}OS checked fail, $os is not supported yet!${NC}"
fi

if [ -n `which java` ]; then
  echo -e "${GREEN}Java checked!${NC}"
else
  echo -e "${RED}Java checked fail, should install java first!${NC}"
  exit -1
fi

function check_port {
  if lsof -i -P -n | grep LISTEN | grep $1; then
    echo -e "${RED}Port $1 checked fail, should release the port first!${NC}"
    exit -1
  else
    echo -e "${GREEN}Port $1 checked!${NC}"
  fi
}

check_port $ZOOKEEPER_PORT
check_port $NAMESERVER_PORT
check_port $TABLET1_PORT
check_port $TABLET2_PORT
check_port $APISERVER_PORT
check_port $TASKMANAGER_PORT

