#!/bin/bash

DIR=$(dirname ${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]})

source $DIR/run.sh

set -e

shopt -s nullglob # without this, empty $DIR would expand * to literal $DIR/*

ran=""

# Some upkeep tasks are intented for removing bootstrapped state.
# If they have never been run before, we can assume the state they
# are intended to remove does not exist either, and just mark them
# as having run.
run_on_change_only="clean scrub spindle-upgrade git-shed-resync"

function check() {
  task=$(basename $1)
  required=$(cat $1)

  current=""
  if [ -f $DIR/current/$task ]; then
    current=$(cat $DIR/current/$task)
  else
    if [[ "$run_on_change_only" == *"$task"* ]]; then
      echo "Skipping on-chnage-only $task..."
      current=$required
      if [ -f $1 ]; then
        cp $1 $DIR/current/$task;
      fi
    fi
  fi

  if [ "$current" != "$required" ]; then
    echo "Running upkeep $task (current: '$current' vs required: '$required')..."
    run_task $task
    ran="$ran $task"
  fi
}

if [ "$1" != "" ]; then
  check $DIR/required/$1
else
  for req_file in $DIR/required/*; do
    check $req_file
  done
fi

if [ "$ran" != "" ]; then
    echo
    echo "$(date +%H:%M:%S) Finished running upkeep tasks: $ran"
fi
