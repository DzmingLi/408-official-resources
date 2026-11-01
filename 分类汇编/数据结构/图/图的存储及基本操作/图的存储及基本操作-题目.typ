// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：图的存储及基本操作

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

== 邻接矩阵

#block(breakable: false)[#question(label: n => [2011 8])[
下列关于图的叙述中，正确的是

I. 回路是简单路径

Ⅱ. 存储稀疏图，用邻接矩阵比邻接表更省空间

Ⅲ. 若有向图中存在拓扑序列，则该图不存在回路

#choices(
  [仅Ⅱ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅲ],
  [仅Ⅰ、Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2013 7])[
设图的邻接矩阵 A 如下所示。各顶点的度依次是

$ bold(A) = mat(delim: "[", 0, 1, 0, 1; 0, 0, 1, 1; 0, 1, 0, 0; 1, 0, 0, 0) $

#choices(
  [1,2,1,2],
  [2,2,1,1],
  [3,4,2,3],
  [4,4,2,2],
)
]]

#question(label: n => [2015 42])[
（8分）已知含有5个顶点的图 $G$ 如下图所示。

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  let points = ((2.8, 7), (8.3, 7), (0, 2.8), (5.3, 0.6), (10.6, 2.8))
  for (a, b) in ((0, 1), (0, 2), (0, 4), (1, 3), (1, 4), (2, 3), (3, 4)) {
    line(points.at(a), points.at(b))
  }
  for (i, p) in points.enumerate() {
    circle(p, radius: 0.86, fill: white)
    content(p, str(i))
  }
}))

请回答下列问题。

#subquestions[
+ 写出图 $G$ 的邻接矩阵 $A$（行、列下标均从0开始）。
  \
+ 求 $A^2$，矩阵 $A^2$ 中位于0行3列元素值的含义是什么？
  \
+ 若已知具有 $n$（$n >= 2$）个顶点的图的邻接矩阵为 $B$，则 $B^m$（$2 <= m <= n$）中非零元素的含义是什么？
    
]
]
