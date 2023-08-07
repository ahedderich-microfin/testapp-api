#!/bin/bash

echo "ENVIRONMENT: $ENVIRONMENT"
echo "$@"

if [ $ENVIRONMENT = "dev" ]
then
  until $@; do
      echo "Debug crashed. Respawning"
      sleep 5
  done
else
  $@
fi