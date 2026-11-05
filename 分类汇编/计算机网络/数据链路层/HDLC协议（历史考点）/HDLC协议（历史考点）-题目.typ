// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：HDLC协议（历史考点）

#question(label: n => [2013 37])[
#strike[HDLC协议对01111100 01111110组帧后对应的比特串为

#choices(
  [01111100 00111110 10],
  [01111100 01111101 01111110],
  [01111100 01111101 0],
  [01111100 01111110 01111101],
)
]
]
