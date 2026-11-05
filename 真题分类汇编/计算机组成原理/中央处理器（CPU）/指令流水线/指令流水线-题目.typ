// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：指令流水线

== 指令流水线的基本概念

#block(breakable: false)[#question(label: n => [2013 18])[
某CPU主频为1.03GHz，采用4级指令流水线，每个流水段的执行需要1个时钟周期。假定CPU执行了100条指令，在其执行过程中，没有发生任何流水线阻塞，此时流水线的吞吐率为

#choices(
  [$0 . 2 5 times 1 0^9$条指令/秒],
  [$0 . 9 7 times 1 0^9$条指令/秒],
  [$1 . 0 times 1 0^9$条指令/秒],
  [$1 . 0 3 times 1 0^9$条指令/秒],
)
]]

== 指令流水线的基本实现

#block(breakable: false)[#question(label: n => [2009 18])[
某计算机的指令流水线由四个功能段组成，指令流经各功能段的时间（忽略各功能段之间的缓存时间）分别为90
ns、80 ns、70 ns和60 ns，则该计算机的 CPU 时钟周期至少是

#choices(
  [90 ns],
  [80 ns],
  [70 ns],
  [60 ns],
)
]]

#block(breakable: false)[#question(label: n => [2017 19])[
下列关于指令流水线数据通路的叙述中，#emphasis[错误]的是
#choices([包含生成控制信号的控制部件], [包含算术逻辑运算部件（ALU）], [包含通用寄存器组和取指部件], [由组合逻辑电路和时序逻辑电路组合而成])
]]

#block(breakable: false)[#question(label: n => [2018 20])[
若某计算机最复杂指令的执行需要完成5个子功能，分别由功能部件 A～E 实现，各功能部件所需时间分别为80 ps、50 ps、50 ps、70 ps 和50 ps，采用流水线方式执行指令，流水段寄存器延时为20 ps，则 CPU 时钟周期至少为

#choices([60 ps], [70 ps], [80 ps], [100 ps])
]]

#block(breakable: false)[#question(label: n => [2025 18])[
下列关于 CPI 和 CPU 时钟周期的叙述中，#emphasis[错误]的是

#choices([不同类型指令的 CPI 可能不一样],[程序的 CPI 与 Cache 缺失率无关],[单周期 CPU 的时钟周期以最耗时指令所用时间为准],[流水线 CPU 的时钟周期以最长流水段所用时间为准])
]]

== 结构冒险、数据冒险和控制冒险的处理

#block(breakable: false)[#question(label: n => [2010 19])[
下列选项中，不会引起指令流水线阻塞的是

#choices(
  [数据旁路（转发）],
  [数据相关],
  [条件转移],
  [资源冲突],
)
]]

#block(breakable: false)[#question(label: n => [2011 18])[
下列给出的指令系统特点中，有利于实现指令流水线的是

I. 指令格式规整且长度一致

Ⅱ. 指令和数据按边界对齐存放

Ⅲ. 只有 Load/Store 指令才能对操作数进行存储访问

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
  [仅Ⅰ、Ⅲ],
  [I、Ⅱ、Ⅲ],
)
]]

#question(label: n => [2012 44])[
（12分）某16位计算机中，带符号整数用补码表示，数据Cache和指令Cache分离。题44表给出了指令系统中部分指令格式，其中Rs和Rd表示寄存器，mem表示存储单元地址，（x）表示寄存器x或存储单元x的内容。

#{
  set figure.caption(position: top)
  figure(
    align(center)[#table(
      columns: 3,
      align: (auto, auto, auto),
      [名称], [指令的汇编格式], [指令功能],
      [加法指令], [ADD Rs,Rd], [(Rs)+(Rd)→Rd],
      [算术/逻辑左移], [SHL Rd], [2\*(Rd)→Rd],
      [算术右移], [SHR Rd], [(Rd)/2→Rd],
      [取数指令], [LOAD Rd,mem], [(mem)→Rd],
      [存数指令], [STORE Rs,mem], [(Rs)→mem],
    )],
    kind: table,
    caption: [题44表　指令系统中部分指令格式],
    numbering: none,
  )
}

该计算机采用5段流水方式执行指令，各流水段分别是取指（IF）、译码/读寄存器（ID）、执行/计算有效地址（EX）、访问存储器（M）和结果写回寄存器（WB），流水线采用“按序发射，按序完成”方式，没有采用转发技术处理数据相关，并且同一个寄存器的读和写操作不能在同一个时钟周期内进行。请回答下列问题。

#subquestions[
+ 若 int 型变量 x 的值为-513，存放在寄存器 R1
  中，则执行指令“SHR R1”后，R1的内容是多少？（用十六进制表示）
  \
