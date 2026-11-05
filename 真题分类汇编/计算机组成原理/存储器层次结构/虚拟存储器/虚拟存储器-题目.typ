// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：虚拟存储器

== 页式虚拟存储器

#block(breakable: false)[#question(label: n => [2010 17])[
下列命中组合情况中，一次访存过程中不可能发生的是

#choices(
  [TLB未命中、Cache未命中、Page未命中],
  [TLB未命中、Cache命中、Page命中],
  [TLB命中、Cache未命中、Page命中],
  [TLB命中、Cache命中、Page未命中],
)
]]

#question(label: n => [2011 44])[
（12分）某计算机存储器按字节编址，虚拟（逻辑）地址空间大小为16MB，主存（物理）地址空间大小为1MB，页面大小为4KB；Cache采用直接映射方式，共8行；主存与
Cache之间交换的块大小为32B。系统运行到某一时刻时，页表的部分内容和Cache的部分内容分别如题44-a图、题44-b图所示，图中页框号及标记字段的内容为十六进制形式。

#align(center)[#box(width: 82%)[#grid(
  columns: (1fr, 1fr),
  gutter: 1.8em,
  figure(
    align(center)[#text(size: 0.78em)[#stack(
      dir: ttb,
      spacing: 0pt,
      grid(
        columns: (1.1fr, 1.1fr, 1.1fr, 0.9fr),
        align: center,
        [虚页号], [有效位], [页框号], […],
      ),
      table(
        columns: (1.1fr, 1.1fr, 1.1fr, 0.9fr),
        align: center + horizon,
        stroke: (x, y) => (
          top: if y == 0 { 0.6pt } else { none },
          bottom: if y == 7 { 0.6pt } else { none },
          left: 0.45pt,
          right: if x == 3 { 0.45pt } else { none },
        ),
        [0], [1], [06], […],
        [1], [1], [04], […],
        [2], [1], [15], […],
        [3], [1], [02], […],
        [4], [0], [−], […],
        [5], [1], [2B], […],
        [6], [0], [−], […],
        [7], [1], [32], […],
      ),
    )]],
    kind: table,
    caption: [题44-a图　页表的部分内容],
    numbering: none,
  ),
  figure(
    align(center)[#text(size: 0.78em)[#stack(
      dir: ttb,
      spacing: 0pt,
      grid(
        columns: (1.1fr, 1.1fr, 1.1fr, 0.9fr),
        align: center,
        [行号], [有效位], [标记], […],
      ),
      table(
        columns: (1.1fr, 1.1fr, 1.1fr, 0.9fr),
        align: center + horizon,
        stroke: (x, y) => (
          top: if y == 0 { 0.6pt } else { none },
          bottom: if y == 7 { 0.6pt } else { none },
          left: 0.45pt,
          right: if x == 3 { 0.45pt } else { none },
        ),
        [0], [1], [020], […],
        [1], [0], [−], […],
        [2], [1], [01D], […],
        [3], [1], [105], […],
        [4], [1], [064], […],
        [5], [1], [14D], […],
        [6], [0], [−], […],
        [7], [1], [27A], […],
      ),
    )]],
    kind: table,
    caption: [题44-b图　Cache的部分内容],
    numbering: none,
  ),
)]]

请回答下列问题。

#subquestions[
+ 
  虚拟地址共有几位，哪几位表示虚页号？物理地址共有几位，哪几位表示页框号
  （物理页号）？
  \
+ 使用物理地址访问
  Cache时，物理地址应划分成哪几个字段？要求说明每个字段的位数及在物理地址中的位置。
  \
+ 
  虚拟地址001C60H所在的页面是否在主存中？若在主存中，则该虚拟地址对应的物理地址是什么？访问该地址时是否Cache命中？要求说明理由。
  \
+ 
  假定为该机配置一个4路组相联的TLB，该TLB共可存放8个页表项，若其当前内容（十六进制）如题44-c图所示，则此时虚拟地址024BACH所在的页面是否在主
  
  存中？要求说明理由。
  
  #figure(
    align(center)[#table(
      columns: (7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%),
      align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
      [组号], [有效位], [标记], [页框号], [有效位], [标记], [页框号], [有效位], [标记], [页框号], [有效位], [标记], [页框号],
      [0], [0], [-], [-], [1], [001], [15], [0], [-], [-], [1], [012], [1F],
      [1], [1], [013], [2D], [0], [-], [-], [1], [008], [7E], [0], [-], [-],
    )],
    kind: image,
    caption: [题44-c图　TLB的部分内容],
    numbering: none,
  )
  
    
]
]

