#!/bin/bash
echo "please input a filename"
read  a
if test -e  /home/lilybo/shell-learn/$a 
then 
echo "$a is exist"
else echo "$a is not exist"
fi