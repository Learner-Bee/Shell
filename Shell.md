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
###Shell变量

your_name="lily"  
注意：变量名前不加美元符合。且变量名和等号间不能有空格。  
变量命名规则:
   
* 首个字符必须为字母（a-z、A-Z）
* 中间不能有空格，中间可以用下划线_ 
* 不能使用标点符号 
* 不能使用bash里的关键字（可用help查看保留关键字）
   
####使用变量
使用一个已定义的变量。只要在变量名前加美元符号：  
your_name="lily"  
echo $your_name  
echo ${your_name} 花括号可加可不加。加后为了方便识别变量边界    
已定义的变量可以重新被定义
####只读变量  
使用readonly命令可以将变量定义为只读，只读变量的值不能被修改    
例：#！／bin／bash  
  readonly name=“lily”  
  name=“tmk”  
  执行报错  
####删除变量  
使用unset 命令删除变量  
语法：unset variable_name  
注：unset命令不能删除只读变量 
####变量类型  
运行Shell时，会同时存在三种变量：
  
* 局部变量：局部变量在脚本和命令中定义，仅在当前Shell实例中有效，其他的shell启动的程序不能访问局部变量  
* 环境变量：所有的程序，包括shell启动的程序，都能访问环境变量，有些程序要使用环境变量来保证其正常运行，必要的时候shell脚本也可以定义环境变量  
* shell变量：shell变量是由shell程序设置的特殊变量。shell变量有一部分时环境变量，一部分时局部变量，这些变量保证了shell的正常运行 

###Shell字符串 
字符串时shell编程中最有用最常用的数据类型。字符串可以用单引号，也可以用双引号，也可以不用引号  
####单引号  
str=‘this is a string’   
单引号字符串限制：

* 单引号里的任何字符都会原样输出，单引号字符串中的变量时无效的 
* 单引号字符串中不能出现单引号 

####双引号
name=“lily”  
str=“Hello，i know you are \"$name\“”  
双引号优点：
  
* 双引号里面可以有变量
* 双引号里面可以有转义字符 

