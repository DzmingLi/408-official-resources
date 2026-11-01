// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：图的基本概念

=== 2009 7：A

=== 2010 7：C

=== 2017 7：B

=== 2022 6：D

=== 2021 41

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  
  对于采用邻接矩阵存储的无向图，邻接矩阵每一行（列）中非零元素的个数为本行（列）对应顶点的度。可以依次计算连通图 $G$ 中各顶点的度，并记录度为奇数的顶点个数，若个数为0或2，则返回1，否则返回0。
  
+ 算法实现
  
  ```c
  int IsExistEL(MGraph G)
  // 采用邻接矩阵存储，判断图是否存在EL路径
  {
      int degree, i, j, count = 0;
      for (i = 0; i < G.numVertices; i++)
      {
          degree = 0;
          for (j = 0; j < G.numVertices; j++)
              // 依次计算各个顶点的度
              degree += G.Edge[i][j];
          if (degree % 2 != 0)
              count++; // 对度为奇数的顶点计数
      }
      if (count == 0 || count == 2)
          return 1;    // 存在EL路径，返回1
      else
          return 0;    // 不存在EL路径，返回0
  }
  ```
  
+ 算法的时间复杂度和空间复杂度
  本参考答案给出的算法的时间复杂度是 $O(n^2)$，空间复杂度是 $O(1)$。

]
