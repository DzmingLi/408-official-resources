// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：高级语言程序与机器级代码之间的对应

== 编译器、汇编器和链接器的基本概念

=== 2016 12：C

=== 2022 20：A

== 循环结构语句的机器级表示

=== 2017 44

#subquestions(allow-oversize: true)[
+ M为CISC。（1分）

  M的指令长短不一，不符合RISC指令系统特点。（1分）
+ f1的机器代码占96 B。（1分）

  因为f1的第一条指令`push ebp`所在的虚拟地址为0040 1020H，最后一条指令`ret`所在的虚拟地址为0040 107FH，所以，f1的机器指令代码长度为0040 107FH−0040 1020H+1=60H=96个字节。（1分）
+ CF=1。（1分）

  cmp指令实现$i$与$n-1$的比较功能，进行的是减法运算。在执行f1(0)过程中，$n=0$，当$i=0$时，$i$=0000 0000H，并且$n-1$=FFFF FFFFH。因此，当执行第20条指令时，在补码加/减运算器中执行“0减FFFF FFFFH”的操作，即0000 0000H+0000 0000H+1=0000 0001H，此时，进位输出C=0，减法运算时的借位标志$"CF"="C" xor 1=1$。（2分）
+ f2中不能用shl指令实现power\*2。（1分）

  因为shl指令用来将一个整数的所有有效数位作为一个整体左移；而f2中的变量power是float型，其机器数中不包含最高有效数位，但包含了阶码部分，将其作为一个整体左移时并不能实现“乘2”的功能，因而f2中不能用shl指令实现power\*2。（2分）
]

=== 2023 44

本仓库尚未收录本题参考答案。

=== 2024 44

#subquestions(allow-oversize: true)[
+ $a$ 的首地址存放在 r3；$i$ 存放在 r2；$s u m$ 存放在 r1。
+ $a[i]$ 的地址为0013 E004H；$a[i]$ 的机器数为 FFFF ECDCH；$s u m$ 的机器数为0000 000EH。$a[i]$ 所在页的页号是0013EH。数组 $a$ 至少存放在2页中。
+ 指令机器码为0021 2213H。汇编形式是 slli r4, r2, 1。

]

=== 2026 43

本仓库尚未收录本题参考答案。
