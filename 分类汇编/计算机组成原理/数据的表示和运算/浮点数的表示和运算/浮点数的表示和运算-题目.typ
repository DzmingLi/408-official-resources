// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：浮点数的表示和运算

== 浮点数的表示

#block(breakable: false)[#question(label: n => [2011 13])[
float型数据通常用IEEE754单精度浮点数格式表示。若编译器将float型变量x分配在一个32位浮点寄存器FR1中，且
$x = - 8.25$ ，则FR1的内容是

#choices(
  [C1040000H],
  [C2420000H],
  [C1840000H],
  [C1C20000H],
)
]]

#block(breakable: false)[#question(label: n => [2012 14])[
float类型（即IEEE754单精度浮点数格式）能表示的最大正整数是

#choices(
  [$2^(1 2 6) - 2^(1 0 3)$],
  [$2^(1 2 7) - 2^(1 0 4)$],
  [$2^(1 2 7) - 2^(1 0 3)$],
  [$2^(1 2 8) - 2^(1 0 4)$],
)
]]

#block(breakable: false)[#question(label: n => [2013 13])[
某数采用IEEE754单精度浮点数格式表示为C6400000H，则该数的值是

#choices(
  [$- 1 . 5 times 2^(1 3)$],
  [$- 1 . 5 times 2^(1 2)$],
  [$- 0 . 5 times 2^(1 3)$],
  [$- 0 . 5 times 2^(1 2)$],
)
]]

#block(breakable: false)[#question(label: n => [2014 14])[
float 型数据通常用 IEEE 754 单精度浮点格式表示。假定两个 float 型变量 $x$ 和 $y$ 分别存放在32位寄存器 f1 和 f2 中，若（f1）= CC90 0000H，（f2）= B0C0 0000H，则 $x$ 和 $y$ 之间的关系为

#choices(
  [$x < y$ 且符号相同],
  [$x < y$ 且符号不同],
  [$x > y$ 且符号相同],
  [$x > y$ 且符号不同],
)

]]

#block(breakable: false)[#question(label: n => [2018 14])[
IEEE 754 单精度浮点格式表示的数中，最小的规格化正数是

#choices([$1.0 times 2^(-126)$], [$1.0 times 2^(-127)$], [$1.0 times 2^(-128)$], [$1.0 times 2^(-149)$])
]]

#block(breakable: false)[#question(label: n => [2020 13])[
已知带符号整数用补码表示，float 型数据用 IEEE 754 标准表示。假定变量 $x$ 的类型只可能是 int 或 float，当 $x$ 的机器数为 C800 0000H 时，$x$ 的值可能是

#choices([$-7 times 2^27$], [$-2^16$], [$2^17$], [$25 times 2^27$])
]]

#block(breakable: false)[#question(label: n => [2021 14])[
下列数值中，不能用 IEEE 754 浮点格式精确表示的是

#choices([1.2], [1.25], [2.0], [2.5])
]]

#block(breakable: false)[#question(label: n => [2022 14])[
$-0.4375$ 的 IEEE 754 单精度浮点数表示为

#choices([BEE0 0000H], [BF60 0000H], [BF70 0000H], [C0E0 0000H])
]]

#block(breakable: false)[#question(label: n => [2023 14])[
已知 float 型变量用 IEEE 754 单精度浮点数格式表示。若 float 型变量 $x$ 的机器数为8020 0000H，则 $x$ 的值是
#choices([$-2^(-128)$], [$-1.01 times 2^(-127)$], [$-1.01 times 2^(-126)$], [非数（NaN）])
]]

#block(breakable: false)[#question(label: n => [2024 14])[
某科学实验中，需要使用大量的整型参数，为了在保证表达精度的基础上提高运算速度，需要选择合理的数据表示方法。若整型参数 $α$、$β$ 的取值范围分别为 $-2^20 ∼ 2^20$、$-2^40 ∼ 2^40$，则下列选项中，$α$、$β$ 最适宜采用的数据表示方法分别是

#choices([32位整数、32位整数], [单精度浮点数、单精度浮点数], [32位整数、双精度浮点数], [单精度浮点数、双精度浮点数])
]]

#block(breakable: false)[#question(label: n => [2025 13])[
已知 float 型变量用 IEEE 754 单精度浮点数格式表示。若 float 型变量 $x$ 的机器数为4730 0000H，则 $x$ 的值是