#block(breakable: false)[#question(label: n => [2013 16])[
某计算机主存地址空间大小为256MB，按字节编址。虚拟地址空间大小为4GB，采用页式存储管理，页面大小为4KB，TLB（快表）采用全相联映射，有4个页表项，内容如下表所示。

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [有效位], [标记], [页框号], […],
    [0], [FF180H], [0002H], […],
    [1], [3FFF1H], [0035H], […],
    [0], [02FF3H], [0351H], […],
    [1], [03FFFH], [0153H], […],
  )]
  , kind: table
  )

则对虚拟地址03FF F180H进行虚实地址变换的结果是

#choices(
  [0153180H],
  [0035180H],
  [TLB缺失],
  [缺页],
)
]]

#block(breakable: false)[#question(label: n => [2015 16])[
假定编译器将赋值语句“`x = x + 3;`”转换为指令“`add xaddr, 3`”，其中，xaddr是x对应的存储单元地址。若执行该指令的计算机采用页式虚拟存储管理方式，并配有相应的TLB，且Cache使用直写（Write Through）方式，则完成该指令功能需要访问主存的次数至少是

#choices([0], [1], [2], [3])
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

#pagebreak(weak: true)

#question(label: n => [2018 44])[
（15分）某计算机采用页式虚拟存储管理方式，按字节编址。CPU 进行存储访问的过程如题44图所示。

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

根据题44图回答下列问题。

#subquestions[
+ 主存物理地址占多少位？
+ TLB 采用什么映射方式？TLB 用 SRAM 还是 DRAM 实现？
+ Cache 采用什么映射方式？若 Cache 采用 LRU 替换算法和回写（Write Back）策略，则 Cache 每行中除数据（Data）、Tag 和有效位外，还应有哪些附加位？Cache 总容量是多少？Cache 中有效位的作用是什么？
+ 若 CPU 给出的虚拟地址为0008 C040H，则对应的物理地址是多少？是否在 Cache 中命中？说明理由。若 CPU 给出的虚拟地址为0007 C260H，则该地址所在主存块映射到的 Cache 组号是多少？

]
]

#block(breakable: false)[#question(label: n => [2020 15])[
下列关于 TLB 和 Cache 的叙述中，#emphasis[错误]的是

#choices([命中率都与程序局部性有关], [缺失后都需要去访问主存], [缺失处理都可以由硬件实现], [都由 DRAM 存储器组成])
]]

#question(label: n => [2021 44])[
（8分）假设计算机 M 的主存地址为24位，按字节编址，采用分页存储管理方式，虚拟地址为30位，页大小为4 KB；TLB 采用2路组相联方式和 LRU 替换策略，共8组。请回答下列问题。

#subquestions[
+ 虚拟地址中哪几位表示虚页号？哪几位表示页内地址？
+ 已知访问 TLB 时虚页号高位部分用作 TLB 标记，低位部分用作 TLB 组号，M 的虚拟地址中哪几位是 TLB 标记？哪几位是 TLB 组号？
+ 假设 TLB 初始时为空，访问的虚页号依次为10、12、16、7、26、4、12和20，在此过程中，哪一个虚页号对应的 TLB 表项被替换？说明理由。
+ 若将 M 中的虚拟地址位数增加到32位，则 TLB 表项的位数增加几位？

]
]

#block(breakable: false)[#question(label: n => [2022 15])[
某计算机主存地址为24位，采用分页虚拟存储管理方式，虚拟地址空间大小为4 GB，页大小为4 KB，按字节编址。某进程的页表部分内容如下页表所示。

#align(center, table(columns: (4em, 9em, 5em), stroke: none, align: center,
  [虚页号], [实页号（页框号）], [存在位],
  [82], table.cell(stroke: 0.5pt)[024H], table.cell(stroke: 0.5pt)[0],
  [⋯], table.cell(stroke: 0.5pt)[⋯], table.cell(stroke: 0.5pt)[⋯],
  [129], table.cell(stroke: 0.5pt)[180H], table.cell(stroke: 0.5pt)[1],
  [130], table.cell(stroke: 0.5pt)[018H], table.cell(stroke: 0.5pt)[1],
))

当 CPU 访问虚拟地址0008 2840H时，虚实地址转换的结果是

#choices([得到主存地址02 4840H], [得到主存地址18 0840H], [得到主存地址01 8840H], [检测到缺页异常])
]]

