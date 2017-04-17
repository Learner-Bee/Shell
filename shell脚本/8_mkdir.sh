#!/bin/bash
while :
do
echo "please input file's name"
read a
if test -e ../shell-learn/$a
        then echo "the file is existing please input new name:"
else
        mkdir $a
        echo "you are sussesful!"
        break
fi
done