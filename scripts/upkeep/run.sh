#!/bin/bash

DIR=$(dirname ${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]})
mkdir -p $DIR/current

function run_task() {
  $DIR/tasks/$(basename $1).sh && cp $DIR/required/$1 $DIR/current/$1
}

if [ "$0" = "$BASH_SOURCE" ]; then
  run_task $1;
fi
