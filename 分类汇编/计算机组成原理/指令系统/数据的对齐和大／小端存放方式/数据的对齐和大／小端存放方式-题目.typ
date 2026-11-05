// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：数据的对齐和大/小端存放方式

#block(breakable: false)[#question(label: n => [2012 15])[
某计算机存储器按字节编址，采用小端方式存放数据。假定编译器规定 int 和
short
型长度分别为32位和16位，并且数据按边界对齐存储。某C语言程序段如下：

```c
struct {
    int a;
    char b;
    short c;
} record;
record.a = 273;
```

若 record 变量的首地址为 0xC008，则地址 0xC008 中内容及 record.c
的地址分别为

#choices(
  [0x00、0xC00D],
  [0x00、0xC00E],
  [0x11、0xC00D],
  [0x11、0xC00E],
)
]]

#block(breakable: false)[#question(label: n => [2016 14])[
某计算机字长为32位，按字节编址，采用小端（Little Endian）方式存放数据。假定有一个 double 型变量，其机器数表示为1122 3344 5566 7788H，存放在0000 8040H开始的连续存储单元中，则存储单元0000 8046H中存放的是
#choices([22H], [33H], [66H], [77H])
]]

#block(breakable: false)[#question(label: n => [2017 13])[
某计算机主存按字节编址，由4个 $64"M" times 8$ 位的 DRAM 芯片采用交叉编址方式构成，并与宽度为32位的存储器总线相连，主存每次最多读写32位数据。若 double 型变量 $x$ 的主存地址为804001AH，则读取 $x$ 需要的存储周期数是
#choices([1], [2], [3], [4])
]]

#block(breakable: false)[#question(label: n => [2018 15])[
某32位计算机按字节编址，采用小端（Little Endian）方式。若语句“`int i = 0;`”对应指令的机器代码为“C7 45 FC 00 00 00 00”，则语句“`int i = -64;`”对应指令的机器代码是

#choices([C7 45 FC C0 FF FF FF], [C7 45 FC 0C FF FF FF], [C7 45 FC FF FF FF C0], [C7 45 FC FF FF FF 0C])
]]

#block(breakable: false)[#question(label: n => [2019 15])[
某计算机采用大端方式，按字节编址。某指令中操作数的机器数为 1234 FF00H，该操作数采用基址寻址方式，形式地址（用补码表示）为 FF12H，基址寄存器内容为 F000 0000H，则该操作数的 LSB（最低有效字节）所在的地址是

#choices([F000 FF12H], [F000 FF15H], [EFFF FF12H], [EFFF FF15H])
]]

#block(breakable: false)[#question(label: n => [2020 14])[
在按字节编址、采用小端方式的32位计算机中，按边界对齐方式为以下 C 语言结构型变量 a 分配存储空间。

```c
struct record {
    short x1;
    int   x2;
} a;
```

若 a 的首地址为2020 FE00H，a 的成员变量 x2 的机器数为1234 0000H，则其中34H所在存储单元的地址是

#choices([2020 FE03H], [2020 FE04H], [2020 FE05H], [2020 FE06H])
]]

#block(breakable: false)[#question(label: n => [2025 15])[
某32位计算机按字节编址，采用小端方式存放数据，编译器按边界对齐方式为下列 C 语言结构型数组变量 $e m p l o y e e$ 分配存储空间。

#block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```c
struct record {
    int id;
    char name[10];
    int salary;
} employee[200];
```
]

若 $e m p l o y e e$ 的首地址为0000 A0B0H，employee[1].id 的机器数为1234 5678H，则该机器数中的56H所在存储单元的地址是

#choices([0000 A0C3H],[0000 A0C4H],[0000 A0C5H],[0000 A0C6H])
]]
