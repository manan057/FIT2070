#! /bin/sh

compj() {
  file = `ls -t *.java | head -1`
  javac $file
}

compc() {
  file=`ls -t *.c | head -1`
  gcc $file && ./a.out
}

# echo –e "Please enter the file you wish to run:\c"
# read file
if [ $# -eq 1 ] ; then
  if [ $1 = “j” ] ; then
    compj
  elif [ $1 = “c” ] ;
    then compc
  else echo “Invalid file type”
  fi
else echo -e “Usage: $0 file_type\nValid file types are c and j”
fi
