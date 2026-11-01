// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：指令系统的基本概念

#block(breakable: false)[#question(label: n => [2022 18])[
下列选项中，属于指令集体系结构（ISA）规定的内容是

#statements(columns: (1fr, 1fr), [Ⅰ．指令字格式和指令类型], [Ⅱ．CPU 的时钟周期],
  [Ⅲ．通用寄存器个数和位数], [Ⅳ．加法器的进位方式],
)

#choices([Ⅰ、Ⅱ], [Ⅰ、Ⅲ], [Ⅱ、Ⅳ], [Ⅰ、Ⅲ、Ⅳ])
]]