#choices([$0.375 times 2^14$],[$1.375 times 2^14$],[$0.375 times 2^15$],[$1.375 times 2^15$])
]]

== 浮点数的加/减运算

#block(breakable: false)[#question(label: n => [2009 13])[
浮点数加、减运算过程一般包括对阶、尾数运算、规格化、舍入和判溢出等步骤。设浮点数的阶码和尾数均采用补码表示，且位数分别为5位和7位（均含2位符号位）。若有两个数
$X = 2^7 times 29 \/ 32 \, Y = 2^5 times 5 \/ 8$ ，则用浮点加法计算
X+Y的最终结果是

#choices(
  [00111 1100010],
  [00111 0100010],
  [01000 0010001],
  [发生溢出],
)
]]

#block(breakable: false)[#question(label: n => [2010 14])[
假定变量 i、f和 d的数据类型分别为 int、float和
double（int用补码表示，float和
double分别用IEEE754单精度和双精度浮点数格式表示），已知
$i = 785$，$f = 1.5678 times 10^3$，$d = 1.5 times 10^100$。若在32位机器中执行下列关系表达式，则结果为“真”的是

#statements(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  [I. `i == (int)(float)i`],
  [II. `f == (float)(int)f`],
  [III. `f == (float)(double)f`],
  [IV. `(d + f) - d == f`],
)

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅰ和Ⅲ],
  [仅Ⅱ和Ⅲ],
  [仅Ⅲ和Ⅳ],
)
]]

#block(breakable: false)[#question(label: n => [2015 14])[
下列有关浮点数加减运算的叙述中，正确的是

Ⅰ．对阶操作不会引起阶码上溢或下溢
\
Ⅱ．右规和尾数舍入都可能引起阶码上溢
\
Ⅲ．左规时可能引起阶码下溢
\
Ⅳ．尾数溢出时结果不一定溢出

#choices(
  [仅Ⅱ、Ⅲ],
  [仅Ⅰ、Ⅱ、Ⅳ],
  [仅Ⅰ、Ⅲ、Ⅳ],
  [Ⅰ、Ⅱ、Ⅲ、Ⅳ],
)
]]

#question(label: n => [2017 43])[
（13分）已知 $f(n)=sum_(i=0)^n 2^i=2^(n+1)-1=overbrace(11 dots.c 1, n+1"位")"B"$，计算 $f(n)$ 的 C 语言函数 f1 如下：
```
1  int f1(unsigned n)
2  {    int sum=1, power=1;
3       for(unsigned i=0; i<=n-1; i++)
4       {    power *= 2;
5            sum += power;
6       }
7       return sum;
8  }
```
将 f1 中的 int 都改为 float，可得到计算 $f(n)$ 的另一个函数 f2。假设 unsigned 和 int 型数据都占32位，float 采用 IEEE 754 单精度标准。请回答下列问题。
#subquestions[
 + 当 $n=0$ 时，f1 会出现死循环，为什么？若将 f1 中的变量 $i$ 和 $n$ 都定义为 int 型，则 f1 是否还会出现死循环？为什么？
 + f1(23)和 f2(23)的返回值是否相等？机器数各是什么（用十六进制表示）？
 + f1(24)和 f2(24)的返回值分别为33554431和33554432.0，为什么不相等？
 + $f(31)=2^32-1$，而 f1(31)的返回值却为−1，为什么？若使 f1($n$)的返回值与 $f(n)$ 相等，则最大的 $n$ 是多少？
 + f2(127)的机器数为7F80 0000H，对应的值是什么？若使 f2($n$)的结果不溢出，则最大的 $n$ 是多少？若使 f2($n$)的结果精确（无舍入），则最大的 $n$ 是多少？
]
]

#block(breakable: false)[#question(label: n => [2026 14])[
已知 float 型变量用 IEEE 754 单精度浮点数格式表示，采用就近舍入（中间值取偶数）方式。若 float 型变量 $x$ 值为12.1（提示：0.1 = 0.000 1100 1100 1100 1100 1100…B），则 $x$ 的机器数是
#choices([4141 9999H], [4141 999AH], [41E0 CCCCH], [41E0 CCCDH])
]]
