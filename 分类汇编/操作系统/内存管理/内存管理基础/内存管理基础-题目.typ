// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：内存管理基础

== 内存管理的基本概念

#block(breakable: false)[#question(label: n => [2009 26])[
分区分配内存管理方式的主要保护措施是

#choices(
  [界地址保护],
  [程序代码保护],
  [数据保护],
  [栈保护],
)
]]

== 连续分配管理方式

#block(breakable: false)[#question(label: n => [2010 28])[
某基于动态分区存储管理的计算机，其主存容量为55
MB（初始为空闲），采用最佳适配（Best
Fit）算法，分配和释放的顺序为：分配15 MB、分配30 MB、释放15 MB、分配8
MB、分配6 MB，此时主存中最大空闲分区的大小是

#choices(
  [7 MB],
  [9 MB],
  [10 MB],
  [15 MB],
)
]]

#block(breakable: false)[#question(label: n => [2017 25])[
某计算机按字节编址，其动态分区内存管理采用最佳适应算法，每次分配和回收内存后都对空闲分区链重新排序。当前空闲分区信息如下表所示。
#align(center, table(columns: (7em, 4em, 4em, 4em, 4em), align: center,
 [分区起始地址], [20 K], [500 K], [1000 K], [200 K],
 [分区大小], [40 KB], [80 KB], [100 KB], [200 KB]))
回收起始地址为60 K、大小为140 KB的分区后，系统中空闲分区的数量、空闲分区链第一个分区的起始地址和大小分别是
#choices([3、20 K、380 KB], [3、500 K、80 KB], [4、20 K、180 KB], [4、500 K、80 KB])
]]

#block(breakable: false)[#question(label: n => [2019 32])[
在下列动态分区分配算法中，最容易产生内存碎片的是

#choices([首次适应算法], [最坏适应算法], [最佳适应算法], [循环首次适应算法])
]]

#block(breakable: false)[#question(label: n => [2024 27])[
下列算法中，每次回收分区时仅合并大小相等的空闲分区的是

#choices([伙伴算法], [最佳适应算法], [最坏适应算法], [首次适应算法])
]]

== 页式管理

#block(breakable: false)[#question(label: n => [2010 29])[
某计算机采用二级页表的分页存储管理方式，按字节编址，页大小为
$2^(1 0)$字节，页表项大小为2字节，逻辑地址结构为：页目录号 页号
页内偏移量，逻辑地址空间大小为
$2^(1 6)$页，则表示整个逻辑地址空间的页目录表中包含表项的个数至少是

#choices(
  [64],
  [128],
  [256],
  [512],
)
]]

#question(label: n => [2013 46])[
（8分）某计算机主存按字节编址，逻辑地址和物理地址都是32位，页表项大小为4字节。请回答下列问题。

#subquestions[
+ 
  若使用一级页表的分页存储管理方式，逻辑地址结构为：
  
  #figure(
    align(center)[#table(
      columns: (10em, 11.5em),
      align: center + horizon,
      [页号(20位)], [页内偏移量(12位)],
    )]
    , kind: table
    )
  
  则页的大小是多少字节？页表最大占用多少字节？
  \
+ 
  若使用二级页表的分页存储管理方式，逻辑地址结构为：
  
  #figure(
    align(center)[#table(
      columns: (9.5em, 9.5em, 10.5em),
      align: center + horizon,
      [页目录号(10位)], [页表索引(10位)], [页内偏移量(12位)],
    )]
    , kind: table
    )
  
  设逻辑地址为LA，请分别给出其对应的页目录号和页表索引的表达式。
  \
+ 
  采用（1）中的分页存储管理方式，一个代码段起始逻辑地址为00008000H，其长度为8KB，被装载到从物理地址00900000H开始的连续主存空间中。页表从主存
  00200000H开始的物理地址处连续存放，如下图所示（地址大小自下向上递增）。请计算出该代码段对应的两个页表项的物理地址，这两个页表项中的页框号以及代码页面2的起始物理地址。
  
  #align(center)[
    #cetz.canvas(length: 0.92cm, {
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
      let rule = 0.58pt
      hide(rect((-0.20, 0), (15.25, 5.30), stroke: none), bounds: true)
  
      // Page table and the two consecutive physical pages.
      rect((2.45, 0.25), (7.25, 4.55), fill: white, stroke: rule)
      line((2.45, 2.92), (7.25, 2.92), stroke: rule)
      line((2.45, 2.30), (7.25, 2.30), stroke: rule)
      line((2.45, 1.68), (7.25, 1.68), stroke: rule)
  
      rect((12.25, 0.72), (15.05, 5.05), fill: white, stroke: rule)
      line((12.25, 3.16), (15.05, 3.16), stroke: rule)
  
      // The arrows terminate at the physical addresses indicated in the scan.
      line(
        (7.25, 2.61), (9.30, 2.61), (9.30, 3.16), (12.25, 3.16),
        stroke: rule,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      line(
        (7.25, 1.99), (9.30, 1.99), (9.30, 1.15), (12.25, 1.15),
        stroke: rule,
        mark: (end: ">", fill: black, scale: 0.70),
      )
  
      content((4.85, 4.95), text(size: 0.92em)[页表])
      content((4.85, 2.61), text(size: 0.90em)[页框号 2])
      content((4.85, 1.99), text(size: 0.90em)[页框号 1])
      content((2.15, 2.61), text(size: 0.88em)[物理地址 2], anchor: "east")
      content((2.15, 1.99), text(size: 0.88em)[物理地址 1], anchor: "east")
      content((2.15, 0.48), text(size: 0.88em)[0020 0000H], anchor: "east")
  
      content((13.65, 4.10), text(size: 0.92em)[代码页面 2])
      content((13.65, 1.94), text(size: 0.92em)[代码页面 1])
      content((10.77, 3.52), text(size: 0.88em)[物理地址 3])
      content((10.75, 1.53), text(size: 0.88em)[0090 0000H])
    })
  ]
  
    
]
]

