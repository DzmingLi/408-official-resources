// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：路由算法

== 距离-向量路由算法

=== 2021 37：D

== 链路状态路由算法

=== 2014 42

#subquestions(allow-oversize: true)[
+ 本题中的网络可抽象为图结构。
+ 链式存储结构的数据类型定义如下：

  ```c
  typedef struct {
      unsigned int ID;
      unsigned int IP;
  } LinkNode; // Link的结构
  typedef struct {
      unsigned int Prefix;
      unsigned int Mask;
  } NetNode; // Net的结构
  typedef struct Node {
      int Flag; // Flag=1：Link；Flag=2：Net
      union {
          LinkNode Lnode;
          NetNode Nnode;
      } LinkORNet;
      unsigned int Metric;
      struct Node *Next;
  } ArcNode; // 弧结点
  typedef struct HNode {
      unsigned int RouterID;
      ArcNode *LN_link;
      struct HNode *Next;
  } HNODE; // 表头结点
  ```

  弧结点的两种基本形态

  #align(center, grid(columns: (auto, auto), column-gutter: 2em,
    table(columns: 2, align: center + horizon,
      [Flag=1], [Next], table.cell(colspan: 2)[ID],
      table.cell(colspan: 2)[IP], table.cell(colspan: 2)[Metric]),
    table(columns: 2, align: center + horizon,
      [Flag=2], [Next], table.cell(colspan: 2)[Prefix],
      table.cell(colspan: 2)[Mask], table.cell(colspan: 2)[Metric]),
  ))

  表头结点结构示意

  #align(center, table(columns: 1, align: center + horizon,
    [RouterID], [LN_link], [Next],
  ))

  对应题42表的链式存储结构示意图如下。

  #align(center, image("../../../../历年真题+参考解答/2014/official-images/page-020-img-6.jpg", width: 27em))
+ 计算结果如下表所示。

  #align(center, table(columns: 4, align: center + horizon,
    [], [目的网络], [路径], [代价（费用）],
    [步骤1], [#text("192. 1. 1. 0/24")], [直接到达], [1],
    [步骤2], [#text("192. 1. 5. 0/24")], [R1→R3→192. 1. 5. 0/24], [3],
    [步骤3], [#text("192. 1. 6. 0/24")], [R1→R2→192. 1. 6. 0/24], [4],
    [步骤4], [#text("192. 1. 7. 0/24")], [R1→R2→R4→192. 1. 7. 0/24], [8],
  ))
]
