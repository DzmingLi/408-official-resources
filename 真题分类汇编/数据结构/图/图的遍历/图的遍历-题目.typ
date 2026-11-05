// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：图的遍历

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

== 深度优先搜索

#block(breakable: false)[#question(label: n => [2015 5])[
设有向图 $G = (V, E)$，顶点集 $V = \{v_0, v_1, v_2, v_3\}$，边集 $E = \{⟨v_0, v_1⟩, ⟨v_0, v_2⟩, ⟨v_0, v_3⟩, ⟨v_1, v_3⟩\}$。若从顶点 $v_0$ 开始对图进行深度优先遍历，则可能得到的不同遍历序列个数是

#choices([2], [3], [4], [5])
]]

#block(breakable: false)[#question(label: n => [2016 6])[
下列选项中，不是下图深度优先搜索序列的是

#align(center, diagram(spacing: 2.15em, node-stroke: 0.055em, edge-stroke: 0.055em, node-fill: white,
  node((0.5,0), [$V_1$], radius: 0.75em),
  node((0,1), [$V_2$], radius: 0.75em), node((1,1), [$V_3$], radius: 0.75em),
  node((0,2.25), [$V_4$], radius: 0.75em), node((1,2.25), [$V_5$], radius: 0.75em),
  edge((0.5,0),(0,1),"-|>"), edge((0.5,0),(1,1),"-|>"), edge((0.5,0),(1,2.25),"-|>"),
  edge((1,1),(0,1),"-|>"), edge((0,1),(1,2.25),"-|>"), edge((1,2.25),(0,2.25),"-|>"), edge((0,2.25),(1,1),"-|>"),
))
#choices([$V_1,V_5,V_4,V_3,V_2$], [$V_1,V_3,V_2,V_5,V_4$], [$V_1,V_2,V_5,V_4,V_3$], [$V_1,V_2,V_3,V_4,V_5$])
]]

#block(breakable: false)[#question(label: n => [2020 6])[
修改递归方式实现的图的深度优先搜索（DFS）算法，将输出（访问）顶点信息的语句移到退出递归前（即执行输出语句后立即退出递归）。采用修改后的算法遍历有向无环图 $G$，若输出结果中包含 $G$ 中的全部顶点，则输出的顶点序列是 $G$ 的

#choices([拓扑有序序列], [逆拓扑有序序列], [广度优先搜索序列], [深度优先搜索序列])
]]

== 广度优先搜索

#block(breakable: false)[#question(label: n => [2012 5])[
对有
n个顶点、e条边且使用邻接表存储的有向图进行广度优先遍历，其算法的时间复杂度是

#choices(
  [O(n)],
  [O(e)],
  [O(n+e)],
  [O(n×e)],
)
]]

#block(breakable: false)[#question(label: n => [2013 8])[
若对如下无向图进行遍历，则下列选项中，不是广度优先遍历序列的是

#align(center)[
  #diagram(
    node-stroke: 0.065em,
    node-fill: white,
    edge-stroke: 0.065em,
    spacing: (1.2em, 1.55em),
    node((0, 0), text(size: 0.9em, weight: "semibold")[a], radius: 0.82em),
    node((-2.07, 1.43), text(size: 0.9em, weight: "semibold")[b], radius: 0.82em),
    node((-3.15, 2.75), text(size: 0.9em, weight: "semibold")[c], radius: 0.82em),
    node((-0.99, 2.75), text(size: 0.9em, weight: "semibold")[d], radius: 0.82em),
    node((2.06, 1.43), text(size: 0.9em, weight: "semibold")[e], radius: 0.82em),
    node((1.02, 2.75), text(size: 0.9em, weight: "semibold")[f], radius: 0.82em),
    node((3.13, 2.75), text(size: 0.9em, weight: "semibold")[g], radius: 0.82em),
    node((0, 4.14), text(size: 0.9em, weight: "semibold")[h], radius: 0.82em),
    edge((0, 0), (-2.07, 1.43)),
    edge((-2.07, 1.43), (-3.15, 2.75)),
    edge((-2.07, 1.43), (-0.99, 2.75)),
    edge((-3.15, 2.75), (-0.99, 2.75)),
    edge((-3.15, 2.75), (0, 4.14)),
    edge((0, 0), (0, 4.14)),
    edge((0, 0), (2.06, 1.43)),
    edge((2.06, 1.43), (1.02, 2.75)),
    edge((2.06, 1.43), (3.13, 2.75)),
  )
]

#choices(
  [h,c,a,b,d,e,g,f],
  [e,a,f,g,b,h,c,d],
  [d,b,c,a,h,e,f,g],
  [a,b,c,d,h,e,f,g],
)
]]