#block(breakable: false)[#question(label: n => [2014 32])[
下列选项中，属于多级页表优点的是

#choices(
  [加快地址变换速度],
  [减少缺页中断次数],
  [减少页表项所占字节数],
  [减少页表所占的连续内存空间],
)
]]

#question(label: n => [2015 46])[
（6分）某计算机系统按字节编址，采用二级页表的分页存储管理方式，虚拟地址格式如下所示：

#align(center)[#table(
  columns: (1fr, 1fr, 1.2fr),
  align: center + horizon,
  inset: (x: 1.1em, y: 0.35em),
  [10位], [10位], [12位],
  [页目录号], [页表索引], [页内偏移量],
)]

请回答下列问题。

#subquestions[
+ 页和页框的大小各为多少字节？进程的虚拟地址空间大小为多少页？
  \
+ 假定页目录项和页表项均占4个字节，则进程的页目录和页表共占多少页？要求写出计算过程。
  \
+ 若某指令周期内访问的虚拟地址为0100 0000H和0111 2048H，则进行地址转换时共访问多少个二级页表？要求说明理由。
    
]
]

#block(breakable: false)[#question(label: n => [2019 31])[
某计算机主存按字节编址，采用二级分页存储管理，地址结构如下所示

#align(center, table(
  columns: (10em, 10em, 12em), align: center, stroke: 0.065em,
  [页目录号（10位）], [页号（10位）], [页内偏移（12位）],
))

虚拟地址 2050 1225H 对应的页目录号、页号分别是

#choices([081H、101H], [081H、401H], [201H、101H], [201H、401H])
]]

#question(label: n => [2019 46])[
原卷第45题共用背景（不含小问）：

已知 $f(n)=n! = n times (n-1) times (n-2) times dots times 2 times 1$，计算 $f(n)$ 的 C 语言函数 f1 的源程序（阴影部分）及其在32位计算机 M 上的部分机器级代码如下：

#table(
  columns: (2em, 6em, 9em, 1fr), stroke: none,
  align: (right, left, left, left),
  table.cell(colspan: 4, fill: luma(85%), align: left)[`int f1(int n) {`],
  [1], [00401000], [55], [`push ebp`],
  [], [……], [……], [……],
  table.cell(colspan: 4, fill: luma(85%), align: left)[#h(1.5em)`if (n > 1)`],
  [11], [00401018], [83 7D 08 01], [`cmp dword ptr [ebp+8], 1`],
  [12], [0040101C], [7E 17], [`jle f1+35h (00401035)`],
  table.cell(colspan: 4, fill: luma(85%), align: left)[#h(3em)`return n * f1(n-1);`],
  [13], [0040101E], [8B 45 08], [`mov eax, dword ptr [ebp+8]`],
  [14], [00401021], [83 E8 01], [`sub eax, 1`],
  [15], [00401024], [50], [`push eax`],
  [16], [00401025], [E8 D6 FF FF FF], [`call f1 (00401000)`],
  [], [……], [……], [……],
  [19], [00401030], [0F AF C1], [`imul eax, ecx`],
  [20], [00401033], [EB 05], [`jmp f1+3Ah (0040103a)`],
  table.cell(colspan: 4, fill: luma(85%), align: left)[#h(1.5em)`else return 1;`],
  [21], [00401035], [B8 01 00 00 00], [`mov eax, 1`],
  table.cell(colspan: 4, fill: luma(85%), align: left)[`}`],
  [], [……], [……], [……],
  [26], [00401040], [3B EC], [`cmp ebp, esp`],
  [], [……], [……], [……],
  [30], [0040104A], [C3], [`ret`],
)

其中，机器级代码行包括行号、虚拟地址、机器指令和汇编指令，计算机 M 按字节编址，int 型数据占32位。




（7分）对于题45，若计算机 M 的主存地址为32位，采用分页存储管理方式，页大小为4 KB，则第1行 push 指令和第30行 ret 指令是否在同一页中（说明理由）？若指令 Cache 有64行，采用4路组相联映射方式，主存块大小为64 B，则32位主存地址中，哪几位表示块内地址？哪几位表示 Cache 组号？哪几位表示标记（tag）信息？读取第16行 call 指令时，只可能在指令 Cache 的哪一组中命中（说明理由）？
]

#block(breakable: false)[#question(label: n => [2021 29])[
在采用二级页表的分页系统中，CPU 页表基址寄存器中的内容是

#choices([当前进程的一级页表的起始虚拟地址], [当前进程的一级页表的起始物理地址], [当前进程的二级页表的起始虚拟地址], [当前进程的二级页表的起始物理地址])
]]

