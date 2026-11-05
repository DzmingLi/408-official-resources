// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：RAID（历史考点）

#block(breakable: false)[#question(label: n => [2013 20])[
#strike[下列选项中，用于提高RAID可靠性的措施有

I. 磁盘镜像 II. 条带化 III. 奇偶校验 IV.
增加Cache机制

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅰ、Ⅲ和Ⅳ],
  [仅Ⅱ、Ⅲ和Ⅳ],
)
]
]]
