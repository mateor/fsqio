#!/bin/bash

DIR=$(dirname ${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]})

source $DIR/run.sh

shopt -s nullglob # without this, empty $DIR would expand * to literal $DIR/*

ran=""
for req_file in $DIR/required/*; do
  task=$(basename $req_file)
  required=$(cat $req_file)

  current=""
  if [ -f $DIR/current/$task ]; then
    current=$(cat $DIR/current/$task)
  fi


  if [ "$current" != "$required" ]; then
    echo "Running upkeep $task (current: '$current' vs required: '$required')..."
    run_task $task
    ran="$ran $task"
  fi
done

if [ "$ran" != "" ]; then
    echo
    echo "$(date +%H:%M:%S) Finished running upkeep tasks: $ran"
fi
