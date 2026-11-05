// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：外部存储器

== 磁盘存储器

#block(breakable: false)[#question(label: n => [2013 21])[
某磁盘的转速为10000转/分，平均寻道时间是6
ms，磁盘传输速率是20 MB/s，磁盘控制器延迟为0.2
ms，读取一个4KB的扇区所需的平均时间约为

#choices(
  [9 ms],
  [9.4 ms],
  [12 ms],
  [12.4 ms],
)
]]

#block(breakable: false)[#question(label: n => [2015 20])[
若磁盘转速为7200转/分，平均寻道时间为8 ms，每个磁道包含1000个扇区，则访问一个扇区的平均存取时间大约是

#choices([8.1 ms], [12.2 ms], [16.3 ms], [20.5 ms])
]]

#block(breakable: false)[#question(label: n => [2019 20])[
下列关于磁盘存储器的叙述中，错误的是

#choices(
  [磁盘的格式化容量比非格式化容量小],
  [扇区中包含数据、地址和校验等信息],
  [磁盘存储器的最小读写单位为一个字节],
  [磁盘存储器由磁盘控制器、磁盘驱动器和盘片组成],
)
]]
