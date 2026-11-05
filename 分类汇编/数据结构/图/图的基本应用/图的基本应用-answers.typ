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

举例说明如下：

#align(center, image("../../../../历年真题+参考解答/2009/official-images/page-117-img-12.jpg", width: 16em))

图a

#align(center, image("../../../../历年真题+参考解答/2009/official-images/page-117-img-14.jpg", width: 16em))

图b

图a中，设初始顶点为1，目标顶点为4，欲求从顶点1到顶点4之间的最短路径。显然，这两点之间的最短路径长度为2。但利用给定方法求得的路径长度为3，因此这条路径并不是这两点之间的最短路径。

图b中，设初始顶点为1，目标顶点为3，欲求从顶点1到顶点3之间的最短路径。利用给定的方法，无法求出顶点1到顶点3的路径。
]

=== 2012 7：C

=== 2016 8：B

=== 2021 8：C

=== 2023 6

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 旧版题型示例

#block(breakable: false)[
原考纲未附本题参考答案。
]

== 拓扑排序

=== 2010 8：B

=== 2012 6：C

=== 2014 7：D

=== 2016 7：B

=== 2018 7：D

=== 2019 6：A

=== 2021 7：A

=== 2024 41

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  建立图 $G$ 各顶点的入度表 degree[]。

  选择入度为0的顶点 $v$，将 $v$ 的所有邻接点的入度减1，重复执行这个过程。若每次选出的入度为0的顶点有且仅有一个，且共进行了 G.numVertices 次，则意味着存在唯一的拓扑序列，返回1，否则不存在拓扑序列，或存在多个拓扑序列，返回0。

+ 用 C 语言描述的算法

  #block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em,breakable: true)[
  ```c
  int uniquely(MGraph G) // 判定有向图是否存在唯一的拓扑序列
  {
      int *degree, i, j, count=0, in0=-1, prev_in0;
      degree=(int *)malloc(G.numVertices * sizeof(int));
      for(j=0; j<G.numVertices; j++) // 计算各顶点的入度
      {
          degree[j]=0;
          for(i=0; i<G.numVertices; i++)
              degree[j]+=G.Edge[i][j];
          if(degree[j]==0)
          {
              if(in0==-1) in0=j; // 入度为0的顶点
              else in0=-2;      // 有多个入度为0的顶点
          }
      }
      while(in0>=0)
      {
          count++;
          prev_in0=in0;
          in0=-1;
          for(j=0; j<G.numVertices; j++)
              if(G.Edge[prev_in0][j]>0)
              {
                  if(--degree[j]==0) // 邻接点入度值减1
                  {
                      if(in0==-1) in0=j; // 入度为0的顶点
                      else in0=-2;      // 有多个入度为0的顶点
                  }
              }
      }
      free(degree);
      if(count==G.numVertices) return 1;
      else return 0;
  }
  ```
  ]

]

== 关键路径

=== 2011 41

#block(breakable: false)[
#subquestions(after-heading: true, allow-oversize: true)[
+ 图 G的邻接矩阵 A如下：（2分）

  $ mat(delim: "[", 0, 4, 6, oo, oo, oo; oo, 0, 5, oo, oo, oo; oo, oo, 0, 4, 3, oo; oo, oo, oo, 0, oo, 3; oo, oo, oo, oo, 0, 3; oo, oo, oo, oo, oo, 0) $

+ 图G如下：（2分）

  #align(center, image("../../../../历年真题+参考解答/2011/official-images/page-077-img-6.jpg", width: 27em))

  【评分说明】

  ①若考生画出的图 G与上图同构，给2分。

  ②若考生画出的图 G部分正确，可酌情给分。

+ 下图中双线箭头所标识的4个活动组成图
  G的关键路径。（3分）

  #align(center, image("../../../../历年真题+参考解答/2011/official-images/page-077-img-11.jpg", width: 27em))

  图 G的关键路径的长度为16。（1分）

  【评分说明】若考生给出的答案（1）或（2）不完全正确，但所画的图是含6个顶点、7条边的有向无环图，且所求得的关键路径及路径长度与考生所画的图吻合，则按（3）的标准给分。部分正确，可酌情给分。

]
]

=== 2013 9：C

=== 2019 5：C

=== 2020 8：B

=== 2022 7：B

=== 2025 42

#subquestions(allow-oversize: true)[
+ 完成该工程的最短时间是12。关键活动是 a，e，m，n。
+ 与 e 同时进行的活动可能有 b，c，d。
+ 时间余量最大的活动是 j。时间余量是6。
+ b 的持续时间最多是4。压缩 k 的持续时间。

]
