// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：虚拟内存管理

== 虚拟内存的基本概念

#block(breakable: false)[#question(label: n => [2012 25])[
下列关于虚拟存储的叙述中，正确的是

#choices(
  [虚拟存储只能基于连续分配技术],
  [虚拟存储只能基于非连续分配技术],
  [虚拟存储容量只受外存容量的限制],
  [虚拟存储容量只受内存容量的限制],
)
]]

#block(breakable: false)[#question(label: n => [2023 28])[
对于采用虚拟内存管理方式的系统，下列关于进程虚拟地址空间的叙述中，错误的是
#choices([每个进程都有自己独立的虚拟地址空间], [C 语言中 malloc()函数返回的是虚拟地址], [进程对数据段和代码段可以有不同的访问权限], [虚拟地址空间的大小由内存和硬盘的大小决定])
]]

== 请求页式管理

#block(breakable: false)[#question(label: n => [2011 28])[
在缺页处理过程中，操作系统执行的操作可能是

I. 修改页表 II. 磁盘I/O III. 分配页框

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ],
  [仅Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2013 30])[
若用户进程访问内存时产生缺页，则下列选项中，操作系统可能执行的操作是

I. 处理越界错 II. 置换页 III. 分配内存

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
  [仅Ⅰ、Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]]

#question(label: n => [2014 45])[
原卷第44题共用背景（不含小问）：

某程序中有如下循环代码段 $P$：

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
OP为操作码；Rs和Rd为寄存器编号；OFFSET为偏移量，用补码表示。




（11分）假设对于题44中的计算机M和程序段P的机器代码，M采用页式虚拟存储管理；P开始执行时，
（R1）=（R2）= 0，（R6）= 1000
，其机器代码已调入主存但不在Cache中；数组A未调入主存，且所有数组元素在同一页，并存储在磁盘同一个扇区。请回答下列问题，并说明理由。

#subquestions[
+ P执行结束时，R2的内容是多少？
  \
+ M的指令 Cache和数据 Cache分离。若指令
  Cache共有16行，Cache和主存交换的块大小为32字节，则其数据区的容量是多少？若仅考虑程序段P的执行，则指令
  Cache的命中率为多少？
  \
+ 
  P在执行过程中，哪条指令的执行可能发生溢出异常？哪条指令的执行可能产生缺页异常？对于数组A的访问，需要读磁盘和TLB至少各多少次？
  
    
]
]

#question(label: n => [2017 45])[
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


原卷第44题共用背景（不含小问）：

在按字节编址的计算机 M 上，题43中 f1 的部分源程序（阴影部分）与对应的机器级代码（包括指令的虚拟地址）如下：
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
其中，机器级代码行包括行号、虚拟地址、机器指令和汇编指令。



（7分）假定题44给出的计算机 M 采用二级分页虚拟存储管理方式，虚拟地址格式如下：
#align(center, table(columns: (10fr, 10fr, 12fr), align: center,
 [页目录号（10位）], [页表索引（10位）], [页内偏移量（12位）]))
请针对题43的函数 f1 和题44中的机器指令代码，回答下列问题。
#subquestions[
 + 函数 f1 的机器指令代码占多少页？
 + 取第1条指令（push ebp）时，若在进行地址转换的过程中需要访问内存中的页目录和页表，则会分别访问它们各自的第几个表项（编号从0开始）？
 + M 的 I/O 采用中断控制方式。若进程 P 在调用 f1 之前通过 scanf()获取 $n$ 的值，则在执行 scanf()的过程中，进程 P 的状态会如何变化？CPU 是否会进入内核态？
]
]

#question(label: n => [2020 46])[
（8分）某32位系统采用基于二级页表的请求分页存储管理方式，按字节编址，页目录项和页表项长度均为4字节，虚拟地址结构如下所示。

#align(center, table(columns:(10fr,10fr,12fr), align:center,
  [页目录号（10位）], [页号（10位）], [页内偏移量（12位）],
))

