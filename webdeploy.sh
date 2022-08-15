#!/bin/bash

USR="devops"

for host in `cat remhost`
do
  echo "---------------------------------------------------"
  echo "Connecting to Host..."
  echo "Pushing Script to $host"
  scp multios.sh $USR@$host:/tmp/
  echo "Executing Script on $host"
  ssh $USR@$host sudo /tmp/multios.sh
  ssh $USR@$host sudo rm -rf: /tmp/multios.sh

  echo "---------------------------------------------------"
  echo
done
