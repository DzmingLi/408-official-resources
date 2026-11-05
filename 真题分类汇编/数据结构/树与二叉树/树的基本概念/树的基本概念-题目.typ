// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：树的基本概念

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2010 5])[
在一棵度为4的树
T中，若有20个度为4的结点，10个度为3的结点，1个度为2的结点，10个度为1的结点，则树
T的叶结点个数是

#choices(
  [41],
  [82],
  [113],
  [122],
)
]]

#block(breakable: false)[#question(label: n => [2016 5])[
若森林 $F$ 有15条边、25个结点，则 $F$ 包含树的个数是
#choices([8], [9], [10], [11])
]]

#question(label: n => [2016 42])[
（8分）如果一棵非空 $k$（$k >= 2$）叉树 $T$ 中每个非叶结点都有 $k$ 个孩子，则称 $T$ 为正则 $k$ 叉树。请回答下列问题并给出推导过程。
#subquestions[
+ 若 $T$ 有 $m$ 个非叶结点，则 $T$ 中的叶结点有多少个？
+ 若 $T$ 的高度为 $h$（单结点的树 $h=1$），则 $T$ 的结点数最多为多少个？最少为多少个？
]
]

#block(breakable: false)[#question(label: n => [2022 4])[
若三叉树 $T$ 中有244个结点（叶结点的高度为1），则 $T$ 的高度至少是

#choices([8], [7], [6], [5])
]]
