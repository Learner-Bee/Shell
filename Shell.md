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

##Shell echo命令
###显示普通字符串
echo "It is a test"  
双引号可省略：echo It is a test  
###显示转移字符 
echo "\"It is a test\"" 或echo \"It is a test\"  
结果："It is a test"
###显示变量
read从标准输入中读取一行，并把输入行的每个字段的值指定给shell变量  
read name  
echo myname is $name  
运行：  
lily #输入
myname is lily #输出  
###显示换行
echo -e "test \n"  # -e 开启转义    
###显示不换行
echo -e "test \c"  #-e 开启/c不换行 
###显示结果定向至文件 
echo "test" >test.sh  
输出结果到test.sh文件中  
###原样输出字符串，不进行转译或取变量（用单引号）
echo '$name \"'  #输出 $name \" 
###显示命令执行时间
echo `date` #反引号，不是单引号  
##Shell printf命令
语法：printf format-string [arguments...]  
printf不会像echo一样输出时自动换行。需手动添加\n  

* format-string：为格式控制字符串
* arguments:为参数列表

例：
printf "%-10s %-8s %-4s \n" 姓名 性别 体重  
printf "%-10s %-8s %-4.2f\n"郭靖 男 55.5555  

* %s %c %d %f都是格式替代符
* %-10s 指一个宽度为10个字符（-表示左对齐，没有表示右对齐）。任何字符都会被显示在10个字符宽度内。不足，已空格填充，超过也会将内容全部显示出来
* %-4.2f 指格式化为小数。其中.2指保留2位小数  

###printf的转义序列 

* \a 警告字符。通常为ASCLL的BEL字符 
* \b 后退（back off）
* \f 换页（formfeed）
* \n 换行
* \r
##Shell test命令
shell中的test命令用与检查某个条件是否成立。可以进行数值、字符、文件三方面测试
###数值测试
* -eq
* -ne
* -gt
* -ge
* -lt
* -le

例：  
a=10 b=20  
if test $a -eq $-b  
then    
 echo "a=b"
else  
 echo "a!=b"  
###字符串测试
* =
* ！=
* -z 字符串 字符串长度为0则true
* -n 字符串 字符串长度不为0则true

###文件测试
同文件运算符命令  
例：  
if test -e test.sh  
then  
 echo "file existence"
else  
 echo "file doesnot existence"  
fi

*  -a (与) -o(或) ！（非）将测试条件连接起来。其优先级 ！ > -a > -o 
 
例：  
if test -e test.sh -o -e test.sh  
then  
 echo "file existence"
else  
 echo "file doesnot existence"  
fi
##Shell 流程控制
shell的流程控制不可为空  
###if else
* if else语法：  
 if condition   
 then 
  command  
 else  
  command   
 fi   #fi是if倒过来写的。
* if else-if else   
 if condition1  
 then  
command1  
elif condition2  
then   
command2  
else  
command3  
fi   

###for
语法：
 
for  var i in item1 item2...  
do  
command  
done  
例 1： 顺序输出当前列表中的数字  
for loop in 1 2 3   
do  
echo "the value : $loop"  
done  
结果：  
the value :1  
the value :2  
the value :3  
 例2：顺序输出字符串的字符  
for str in 'this is a string'  
do   
echo $str  
done  
结果：  
this is a string
###while
while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。  
语法：  
while condition   
do 
 command  
done  

* 用于不断执行一系列命令
例：  
a=1  
whlie (($a<=3))  
do   
echo $a
let "a++"  
done  
结果：  
1  
2  
3  
* 用于读取键盘信息  
while read film   
do   
echo "$file is a nice film"   
done

###无限循环
语法：  
while ：  
do 
 command  
 done  
或者  
whlie true   
do  
command  
done  
或者  
for（（ ； ；））  
###until循环
执行一系列命令直至条件为真时停止  
语法：  
until condition 
do  
command  
done   
先执行循环，再判断条件，所以循环至少执行1次  
###case
case语句为多选择语句。可以用case语句匹配一个值与一个模式。如果匹配成功，执行匹配的命令 ,不再匹配其他模式
语法：   
 case 值 in  
 模式1）  
  command1  
  command2  
  ...  
  ;;  
 模式2）  
 command1  
 command2   
 ...  
 ;;  
esac   
例：  
echo " enter 1-4:"  
read num  
case $num in  
1) echo "you enter 1"  
 ;;   
2) echo "you enter 2"  
;;  
3) echo "you enter 3"  
;;  
4) echo "you enter 4"    
;;   
esac  
###跳出循环
###break命令
break命令允许跳出所有循环（终止执行后面的所有循环）
例：  
while :  
do   
 echo "enter 1-5:"  
read num  
case $num in   
1|2|3|4|5) echo "you enter $num"  
;;  
*) echo "not in 1-5"  
break   
;;  
esac  
done  #输入1-5会无限循环下去。当输入不是1-5时，跳出整个循环，结束循环  
###continue  
不会跳出所有循环，只会跳出当前循环  
上面例子  
*） echo "not in 1-5"  
continue   
echo "game over"  #当输入不是1-5时，跳出当前循环，继续执行上面的循环。所以不会执行game over 命令  
###esac  
esac 为case反过来写的。作为结束标记	
##Shell函数  
shell中函数定义格式：  
[function] funname [()]   
{  action ;  
  [return int];  
}

