// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：高速缓冲存储器（Cache）

== Cache的基本原理

#block(breakable: false)[#question(label: n => [2009 21])[
假设某计算机的存储系统由 Cache
和主存组成。某程序执行过程中访存1000次，其中访问 Cache
缺失（未命中）50次，则 Cache 的命中率是

#choices(
  [5%],
  [9.5%],
  [50%],
  [95%],
)
]]

== Cache和主存之间的映射方式

#block(breakable: false)[#question(label: n => [2009 14])[
某计算机的 Cache
共有16块，采用2路组相联映射方式（即每组2块）。每个主存块大小为32字节，按字节编址。主存129号单元所在主存块应装入到的
Cache组号是

#choices(
  [0],
  [2],
  [4],
  [6],
)
]]

#question(label: n => [2010 44])[
（12分）某计算机的主存地址空间大小为256MB，按字节编址。指令Cache和数据
Cache分离，均有8个Cache行，每个Cache行大小为64B，数据Cache采用直接映射方式。现有两个功能相同的程序A和B，其伪代码如下所示：

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.65em,
    box(width: 100%, stroke: 0.5pt, inset: (x: 0.55em, y: 0.35em))[
      程序 A： \
      #h(0.7em)#raw("int a[256][256];") \
      #h(0.7em)#raw("...") \
      #h(0.7em)#raw("int sum_array1()") \
      #h(0.7em)#raw("{") \
      #h(2.1em)#raw("int i,j,sum=0;") \
      #h(2.1em)#raw("for(i=0;i<256;i++)") \
      #h(3.5em)#raw("for(j=0;j<256;j++)") \
      #h(4.9em)#raw("sum+=a[i][j];") \
      #h(2.1em)#raw("return sum;") \
      #h(0.7em)#raw("}")
    ],
    box(width: 100%, stroke: 0.5pt, inset: (x: 0.55em, y: 0.35em))[
      程序 B： \
      #h(0.7em)#raw("int a[256][256];") \
      #h(0.7em)#raw("...") \
      #h(0.7em)#raw("int sum_array2()") \
      #h(0.7em)#raw("{") \
      #h(2.1em)#raw("int i,j,sum=0;") \
      #h(2.1em)#raw("for(j=0;j<256;j++)") \
      #h(3.5em)#raw("for(i=0;i<256;i++)") \
      #h(4.9em)#raw("sum+=a[i][j];") \
      #h(2.1em)#raw("return sum;") \
      #h(0.7em)#raw("}")
    ],
  )
]

假定 int
类型数据用32位补码表示，程序编译时i，j，sum均分配在寄存器中，数组a按行优先方式存放，其首地址为320（十进制数）。请回答下列问题，要求说明理由或给出计算过程。

#subquestions[
+ 若不考虑用于 Cache
  一致性维护和替换算法的控制位，则数据 Cache的总容量为多少？
  \
+ 数组元素 a[0][31]和
  a[1][1]各自所在的主存块对应的 Cache 行号分别是多少 （Cache
  行号从0开始）？
  \
+ 
  程序A和B的数据访问命中率各是多少？哪个程序的执行时间更短？
  
    
]
]

#block(breakable: false)[#question(label: n => [2016 15])[
有如下C语言程序段：
```c
for(k=0;k<1000;k++)
    a[k]=a[k]+32;
```
若数组 a 及变量 k 均为 int 型，int 型数据占4 B，数据 Cache 采用直接映射方式、数据区大小为1 KB、块大小为16 B，该程序段执行前 Cache 为空，则该程序段执行过程中访问数组 a 的 Cache 缺失率约为
#choices([1.25%], [2.5%], [12.5%], [25%])
]]

#block(breakable: false)[#question(label: n => [2022 16])[
若计算机主存地址为32位，按字节编址，某 Cache 的数据区容量为32 KB，主存块大小为64 B，采用8路组相联映射方式，该 Cache 中比较器的个数和位数分别为

#choices([8，20], [8，23], [64，20], [64，23])
]]

#block(breakable: false)[#question(label: n => [2026 18])[
某计算机按字节编址，数据 Cache 共有1024行，采用4路组相联映射方式，主存块大小为32 B。若需要访问主存地址为1028的4字节数据，则该数据所在主存块对应的 Cache 组号是
#choices([4], [16], [32], [64])
]]

== Cache中主存块的替换算法

#block(breakable: false)[#question(label: n => [2012 17])[
假设某计算机按字编址，Cache有4个行，Cache和主存之间交换的块大小为1个字。若
Cache的内容初始为空，采用2路组相联映射方式和LRU替换算法，当访问的主存地址依次为0,4,8,2,0,6,8,6,4,8时，命中Cache的次数是

#choices(
  [1],
  [2],
  [3],
  [4],
)
]]

== Cache写策略

#block(breakable: false)[#question(label: n => [2015 15])[
假定主存地址为32位，按字节编址，主存和Cache之间采用直接映射方式，主存块大小为4个字，每字32位，采用回写（Write Back）方式，则能存放4K字数据的Cache的总容量的位数至少是

#choices([146K], [147K], [148K], [158K])
]]

#question(label: n => [2020 44])[
（10分）假定主存地址为32位，按字节编址，指令 Cache 和数据 Cache 与主存之间均采用8路组相联映射方式、直写（Write Through）写策略和 LRU 替换算法，主存块大小为64 B，数据区容量各为32 KB，开始时 Cache 均为空。请回答下列问题。

#subquestions[
+ Cache 每一行中标记（Tag）、LRU 位各占几位？是否有修改位？
+ 有如下 C 语言程序段：
  
  ```c
  for (k = 0; k < 1024; k++)
      s[k] = 2 * s[k];
  ```
  
  若数组 s 及变量 k 均为 int 型，int 型数据占4 B，变量 k 分配在寄存器中，数组 s 在主存中的起始地址为0080 00C0H，则该程序段执行过程中，访问数组 s 的数据 Cache 缺失次数为多少？ \
+ 若 CPU 最先开始的访问操作是读取主存单元0001 0003H中的指令，简要说明从 Cache 中访问该指令的过程，包括 Cache 缺失处理过程。

]
]

#block(breakable: false)[#question(label: n => [2021 16])[
若计算机主存地址为32位，按字节编址，Cache 数据区大小为32 KB，主存块大小为32 B，采用直接映射方式和回写（Write Back）策略，则 Cache 行的位数至少是

#choices([275], [274], [258], [257])
]]

#question(label: n => [旧版题型示例])[
某计算机的主存地址位数为32位，按字节编址。假定数据 Cache 中最多存放128个主存块，采用4路组相联方式，块大小为64 Byte，每块设置了1位有效位。采用一次性写回（Write Back）策略，为此每块设置了1位“脏（Dirty）”位。要求：

#subquestions[
+ 分别指出主存地址中标记（Tag）、组号（Index）和块内地址（Offset）三部分的位置和位数。
+ 计算该数据 Cache 的总位数（请给出详细计算过程）。

]
]
