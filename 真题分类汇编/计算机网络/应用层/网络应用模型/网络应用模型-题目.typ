// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：网络应用模型

== 对等（P2P）模型

#question(label: n => [2019 40])[
下列关于网络应用模型的叙述中，错误的是

#choices(
  [在 P2P 模型中，结点之间具有对等关系],
  [在客户/服务器（C/S）模型中，客户与客户之间可以直接通信],
  [在 C/S 模型中，主动发起通信的是客户，被动通信的是服务器],
  [在向多用户分发一个文件时，P2P 模型通常比 C/S 模型所需时间短],
)
]
