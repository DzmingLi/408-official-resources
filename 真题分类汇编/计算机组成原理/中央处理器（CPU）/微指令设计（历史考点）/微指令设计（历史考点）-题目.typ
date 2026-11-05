// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：微指令设计（历史考点）

#block(breakable: false)[#question(label: n => [2012 18])[
#strike[某计算机的控制器采用微程序控制方式，微指令中的操作控制字段采用字段直接编码法，共有33个微命令，构成5个互斥类，分别包含7、3、12、5和6个微命令，则操作控制字段至少有

#choices(
  [5位],
  [6位],
  [15位],
  [33位],
)
]
]]

#block(breakable: false)[#question(label: n => [2014 18])[
#strike[某计算机采用微程序控制器，共有32条指令，公共的取指令微程序包含2条微指令，各指令对应的微程序平均由4条微指令组成，采用断定法（下址字段法）确定下条微指令地址，则微指令中下址字段的位数至少是

#choices(
  [5],
  [6],
  [8],
  [9],
)
]
]]
