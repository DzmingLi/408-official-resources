// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：整数的表示和运算

== 无符号整数的表示和运算

#block(breakable: false)[#question(label: n => [2012 13])[
假定编译器规定 int 和 short 类型长度分别为 32
位和 16 位，执行下列 C 语言语句：

```c
unsigned short x = 65530;
unsigned int y = x;
```

得到 y的机器数为

#choices(
  [0000 7FFAH],
  [0000 FFFAH],
  [FFFF 7FFAH],
  [FFFF FFFAH],
)
]]

== 带符号整数的表示和运算

#block(breakable: false)[#question(label: n => [2009 12])[
一个C语言程序在一台32位机器上运行。程序中定义了三个变量x、y和z，其中x和z为
int型，y为short型。当 x=127，y=-9时，执行赋值语句
z=x+y后，x、y和z的值分别是

#choices(
  [x=0000007FH，y=FFF9H，z=00000076H],
  [x=0000007FH，y=FFF9H，z=FFFF0076H],
  [x=0000007FH，y=FFF7H，z=FFFF0076H],
  [x=0000007FH，y=FFF7H，z=00000076H],
)
]]

#block(breakable: false)[#question(label: n => [2010 13])[
假定有4个整数用8位补码分别表示为
r1 = FEH，r2 = F2H，r3 = 90H，r4 = F8H。
若将运算结果存放在一个8位寄存器中，则下列运算中会发生溢出的是

#choices(
  [r1×r2],
  [r2×r3],
  [r1×r4],
  [r2×r4],
)
]]

#question(label: n => [2011 43])[
（11分）假定在一个8位字长的计算机中运行如下类C程序段：

```c
unsigned int x = 134;
unsigned int y = 246;
int m = x;
int n = y;
unsigned int z1 = x - y;
unsigned int z2 = x + y;
int k1 = m - n;
int k2 = m + n;
```

若编译器编译时将8个8位寄存器R1～R8分别分配给变量
x、y、m、n、z1、z2、k1和
k2。请回答下列问题。（提示：带符号整数用补码表示）

#subquestions[
+ 
  执行上述程序段后，寄存器R1、R5和R6的内容分别是什么？（用十六进制表示）
  \
+ 执行上述程序段后，变量 m和
  k1的值分别是多少？（用十进制表示）
  \
+ 
  上述程序段涉及带符号整数加/减、无符号整数加/减运算，这四种运算能否利用同一个加法器及辅助电路实现？简述理由。
  \
+ 
  计算机内部如何判断带符号整数加/减运算的结果是否发生溢出？上述程序段中，哪些带符号整数运算语句的执行结果会发生溢出？
  
    
]
]

#block(breakable: false)[#question(label: n => [2013 14])[
某字长为8位的计算机中，已知整型变量
x、y的机器数分别为 $\[x\]_("补") = 11110100$、
$\[y\]_("补") = 10110000$。若整型变量 $z = 2 ast x + y \/ 2$
，则 z的机器数为

#choices(
  [11000000],
  [00100100],
  [10101010],
  [溢出],
)

]]

#block(breakable: false)[#question(label: n => [2014 13])[
若 $x = 103$，$y = -25$，则下列表达式采用8位定点补码运算实现时，会发生溢出的是

#choices(
  [$x + y$],
  [$-x + y$],
  [$x - y$],
  [$-x - y$],
)
]]

#block(breakable: false)[#question(label: n => [2015 13])[
由3个“1”和5个“0”组成的8位二进制补码，能表示的最小整数是

#choices([$-126$], [$-125$], [$-32$], [$-3$])
]]

#block(breakable: false)[#question(label: n => [2016 13])[
有如下C语言程序段：
```c
short si=-32767;
unsigned short usi=si;
```
执行上述两条语句后，usi 的值为
#choices([-32767], [32767], [32768], [32769])
]]

#block(breakable: false)[#question(label: n => [2018 13])[
假定带符号整数采用补码表示，若 int 型变量 $x$ 和 $y$ 的机器数分别是 FFFF FFDFH 和 0000 0041H，则 $x$、$y$ 的值以及 $x-y$ 的机器数分别是

#choices(
  [$x=-65$，$y=41$，$x-y$ 的机器数溢出],
  [$x=-33$，$y=65$，$x-y$ 的机器数为 FFFF FF9DH],
  [$x=-33$，$y=65$，$x-y$ 的机器数为 FFFF FF9EH],
  [$x=-65$，$y=41$，$x-y$ 的机器数为 FFFF FF96H],
)
]]

#block(breakable: false)[#question(label: n => [2018 16])[
整数 $x$ 的机器数为1101 1000，分别对 $x$ 进行逻辑右移1位和算术右移1位操作，得到的机器数各是

#choices([1110 1100，1110 1100], [0110 1100，1110 1100], [1110 1100，0110 1100], [0110 1100，0110 1100])
]]

#block(breakable: false)[#question(label: n => [2019 13])[
考虑以下 C 语言代码：

```c
unsigned short usi = 65535;
short si = usi;
```

执行上述程序段后，si 的值是

#choices([$-1$], [$-32767$], [$-32768$], [$-65535$])
]]

#block(breakable: false)[#question(label: n => [2021 13])[
已知带符号整数用补码表示，变量 $x$、$y$、$z$ 的机器数分别为 FFFDH、FFDFH、7FFCH，下列结论中，正确的是

#choices([若 $x$、$y$ 和 $z$ 为无符号整数，则 $z<x<y$], [若 $x$、$y$ 和 $z$ 为无符号整数，则 $x<y<z$], [若 $x$、$y$ 和 $z$ 为带符号整数，则 $x<y<z$], [若 $x$、$y$ 和 $z$ 为带符号整数，则 $y<x<z$])
]]

#block(breakable: false)[#question(label: n => [2022 13])[
32位补码所能表示的整数范围是

#choices([$-2^32 ∼ 2^31 - 1$], [$-2^31 ∼ 2^31 - 1$], [$-2^32 ∼ 2^32 - 1$], [$-2^31 ∼ 2^32 - 1$])
]]

#block(breakable: false)[#question(label: n => [2023 13])[
若 short 型变量 $x=-8190$，则 $x$ 的机器数是
#choices([E002H], [E001H], [9FFFH], [9FFEH])
]]

#block(breakable: false)[#question(label: n => [2024 12])[
C 语言代码段如下。

#block(stroke: (dash: "dotted", thickness: 0.045em), inset: 0.5em)[
```c
int i=32777;
short si=i;
int j=si;
```
]

执行上述代码段后，$j$ 的值是

#choices([$-32 thin 777$], [$-32 thin 759$], [32 759], [32 777])
]]

#block(breakable: false)[#question(label: n => [2025 12])[
在32位计算机上执行下列 C 语言代码段后，$u i$ 的值是

#block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```c
short si=-32767;
unsigned int ui=si;
```
]

#choices([$2^15-1$],[$2^15+1$],[$2^32-2^15-1$],[$2^32-2^15+1$])
]]

#block(breakable: false)[#question(label: n => [2026 13])[
对机器数1010 0110B先算术右移3位，再算术左移2位，最终结果是
#choices([1101 0000B], [1101 0011B], [0101 0000B], [0101 0011B])
]]
