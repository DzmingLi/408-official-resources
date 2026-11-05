// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：图的基本应用

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

== 最小（代价）生成树

#block(breakable: false)[#question(label: n => [2012 8])[
下列关于最小生成树的叙述中，正确的是

I. 最小生成树的代价唯一

Ⅱ. 权值最小的边一定会出现在所有的最小生成树中

Ⅲ. 使用普里姆（Prim）算法从不同顶点开始得到的最小生成树一定相同

Ⅳ. 使用普里姆算法和克鲁斯卡尔（Kruskal）算法得到的最小生成树总不相同

#choices(
  [仅Ⅰ],
  [仅Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅳ],
)
]]

#block(breakable: false)[#question(label: n => [2015 6])[
求下面带权图的最小（代价）生成树时，可能是克鲁斯卡尔（Kruskal）算法第2次选中但不是普里姆（Prim）算法（从 $v_4$ 开始）第2次选中的边是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  line((0, 6), (6, 6), (6, 0), (0, 0), close: true)
  line((0, 6), (6, 0))
  line((0, 0), (6, 6))
  for (p, body) in (((0, 6), [$v_1$]), ((6, 6), [$v_2$]), ((0, 0), [$v_3$]), ((6, 0), [$v_4$])) {
    circle(p, radius: 0.93, fill: white)
    content(p, body)
  }
  content((3, 6.62), [10])
  content((-0.66, 3), [8])
  content((6.78, 3), [11])
  content((3, -0.62), [8])
  content((1.17, 3.75), [5])
  content((4.82, 3.75), [8])
}))

#choices(
  [$(v_1, v_3)$],
  [$(v_1, v_4)$],
  [$(v_2, v_3)$],
  [$(v_3, v_4)$],
)
]]

#question(label: n => [2017 42])[
（8分）使用 Prim（普里姆）算法求带权连通图的最小（代价）生成树（MST）。请回答下列问题。
#subquestions[
 + 对下列图 $G$，从顶点 A 开始求 $G$ 的 MST，依次给出按算法选出的边。
 + 图 $G$ 的 MST 是唯一的吗？
 + 对任意的带权连通图，满足什么条件时，其 MST 是唯一的？
]
#align(center, diagram(spacing: (2em, 2em), node-stroke: .6pt,
 node((1,0), [A], name: <a>, shape: circle, radius: .6em),
 node((-.4,1), [B], name: <b>, shape: circle, radius: .6em),
 node((2.4,1), [E], name: <e>, shape: circle, radius: .6em),
 node((.1,2.6), [C], name: <c>, shape: circle, radius: .6em),
 node((1.9,2.6), [D], name: <d>, shape: circle, radius: .6em),
 edge(<a>,<b>, [6]), edge(<a>,<e>, [5]), edge(<a>,<d>, [4]),
 edge(<b>,<c>, [4]), edge(<c>,<d>, [6]), edge(<e>,<d>, [4]), edge(<c>,<e>, [5])))
]

#question(label: n => [2018 42])[
（12分）拟建设一个光通信骨干网连接 BJ、CS、XA、QD、JN、NJ、TL 和 WH 等8个城市，题42图中无向边上的权值表示两个城市间备选光缆的铺设费用。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em, content: (wrap: body => box(text(size: 0.8em, top-edge: "bounds", bottom-edge: "bounds", body))))
    let positions = ((0, 10), (6, 10), (12, 10), (0, 5), (12, 5), (0, 0), (6, 0), (12, 0))
    for (a, b, w, p) in ((0, 1, 2, (3, 10.65)), (1, 2, 3, (9, 10.65)),
      (0, 3, 2, (-0.8, 7.5)), (2, 4, 2, (12.8, 7.5)), (3, 5, 4, (-0.8, 2.5)),
      (4, 7, 3, (12.8, 2.5)), (5, 6, 3, (3, -0.7)), (6, 7, 2, (9, -0.7)),
      (3, 1, 3, (3.25, 6.7)), (1, 4, 4, (8.3, 6.9)),
      (3, 6, 3, (2.2, 2.6)), (6, 4, 2, (9.3, 1.9))) {
      line(positions.at(a), positions.at(b))
      content(p, str(w))
    }
    for (i, body) in ([XA], [BJ], [TL], [WH], [JN], [CS], [QD], [NJ]).enumerate() {
      circle(positions.at(i), radius: (1.05, 0.8), fill: white)
      content(positions.at(i), body)
    }
  }),
  caption: [题42图], numbering: none,
)

