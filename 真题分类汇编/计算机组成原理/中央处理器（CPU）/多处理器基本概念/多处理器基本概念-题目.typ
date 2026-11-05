// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：多处理器基本概念

== 共享内存多处理器（SMP）的基本概念

#block(breakable: false)[#question(label: n => [2022 22])[
下列关于并行处理技术的叙述中，#emphasis[不正确]的是

#choices([多核处理器属于 MIMD 结构], [向量处理器属于 SIMD 结构], [硬件多线程技术只可用于多核处理器], [SMP 中所有处理器共享单一物理地址空间])
]]
