// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：图的基本概念

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2009 7])[
下列关于无向连通图特性的叙述中，正确的是

I. 所有顶点的度之和为偶数 II. 边数大于顶点个数减1

Ⅲ. 至少有一个顶点的度为1

#choices(
  [只有Ⅰ],
  [只有Ⅱ],
  [I和Ⅱ],
  [I和Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2010 7])[
若无向图 G =（V，E）中含有7个顶点，要保证图
G在任何情况下都是连通的，则需要的边数最少是

#choices(
  [6],
  [15],
  [16],
  [21],
)
]]

#block(breakable: false)[#question(label: n => [2017 7])[
已知无向图 $G$ 含有16条边，其中度为4的顶点个数为3，度为3的顶点个数为4，其他顶点的度均小于3。图 $G$ 所含的顶点个数至少是
#choices([10], [11], [13], [15])
]]

#block(breakable: false)[#question(label: n => [2022 6])[
对于无向图 $G = (V, E)$，下列选项中，正确的是

#choices(
  [当 $abs(V) > abs(E)$ 时，$G$ 一定是连通的],
  [当 $abs(V) < abs(E)$ 时，$G$ 一定是连通的],
  [当 $abs(V) = abs(E) - 1$ 时，$G$ 一定是不连通的],
  [当 $abs(V) > abs(E) + 1$ 时，$G$ 一定是不连通的],
)
]]

#block(breakable: false)[#question(label: n => [2025 6])[
下列关于图的叙述中，正确的是

#choices([有向图必存在入度为0的顶点],[有向无环图的拓扑有序序列存在且唯一],[各顶点的度均大于等于2的无向图必有回路],[可用 BFS 算法求出带权图中每一对顶点间的最短路径])
]]

#block(breakable: false)[#question(label: n => [2026 7])[
有向图 $G=(V,E)$ 的顶点个数为 $n(n>=2)$，指定一个顶点为初始点，指定若干个顶点（非初始点）为标记点，且每个顶点都在从初始点到标记点的有向路径上（一条有向路径上允许含有多个标记点）。每条有向边上均有一个字符，从初始点到任一标记点的有向路径上的所有字符组成一个字符串，所有这样的字符串构成字符串集 $S$。下列关于 $S$ 的叙述中，#emphasis[错误]的是
#choices([若 $G$ 无环，则 $S$ 是有穷集], [若 $G$ 无环，则 $S$ 中存在长度等于 $n$ 的字符串], [若 $G$ 有环，则 $S$ 中存在长度大于 $n$ 的字符串], [若 $G$ 有环，则 $S$ 中存在长度小于 $2n$ 的字符串])
]]

#block(breakable: false)[#question(label: n => [2021 41])[
（15分）已知无向连通图 $G$ 由顶点集 $V$ 和边集 $E$ 组成，$abs(E)>0$，当 $G$ 中度为奇数的顶点个数为不大于2的偶数时，$G$ 存在包含所有边且长度为 $abs(E)$ 的路径（称为 EL 路径）。设图 $G$ 采用邻接矩阵存储，类型定义如下：

```c
typedef struct {                  // 图的定义
    int numVertices, numEdges;    // 图中实际的顶点数和边数
    char VerticesList[MAXV];      // 顶点表。MAXV为已定义常量
    int Edge[MAXV][MAXV];         // 邻接矩阵
} MGraph;
```

请设计算法：int IsExistEL(MGraph G)，判断 $G$ 是否存在 EL 路径，若存在，则返回1，否则，返回0。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。
+ 说明你所设计算法的时间复杂度和空间复杂度。

]
]]