+ 
  若某个时间段中，有连续的4条指令进入流水线，在其执行过程中没有发生任何阻塞，则执行这4条指令所需的时钟周期数为多少？
  \
+ 若高级语言程序中某赋值语句为 $x = a + b$
  ，x、a和b均为int型变量，它们的存储单元地址分别表示为 $[x]$、$[a]$ 和 $[b]$。该语句对应的指令序列及其在指令流水线中的执行过程如题44图所示。
  
  #align(center)[
    #grid(
      columns: (2.2em, auto),
      column-gutter: 0.45em,
      row-gutter: 0.18em,
      align: left + horizon,
      [$I_1$], [`LOAD R1, [a]`],
      [$I_2$], [`LOAD R2, [b]`],
      [$I_3$], [`ADD R1, R2`],
      [$I_4$], [`STORE R2, [x]`],
    )
  ]
  
  #figure(
    align(center)[#text(size: 0.82em)[#table(
      columns: (4.8em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em),
      align: center + horizon,
      stroke: 0.6pt,
      [], table.cell(colspan: 14)[时间单元],
      [指令], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14],
      [$I_1$], [IF], [ID], [EX], [M], [WB], [], [], [], [], [], [], [], [], [],
      [$I_2$], [], [IF], [ID], [EX], [M], [WB], [], [], [], [], [], [], [], [],
      [$I_3$], [], [], [IF], [], [], [], [ID], [EX], [M], [WB], [], [], [], [],
      [$I_4$], [], [], [], [], [], [], [IF], [], [], [], [ID], [EX], [M], [WB],
    )]],
    kind: table,
    caption: [题44图　指令序列及其执行过程示意图],
    numbering: none,
  )
  
  则这4条指令执行过程中，$I_3$ 的ID段和
  $I_4$ 的IF段被阻塞的原因各是什么？
  \
+ 若高级语言程序中某赋值语句为
  $x = 2 ast x + a$，x和a均为unsigned
  int类型变量，它们的存储单元地址分别表示为 $[x]$、$[a]$，则执行这条语句至少需要多少个时钟周期？要求模仿题44图画出这条语句对应的指令序列及其在流水线中的执行过程示意图。
  
    
]
]

#block(breakable: false)[#question(label: n => [2014 16])[
采用指令 Cache 与数据 Cache 分离的主要目的是

#choices(
  [降低 Cache 的缺失损失],
  [提高 Cache 的命中率],
  [降低CPU平均访存时间],
  [减少指令流水线资源冲突],
)
]]

#question(label: n => [2014 44])[
（12分）某程序中有如下循环代码段 $P$：

```c
for (i = 0; i < N; i++)
    sum += A[i];
```

假设编译时变量 `sum` 和 $i$ 分别分配在寄存器 R1 和 R2 中，常量 $N$ 在寄存器 R6 中，数组 $A$ 的首地址在寄存器 R3 中。程序段 $P$ 起始地址为08048100H，对应的汇编代码和机器代码如题44表所示。

#{
  set figure.caption(position: top)
  figure(
    kind: table,
    caption: [题44表],
    numbering: none,
  )[
    #table(
      columns: (8.7%, 15.94%, 15.94%, 26.09%, 33.33%),
      align: (auto, auto, auto, auto, auto),
      [编号], [地址], [机器代码], [汇编代码], [注释],
      [1], [08048100H], [00022080H], [loop:sll R4,R2,2], [(R2)＜＜2→R4],
      [2], [08048104H], [00832020H], [add R4,R4,R3], [(R4)+(R3)→R4],
      [3], [08048108H], [8C850000H], [load R5,0(R4)], [((R4)+0)→R5],
      [4], [0804810CH], [00250820H], [add R1,R1,R5], [(R1)+(R5)→R1],
      [5], [08048110H], [20420001H], [addi R2,R2,1], [(R2)+1→R2],
      [6], [08048114H], [1446FFFAH], [bne R2,R6,loop], [if(R2)!=(R6)goto loop],
    )
  ]
}

执行上述代码的计算机M采用32位定长指令字，其中分支指令bne采用如下格式：

