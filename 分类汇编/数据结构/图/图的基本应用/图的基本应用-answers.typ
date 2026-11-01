// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：图的基本应用

== 最小（代价）生成树

=== 2012 8：A

=== 2015 6：C

=== 2017 42

#subquestions(allow-oversize: true)[
+ 依次选取的边为(A, D)、(D, E)、(C, E)、(B, C)。（4分）
+ 图 $G$ 的最小生成树唯一。（2分）
+ 当带权连通图中任意一个环内的边的权值均不相同时，其最小生成树唯一。（2分）
]
【评分说明】第一问每条边正确且次序正确给1分；边正确而次序不完全正确时酌情给分。第三问给出其他充分条件（例如所有边权值均不同）也给分；仅限制顶点数小于3、图无环等的答案最多给1分。

=== 2018 42

#subquestions(allow-oversize: true)[
+ 最经济的光缆铺设方案可以抽象为求最小生成树的问题。根据题图可以求得两种最经济的光缆建设方案，如下所示。
  
  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em)
    for (scheme, dx) in ((1, 0), (2, 18)) {
      let positions = ((dx, 8), (dx + 5, 8), (dx + 10, 8), (dx, 4), (dx + 10, 4), (dx, 0), (dx + 5, 0), (dx + 10, 0))
      let common = ((0, 1, 2, (dx + 2.5, 8.6)), (0, 3, 2, (dx - 0.7, 6)),
        (2, 4, 2, (dx + 10.7, 6)), (4, 6, 2, (dx + 7.3, 2.35)),
        (5, 6, 3, (dx + 2.5, -0.65)), (6, 7, 2, (dx + 7.5, -0.65)))
      let extra = if scheme == 1 { ((3, 6, 3, (dx + 2.7, 2.35)),) } else { ((1, 2, 3, (dx + 7.5, 8.6)),) }
      for (a, b, w, p) in common + extra {
        line(positions.at(a), positions.at(b))
        content(p, text(size:0.8em,str(w)))
      }
      for (i, body) in ([XA], [BJ], [TL], [WH], [JN], [CS], [QD], [NJ]).enumerate() {
        circle(positions.at(i), radius: (1.3, 0.6), fill: white)
        content(positions.at(i), text(size:0.8em,body))
      }
      content((dx + 5, -2), [方案#scheme])
    }
  }))
  
  方案的总费用为16。
  
+ 可采用邻接矩阵保存题42图。可使用 Prim 算法求解。
+ 使用方案1：H2 不能收到该 IP 分组；使用方案2：H2 可以收到该 IP 分组。

]

=== 2020 7：A

== 最短路径

=== 2009 41

#block(breakable: false)[
该方法不一定能（或不能）求得最短路径。

举例说明（略）。
]

=== 2012 7：C

=== 2016 8：B

=== 2021 8：C

=== 旧版题型示例

#block(breakable: false)[
自制解析（非官方）：原考纲未提供示例答案，以下答案与解析由本仓库自行编写。

最短路径

所有边权为正，可用 Dijkstra 算法。集合 $S$ 表示已确定最短距离的顶点；其余距离按经新加入顶点的路径进行松弛。

#table(columns: (1.3fr, 1fr, 1fr, 1fr, 1fr), align: center + horizon,
  [已确定的顶点], [$d(2)$], [$d(3)$], [$d(4)$], [$d(5)$],
  [1], [4], [2], [$infinity$], [8],
  [1，3], [4], [2], [3], [8],
  [1，3，4], [4], [2], [3], [6],
  [1，3，4，2], [4], [2], [3], [6],
  [1，3，4，2，5], [4], [2], [3], [6])

先确定顶点3，令 $d(4)=2+1=3$；再确定顶点4，令 $d(5)=3+3=6$，经4到2的距离7大于已有的4，故不更新。随后确定2和5，距离不再改变。

#table(columns: (1fr, 2fr, 1fr), align: center + horizon,
  [终点], [最短路径], [路径长度],
  [2], [1→2], [4],
  [3], [1→3], [2],
  [4], [1→3→4], [3],
  [5], [1→3→4→5], [6])
]

== 拓扑排序

=== 2010 8：B

=== 2012 6：C

=== 2014 7：D

=== 2016 7：B

=== 2018 7：D

=== 2021 7：A

=== 2019 6：A

== 关键路径

=== 2011 41

#block(breakable: false)[
#subquestions(allow-oversize: true)[
+ 图 $G$ 的邻接矩阵 $A$ 如下：

  $ A=mat(delim: "[", 0,4,6,infinity,infinity,infinity; infinity,0,5,infinity,infinity,infinity; infinity,infinity,0,4,3,infinity; infinity,infinity,infinity,0,infinity,3; infinity,infinity,infinity,infinity,0,3; infinity,infinity,infinity,infinity,infinity,0) $
+ 图 $G$ 如下：

  #align(center, image("../../../../历年真题+参考解答/2011/official-images/page-077-img-6.jpg", width: 27em))
+ 下图中双线箭头所标识的4个活动组成图 $G$ 的关键路径。

  #align(center, image("../../../../历年真题+参考解答/2011/official-images/page-077-img-11.jpg", width: 27em))

  图 $G$ 的关键路径的长度为16。
]
]

=== 2013 9：C

=== 2019 5：C

=== 2020 8：B

=== 2022 7：B
