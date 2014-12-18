#!/bin/bash

DIR=$(dirname ${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]})
mkdir -p $DIR/current

function run_task() {
  $DIR/tasks/$(basename $1).sh "$2" && if [ -f $DIR/required/$1 ]; then cp $DIR/required/$1 $DIR/current/$1; fi
}

if [ "$0" = "$BASH_SOURCE" ]; then
  run_task "$1" "manually";
fi
