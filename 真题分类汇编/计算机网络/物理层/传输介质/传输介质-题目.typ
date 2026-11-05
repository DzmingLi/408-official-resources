// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：传输介质

== 物理层接口的特性

#question(label: n => [2012 34])[
在物理层接口特性中，用于描述完成每种功能的事件发生顺序的是

#choices(
  [机械特性],
  [功能特性],
  [过程特性],
  [电气特性],
)
]

#question(label: n => [2018 34])[
下列选项中，不属于物理层接口规范定义范畴的是

#choices([接口形状], [引脚功能], [物理地址], [信号电平])
]