请回答下列问题：

#subquestions[
+ 仅从铺设费用角度出发，给出所有可能的最经济的光缆铺设方案（用带权图表示），并计算相应方案的总费用。
+ 题42图可采用图的哪一种存储结构？给出求解问题（1）所使用的算法名称。
+ 假设每个城市采用一个路由器按（1）中得到的最经济方案组网，主机 H1 直接连接在 TL 的路由器上，主机 H2 直接连接在 BJ 的路由器上。若 H1 向 H2 发送一个 TTL=5 的 IP 分组，则 H2 是否可以收到该 IP 分组？

]
]

#block(breakable: false)[#question(label: n => [2020 7])[
已知无向图 $G$ 如下所示，使用克鲁斯卡尔（Kruskal）算法求图 $G$ 的最小生成树，加入到最小生成树中的边依次是

#align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 大纲 PDF 第 41 页，边权与顶点使用小于正文的字面。
  set-style(stroke:0.055em,content:(wrap:body =>
    box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  for (a,b) in (((0,0),(5.2,0)),((0,0),(0,-3.8)),((0,0),(2.6,-1.9)),
    ((0,-3.8),(2.6,-1.9)),((0,-3.8),(5.2,-3.8)),((2.6,-1.9),(5.2,0)),
    ((2.6,-1.9),(5.2,-3.8)),((5.2,0),(5.2,-3.8)),((5.2,0),(7.8,-1.9)),
    ((5.2,-3.8),(7.8,-1.9))) {line(a,b)}
  for (x,y,label) in ((0,0,[a]),(0,-3.8,[c]),(2.6,-1.9,[e]),(5.2,0,[b]),(5.2,-3.8,[d]),(7.8,-1.9,[f])) {
    circle((x,y),radius:0.65,fill:white);content((x,y),label)
  }
  for (x,y,label) in ((2.6,0.7,[20]),(-0.75,-1.9,[12]),(1.8,-0.6,[9]),
    (1.1,-2.15,[10]),(2.6,-4.5,[18]),(3.65,-0.6,[11]),(4.2,-2.15,[14]),
    (5.95,-1.9,[6]),(6.55,-0.65,[5]),(6.55,-3.25,[7])) {content((x,y),label)}
}))

#choices([(b，f)，(b，d)，(a，e)，(c，e)，(b，e)], [(b，f)，(b，d)，(b，e)，(a，e)，(c，e)], [(a，e)，(b，e)，(c，e)，(b，d)，(b，f)], [(a，e)，(c，e)，(b，e)，(b，f)，(b，d)])
]]

== 最短路径

#question(label: n => [2009 41])[
（10分）带权图（权值非负，表示边连接的两顶点间的距离）的最短路径问题是找出从初始顶点到目标顶点之间的一条最短路径。假设从初始顶点到目标顶点之间存在路径，现有一种解决该问题的方法：

① 设最短路径初始时仅包含初始顶点，令当前顶点 $u$ 为初始顶点；
\
② 选择离 $u$ 最近且尚未在最短路径中的一个顶点 $v$，加入到最短路径中，修改当前顶点 $u = v$；
\
③ 重复步骤②，直到 $u$ 是目标顶点时为止。

请问上述方法能否求得最短路径？若该方法可行，请证明之；否则，请举例说明。

]

#block(breakable: false)[#question(label: n => [2012 7])[
对如下有向带权图，若采用迪杰斯特拉（Dijkstra）算法求从源点 a
到其他各顶点的最短路径，则得到的第一条最短路径的目标顶点是
b，第二条最短路径的目标顶点是
c，后续得到的其余各最短路径的目标顶点依次是

