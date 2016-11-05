#!/bin/sh

countdown () {
  sec=$1
  while [ $sec -ge 0 ]; do
    echo -ne "Waiting for $sec seconds...\033[0K\r"
    let "sec = sec - 1"
    sleep 1
  done
}
