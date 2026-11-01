// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：操作系统的基本概念

#block(breakable: false)[#question(label: n => [2009 23])[
单处理机系统中，可并行的是

#statements(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 0.6em,
  [I. 进程与进程], [II. 处理机与设备], [III. 处理机与通道], [IV. 设备与设备],
)

#choices(
  [I、Ⅱ和Ⅲ],
  [I、Ⅱ和Ⅳ],
  [I、Ⅲ和Ⅳ],
  [II、Ⅲ和Ⅳ],
)
]]

#block(breakable: false)[#question(label: n => [2018 23])[
下列关于多任务操作系统的叙述中，正确的是

Ⅰ．具有并发和并行的特点 \
Ⅱ．需要实现对共享资源的保护 \
Ⅲ．需要运行在多 CPU 的硬件平台上

#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ、Ⅲ])
]]