#align(center)[
  #cetz.canvas(length:1em,{
    import cetz.draw: *
    // 2013 大纲 PDF 第 46 页；边权固定在原图对应的一侧，避免自动避让改变含义。
    let p(x,y)=((x - 365) / 34,(837 - y) / 34)
    let ps=((365,747),(550,658),(550,837),(735,658),(735,837),(920,747)).map(q=>p(..q))
    set-style(stroke:0.055em,content:(wrap:body=>box(text(size:0.85em,top-edge:"bounds",bottom-edge:"bounds",body))))
    for (a,b,x,y,label) in ((0,1,448,681,[2]),(0,2,432,805,[5]),
      (1,2,532,747,[1]),(1,3,645,641,[3]),(2,3,620,744,[3]),
      (2,4,646,860,[4]),(3,4,718,747,[1]),(3,5,822,681,[4]),
      (2,5,794,756,[1]),(4,5,830,813,[1])) {
      let u=ps.at(a); let v=ps.at(b)
      let dx=v.at(0)-u.at(0); let dy=v.at(1)-u.at(1)
      let d=calc.sqrt(dx*dx+dy*dy)
      line((u.at(0)+0.64*dx/d,u.at(1)+0.64*dy/d),(v.at(0)-0.64*dx/d,v.at(1)-0.64*dy/d),mark:(end:">",fill:black,scale:0.65))
      content(p(x,y),label)
    }
    for (q,label) in ps.zip(([a],[b],[c],[d],[e],[f])) {
      circle(q,radius:0.64,fill:white)
      content(q,label)
    }
  })
]

#choices(
  [d,e,f],
  [e,d,f],
  [f,d,e],
  [f,e,d],
)
]]

#block(breakable: false)[#question(label: n => [2016 8])[
使用迪杰斯特拉（Dijkstra）算法求下图中从顶点1到其他各顶点的最短路径，依次得到的各最短路径的目标顶点是

#align(center, diagram(spacing: (3.5em,2.5em), node-stroke: 0.055em, edge-stroke: 0.055em, node-fill: white,
  node((0,0),[1],radius:0.7em), node((2,0),[2],radius:0.7em), node((4,0),[3],radius:0.7em),
  node((0,1.8),[4],radius:0.7em), node((2,1.8),[5],radius:0.7em), node((4,1.8),[6],radius:0.7em),
  edge((0,0),(2,0),"-|>",label:[5]), edge((2,0),(4,0),"-|>",label:[2]),
  edge((0,1.8),(0,0),"-|>",label:[2]), edge((0,0),(2,1.8),"-|>",label:[4],label-pos:0.35),
  edge((2,0),(0,1.8),"-|>",label:[9],label-pos:0.65), edge((2,1.8),(2,0),"-|>",label:[6]),
  edge((4,0),(2,1.8),"-|>",label:[6]), edge((2,1.8),(0,1.8),"-|>",label:[7]),
  edge((2,1.8),(4,1.8),"-|>",label:[5]), edge((4,1.8),(4,0),"-|>",label:[2]),
))
#choices([5,2,3,4,6], [5,2,3,6,4], [5,2,4,3,6], [5,2,6,3,4])
]]

#block(breakable: false)[#question(label: n => [2021 8])[
使用 Dijkstra 算法求下图中从顶点1到其余各顶点的最短路径，将当前找到的从顶点1到顶点2、3、4、5的最短路径长度保存在数组 dist 中，求出第二条最短路径后，dist 中的内容更新为

#align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 2022 大纲第 56 页：数字按字面居中，边权不与斜边相交。
  set-style(stroke:0.055em,content:(wrap:body =>
    box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  let arrow(a,b) = {
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let d = calc.sqrt(dx*dx+dy*dy)
    line((a.at(0)+dx/d*0.62,a.at(1)+dy/d*0.62),
      (b.at(0) - dx/d*0.62,b.at(1) - dy/d*0.62),
      mark:(end:">",fill:black,scale:0.7))
  }
  for (a,b) in (((4.2,0),(0,-2.5)),((4.2,0),(8.4,-2.5)),((4.2,0),(6.8,-6.7)),
    ((0,-2.5),(8.4,-2.5)),((0,-2.5),(1.5,-6.7)),((0,-2.5),(6.8,-6.7)),
    ((1.5,-6.7),(8.4,-2.5)),((1.5,-6.7),(6.8,-6.7)),((6.8,-6.7),(8.4,-2.5))) {arrow(a,b)}
  for (x,y,label) in ((4.2,0,[1]),(0,-2.5,[5]),(8.4,-2.5,[2]),(1.5,-6.7,[4]),(6.8,-6.7,[3])) {
    circle((x,y),radius:0.62,fill:white);content((x,y),label)
  }
  for (x,y,label) in ((1.9,-0.6,[6]),(6.5,-0.6,[26]),(5.25,-1.75,[3]),
    (3.25,-1.8,[15]),(0.05,-4.5,[8]),(2.05,-4,[6]),(3.65,-5.8,[1]),
    (4.15,-7.4,[6]),(8.2,-4.9,[22])) {content((x,y),label)}
}))