#block(breakable: false)[#question(label: n => [2023 25])[
某系统采用页式存储管理，用位图管理空闲页框。若页大小为4 KB，物理内存大小为16 GB，则位图所占空间的大小是
#choices([128 B], [128 KB], [512 KB], [4 MB])
]]

#block(breakable: false)[#question(label: n => [2023 30])[
进程 R 和 S 共享数据 data，若 data 在 R 和 S 中所在页的页号分别为 p1 和 p2，两个页所对应的页框号分别为 f1 和 f2，则下列叙述中，正确的是
#choices([p1 和 p2 一定相等，f1 和 f2 一定相等], [p1 和 p2 一定相等，f1 和 f2 不一定相等], [p1 和 p2 不一定相等，f1 和 f2 一定相等], [p1 和 p2 不一定相等，f1 和 f2 不一定相等])
]]

#block(breakable: false)[#question(label: n => [2026 28])[
某64位系统采用三级页式存储管理方式，虚拟地址结构如下图所示。
#align(center)[
#set text(size: .8em)
#table(columns: 5, align: center,
 [保留（25位）], [一级页号（9位）], [二级页号（9位）], [三级页号（9位）], [页内偏移（12位）])
]
若各级页表项均占8字节，则进程的第三级页表占用的页框数最多是
#choices([512], [32 K], [256 K], [128 M])
]]

#block(breakable: false)[#question(label: n => [2026 30])[
假设两个进程共享一个页 S，其页表分别为 PT1 和 PT2，S 在两个进程虚拟地址空间中的起始地址分别为 VA1 和 VA2，则下列叙述中，正确的是
#choices([VA1 和 VA2 相同], [VA1 和 VA2 映射到的物理地址相同], [S 在 PT1 和 PT2 中的页表项内容相同], [S 在 PT1 和 PT2 中的页表项虚拟地址相同])
]]

== 段式管理

#block(breakable: false)[#question(label: n => [2009 27])[
一个分段存储管理系统中，地址长度为32位，其中段号占8位，则最大段长是

#choices(
  [$2^8$字节],
  [$2^(1 6)$字节],
  [$2^(2 4)$字节],
  [$2^(3 2)$字节],
)
]]

#block(breakable: false)[#question(label: n => [2016 28])[
某进程的段表内容如下所示。

#align(center, table(columns:(3em,3em,7em,4em,5em),align:center,stroke:none,
 [段号],table.cell(stroke:0.5pt)[段长],table.cell(stroke:0.5pt)[内存起始地址],table.cell(stroke:0.5pt)[权限],table.cell(stroke:0.5pt)[状态],
 [0],table.cell(stroke:0.5pt)[100],table.cell(stroke:0.5pt)[6000],table.cell(stroke:0.5pt)[只读],table.cell(stroke:0.5pt)[在内存],
 [1],table.cell(stroke:0.5pt)[200],table.cell(stroke:0.5pt)[—],table.cell(stroke:0.5pt)[读写],table.cell(stroke:0.5pt)[不在内存],
 [2],table.cell(stroke:0.5pt)[300],table.cell(stroke:0.5pt)[4000],table.cell(stroke:0.5pt)[读写],table.cell(stroke:0.5pt)[在内存],
))

当访问段号为2、段内地址为400的逻辑地址时，进行地址转换的结果是
#choices([段缺失异常], [得到内存地址4400], [越权异常], [越界异常])
]]

#block(breakable: false)[#question(label: n => [2019 28])[
在分段存储管理系统中，用共享段表描述所有被共享的段。若进程 P1 和 P2 共享段 S，下列叙述中，错误的是

#choices(
  [在物理内存中仅保存一份段 S 的内容],
  [段 S 在 P1 和 P2 中应该具有相同的段号],
  [P1 和 P2 共享段 S 在共享段表中的段表项],
  [P1 和 P2 都不再使用段 S 时才回收段 S 所占的内存空间],
)
]]
