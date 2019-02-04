#!/bin/bash

# Start tor process
service tor start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start tor: $status"
  exit $status
fi

# Start polipo process
service polipo start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start polipo: $status"
  exit $status
fi

# Check if processes are still running
while sleep 60; do
  ps aux |grep tor |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep polipo |grep -q -v grep
  PROCESS_2_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done