#choices([26，3，14，6], [25，3，14，6], [21，3，14，6], [15，3，14，6])
]]

#block(breakable: false)[#question(label: n => [2023 6])[
已知无向连通图 $G$ 中各边的权值均为1。下列算法中，一定能够求出图 $G$ 中从某顶点到其余各顶点最短路径的是
#statements(columns: 2, [Ⅰ．普里姆（Prim）算法], [Ⅱ．克鲁斯卡尔（Kruskal）算法], [Ⅲ．图的广度优先搜索算法])
#choices([仅Ⅰ], [仅Ⅲ], [Ⅰ、Ⅱ], [Ⅰ、Ⅱ、Ⅲ])
]]

== 拓扑排序

#block(breakable: false)[#question(label: n => [2010 8])[
对下图进行拓扑排序，可以得到不同拓扑序列的个数是

#align(center)[
  #diagram(
    node-stroke: 0.8pt,
    node-fill: white,
    edge-stroke: 0.8pt,
    mark-scale: 80%,
    spacing: (1em, 0.45em),
    node((0, 1), [a], radius: 0.82em),
    node((2, 0), [e], radius: 0.82em),
    node((4, 1), [d], radius: 0.82em),
    node((1, 2), [b], radius: 0.82em),
    node((3, 2), [c], radius: 0.82em),
    edge((0, 1), (2, 0), "-|>"),
    edge((2, 0), (4, 1), "-|>"),
    edge((0, 1), (1, 2), "-|>"),
    edge((0, 1), (3, 2), "-|>"),
    edge((1, 2), (3, 2), "-|>"),
    edge((3, 2), (4, 1), "-|>"),
  )
]

#choices(
  [4],
  [3],
  [2],
  [1],
)
]]

#block(breakable: false)[#question(label: n => [2012 6])[
若用邻接矩阵存储有向图，矩阵中主对角线以下的元素均为零，则关于该图拓扑序列的结论是

#choices(
  [存在，且唯一],
  [存在，且不唯一],
  [存在，可能不唯一],
  [无法确定是否存在],
)
]]

#block(breakable: false)[#question(label: n => [2014 7])[
对如下所示的有向图进行拓扑排序，得到的拓扑序列可能是

#align(center)[
  #exam-diagram(
    mark-scale: 94%,
    spacing: 1.85em,
    node((-0.82, 0), [1], radius: 0.76em),
    node((0.82, 0.03), [2], radius: 0.76em),
    node((-1.68, 1.47), [3], radius: 0.76em),
    node((0, 1.48), [4], radius: 0.76em),
    node((1.53, 1.49), [5], radius: 0.76em),
    node((0, 2.96), [6], radius: 0.76em),
    edge((-1.68, 1.47), (-0.82, 0), "-|>"),
    edge((-0.82, 0), (0.82, 0.03), "-|>"),
    edge((-0.82, 0), (0, 1.48), "-|>"),
    edge((0, 1.48), (0.82, 0.03), "-|>"),
    edge((0.82, 0.03), (1.53, 1.49), "-|>"),
    edge((-1.68, 1.47), (0, 2.96), "-|>"),
    edge((0, 1.48), (0, 2.96), "-|>"),
    edge((0, 2.96), (1.53, 1.49), "-|>"),
  )
]

#choices(
  [3,1,2,4,5,6],
  [3,1,2,4,6,5],
  [3,1,4,2,5,6],
  [3,1,4,2,6,5],
)
]]

#block(breakable: false)[#question(label: n => [2016 7])[
若将 $n$ 个顶点 $e$ 条弧的有向图采用邻接表存储，则拓扑排序算法的时间复杂度是
#choices([$O(n)$], [$O(n+e)$], [$O(n^2)$], [$O(n times e)$])
]]

#block(breakable: false)[#question(label: n => [2018 7])[
下列选项中，不是如下有向图的拓扑序列的是

