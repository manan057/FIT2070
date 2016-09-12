#!/bin/sh
# get the command names
# They are in the first column before a tab or a blank character of a formatted output
LIST=`cut -f1 $1 | cut -d " " -f1` #
# You can use echo $LIST to view the value of LIST here #
for R in $LIST
do
  echo Show $R?
  read YN
  case $YN in
    [Yy]*) man $R
    ;;
    *)
    ;;
  esac
done
