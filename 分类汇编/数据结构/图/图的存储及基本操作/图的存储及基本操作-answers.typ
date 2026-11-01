// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：图的存储及基本操作

== 邻接矩阵

=== 2011 8：C

=== 2013 7：C

=== 2015 42

#block(breakable: false)[
#subquestions(allow-oversize: true)[
+ 图 $G$ 的邻接矩阵 $A$ 如下：
  
  $ A = mat(
    0, 1, 1, 0, 1;
    1, 0, 0, 1, 1;
    1, 0, 0, 1, 0;
    0, 1, 1, 0, 1;
    1, 1, 0, 1, 0
  ) $
  
+ $A^2$ 如下：
  
  $ A^2 = mat(
    3, 1, 0, 3, 1;
    1, 3, 2, 1, 2;
    0, 2, 2, 0, 2;
    3, 1, 0, 3, 1;
    1, 2, 2, 1, 3
  ) $
  
  0行3列的元素值3表示从顶点0到顶点3之间长度为2的路径共有3条。
  
+ $B^m$（$2 <= m <= n$）中位于 $i$ 行 $j$ 列（$0 <= i, j <= n - 1$）的非零元素的含义是：图中从顶点 $i$ 到顶点 $j$ 长度为 $m$ 的路径条数。
  
  【评分说明】
  
  ① 若考生给出的邻接矩阵 $A$ 中，结点与行、列的对应次序与本参考答案不完全一致，只要正确，同样给分。问题（2）中，考生所给的答案中顶点编号要与其所给的邻接矩阵相对应。
  
  ② 若考生给出的矩阵 $A$ 及 $A^2$ 部分正确，酌情给分。
  
  ③ 若考生分别说明矩阵 $B^2, B^3, dots, B^n$ 中非零元素的含义，同样给分。
  
  ④ 若考生给出的 $B^m$（$2 <= m <= n$）中非零元素的含义部分正确，酌情给分。

]
]
