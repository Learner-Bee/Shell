#Shell 教程
##Shell教程
Shell是一个用C语言编写的程序。它是用户使用Linux的桥梁。   
Shell既是一种命令语言，有是一种程序设计语言。
###Shell环境
Shell跟java和php编程一样，需要一个能编写代码的文本编辑器和一个能解释执行的脚本解释器就可以了。  
Linux的Shell种类众多，常见的有：  

* Bourne Shell（/usr/bin/sh或/bin/sh）
* Bourne Again Shell（/bin/bash）
* C Shell(/usr/bin/csh)
* K Shell(/usr/bin/ksh)
* Shell for Root(/sbin/sh)  

本教程关注的是Bash。由于易用和免费，Bash在日常工作中被广泛使用。同时，Bash也是大多数Linux系统默认的Shell   
###第一个Shell脚本
打开文本编辑器（可以使用vi/vim创建文件），新建一个文件test.sh  
实例：#！/bin/bash  
echo "hello world !"  
"#!" 是一个约定的标记。它告诉系统需要什么解释器来执行，即使用哪一种Shell  
echo 用于向窗口输出文本  
###运行Shell的两种方法  
1. 作为可执行程序  
将上面代码保存后，并切到相应目录  
chmod +x test.sh #使脚本具有执行权限  
./test.sh #执行脚本  
2. 作为解释器参数  
这种运行方式是直接运行解释器。其参数就是shell脚本的文件名  
例：/bin/sh  test.sh    
##Shell变量 
your_name="lily"  
注意：变量名前不加美元符合。且变量名和等号间不能有空格。  
变量命名规则:
   
* 首个字符必须为字母（a-z、A-Z）
* 中间不能有空格，中间可以用下划线_ 
* 不能使用标点符号 
* 不能使用bash里的关键字（可用help查看保留关键字）   
###使用变量
使用一个已定义的变量。只要在变量名前加美元符号：  
your_name="lily"  
echo $your_name  
echo ${your_name} 花括号可加可不加。加后为了方便识别变量边界    
已定义的变量可以重新被定义
 