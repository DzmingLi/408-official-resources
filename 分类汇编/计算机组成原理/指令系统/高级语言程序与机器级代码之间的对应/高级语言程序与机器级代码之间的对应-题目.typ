// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：高级语言程序与机器级代码之间的对应

== 编译器、汇编器和链接器的基本概念

#block(breakable: false)[#question(label: n => [2016 12])[
将高级语言源程序转换为机器级目标代码文件的程序是
#choices([汇编程序], [链接程序], [编译程序], [解释程序])
]]

#block(breakable: false)[#question(label: n => [2022 20])[
将高级语言源程序转换为可执行目标文件的主要过程是

#choices([预处理→编译→汇编→链接], [预处理→汇编→编译→链接], [预处理→编译→链接→汇编], [预处理→汇编→链接→编译])
]]

== 循环结构语句的机器级表示

#question(label: n => [2017 44])[
原卷第43题共用背景（不含小问）：

已知 $f(n)=sum_(i=0)^n 2^i=2^(n+1)-1=overbrace(11 dots.c 1, n+1"位")"B"$，计算 $f(n)$ 的 C 语言函数 f1 如下：
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
将 f1 中的 int 都改为 float，可得到计算 $f(n)$ 的另一个函数 f2。假设 unsigned 和 int 型数据都占32位，float 采用 IEEE 754 单精度标准。



（10分）在按字节编址的计算机 M 上，题43中 f1 的部分源程序（阴影部分）与对应的机器级代码（包括指令的虚拟地址）如下：
#align(center, table(columns: (2em, 6em, 5em, 16em), stroke: none,
 table.cell(colspan: 4, fill: luma(92%))[`int f1(unsigned n)`],
 [1], [00401020], [55], [`push ebp`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`for(unsigned i=0; i<=n-1; i++)`],
 [], [……], [……], [……],
 [20], [0040105E], [39 4D F4], [`cmp dword ptr [ebp-0Ch], ecx`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`{    power *= 2;`],
 [], [……], [……], [……],
 [23], [00401066], [D1 E2], [`shl edx, 1`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`return sum;`],
 [], [……], [……], [……],
 [35], [0040107F], [C3], [`ret`]))
其中，机器级代码行包括行号、虚拟地址、机器指令和汇编指令。请回答下列问题。
#subquestions[
 + 计算机 M 是 RISC 还是 CISC？为什么？
 + f1 的机器指令代码共占多少字节？要求给出计算过程。
 + 第20条指令 cmp 通过 $i$ 减 $n-1$ 实现对 $i$ 和 $n-1$ 的比较。执行 f1(0)过程中，当 $i=0$ 时，cmp 指令执行后，进/借位标志 CF 的内容是什么？要求给出计算过程。
 + 第23条指令 shl 通过左移操作实现了 power\*2运算，在 f2 中能否也用 shl 指令实现 power\*2？为什么？
]
]
