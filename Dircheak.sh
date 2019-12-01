#!/bin/bash
dir=$1
error=/dev/null
result=result.txt
testpath=.testdirscriptA
dt=`date +%F-%T`
for dirname in $dir
do 
  ls $dirname 2>$error
  if [ $? == "1" ]
  then	  
  echo "$dirname:1" >> $result
  break
fi
  touch ${dirname}/$testpath 2>$error && rm -f ${dirname}/$testpath
  if [ $? == "1" ] 
    then 
        echo  "$dirname:1 $dt" >> $result
    else 
        echo  "$dirname:0 $dt" >> $result
  fi 
done 
