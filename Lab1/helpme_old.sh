#!/bin/sh
echo –e "What do you need help on:\c"
read topic
man -k $topic | tee file1
echo –e "\n\n Is the list of man pages too long?"
read YN
case $YN in
  [yY]*) echo –e "Please suggest another keyword:\c"
  read topic
  cat file1 | grep $topic | tee file2 rm file1
  mv file2 file1
  ;;
[nN]*) echo –e "Good. Bye for now.\n"
  ;;
esac
