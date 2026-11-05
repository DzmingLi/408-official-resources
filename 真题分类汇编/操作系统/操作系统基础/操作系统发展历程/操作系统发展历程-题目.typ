// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：操作系统发展历程

#block(breakable: false)[#question(label: n => [2016 23])[
下列关于批处理系统的叙述中，正确的是
#statements(columns:1,
 [Ⅰ. 批处理系统允许多个用户与计算机直接交互],
 [Ⅱ. 批处理系统分为单道批处理系统和多道批处理系统],
 [Ⅲ. 中断技术使得多道批处理系统的I/O设备可与CPU并行工作],
)
#choices([仅Ⅱ、Ⅲ], [仅Ⅱ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2017 28])[
与单道程序系统相比，多道程序系统的优点是
#statements(columns: 2, [Ⅰ．CPU 利用率高], [Ⅱ．系统开销小], [Ⅲ．系统吞吐量大], [Ⅳ．I/O 设备利用率高])
#choices([仅Ⅰ、Ⅲ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2022 23])[
下列关于多道程序系统的叙述中，#emphasis[不正确]的是

#choices([支持进程的并发执行], [不必支持虚拟存储管理], [需要实现对共享资源的管理], [进程数越多 CPU 利用率越高])
]]
