#!/bin/bash

DIR=$(dirname ${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]})
mkdir -p $DIR/current

function run_task() {
  export BUILD_ROOT=$(dirname $(dirname $DIR))
  export BOOTSTRAP_DIR=${BUILD_ROOT}/.pants.bootstrap
  export FS_DEV_BUCKET=http://bodega.prod.foursquare.com/4sq-dev
  export URL_BASE=$FS_DEV_BUCKET/data/bin
  export CURL_PROXY="proxyout-aux:80"

  $DIR/tasks/$(basename $1).sh "$2" && if [ -f $DIR/required/$1 ]; then cp $DIR/required/$1 $DIR/current/$1; fi
}

function do_in_sudo {
  if [ -z "$NO_SUDO_BOOTSTRAP" ]; then
    sudo "$@"
  else
    echo "NO_SUDO_BOOTSTRAP enabled. Will not perform: " "$@" 1>&2
    exit 1
  fi
}

for task in "$@"; do
  if [ "$0" = "$BASH_SOURCE" ]; then
    if [ $# -gt 1 ]; then
      echo "Running $task upkeep..."
    fi
    run_task "$task" "manually";
  fi
done

