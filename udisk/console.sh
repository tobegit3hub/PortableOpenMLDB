#!/bin/bash

cd "$(dirname "$0")"

# Contant variables
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle OpenMLDB \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 0 \
    "1" "Start   OpenMLDB cluster" \
    "2" "Stop    OpenMLDB cluster" \
    "3" "Cleanup OpenMLDB cluster" \
    "4" "Upgrade OpenMLDB cluster" \
    "5" "Test    OpenMLDb cluster" \
    "6" "Run     OpenMLDB CLI" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac

  case $selection in
    0 )
      clear
      echo "Program terminated."
      exit 0
      ;;
    1 )
      ./start.sh
      ;;
    2 )
      ./stop.sh
      ;;
    3 )
      ./cleanup.sh
      ;;
    4 )
      ./upgrade.sh
      ;;
    5 )
      ./test.sh
      ;;
    6 )
      ./openmldb_cli.sh
      ;;
  esac

  read -n 1 -s -r -p "Press any key to continue"

done
