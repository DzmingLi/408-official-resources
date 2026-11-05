// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：操作系统结构

#block(breakable: false)[#question(label: n => [2023 23])[
与宏内核操作系统相比，下列特征中，微内核操作系统具有的是
#statements(columns: 2, [Ⅰ．较好的性能], [Ⅱ．较高的可靠性], [Ⅲ．较高的安全性], [Ⅳ．较强的可扩展性])
#choices([Ⅱ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ], [Ⅰ、Ⅲ、Ⅳ], [Ⅱ、Ⅲ、Ⅳ])
]]