#align(center, diagram(
  node-stroke: 0.055em, edge-stroke: 0.055em, node-inset: 0pt,
  node((0em, 0em), text(size: 0.85em)[1], radius: 0.76em), node((6.94em, 0em), text(size: 0.85em)[3], radius: 0.76em),
  node((3.39em, -2.35em), text(size: 0.85em)[2], radius: 0.76em), node((10.32em, -2.35em), text(size: 0.85em)[4], radius: 0.76em),
  node((0em, -4.61em), text(size: 0.85em)[5], radius: 0.76em), node((6.94em, -4.61em), text(size: 0.85em)[6], radius: 0.76em),
  edge((0em, 0em), (6.94em, 0em), "-|>"), edge((0em, 0em), (3.39em, -2.35em), "-|>"),
  edge((0em, -4.61em), (3.39em, -2.35em), "-|>"), edge((3.39em, -2.35em), (6.94em, 0em), "-|>"),
  edge((3.39em, -2.35em), (6.94em, -4.61em), "-|>"), edge((6.94em, 0em), (10.32em, -2.35em), "-|>"),
  edge((0em, -4.61em), (10.32em, -2.35em), "-|>"), edge((6.94em, -4.61em), (10.32em, -2.35em), "-|>"),
))

#choices([1, 5, 2, 3, 6, 4], [5, 1, 2, 6, 3, 4], [5, 1, 2, 3, 6, 4], [5, 2, 1, 6, 3, 4])
]]

#block(breakable: false)[#question(label: n => [2019 6])[
用有向无环图描述表达式 $(x+y) ast ((x+y) \/ x)$，需要的顶点个数至少是

#choices([5], [6], [8], [9])
]]

#block(breakable: false)[#question(label: n => [2021 7])[
给定如下有向图，该图的拓扑有序序列的个数是

#align(center,diagram(node-stroke:0.055em,edge-stroke:0.055em,node-inset:0pt,
  node((3.2em,0em),text(size:0.85em)[A],radius:0.72em),
  node((0em,-1.7em),text(size:0.85em)[B],radius:0.72em),node((6.4em,-1.7em),text(size:0.85em)[F],radius:0.72em),
  node((0em,-4.5em),text(size:0.85em)[C],radius:0.72em),node((6.4em,-4.5em),text(size:0.85em)[E],radius:0.72em),
  node((3.2em,-6.2em),text(size:0.85em)[D],radius:0.72em),
  edge((3.2em,0em),(0em,-1.7em),"-|>"),edge((3.2em,0em),(6.4em,-1.7em),"-|>"),
  edge((0em,-1.7em),(6.4em,-1.7em),"-|>"),edge((0em,-1.7em),(0em,-4.5em),"-|>"),
  edge((0em,-1.7em),(3.2em,-6.2em),"-|>"),edge((0em,-4.5em),(3.2em,-6.2em),"-|>"),
  edge((3.2em,-6.2em),(6.4em,-1.7em),"-|>"),edge((3.2em,-6.2em),(6.4em,-4.5em),"-|>"),
  edge((6.4em,-4.5em),(6.4em,-1.7em),"-|>"),
))

#choices([1], [2], [3], [4])
]]

#question(label: n => [2024 41])[
（本题13分）2023年10月26日，神舟十七号载人飞船发射取得圆满成功，再次彰显了中国航天事业的辉煌成就。载人航天工程是包含众多子工程的复杂系统工程，为了保证工程的有序开展，需要明确各子工程的前导子工程，以协调各子工程的实施。该问题可以简化、抽象为有向图的拓扑序列问题。已知有向图 $G$ 采用邻接矩阵存储，类型定义如下。

