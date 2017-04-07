#!bin/bash
echo "please input a and b"
read a
read b
#空格很正要！！！
if test $a -eq $b
then 
echo "NO.1=NO.2"
elif test $a -gt $b 
then
echo "NO.1>NO.2"
else echo "NO.1<NO.2"
fi