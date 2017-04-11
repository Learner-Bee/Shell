#!/bin/bash
#test Ip
#测试主机在线，把1 2 3换成主机地址
for i in 1 2 3 4 5 6 
do
	echo "the number of $i computer is"
	#-c 1指ping的次数
	ping -c 1 192.168.0.$i
done