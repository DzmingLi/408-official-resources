// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：B树及其基本操作、B⁺树的基本概念

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2009 8])[
下列叙述中，不符合 m阶B树定义要求的是

#choices(
  [根结点最多有 m棵子树],
  [所有叶结点都在同一层上],
  [各结点内关键字均升序或降序排列],
  [叶结点之间通过指针链接],
)
]]

#block(breakable: false)[#question(label: n => [2012 9])[
设有一棵3阶B树，如下图所示。删除关键字78得到一棵新B树，其最右叶结点所含的关键字是

#align(center)[
  #diagram(
    node-stroke: 0.055em,
    node-fill: white,
    edge-stroke: 0.055em,
    spacing: (0.35em, 1.15em),
    node((0, 0), text(size: 0.88em)[45], width: 2.2em, height: 1.30em, inset: 0pt),
    node((-2.55, 1.55), text(size: 0.88em)[17#h(0.35em)35], width: 3.2em, height: 1.30em, inset: 0pt),
    node((2.55, 1.55), text(size: 0.88em)[55#h(0.35em)65], width: 3.2em, height: 1.30em, inset: 0pt),
    node((-4.05, 3.10), text(size: 0.88em)[10], width: 2em, height: 1.30em, inset: 0pt),
    node((-2.55, 3.10), text(size: 0.88em)[21], width: 2em, height: 1.30em, inset: 0pt),
    node((-1.05, 3.10), text(size: 0.88em)[37], width: 2em, height: 1.30em, inset: 0pt),
    node((1.05, 3.10), text(size: 0.88em)[47], width: 2em, height: 1.30em, inset: 0pt),
    node((2.55, 3.10), text(size: 0.88em)[60#h(0.35em)62], width: 3.2em, height: 1.30em, inset: 0pt),
    node((4.05, 3.10), text(size: 0.88em)[78], width: 2em, height: 1.30em, inset: 0pt),
    edge((0, 0), (-2.55, 1.55)),
    edge((0, 0), (2.55, 1.55)),
    edge((-2.55, 1.55), (-4.05, 3.10)),
    edge((-2.55, 1.55), (-2.55, 3.10)),
    edge((-2.55, 1.55), (-1.05, 3.10)),
    edge((2.55, 1.55), (1.05, 3.10)),
    edge((2.55, 1.55), (2.55, 3.10)),
    edge((2.55, 1.55), (4.05, 3.10)),
  )
]

#choices(
  [60],
  [60,62],
  [62,65],
  [65],
)
]]

#block(breakable: false)[#question(label: n => [2013 10])[
在一棵高度为2的5阶B树中，所含关键字的个数最少是

#choices(
  [5],
  [7],
  [8],
  [14],
)
]]

#block(breakable: false)[#question(label: n => [2014 9])[
在一棵具有15个关键字的4阶B树中，含关键字的结点个数最多是

#choices(
  [5],
  [6],
  [10],
  [15],
)
]]

#block(breakable: false)[#question(label: n => [2016 10])[
$B^+$树不同于B树的特点之一是
#choices([能支持顺序查找], [结点中含有关键字], [根结点至少有两个分支], [所有叶结点都在同一层上])
]]

#block(breakable: false)[#question(label: n => [2017 9])[
下列应用中，适合使用 $B^+$ 树的是
#choices([编译器中的词法分析], [关系数据库系统中的索引], [网络中的路由表快速查找], [操作系统的磁盘空闲块管理])
]]

#block(breakable: false)[#question(label: n => [2018 8])[
高度为5的3阶 B 树含有的关键字个数至少是

#choices([15], [31], [62], [242])
]]

#block(breakable: false)[#question(label: n => [2020 10])[
依次将关键字5，6，9，13，8，2，12，15插入初始为空的4阶 B 树后，根结点中包含的关键字是

#choices([8], [6，9], [8，13], [9，12])
]]

#block(breakable: false)[#question(label: n => [2021 9])[
在一棵高度为3的3阶 B 树中，根为第1层，若第2层中有4个关键字，则该树的结点个数最多是

#choices([11], [10], [9], [8])
]]

#block(breakable: false)[#question(label: n => [2022 8])[
在下图所示的5阶 B 树 $T$ 中，删除关键字260之后需要进行必要的调整，得到新的 B 树 $T_1$。下列选项中，#emphasis[不可能]是 $T_1$ 根结点中关键字序列的是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: 0.045em)
  for (x,px) in ((0,-2.7),(4,-1.4),(8,0),(12,1.4),(16,2.7)) {
    line((8+px,2.5),(x,0.5))
  }
  content((8,2.5), std.rect(radius: 0.15em, stroke: 0.045em, inset: 0.3em)[60　90　260　350])
  for (x,label) in ((0,[30　50]),(4,[70　80　85]),(8,[100　110]),(12,[280　300]),(16,[400　500])) {
    content((x,0), std.rect(radius: 0.15em, stroke: 0.045em, inset: 0.3em, label))
  }
}))

#choices([60，90，280], [60，90，350], [60，85，110，350], [60，90，110，350])
]]

#block(breakable: false)[#question(label: n => [2023 7])[
下列关于非空 B 树的叙述中，正确的是
#statements(columns: 1, [Ⅰ．插入操作可能增加树的高度], [Ⅱ．删除操作一定会导致叶结点的变化], [Ⅲ．查找某关键字总是要查找到叶结点], [Ⅳ．插入的新关键字最终位于叶结点中])
#choices([仅Ⅰ], [Ⅰ、Ⅱ], [Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2025 8])[
给定7个不同的关键字，能够构造的不同4阶 B 树的个数最多是

#choices([7],[8],[9],[10])
]]