某 C 程序中数组 a[1024][1024] 的起始虚拟地址为1080 0000H，数组元素占4字节。该程序运行时，其进程的页目录起始物理地址为0020 1000H，请回答下列问题。

#subquestions[
+ 数组元素 a[1][2] 的虚拟地址是什么？对应的页目录号和页号分别是什么？对应的页目录项的物理地址是什么？若该页目录项中存放的页框号为00301H，则 a[1][2] 所在页对应的页表项的物理地址是什么？
+ 数组 a 在虚拟地址空间中所占区域是否必须连续？在物理地址空间中所占区域是否必须连续？
+ 已知数组 a 按行优先方式存放，若对数组 a 分别按行遍历和按列遍历，则哪一种遍历方式的局部性更好？

]
]

#block(breakable: false)[#question(label: n => [2022 29])[
某进程访问的页 b 不在内存中，导致产生缺页异常，该缺页异常处理过程中#emphasis[不一定]包含的操作是

#choices([淘汰内存中的页], [建立页号与页框号的对应关系], [将页 b 从外存读入内存], [修改页表中页 b 对应的存在位])
]]

#question(label: n => [2024 45])[
（本题7分）某计算机按字节编址，采用页式虚拟存储管理方式，虚拟地址和物理地址的长度均为32位，页表项的大小为4字节，页大小为4 MB，虚拟地址结构如下。

#align(center,table(columns: (10fr,22fr),align: center,[页号（10位）],[页内偏移量（22位）]))

进程 P 的页表起始虚拟地址为 B8C0 0000H，被装载到从物理地址6540 0000H开始的连续主存空间中。

请回答下列问题，要求答案用十六进制表示。

#subquestions[
+ 若 CPU 在执行进程 P 的过程中，访问虚拟地址1234 5678H时发生了缺页异常，经过缺页异常处理和 MMU 地址转换后得到的物理地址是 BAB4 5678H，在此次缺页异常处理过程中，需要为所缺页分配页框并更新相应的页表项，则该页表项的虚拟地址和物理地址分别是什么？该页表项中的页框号更新后的值是什么？（3分）
+ 进程 P 的页表所在页的页号是什么？该页对应的页表项的虚拟地址是什么？该页表项中的页框号是什么？（4分）
]
]

== 页框分配与回收

#question(label: n => [2012 45])[
（7分）某请求分页系统的局部页面置换策略如下：

系统从0时刻开始扫描，每隔5个时间单位扫描一轮驻留集（扫描时间忽略不计），本轮没有被访问过的页框将被系统回收，并放入到空闲页框链尾，其中内容在下一次被分配之前不被清空。当发生缺页时，如果该页曾被使用过且还在空闲页框链表中，则重

新放回进程的驻留集中；否则，从空闲页框链表头部取出一个页框。

假设不考虑其他进程的影响和系统开销，初始时进程驻留集为空。目前系统空闲页框链表中页框号依次为32、15、21、41。进程P依次访问的
〈虚拟页号，访问时刻〉是：
〈1，1〉、〈3，2〉、〈0，4〉、〈0，6〉、〈1，11〉、〈0，13〉、〈2，14〉。请回答下列问题。

#subquestions[
+ 访问〈0，4〉时，对应的页框号是什么？
  \
+ 访问〈1，11〉时，对应的页框号是什么？说明理由。
  \
+ 访问〈2，14〉时，对应的页框号是什么？说明理由。
  \
+ 该策略是否适合于时间局部性好的程序？说明理由。
  
    
]
]

#block(breakable: false)[#question(label: n => [2015 30])[
在请求分页系统中，页面分配策略与页面置换策略不能组合使用的是

#choices([可变分配，全局置换], [可变分配，局部置换], [固定分配，全局置换], [固定分配，局部置换])
]]

#block(breakable: false)[#question(label: n => [2016 29])[
某进程访问页面的序列如下所示。