#align(center)[
  #box(width: 58%)[
    #let bit-range(first, last) = box(width: 100%)[
      #grid(
        columns: (1fr, 1fr),
        inset: (x: 0.12em),
        align: (left, right),
        first,
        last,
      )
    ]
    #grid(
      columns: 1,
      row-gutter: 0.15em,
      grid(
        columns: (6fr, 5fr, 5fr, 16fr),
        column-gutter: 0pt,
        text(size: 0.75em)[#bit-range([31], [26])],
        text(size: 0.75em)[#bit-range([25], [21])],
        text(size: 0.75em)[#bit-range([20], [16])],
        text(size: 0.75em)[#bit-range([15], [0])],
      ),
      table(
        columns: (6fr, 5fr, 5fr, 16fr),
        align: center + horizon,
        stroke: 0.6pt,
        [OP], [Rs], [Rd], [OFFSET],
      ),
    )
  ]
]
OP为操作码；Rs和Rd为寄存器编号；OFFSET为偏移量，用补码表示。请回答下列问题，并说明理由。

#subquestions[
+ M的存储器编址单位是什么？
  \
+ 
  已知sll指令实现左移功能，数组A中每个元素占多少位？
  \
+ 
  题44表中bne指令的OFFSET字段的值是多少？已知bne指令采用相对寻址方式，当前PC内容为bne指令地址，通过分析题44表中指令地址和bne指令内容，推断出bne指令的转移目标地址计算公式。
  \
+ 
  若M采用如下“按序发射、按序完成”的5级指令流水线：IF（取指）、ID（译码及取数）、EXE（执行）、MEM（访存）、WB（写回寄存器），且硬件不采取任何转发措施，分支指令的执行均引起3个时钟周期的阻塞，则P中哪些指令的执行会由于数据相关而发生流水线阻塞？哪条指令的执行会发生控制冒险？为什么指令1的执行不会因为与指令5的数据相关而发生阻塞？
  
    
]
]

#block(breakable: false)[#question(label: n => [2016 19])[
在无转发机制的五段基本流水线（取指、译码/读寄存器、运算、访存、写回寄存器）中，下列指令序列存在数据冒险的指令对是

```text
I1: add R1, R2, R3 ; (R2)+(R3)→R1
I2: add R5, R2, R4 ; (R2)+(R4)→R5
I3: add R4, R5, R3 ; (R5)+(R3)→R4
I4: add R5, R2, R6 ; (R2)+(R6)→R5
```
#choices([I1和I2], [I2和I3], [I2和I4], [I3和I4])
]]

#block(breakable: false)[#question(label: n => [2019 18])[
在采用“取指、译码/取数、执行、访存、写回”5段流水线的处理器中，执行如下指令序列，其中 s0、s1、s2、s3 和 t2 表示寄存器编号。

```asm
I1: add s2, s1, s0    // R[s2]←R[s1]+R[s0]
I2: load s3, 0(t2)    // R[s3]←M[R[t2]+0]
I3: add s2, s2, s3    // R[s2]←R[s2]+R[s3]
I4: store s2, 0(t2)   // M[R[t2]+0]←R[s2]
```

下列指令对中，不存在数据冒险的是

#choices([I1 和 I3], [I2 和 I3], [I2 和 I4], [I3 和 I4])
]]

#block(breakable: false)[#question(label: n => [2023 19])[
在采用“取指、译码/取数、执行、访存、写回”5段流水线的 RISC 处理器中，执行如下指令序列（第一列为指令序号），其中 s0、s1、s2、s3 和 t2 表示寄存器编号。
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```
I1    add s2, s1, s0     // R[s2]←R[s1]+R[s0]
I2    load s3, 0(s2)     // R[s3]←M[R[s2]+0]
I3    beq t2, s3, L1     // if R[t2]=R[s3] jump to L1
I4    addi t2, t2, 20    // R[t2]←R[t2]+20
I5  L1: …
```
]
若采用转发（旁路）技术处理数据冒险，采用硬件阻塞方式处理控制冒险，则在指令 I1～I4 执行过程中，发生流水线阻塞的指令有
#choices([仅 I3], [I2、I4], [I3、I4], [I2、I3、I4])
]]

#block(breakable: false)[#question(label: n => [2024 19])[
对于采用“取指、译码/取数、执行、访存、写回”5段流水线的 RISC 数据通路，下列关于指令流水线数据冒险处理的叙述中，#emphasis[错误]的是

#choices([相邻两条指令中的操作数相关可能引起数据冒险], [在数据相关的指令间插入“气泡”能避免数据冒险], [所有数据冒险都可以通过加入转发（旁路）电路解决], [所有数据冒险都能通过调整指令顺序和插入 nop 指令解决])
]]

== 超标量和动态流水线的基本概念

#block(breakable: false)[#question(label: n => [2017 17])[
下列关于超标量流水线特性的叙述中，正确的是
#statements(columns: 1, [Ⅰ．能缩短流水线功能段的处理时间], [Ⅱ．能在一个时钟周期内同时发射多条指令], [Ⅲ．能结合动态调度技术提高指令执行并行性])
#choices([仅Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ和Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2020 17])[
下列给出的处理器类型中，理想情况下，CPI 为1的是

#statements(columns: (1fr, 1fr), [Ⅰ．单周期 CPU], [Ⅱ．多周期 CPU], [Ⅲ．基本流水线 CPU], [Ⅳ．超标量流水线 CPU],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ])
]]
