#!/usr/bin/env bash

a=1 b=2 c=1 d=2
echo 'please choose any one No 1 or 2'
echo
echo '1.ssh'
echo '2.scp'
echo
read n


if [ $n == $a ] and or
then
   echo "Please enter your remote ip"
   echo 
   read ip
   echo
   echo  "please enter your username"
   echo 
   read username
   ssh $username@$ip
    
elif [ $n == $b ]
then
   echo "Please enter your remote ip"
   echo
   read ip
   echo "1.local -> remote"
   echo "2.remote -> local"
   read no
   if [ $no -eq $c ];
   then
   echo "Please enter source file location"
   echo
   read sourcefile
   echo
   echo "Please enter Destination file location"
   echo
   read destfile
   scp $sourcefile $ip:$destfile
   elif [ $no -eq $d ];
   then
   echo "Please enter remote file location"
   echo
   read remote
   echo
   echo "Please enter Destination file location"
   echo
   read destfile
   scp $ip:$remote $destfile
   fi
else
   echo "None of the condition met"
fi