#block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```c
typedef struct                       // 图的类型定义
{
    int numVertices, numEdges;        // 图的顶点数和有向边数
    char VerticesList[MAXV];          // 顶点表，MAXV为已定义常量
    int Edge[MAXV][MAXV];             // 邻接矩阵
} MGraph;
```
]

请设计算法：int uniquely(MGraph G)，判定 $G$ 是否存在唯一的拓扑序列，若是，则返回1，否则返回0。要求如下。

#subquestions[
+ 给出算法的基本设计思想。（4分）
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。（9分）
]
]

== 关键路径

#question(label: n => [2011 41])[
（8分）已知有6个顶点（顶点编号为0～5）的有向带权图 G，其邻接矩阵
A为上三角矩阵，按行为主序（行优先）保存在如下的一维数组中。

#figure(
  align(center)[#table(
    columns: (6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%),
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    [4], [6], [∞], [∞], [∞], [5], [∞], [∞], [∞], [4], [3], [∞], [∞], [3], [3],
  )]
  , kind: table
  )

要求：

#subquestions[
+ 写出图 G的邻接矩阵 A。
  \
+ 画出有向带权图 G。
  \
+ 求图 G的关键路径，并计算该关键路径的长度。
  
    
]
]

#block(breakable: false)[#question(label: n => [2013 9])[
下列 AOE
网表示一项包含8个活动的工程。通过同时加快若干活动的进度可以缩短整个工程的工期。下列选项中，加快其进度就可以缩短工程工期的是

#align(center)[
  #diagram(
    node-stroke: 0.065em,
    node-fill: white,
    edge-stroke: 0.065em,
    spacing: (2.1em, 1.6em),
    node((0, 1.35), [1], radius: 0.82em),
    node((2, 0), [2], radius: 0.82em),
    node((2, 2.60), [3], radius: 0.82em),
    node((4.10, 0), [4], radius: 0.82em),
    node((4.10, 2.60), [5], radius: 0.82em),
    node((6.20, 1.35), [6], radius: 0.82em),
    edge((0, 1.35), (2, 0), "->", label: $a = 3$, label-side: left),
    edge((0, 1.35), (2, 2.60), "->", label: $b = 8$, label-side: right),
    edge((2, 2.60), (2, 0), "->", label: $d = 4$, label-side: left),
    edge((2, 0), (4.10, 0), "->", label: $c = 9$, label-side: left),
    edge((2, 0), (4.10, 2.60), "->", label: $e = 6$, label-side: left),
    edge((2, 2.60), (4.10, 2.60), "->", label: $f = 10$, label-side: right),
    edge((4.10, 0), (6.20, 1.35), "->", label: $g = 6$, label-side: left),
    edge((4.10, 2.60), (6.20, 1.35), "->", label: $h = 9$, label-side: right),
  )
]

#choices(
  [c和e],
  [d和c],
  [f和d],
  [f和h],
)
]]

#block(breakable: false)[#question(label: n => [2019 5])[
下图所示的 AOE 网表示一项包含8个活动的工程。活动 $d$ 的最早开始时间和最迟开始时间分别是

#align(center, diagram(
  node-stroke: 0.055em, edge-stroke: 0.055em, node-inset: 0pt, label-size: 0.8em,
  node((0em, -1.94em), text(size: 0.85em)[1], radius: 0.72em),
  node((5em, 0em), text(size: 0.85em)[2], radius: 0.72em), node((5em, -3.87em), text(size: 0.85em)[3], radius: 0.72em),
  node((9.8em, 0em), text(size: 0.85em)[4], radius: 0.72em), node((9.8em, -3.87em), text(size: 0.85em)[5], radius: 0.72em),
  node((14.74em, -1.94em), text(size: 0.85em)[6], radius: 0.72em),
  edge((0em, -1.94em), (5em, 0em), "-|>", [$a=3$], label-side: left),
  edge((0em, -1.94em), (5em, -3.87em), "-|>", [$c=8$], label-side: right),
  edge((5em, -3.87em), (5em, 0em), "-|>", [$b=4$], label-side: left),
  edge((5em, 0em), (9.8em, 0em), "-|>", [$d=7$], label-side: left),
  edge((5em, 0em), (9.8em, -3.87em), "-|>", [$e=6$], label-side: left),
  edge((5em, -3.87em), (9.8em, -3.87em), "-|>", [$f=10$], label-side: right),
  edge((9.8em, 0em), (14.74em, -1.94em), "-|>", [$g=6$], label-side: left),
  edge((9.8em, -3.87em), (14.74em, -1.94em), "-|>", [$h=9$], label-side: right),
))

#choices([3和7], [12和12], [12和14], [15和15])
]]

#block(breakable: false)[#question(label: n => [2020 8])[
若使用 AOE 网估算工程进度，则下列叙述中正确的是

#choices([关键路径是从源点到汇点边数最多的一条路径], [关键路径是从源点到汇点路径长度最长的路径], [增加任一关键活动的时间不会延长工程的工期], [缩短任一关键活动的时间将会缩短工程的工期])
]]

#block(breakable: false)[#question(label: n => [2022 7])[
下图是一个有10个活动的 AOE 网，时间余量最大的活动是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: 0.045em, mark: (end: "stealth", scale: 0.55))
  let ps = ((0, 0), (4, 2), (4, -2), (8, 2), (8, -2), (12, 0))
  for (a,b,label,pos) in (
    (0,1,[a=2],(1.4,1.25)), (0,2,[b=5],(1.4,-1.3)),
    (1,2,[c=3],(3.3,0)), (1,3,[d=3],(6,2.4)),
    (2,3,[e=3],(5.7,0.6)), (2,4,[f=3],(6,-2.5)),
    (2,5,[g=1],(9.3,-0.2)), (3,4,[h=1],(7.3,0)),
    (3,5,[i=4],(10.5,1.5)), (4,5,[j=1],(10.5,-1.5)),
  ) {
    let start = ps.at(a)
    let end = ps.at(b)
    let dx = end.at(0) - start.at(0)
    let dy = end.at(1) - start.at(1)
    let distance = calc.sqrt(dx*dx + dy*dy)
    let ux = dx / distance
    let uy = dy / distance
    line((start.at(0)+ux*0.7,start.at(1)+uy*0.7),
      (end.at(0)-ux*0.7,end.at(1)-uy*0.7), mark: (end: "stealth"))
    content(pos, text(size: 0.85em, label))
  }
  for (i,p) in ps.enumerate() {
    circle(p, radius: 0.7, fill: white, mark: none)
    content(p, text(size: 0.85em, top-edge: "ascender", bottom-edge: "descender", str(i+1)))
  }
}))

#choices([c], [g], [h], [j])
]]

#question(label: n => [2025 42])[
（本题10分）某工程包含12个活动，使用题42图所示的 AOE 网描述，图中各边上标注了活动及其持续时间。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 2026 大纲 PDF 第 84 页，按原图结点、边权位置描点；33 px 为正文 1em。
  let p(x,y) = ((x - 360) / 33,(760 - y) / 33)
  set-style(stroke: 0.045em,content:(wrap:body =>
    box(text(size:0.85em,top-edge:"bounds",bottom-edge:"bounds",body))))
  let ps=((512,599),(831,600),(361,679),(675,681),(990,683),(510,759),(830,761)).map(q => p(..q))
  for (a,b,label,pos) in (
    (0,2,[a=2],(428,621)),(0,1,[b=5],(679,584)),(2,5,[c=1],(411,735)),
    (0,3,[d=3],(628,632)),(2,3,[e=3],(509,665)),(3,1,[f=4],(797,647)),
    (3,5,[g=1],(557,714)),(5,6,[h=1],(646,780)),(3,4,[j=1],(820,701)),
    (1,4,[k=2],(920,622)),(3,6,[m=4],(710,730)),(6,4,[n=3],(915,746)),
  ) {
    let u=ps.at(a); let v=ps.at(b)
    let dx=v.at(0)-u.at(0); let dy=v.at(1)-u.at(1)
    let d=calc.sqrt(dx*dx+dy*dy)
    let r=24 / 33
    line((u.at(0)+r*dx/d,u.at(1)+r*dy/d),(v.at(0)-r*dx/d,v.at(1)-r*dy/d),mark: (end: ">",fill:black,scale:0.55))
    content(p(..pos),label)
  }
  for (i,q) in ps.enumerate() { circle(q,radius:24 / 33,fill:white); content(q,[#(i+1)]) }
})),caption: [题42图],kind: image)

请回答下列问题（活动均用活动名表示）。

#subquestions[
+ 完成该工程的最短时间是多少？哪些活动是关键活动？（3分）
+ 若以最短时间完成工程，则与活动 e 同时进行的活动可能有哪些？（3分）
+ 时间余量最大的活动是哪个？其时间余量是多少？（2分）
+ 假设工程从时刻0启动，因某种原因，活动 b 在时刻6开始。为了保证工程不延期，在其他活动持续时间均不变的情况下，b 的持续时间最多是多少？若不改变 b 的持续时间，则压缩哪个活动的持续时间可以保证工程不延期？（2分）

]
]