#align(center,cetz.canvas(length:1em,{
 import cetz.draw: *
 set-style(stroke:0.045em, content:(wrap: body => box(text(size:.85em,body))))
 let sequence = ([⋯],[1],[3],[4],[5],[6],[0],[3],[2],[3],[2],[0],[4],[0],[3],[2],[9],[2],[1],[⋯])
 for (i,label) in sequence.enumerate() {
   content((i*1.15,.8),label)
   if i < 19 { content((i*1.15+.5,.8),[,]) }
 }
 line((-.4,0),(23,0),mark:(end:">",fill:black))
 line((12.075,-.8),(12.075,.55),mark:(end:">",fill:black))
 content((12.075,-1.3),[$t$]); content((21,-.8),[时间])
}))

若工作集的窗口大小为6，则在 $t$ 时刻的工作集为
#choices([$\{6,0,3,2\}$], [$\{2,3,0,4\}$], [$\{0,4,3,2,9\}$], [$\{4,5,6,0,3,2\}$])
]]

#block(breakable: false)[#question(label: n => [2025 27])[
在页式虚拟存储管理系统中，确定进程正常运行所需的最少页框数时，下列因素中需要考虑的是

#choices([代码段长度],[进程的虚拟地址空间大小],[物理内存大小],[指令系统支持的寻址方式])
]]

== 页置换算法

#question(label: n => [2010 46])[
（8分）设某计算机的逻辑地址空间和物理地址空间均为64KB，按字节编址。若某进程最多需要6页（Page）数据存储空间，页的大小为1KB，操作系统采用固定分配局部置换策略为此进程分配4个页框（Page
Frame）。在时刻260前的该进程访问情况如下表所示（访问位即使用位）。

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [页号], [页框号], [装入时刻], [访问位],
    [0], [7], [130], [1],
    [1], [4], [230], [1],
    [2], [2], [200], [1],
    [3], [9], [160], [1],
  )]
  , kind: table
  )

当该进程执行到时刻260时，要访问逻辑地址为17CAH的数据。

请回答下列问题：

#subquestions[
+ 该逻辑地址对应的页号是多少？
  \
+ 
  若采用先进先出（FIFO）置换算法，该逻辑地址对应的物理地址是多少？要求给出计算过程。
  \
+ 
  若采用时钟（CLOCK）置换算法，该逻辑地址对应的物理地址是多少？要求给出计算过程（设搜索下一页的指针沿顺时针方向移动，且当前指向2号页框，示意图如下）。
  
  #align(center)[
    #cetz.canvas(length: 1.2cm, {
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
      let label(pos, body, anchor: "center") = content(
        pos,
        [#text(size: 0.78em)[#body]],
        anchor: anchor,
      )
  
      hide(rect((-2.28, -1.18), (2.28, 1.18), stroke: none), bounds: true)
  
      // Four page frames arranged as the CLOCK replacement ring.
      circle((0, 0), radius: 1.08, fill: white, stroke: 0.58pt)
      circle((0, 0), radius: 0.58, fill: white, stroke: 0.58pt)
      line((0, 0.58), (0, 1.08), stroke: 0.58pt)
      line((0.58, 0), (1.08, 0), stroke: 0.58pt)
      line((0, -0.58), (0, -1.08), stroke: 0.58pt)
      line((-0.58, 0), (-1.08, 0), stroke: 0.58pt)
  
      label((-0.48, 0.60), [3号页])
      label((0.48, 0.60), [2号页])
      label((-0.48, -0.62), [0号页])
      label((0.48, -0.62), [1号页])
  
      label((-1.28, 0.60), [9号页框], anchor: "east")
      label((1.28, 0.60), [2号页框], anchor: "west")
      label((-1.28, -0.62), [7号页框], anchor: "east")
      label((1.28, -0.62), [4号页框], anchor: "west")
  
      // The hand currently points at page frame 2 and advances clockwise.
      line((0, -0.06), (0.41, 0.42),
        stroke: 0.62pt,
        mark: (end: ">", fill: black, scale: 0.68),
      )
    })
  ]
  
    
]
]

