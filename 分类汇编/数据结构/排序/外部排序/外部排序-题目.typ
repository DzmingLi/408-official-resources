// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：外部排序

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#question(label: n => [2012 41])[
（10分）设有6个有序表A、B、C、D、E、F，分别含有10、35、40、50、60和200个数据元素，各表中元素按升序排列。要求通过5次两两合并，将6个表最终合并成1个升序表，并在最坏情况下比较的总次数达到最小。请回答下列问题。

#subquestions[
+ 
  给出完整的合并过程，并求出最坏情况下比较的总次数。
  \
+ 根据你的合并过程，描述 n （ $n gt.eq 2$
  ）个不等长升序表的合并策略，并说明理由。
  
    
]
]

#block(breakable: false)[#question(label: n => [2016 11])[
对10 TB的数据文件进行排序，应使用的方法是
#choices([希尔排序], [堆排序], [快速排序], [归并排序])
]]

#block(breakable: false)[#question(label: n => [2019 11])[
设外存上有120个初始归并段，进行12路归并时，为实现最佳归并，需要补充的虚段个数是

#choices([1], [2], [3], [4])
]]