####拼接字符串
name="lily"  
greeting="hello, "¥name""  
greeting_1="hello,{¥name}"
echo ¥greeting  ¥greeting_1  
####获取字符串长度  
str=“abcde”  
echo ¥{#str}  //输出5  
####提取子字符串
str=“this is a string”  

* echo ¥{str:0:4} //:postion:len 从左边第1位开始数4个（从0开始数） 
* echo ¥{str:3} //:postion 从左边第4个开始到结束

####查找子字符串
查找字符“i或s”到位置  
str=“this is a string”  
echo `expr index “¥str” is` //返回字符串is第一个字符i出现的位置：3  
### Shell数组  
bash支持一维数组（不支持多维数组），并且没有限定数组的大小  
数组元素下标由0开始编号。 
 
####定义数组
Shell中数组用括号来表示，数组元素用空格分隔开  
数组名=（值1 值2 值3） 
 
#### 读取数组
¥{数组名[下标]}  
例：valuen=${array[n]}  
使用@可以获取数组中的所有元素  
echo ¥{array[@]}
####获取数组长度
方法同字符串  

* 获取数组元素个数：length=${#array[@]} 
* length=${#array[*]}
* 获取数组元素中单个元素长度：length=${#array[n]}

###Shell注释
以#开头的行就是注释 
sh里没有多行注释。只能一行一行加#  
如果一大段代码要临时注释掉，可以将该段代码用{}括起来，定义成一个函数，没有地方调用这个函数，这段代码就不会执行。达到注释的目的  
##Shell传递参数
在执行Shell脚本时，可以向脚本传递参数。脚本内获取参数的格式为：$n。  
n代表数字，1为执行脚本的第一个参数，2为执行脚本第二个参数  
实例：  
echo "执行的文件名：$0";  
echo "第一个参数为：$1";  
echo "第二个参数为：$2";  
其中$0为执行的文件名   
执行脚本：./test.sh  1  2  
处理参数的特殊字符：

* $#：传递到脚本的参数个数
* $*：以一个字符串显示所有向脚本传递的参数
* $@：同上。但是使用时加引号。
* $$：脚本运行当前的进程ID
* $!：后台运行的最后一个进程的ID
* $?：显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误
* $-：显示Shell使用的当前选项。与set命令相同    
例：echo "参数个数：$#";  
   echo  "传递的参数有：$*"; 
 
**两个获取所有参数的区别**

* 相同点：都是引用所有参数
* 不同点：只有在双引号中体现出来。假设脚本运行时写了三个参数1、2、3...则"*"等价于"1 2 3 "(传递了一个参数)，而"@"等价于"1""2""3"(传递了三个参数)  
例：  
for i in "$*";do  
echo $i;  
done  //输出1 2 3  
  
for i in "$@";do  
echo $i;  
done  
//输出  
1  
2  
3    
##Shell数组
初始化时不需要定义数组大小  
array_name=(value1 value2 ...)  
or  array_name[0]=value0  
array_name[1]=value1  
###读取数组
${array_name[index]}  
###获取数组中的所有元素  
echo ${array_name[*]}  
echo ${array_name[@]}  
输出 1 2 3 4  
输出 1 2 3 4
###获取数组的长度  
${#array_name[*]}  
${#array_name[@]}
##Shell基本运算符
原生Bash不支持简单的算术运算，但是可以通过其他命令来实现。如：awk、expr（最常用）。  
expr是一款表达式计算工具，使用它可完成表达式的求值操作  
例：求和  
val=`expr 2 + 2`  
echo "两数之和：$val"  

* 表达式和运算符之间要有空格，例如2+2是不对的，应该是2 + 2 
* 完整的表达式要用``包含。这个字符不是单引号，是反引号 
###算术运算符
设a为10，b为20

* + 加法  `expr $a + $b`  30 
* - 减法  `expr $a - $b` -10
* * 乘法  `expr $a \* $b` 200
* / 除法  `expr $b / $a` 2
* % 取余  `expr $b % $a` 0
* = 赋值  a=$b 把变量b的值赋给a
* == 比较相等 [ $a == $b ] 返回false
* ！=比较不等 [ $a != $b] 返回true

注：条件表达式要放在[]中，并且要有空格。如[$a==$b]不对，应该为[ $a == $b ]  
例：a=10 b=20 (两个变量间不能用逗号)  
val=`expr $a + $b`
echo "a+b: $val"

val=`expr $a - $b`
echo "a-b:$val"

val=`expr $a \* $b`
echo "a*b:$val"

val=`expr $b / $a`
echo "a/b:$val"

val=`expr $b % $a`
ehco "$val"

if [ $a == $b ]  
then  
  echo "a equal  b"  
fi  

if [ $a != $b ]  
then  
  echo "a not equal b"  
fi  
###关系运算符  
关系运算符只支持数字，不支持字符串，除非字符串的值是数字 

* -eq 检测两个数是否相等，相等返回true  [ $a -eq $b] 返回false
* -ne 检测两个数是否相等，不相等返回true [ $a -ne $b ]返回true
* -gt（greater than）检测左边是否比右边大，是，返回true 
* -lt 检测左边是否小于右边，是，返回true
* -ge 检测左边是否大于等于右边，是，返回true
* -le 检测左边是否小于等于右边

###布尔运算符
假设a=10 b=20

* ！ 非运算
* -o 或运算 例：[ $a -lt 20 -o ¥b -gt 100 ]返回true
* -a 与运算 例：[ $a -lt 20 -a ¥b -gt 100 ]返回false  

###逻辑运算符
* && 逻辑的AND [[ $a -lt 100 && $b -gt 100 ]]false
* || 逻辑的OR  [[ $a -lt 100 || $b -gt 100 ]]true

###字符串运算符
设a为“abc”，b为“efg”  

* = 检测两个字符串是否相等，先等返回true。[ $a = $b ]返回false  
* != 
* -z 检测字符串长度是否为0，为0返回true。[ -z $a ]返回false
* -n 与上相反。不为0返回true
* str 检测字符串是否为空，不为空返回true。[ $a ]true

###文件测试运算符
文件测试运算符用于检测Unix文件到属性

* -b file 检测文件是否时块设备文件（block）。如果是，返回true
* -c file 是字符设备文件，true
* -d file 是目录，true
* -f file 普通文件（既不是目录，也不是设备文件），true
* -r file 文件可读，true
* -w file 文件可写，true
* -x file 文件可执行，true
* -s file 文件是否为空，不为空true
* -e file 文件（目录）是否存在，存在，true