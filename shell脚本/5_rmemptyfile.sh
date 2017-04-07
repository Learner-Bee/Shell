#!/bin/bash
#删除当前目录下大小为0的文件
#-exce表示执行的意思。
# {} \; 是一体。在find命令中出现，用于结束-exce命令
find ./ -size 0 -exce  rm {} \;