// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：起泡排序

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2010 11])[
对一组数据（2，12，16，88，5，10）进行排序，若前三趟排序结果如下：

第一趟排序结果：2，12，16，5，10，88

第二趟排序结果：2，12，5，10，16，88

第三趟排序结果：2，5，10，12，16，88

则采用的排序方法可能是

#choices(
  [起泡排序],
  [希尔排序],
  [归并排序],
  [基数排序],
)
]]
