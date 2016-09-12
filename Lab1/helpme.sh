#!/bin/sh
echo –e "What do you need help on:\c"
read topic
man -k $topic | tee file1
#
RepeatsLeft="2"
while [ $RepeatsLeft -ne "0" ]
  do
    RepeatsLeft=`expr $RepeatsLeft - 1`
    echo –e "\n\n Is the list of man pages too long (y/n)?"
    read YN
    #
    case $YN in
    [yY]*) echo –e "Please suggest another keyword:\c"
      read topic
      cat file1 | grep -i $topic | tee file2
      rm file1
      mv file2 file1
      ;;
    # [nN]*) echo –e "Good. Bye for now.\n" exit 0
    [nN]*) ./showme file2 exit 0
      ;;
    esac
done
echo –e "Provide a keyword that you wish to exclude: \c"
read AntiKey
cat file1 | grep -iv $AntiKey > file2
# more file2
./showme file2
