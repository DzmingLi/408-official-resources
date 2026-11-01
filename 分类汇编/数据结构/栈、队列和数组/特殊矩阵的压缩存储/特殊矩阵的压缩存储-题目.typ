// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：特殊矩阵的压缩存储

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2016 4])[
有一个100阶的三对角矩阵 $M$，其元素 $m_(i,j)$（$1 <= i <= 100, 1 <= j <= 100$）按行优先次序压缩存入下标从0开始的一维数组 $N$ 中。元素 $m_(30,30)$ 在 $N$ 中的下标是
#choices([86], [87], [88], [89])
]]

#block(breakable: false)[#question(label: n => [2017 3])[
适用于压缩存储稀疏矩阵的两种存储结构是
#choices([三元组表和十字链表], [三元组表和邻接矩阵], [十字链表和二叉链表], [邻接矩阵和十字链表])
]]

#block(breakable: false)[#question(label: n => [2018 3])[
设有一个 $12 times 12$ 的对称矩阵 $M$，将其上三角部分的元素 $m_(i,j)$（$1 <= i <= j <= 12$）按行优先存入 C 语言的一维数组 N 中，元素 $m_(6,6)$ 在 N 中的下标是

#choices([50], [51], [55], [66])
]]

#block(breakable: false)[#question(label: n => [2020 1])[
将一个 $10 times 10$ 对称矩阵 $M$ 的上三角部分的元素 $m_(i,j)$（$1 <= i <= j <= 10$）按列优先存入 C 语言的一维数组 N 中，元素 $m_(7,2)$ 在 N 中的下标是

#choices([15], [16], [22], [23])
]]
