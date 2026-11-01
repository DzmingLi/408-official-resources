// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：二路归并排序

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2009 10])[
若数据元素序列11，12，13，7，8，9，23，4，5是采用下列排序方法之一得到的第二趟排序后的结果，则该排序算法只能是

#choices(
  [起泡排序],
  [插入排序],
  [选择排序],
  [二路归并排序],
)
]]

#block(breakable: false)[#question(label: n => [2022 10])[
使用二路归并排序对含 $n$ 个元素的数组 M 进行排序时，二路归并操作的功能是

#choices(
  [将两个有序表合并为一个新的有序表],
  [将 M 划分为两部分，两部分的元素个数大致相等],
  [将 M 划分为 $n$ 个部分，每个部分中仅含有一个元素],
  [将 M 划分为两部分，一部分元素的值均小于另一部分元素的值],
)
]]