#block(breakable: false)[#question(label: n => [2014 30])[
在页式虚拟存储管理系统中，采用某些页面置换算法，会出现Belady异常现象，即进程的缺页次数会随着分配给该进程的页框个数的增加而增加。下列算法中，可能出现
Belady异常现象的是

I. LRU算法 II. FIFO算法 III. OPT算法

#choices(
  [仅Ⅱ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2015 27])[
系统为某进程分配了4个页框，该进程已访问的页号序列为2，0，2，9，3，4，2，8，2，4，8，4，5。若进程要访问的下一页的页号为7，依据LRU算法，应淘汰页的页号是

#choices([2], [3], [4], [8])
]]

#block(breakable: false)[#question(label: n => [2016 26])[
某系统采用改进型CLOCK置换算法，页表项中字段A为访问位，M为修改位。A=0表示页最近没有被访问，A=1表示页最近被访问过。M=0表示页没有被修改过，M=1表示页被修改过。按（A，M）所有可能的取值，将页分为四类：（0，0）、（1，0）、（0，1）和（1，1），则该算法淘汰页的次序为
#choices([(0,0),(0,1),(1,0),(1,1)], [(0,0),(1,0),(0,1),(1,1)], [(0,0),(0,1),(1,1),(1,0)], [(0,0),(1,1),(0,1),(1,0)])
]]

#question(label: n => [2018 45])[
原卷第44题共用背景（不含小问）：

