#!/bin/sh

# trap the signal number 2 and ignore it so that
# when this script is run, it cannot be terminated

trap 'echo you have Pressed Control-C -- I am ignoring it' 2

# perform an infinite loop
while :
do
 echo "Script that ignores the interrupt signal"
 sleep 2
done