#question(label: n => [2023 43])[
（14分）已知计算机 M 字长为32位，按字节编址，采用请求调页策略的虚拟存储管理方式，虚拟地址为32位，页大小为4 KB；数据 Cache 采用4路组相联映射方式，数据区大小为8 KB，主存块大小为32 B。现有 C 语言程序段如下：
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```c
int a[24][64];
…
for(i=0; i<24; i++)
    for(j=0; j<64; j++) a[i][j]=10;
```
]
已知二维数组 a 按行优先存放，在虚拟地址空间中分配的起始地址为0042 2000H，sizeof(int)=4，假定在 M 上执行上述程序段之前数组 a 不在主存，且在该程序段执行过程中不会发生页面置换。请回答下列问题：
#subquestions[
 + 数组 a 分布在几个页面中？对于数组 a 的访问，会发生几次缺页异常？页故障地址各是什么？
 + 不考虑变量 $i$ 和 $j$，该程序段的数据访问是否具有时间局部性？为什么？
 + 计算机 M 的虚拟地址（A31～A0）中哪几位用作块内地址？哪几位用作 Cache 组号？a\[1\]\[0\]的虚拟地址是多少？其所在主存块对应的 Cache 组号是多少？
 + 数组 a 占用多少主存块？假设上述程序段执行过程中数组 a 的访问不会和其他数据发生 Cache 访问冲突，则数组 a 的 Cache 命中率是多少？若将循环中 $i$ 和 $j$ 的次序按如下方式调换：

   #block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
   ```c
   for(j=0; j<64; j++)
       for(i=0; i<24; i++) a[i][j]=10;
   ```
   ]
   则数组 a 的 Cache 命中率又是多少？
]
]

#block(breakable: false)[#question(label: n => [2024 17])[
某计算机按字节编址，采用页式虚拟存储管理方式，虚拟地址为32位，主存地址为30位，页大小为1 KB。若 TLB 共有32个表项，采用4路组相联映射方式，则 TLB 表项中标记字段的位数至少是

#choices([17], [18], [19], [20])
]]

#block(breakable: false)[#question(label: n => [2024 18])[
下列事件中，#emphasis[不是]在 MMU 地址转换过程中检测的是

#choices([访问越权], [Cache 缺失], [页面缺失], [TLB 缺失])
]]

#question(label: n => [2025 43])[
（本题12分）现有 C 语言程序 P 的部分代码如题43图所示。假定运行程序 P 的计算机 M 字长为32位，按字节编址，数据 Cache 的数据区大小为32 KB，采用8路组相联映射方式，主存块大小为64 B，Cache 的命中时间为2个时钟周期，缺失损失为200个时钟周期；采用页式虚拟存储管理方式，页大小为4 KB。数组 $d$ 的起始虚拟地址 $"VA"_31 ∼ "VA"_0$ 为0180 0020H。

#figure(align(center,block(stroke: 0.045em,inset: 0.5em)[
```c
int x, d[2048], i;
...
for(i=0; i<2048; i++)
    d[i]=d[i]/x;
...
```
]),caption: [题43图],kind: image)

请回答下列问题。

#subquestions[
+ 主存地址中 Cache 组号字段和块内地址字段分别占几位？虚拟地址中哪些位可作为 Cache 索引？（3分）
+ $d[100]$ 的虚拟地址为多少？$d[100]$ 所在主存块对应的 Cache 组号是多少？（2分）
+ 假定执行 for 语句时对应代码已在 Cache，变量 $i$ 和 $x$ 装入寄存器，数组 $d$ 已调入主存但不在 Cache，则 $d[0]$ 在其所在主存块内的偏移量是多少（用十六进制表示）？for 语句执行过程中，访问数组 $d$ 的 Cache 缺失率和数组元素的平均访问时间分别是多少（Cache 缺失率的计算结果要求用百分比表示，保留两位小数）？（5分）
+ 数组 $d$ 分布在几个页中？若执行 for 语句时对应代码已在主存，但数组 $d$ 还未调入主存，则执行 for 语句过程中，访问数组 $d$ 所引起的缺页次数是多少？（2分）

]
]

#block(breakable: false)[#question(label: n => [2026 19])[
某计算机按字节编址，虚拟地址为16位，页大小为256 B，页表项中包含装入位（P）、页框号（PPN）等字段，TLB 采用4路组相联映射方式，共有16个 TLB 表项，TLB 表项中包含标记（Tag）、有效位（V）等字段。在 TLB 表项与主存页表同步后，若主存页表中页号22对应的页表项中 P=0、PPN=2AH，则下列选项中，#emphasis[不可能]出现在组号为2的 TLB 表项中的是
#choices([Tag = 05H、V = 1、PPN = 1CH], [Tag = 06H、V = 1、PPN = 2AH], [Tag = 16H、V = 0、PPN = 2AH], [Tag = 1AH、V = 0、PPN = 1CH])
]]