某计算机采用页式虚拟存储管理方式，按字节编址。CPU 进行存储访问的过程如题44图所示。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    let p(x, y) = ((x - 35) / 30, (1310 - y) / 30)
    let wire(..pts, arrow: true, both: false) = line(..pts.pos().map(q => p(..q)), stroke: 0.045em,
      mark: if arrow { (start: if both { "<" } else { none }, end: ">", fill: black, scale: 0.55) } else { none })
    let label(x, y, body) = content(p(x, y), text(size: 0.72em)[#body])
    let unit(x1, y1, x2, y2, body, fill: white) = {
      rect(p(x1, y1), p(x2, y2), fill: fill, stroke: 0.045em)
      label((x1 + x2) / 2, (y1 + y2) / 2, body)
    }
    rect(p(39, 781), p(468, 1027), stroke: (thickness: 0.07em, dash: "dashed"))
    rect(p(527, 637), p(1104, 1060), stroke: (thickness: 0.07em, dash: "dashed"))
    label(65, 806, [TLB])
    label(578, 704, [Cache])
    wire((220, 681), (220, 716))
    wire((98, 748), (98, 1067), (139, 1067), (139, 1093))
    wire((303, 748), (303, 764), (490, 764), (490, 1077))
    wire((398, 991), (398, 1077))
    wire((552, 1094), (655, 1094))
    wire((97, 1127), (97, 1218), (128, 1218))
    wire((191, 1127), (191, 1146), (336, 1146), (336, 1198), (369, 1198))
    wire((270, 1218), (320, 1218), (320, 1270), (369, 1270))
    wire((102, 1273), (128, 1273))
    wire((508, 1198), (548, 1198), (548, 1136), (398, 1136), (398, 1110))
    wire((720, 1077), (720, 1050), (545, 1050), (545, 866), (728, 866), (728, 822), (697, 822))
    wire((545, 866), (927, 866), (927, 822), (944, 822))
    wire((819, 1077), (819, 962), (793, 962))
    wire((819, 962), (846, 962))
    wire((681, 879), (681, 838))
    wire((960, 879), (960, 838))
    wire((617, 879), (617, 805), (665, 805), (665, 788))
    wire((1040, 879), (1040, 805), (975, 805), (975, 788))
    wire((681, 806), (681, 788))
    wire((960, 806), (960, 788))
    wire((675, 750), (675, 734), (768, 734))
    wire((968, 750), (968, 734), (883, 734))
    wire((757, 879), (757, 800), (800, 800), (800, 759))
    wire((880, 879), (880, 800), (850, 800), (850, 759))
    wire((823, 724), (823, 682))
    wire((866, 665), (1088, 665), (1088, 866), arrow: false)
    wire((778, 665), (287, 665))
    unit(154, 648, 287, 681, [CPU], fill: luma(90%))
    unit(39, 716, 253, 748, [虚页号（20位）])
    unit(253, 716, 468, 748, [页内地址（12位）])
    unit(39, 1093, 139, 1127, [10位])
    unit(139, 1093, 238, 1127, [10位])
    unit(302, 1077, 435, 1110, [实页号])
    unit(435, 1077, 552, 1110, [页内地址])
    unit(655, 1077, 786, 1110, [20位])
    unit(786, 1077, 852, 1110, [3位])
    unit(852, 1077, 918, 1110, [5位])
    unit(39, 1260, 102, 1287, [])
    label(74, 1243, [PDBR])
    label(158, 1052, [TLB缺失])
    label(140, 1011, [比较器])
    label(222, 801, [Tag])
    label(303, 801, [有效位])
    label(397, 801, [实页号])
    rect(p(179, 820), p(446, 991), stroke: 0.045em, fill: white)
    for x in (270, 336) { wire((x, 820), (x, 991), arrow: false) }
    for y in (855, 889, 923, 957) { wire((179, y), (446, y), arrow: false) }
    for (i, tag, valid, frame) in ((0, [00324H], [1], [F800H]), (1, [0008CH], [1], [0040H]),
      (2, [8C040H], [1], [0160H]), (3, [⋮], [⋮], [⋮]), (4, [04320H], [0], [0E80H])) {
      let y = 838 + 34 * i
      label(224, y, tag)
      label(303, y, valid)
      label(391, y, frame)
      if i != 3 {
        wire((98, y), (130, y), arrow: false)
        wire((160, y), (179, y), arrow: false)
        circle(p(145, y), radius: 0.45, fill: white, stroke: 0.045em)
        label(145, y, [=])
      } else { label(145, y, [⋮]) }
    }
    for (x, top, rows, col) in ((128, 1162, (1162, 1208, 1242, 1277), (128, 163, 229, 295)),
      (369, 1161, (1161, 1189, 1208, 1277), (369, 405, 473, 529))) {
      rect(p(col.first(), rows.at(1)), p(col.last(), rows.at(2)), fill: luma(86%), stroke: none)
      rect(p(col.first(), rows.first()), p(col.last(), rows.last()), stroke: 0.045em)
      for xx in col.slice(1, -1) { wire((xx, rows.first()), (xx, rows.last()), arrow: false) }
      for yy in rows.slice(1, -1) { wire((col.first(), yy), (col.last(), yy), arrow: false) }
    }
    label(211, 1300, [页目录])
    label(448, 1300, [页表])
    for (left, columns) in ((true, (582, 617, 706, 793)), (false, (846, 934, 1024, 1056))) {
      rect(p(columns.first(), 879), p(columns.last(), 1011), fill: white, stroke: 0.045em)
      for xx in columns.slice(1, -1) { wire((xx, 879), (xx, 1011), arrow: false) }
      for yy in (912, 945, 978) { wire((columns.first(), yy), (columns.last(), yy), arrow: false) }
      let tags = if left { ([F8000H], [008C0H], [00400H], [---]) } else { ([F2840H], [23000H], [01600H], [---]) }
      let valids = if left { ([1], [1], [0], []) } else { ([1], [0], [1], []) }
      for i in range(4) {
        let y = 895 + 33 * i
        label(if left { 600 } else { 1040 }, y, valids.at(i))
        label(if left { 661 } else { 979 }, y, tags.at(i))
        if left and i < 3 { label(570, y, str(i)) }
      }
    }
    for (x, body) in ((585, [有效位]), (661, [Tag]), (750, [Data]),
      (888, [Data]), (979, [Tag]), (1040, [有效位])) { label(x, 1030, body) }
    for (x, lx) in ((681, 629), (960, 1007)) {
      circle(p(x, 822), radius: 0.5, fill: white, stroke: 0.045em)
      label(x, 822, [=])
      label(lx, 841, [比较器])
      merge-path({
        line(p(x - 27, 788), p(x - 27, 769))
        bezier(p(x - 27, 769), p(x + 13, 769), p(x - 27, 743), p(x + 13, 743))
        line(p(x + 13, 769), p(x + 13, 788))
      }, close: true, fill: white, stroke: 0.045em)
    }
    line(p(744, 759), p(769, 724), p(875, 724), p(901, 759), close: true, fill: white, stroke: 0.045em)
    label(823, 744, [多路选择])
    unit(778, 648, 866, 681, [数据])
  }),
  caption: [题44图], numbering: none,
)






