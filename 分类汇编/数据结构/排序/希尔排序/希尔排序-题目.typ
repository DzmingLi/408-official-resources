// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：希尔排序

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2014 10])[
用希尔排序方法对一个数据序列进行排序时，若第1趟排序结果为9，1，4，13，7，8，20，
23，15，则该趟排序采用的增量（间隔）可能是

#choices(
  [2],
  [3],
  [4],
  [5],
)
]]

#block(breakable: false)[#question(label: n => [2015 11])[
希尔排序的组内排序采用的是

#choices([直接插入排序], [折半插入排序], [快速排序], [归并排序])
]]

#block(breakable: false)[#question(label: n => [2018 10])[
对初始数据序列（8，3，9，11，2，1，4，7，5，10，6）进行希尔排序。若第一趟排序结果为（1，3，7，5，2，6，4，9，11，10，8），第二趟排序结果为（1，2，6，4，3，7，5，8，11，10，9），则两趟排序采用的增量（间隔）依次是

#choices([3，1], [3，2], [5，2], [5，3])
]]

#block(breakable: false)[#question(label: n => [2025 11])[
对含9个关键字的初始序列进行排序，若序列的变化情况如下所示，则下列排序算法中，采用的是

#table(columns: (11em,1fr),align: center,
  [初始序列],[5，25，40，30，10，20，45，15，35],
  [第1趟排序后的序列],[5，10，20，30，15，35，45，25，40],
  [第2趟排序后的序列],[5，10，15，25，20，30，40，35，45],
)

#choices([希尔排序],[基数排序],[归并排序],[折半插入排序])
]]