* 可以带function fun()定义，也可以fun()定义，不带任何参数 
* 参数返回，可以加return 返回，如果不加，将以最后一条命令运行结果，作为返回值。  
**例**：定义一个函数，并执行调用  
demoFun（）{  
echo "2"  
}    
echo "1"  
demoFun  
echo "3"  
执行结果：  
1  
2  
3  
**例**：执行一个带有返回值的函数  
fun（）{  
echo "输入第一个数"  
read num1 
echo "输入第二个数"  
read num2  
return $(($num1+$num2))  #此处必须是两个括号
}  
fun  
echo "输入的两个数之和为：$?"  
函数返回值在调用该函数后通过$?来获得 
 
###函数参数
调用函数时，可以向其传递参数。在函数内部通过$n形式获取参数值。例如，$1表示第一个参数。当n>=10时，应该用${10}来获取  
**例**  
fun3(){  
echo "first:$1"  
echo "second:$2"  
echo "ten:${10}"   #获取第十个参数  
echo "totle:$#"    #获取所有参数个数  
echo "string:$*"   # 输出所有参数	  
}
fun3 2 3 5 4 3 2 33 44 55 66 77

* $# 传递到脚本的参数个数  
* $* 已一个单字符串显示所有向脚本传递的参数
* $$ 脚本运行当前的进程ID   

##Shell输入输出重定向
重定向命令列表：  

* command >file 将输出重定向到file
* command <file 将输入重定向到
* command >>file 将输出以追加的方式重定向到file
* n >file 将文件描述符为n的文件重定向到file
* n >>file 将文件描述符为n的文件以追加的方式重定向到file
* n > $m 将输出文件m和n合并
* n < $m 将输入文件m和n合并
* << tag 将开始标记tag和结束标记tag之间的内容作为输入  

**文件描述符0通常是标准输入，1是标准输出，2是标准错误输出**  

###输出重定向 
command > file  
执行命令后，将输出的内容存入file。

**注意：任何file里面存在的内容都将被新内容代替。如果要将新内容添加在文件末尾，使用>>** 
###输入重定向
command < file  
需要从键盘获取输入的命令，会转移到文件中读取内容  
command < infile >outfile  
执行命令从infile文件中读取内容，将结果输出到outfile中  
###重定向深入讲解  
一般情况，每个Unix/Linux命令运行时都会打开三个文件    

* 标准输入文件（stdin）：stdin的文件描述为0，Unix程序默认从stdin读取数据
* 标准输出文件（stdout）：文件描述为1，默认向stdout输出数据
* 标准错误文件（stderr）:文件描述为2，Unix程序会向stderr流中写入错误信息
默认情况下，command >file 将stdout重定向到file，command <file 将stdin重定向到file  
如果希望stderr重定向到file,可以这样写：  
command 2 >file  
错误追加到文件末尾  
command 2 >>file   
**2表示标准错误文件（stderr）**  
如果希望将stdout和stderr合并重定向到file：  
command >file 2>$1	
###Here Document
Here Document 是一种特殊的Shell重定向方式。用来将**输入重定向**到一个交互式Shell脚本或程序  
基本形<<式如下：  
command  << delimiter  
document  
delimiter  
作用是将两个delimiter（分隔符）之间的内容（document）作为输入传递给command   

* 结尾的delimiter一定要顶格写，前面不能有任何字符，后面也不能有任何字符。包括空格和tab缩进  
* 开始的delimiter前后空格会被忽略掉

**例**： 在命令行中通过wc -l 命令计算Here Document 行数：  
wc -l << EOF  
输入内容  
EOF   #回车，执行结果为1行  
**例**:可以将Here Document用在脚本中 ：  
cat << EOF  
输入的内容  
EOF  #执行脚本，查看运行结果   
###/dev/null文件
如果想执行执行某个命令，但是不希望在屏幕上显示输出结果，那么可以将输出重定向到/dev/null  
command > /dev/null  
/dev/null是一个特殊的文件，写入到它的内容都会被丢弃；如果想从该文件读取内容，是什么也读不到的。 但是/dev/null非常有用，将命令的输出重定向到它，会起到“禁止输出”的效果  
如果希望屏蔽掉stdout和stderr  
cmmand > /dev/null 2>$1  
##Shell文件包含
Shell也可以包含外部脚本，这样很方便的封装一些公用的代码作为一个独立的文件  
Shell文件包含的语法格式：  
. filename  **注意文件名前的点号和文件中间有个空格**  
或  
source filename  
**例**
在文件test1中编写代码：  
name="lily"  
在文件test2中调用test1中代码：  
. test.sh  # 或source test.sh  
echo "test1-name:$name"  
**注：被包含的文件不需要有可执行权限**

   