（8分）请根据题44图给出的虚拟存储管理方式，回答下列问题：

#subquestions[
+ 某虚拟地址对应的页目录号为6，在相应的页表中对应的页号为6，页内偏移量为8，该虚拟地址的十六进制表示是什么？
+ 寄存器 PDBR 用于保存当前进程的页目录起始地址，该地址是物理地址还是虚拟地址？进程切换时，PDBR 的内容是否会变化？说明理由。同一进程的线程切换时，PDBR 的内容是否会变化？说明理由。
+ 为了支持改进型 CLOCK 置换算法，需要在页表项中设置哪些字段？

]
]

#block(breakable: false)[#question(label: n => [2019 29])[
某系统采用 LRU 页置换算法和局部置换策略，若系统为进程 P 预分配了4个页框，进程 P 访问页号的序列为0，1，2，7，0，5，3，5，0，2，7，6，则进程访问上述页的过程中，产生页置换的总次数是

#choices([3], [4], [5], [6])
]]

#block(breakable: false)[#question(label: n => [2021 28])[
某请求分页存储系统的页大小为4 KB，按字节编址。系统给进程 P 分配2个固定的页框，并采用改进型 Clock 置换算法，进程 P 页表的部分内容如下表所示。

#align(center,table(columns:(auto,auto,auto,auto,auto),align:center,
  stroke:(x,y)=>if x == 0 {none} else {0.5pt},
  [页号],[页框号],[存在位\ 1：存在，0：不存在],[访问位\ 1：访问，0：未访问],[修改位\ 1：修改，0：未修改],
  […],[…],[…],[…],[…],
  [2],[20H],[0],[0],[0],
  [3],[60H],[1],[1],[0],
  [4],[80H],[1],[1],[1],
  […],[…],[…],[…],[…],
))

若 P 访问虚拟地址为02A01H的存储单元，则经地址转换后得到的物理地址是

#choices([00A01H], [20A01H], [60A01H], [80A01H])
]]

#block(breakable: false)[#question(label: n => [2025 26])[
某页式虚拟存储管理系统采用固定分配局部置换的 LRU 算法。若系统为进程 P 分配了3个页框，P 从某时刻开始的页访问序列为0，1，2，0，5，1，4，3，0，2，3，2，0，且0，1，2三个页已在内存中，则完成上述页序列的访问时，系统执行缺页异常处理程序的次数为

#choices([5],[6],[7],[8])
]]

#block(breakable: false)[#question(label: n => [旧版题型示例])[
设页引用序列：（1，2，3，4，2，1，5，6，2，1，2，3，7，6，3，2，1，2，3，6），物理块（Page frame）数为3，且所有的块初始时为空。当分别采用最近最少使用置换（LRU）、先进先出置换（FIFO）和最佳置换（OPT）的页面换算法时，各会发生多少次缺页？要求给出求解过程。
]]

== 内存映射文件（memory-mapped files）

#block(breakable: false)[#question(label: n => [2025 30])[
下列关于内存映射文件（memory-mapped files）机制的叙述中，正确的是

Ⅰ．可实现进程之间的通信\
Ⅱ．可实现页到磁盘块的映射\
Ⅲ．将文件映射到进程的虚拟地址空间\
Ⅳ．将文件映射到系统的物理地址空间

