// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：直接插入排序

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2026 9])[
使用直接插入排序算法分别对下列数据进行升序排序，元素之间比较次数最少的是
#choices([30，27，56，41，80，95，69], [31，43，26，55，63，99，77], [61，84，51，23，34，91，40], [93，32，48，81，50，21，72])
]]
