// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：CISC和RISC的基本概念

#block(breakable: false)[#question(label: n => [2009 17])[
下列关于 RISC 的叙述中，错误的是

#choices(
  [RISC 普遍采用微程序控制器],
  [RISC 大多数指令在一个时钟周期内完成],
  [RISC 的内部通用寄存器数量相对 CISC 多],
  [RISC 的指令数、寻址方式和指令格式种类相对 CISC 少],
)
]]

#block(breakable: false)[#question(label: n => [2025 17])[
下列关于 RISC 的叙述中，#emphasis[错误]的是

#choices([多采用硬连线方式实现控制器],[通常采用 Load/Store 型指令设计风格],[难以采用流水线数据通路实现微架构],[多采用寄存器传递过程调用时的参数])
]]