#choices([仅Ⅰ、Ⅲ],[仅Ⅰ、Ⅳ],[仅Ⅱ、Ⅲ],[仅Ⅰ、Ⅱ、Ⅲ])
]]

== 虚拟存储器性能的影响因素及改进方法

#question(label: n => [2009 46])[
（8分）请求分页管理系统中，假设某进程的页表内容如下表所示：

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [页号], [页框(Page Frame)号], [有效位(存在位)],
    [0], [101H], [1],
    [1], [—], [0],
    [2], [254H], [1],
  )]
  , kind: table
  )

页面大小为4 KB，一次内存的访问时间是100 ns，一次快表（TLB）的访问时间是
10 ns，处理一次缺页的平均时间为 $10^8 "ns"$
（已含更新TLB和页表的时间），进程的驻留集大小固定为2，采用最近最少使用置换算法（LRU）和局部淘汰策略。假设
① TLB初始为空；②
地址转换时先访问TLB，若TLB未命中，再访问页表（忽略访问页表之后的
TLB更新时间）；③
有效位为0表示页面不在内存，产生缺页中断，缺页中断处理后，返回到产生缺页中断的指令处重新执行。设有虚地址访问序列2362H、1565H、25A5H，请问：

#subquestions[
+ 
  依次访问上述三个虚地址，各需多少时间？给出计算过程。
  \
+ 
  基于上述访问序列，虚地址1565H的物理地址是多少？请说明理由。
  
    
]
]

#block(breakable: false)[#question(label: n => [2011 29])[
当系统发生抖动（thrashing）时，可以采取的有效措施是

I. 撤销部分进程

Ⅱ. 增加磁盘交换区的容量

Ⅲ. 提高用户进程的优先级

#choices(
  [仅Ⅰ],
  [仅Ⅱ],
  [仅Ⅲ],
  [仅Ⅰ、Ⅱ],
)
]]

#block(breakable: false)[#question(label: n => [2014 28])[
下列措施中，能加快虚实地址转换的是

#statements(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1em,
  [I. 增大快表（TLB）容量],
  [II. 让页表常驻内存],
  [III. 增大交换区（swap）],
)

#choices(
  [仅Ⅰ],
  [仅Ⅱ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
)
]]

#question(label: n => [2016 45])[
（14分）某计算机采用页式虚拟存储管理方式，按字节编址，虚拟地址为32位，物理地址为24位，页大小为8 KB；TLB采用全相联映射；Cache数据区大小为64 KB，按2路组相联方式组织，主存块大小为64 B。存储访问过程的示意图如下。

#align(center,image("../../../../历年真题+参考解答/2016/official-images/q45.png",width:29em))

请回答下列问题。
#subquestions[
+ 图中字段A～G的位数各是多少？TLB标记字段B中存放的是什么信息？
+ 将块号为4099的主存块装入到Cache中时，所映射的Cache组号是多少？对应的H字段内容是什么？
+ Cache缺失处理的时间开销大还是缺页处理的时间开销大？为什么？
+ 为什么Cache可以采用直写（Write Through）策略，而修改页面内容时总是采用回写（Write Back）策略？
]
]

#block(breakable: false)[#question(label: n => [2020 28])[
下列因素中，影响请求分页系统有效（平均）访存时间的是

#statements(columns: (1fr, 1fr), [Ⅰ．缺页率], [Ⅱ．磁盘读写时间],
  [Ⅲ．内存访问时间], [Ⅳ．执行缺页处理程序的 CPU 时间],
)

#choices([仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅳ], [仅Ⅰ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ和Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2022 30])[
下列选项中，#emphasis[不会]影响系统缺页率的是

#choices([页置换算法], [工作集的大小], [进程的数量], [页缓冲队列的长度])
]]

#block(breakable: false)[#question(label: n => [2026 29])[
下列页式虚拟存储管理系统的技术中，可用于降低系统平均访存时间的是
#statements(columns: 4, [Ⅰ．TLB], [Ⅱ．多级页表], [Ⅲ．工作集模型], [Ⅳ．页缓冲队列])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ])
]]
