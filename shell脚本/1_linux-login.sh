#!bin/bash
#linux login shell
echo -n "login:"
read name
echo -n "password:"
read password
#if 后面空格，且判断语句放在[]中
if [ $name = "lily" -a $password = "123" ];then
echo "name and password are right"
else  echo "name and password are wrong"
fi