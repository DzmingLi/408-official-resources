// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：操作系统引导

#block(breakable: false)[#question(label: n => [2013 29])[
计算机开机后，操作系统最终被加载到

#choices(
  [BIOS],
  [ROM],
  [EPROM],
  [RAM],
)
]]

#block(breakable: false)[#question(label: n => [2022 24])[
下列选项中，需要在操作系统进行初始化过程中创建的是

#choices([中断向量表], [文件系统的根目录], [硬盘分区表], [文件系统的索引节点表])
]]
