#!/bin/bash

### Tracker
# A command-line utility that tracks how you spend your time.
# @Author: David Duan
# @Date: 2018 Dec.

### Sample Usage:
# - tracker start <task-name>: start a new tracker.
# - tracker stop -m <comment>: stop the tracker and enter a descriptive message.
# - tracker add <task-name> <task-duration> -m <comment>

### Constants (you can modify these to suit your needs)
INPUT_FILE='~/.tracker/input.txt'
OUTPUT_FILE='~/.tracker/output.txt'

### Functions
error () {
  echo "$0: $1. Aborted." 1>&2
  exit 1
}

info () {
  echo "$1. Done."
}

start_handler () {
  task_name=$2
  start_time=$(date '+%H:%M:%S')
  echo "Starting $task_name at $start_time"
  info "Written to $OUTPUT_FILE"
}

stop_handler () {
  flag=$1
  case "flag" in
    -m)
      message=$2
      ;;
    *)
      error "unknown flag" 1>&2
  esac
  start_time=$(cat $INPUT_FILE)
  end_time=$(date '%H:%M:%S')
  duration=$(dateutils.ddiff $start_time $end_time -f "%M")
  echo "You invested $duration minutes in this task.
}

add_handler() {
  :
}

### Main
if [$# -lt 2]; then
  error "not enough arguments"
else
  if ["$1" == "start"]; 
  then
    start_handler 
      $2                  # Task Name
  elif ["$1" == "stop"];
  then
    stop_handler 
      $2                  # Flag, currently only handles -m 
      $3                  # If flag == '-m', this is amessage
  elif ["$1" == "add"];
  then
    add_handler 
      $2                  # Task Name
      $3                  # Task Duration
      $4                  # Flag, currently only handles -m
      $5                  # If flag == '-m', this is a message
  fi
fi




