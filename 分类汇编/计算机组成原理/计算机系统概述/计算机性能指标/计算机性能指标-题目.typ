// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：计算机性能指标

#block(breakable: false)[#question(label: n => [2010 12])[
下列选项中，能缩短程序的CPU执行时间的措施是

I. 提高CPU时钟频率 II. 优化数据通路结构

Ⅲ. 对程序进行编译优化

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅰ和Ⅲ],
  [仅Ⅱ和Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2011 12])[
下列选项中，描述浮点数操作速度指标的是

#choices(
  [MIPS],
  [CPI],
  [IPC],
  [MFLOPS],
)
]]

#block(breakable: false)[#question(label: n => [2012 12])[
假定基准程序
A在某计算机上的运行时间为100秒，其中90秒为CPU时间，其余为
I/O时间。若CPU速度提高 50% ，I/O速度不变，则运行基准程序 A所耗费的时间是

#choices(
  [55秒],
  [60秒],
  [65秒],
  [70秒],
)
]]

#block(breakable: false)[#question(label: n => [2013 12])[
某计算机主频为1.2GHz，其指令分为4类，它们在基准程序中所占比例及CPI如下表所示。

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [指令类型], [所占比例], [CPI],
    [A], [50%], [2],
    [B], [20%], [3],
    [C], [10%], [4],
    [D], [20%], [5],
  )]
  , kind: table
  )

该机的 MIPS 数是

#choices(
  [100],
  [200],
  [400],
  [600],
)
]]

#block(breakable: false)[#question(label: n => [2014 12])[
程序 $P$ 在机器 $M$ 上的CPU执行时间是20秒，编译优化后，$P$ 执行的指令数减少到原来的70%，而 CPI 增加到原来的1.2倍，则 $P$ 在 $M$ 上的CPU执行时间是

#choices(
  [8.4秒],
  [11.7秒],
  [14.0秒],
  [16.8秒],
)
]]

#block(breakable: false)[#question(label: n => [2017 12])[
假定计算机 M1 和 M2 具有相同的指令集体系结构（ISA），主频分别为1.5 GHz和1.2 GHz。在 M1 和 M2 上运行某基准程序 P，平均 CPI 分别为2和1，则程序 P 在 M1 和 M2 上的CPU执行时间的比值是
#choices([0.4], [0.625], [1.6], [2.5])
]]

#block(breakable: false)[#question(label: n => [2021 12])[
2017年公布的全球超级计算机 TOP 500 排名中，我国“神威·太湖之光”超级计算机蝉联第一，其浮点运算速度为93.0146 PFLOPS，说明该计算机每秒钟内完成的浮点操作次数约为

#choices([$9.3 times 10^13$ 次], [$9.3 times 10^15$ 次], [9.3千万亿次], [9.3亿亿次])
]]

#block(breakable: false)[#question(label: n => [2022 12])[
某计算机主频为1 GHz，程序 P 运行过程中，共执行了10 000条指令，其中，80%的指令执行平均需1个时钟周期，20%的指令执行平均需10个时钟周期。程序 P 的平均 CPI 和 CPU 执行时间分别是

#choices([2.8，28 μs], [28，28 μs], [2.8，28 ms], [28，28 ms])
]]
