// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：图的存储及基本操作

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

#question(label: n => [2023 41])[
（13分）已知有向图 $G$ 采用邻接矩阵存储，类型定义如下：
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```c
typedef struct                  // 图的类型定义
{
    int numVertices, numEdges;   // 图的顶点数和有向边数
    char VerticesList[MAXV];     // 顶点表，MAXV为已定义常量
    int Edge[MAXV][MAXV];        // 邻接矩阵
} MGraph;
```
]
将图中出度大于入度的顶点称为 K 顶点。例如题41图中，顶点 a 和 b 为 K 顶点。
#figure(diagram(spacing: (2.3em, 1.8em), node-stroke: .6pt,
 node((1,0), [a], name: <a>, shape: circle, radius: .55em),
 node((0,1), [b], name: <b>, shape: circle, radius: .55em),
 node((2,1), [d], name: <d>, shape: circle, radius: .55em),
 node((1,2), [c], name: <c>, shape: circle, radius: .55em),
 edge(<a>,<b>, "->"), edge(<a>,<d>, "->"), edge(<b>,<d>, "->"), edge(<b>,<c>, "->"), edge(<c>,<d>, "->")), caption: [题41图])
请设计算法：`int printVertices(MGraph G)`，对给定的任意非空有向图 $G$，输出 $G$ 中所有的 K 顶点，并返回 K 顶点的个数。要求：
#subquestions[
 + 给出算法的基本设计思想。
 + 根据设计思想，采用 C 或 C++语言描述算法，关键之处给出注释。
]
]

== 邻接表

#block(breakable: false)[#question(label: n => [2026 6])[
若用邻接表保存有向图 $G=(V,E)$，则计算 $G$ 中某顶点入度的时间复杂度是
#choices([$O(abs(V))$], [$O(min(abs(V),abs(E)))$], [$O(abs(E))$], [$O(max(abs(V),abs(E)))$])
]]

== 邻接多重表、十字链表

#block(breakable: false)[#question(label: n => [2024 4])[
若无向图 $G=(V,E)$ 的邻接多重表如题4图所示，则 $G$ 中顶点 $b$ 与 $d$ 的度分别是

#figure(align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 大纲 PDF 第 49 页；包括原图每个边结点最左侧的空白标记域。
  let p(x,y) = ((x - 271) / 35, (819 - y) / 35)
  set-style(stroke: 0.055em, content: (wrap: body => box(text(size: 0.8em, top-edge: "bounds", bottom-edge: "bounds", body))))
  rect(p(271,417),p(357,782)); line(p(321,417),p(321,782))
  for y in (491,563,636,708) { line(p(271,y),p(357,y)) }
  for (i,label,y) in ((0,[$a$],455),(1,[$b$],529),(2,[$c$],601),(3,[$d$],673),(4,[$e$],745)) {
    content(p(253,y),str(i)); content(p(296,y),label)
  }
  let cellrow(x,y,labels) = {
    rect(p(x,y),p(x+206,y+49))
    for dx in (36,86,122,171) { line(p(x+dx,y),p(x+dx,y+49)) }
    for (dx,label) in (18,61,104,146.5,188.5).zip(labels) { content(p(x+dx,y+24.5),label) }
  }
  for (x,y,labels) in (
    (477,433,([], [0], [], [1], [∧])),(477,505,([], [1], [], [3], [∧])),
    (477,577,([], [2], [], [0], [∧])),(477,648,([], [3], [], [2], [])),
    (477,722,([], [4], [], [2], [∧])),(735,434,([], [0], [], [3], [])),
    (734,724,([], [4], [∧], [3], [])),
  ) { cellrow(x,y,labels) }
  for y in (455,529,601,673,745) { line(p(337,y),p(477,y),mark: (end: ">",fill: black,scale: 0.6)) }
  // 先画边框再画指针，保留原图从指针域内部伸出的线段。
  for pts in (
    ((581,455),(581,395),(838,395),(838,434)),
    ((921,459),(921,531),(683,531)),
    ((581,529),(581,490),(711,490),(711,457),(683,457)),
    ((838,459),(838,603),(683,603)),
    ((580,603),(580,637),(714,637),(714,674),(683,674)),
    ((579,673),(579,709),(426,709),(426,819),(920,819),(920,773)),
    ((662,673),(662,722)),
    ((579,746),(579,795),(836,795),(836,773)),
    ((920,749),(965,749),(965,458),(941,458)),
  ) { line(..pts.map(q => p(..q)),mark: (end: ">",fill: black,scale: 0.6)) }
})), caption: [题4图], kind: image)

#choices([0，2], [2，4], [2，5], [3，4])
]]
