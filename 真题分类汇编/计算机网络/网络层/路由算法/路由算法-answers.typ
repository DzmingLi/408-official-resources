// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：路由算法

== 距离-向量路由算法

=== 2021 37：D

== 链路状态路由算法

=== 2014 42

#subquestions(after-heading: true, allow-oversize: true)[
+ 本题中的网络可抽象为图结构。（1分）

]
*【评分说明】*
只要考生的答案中给出与图的含义相似的描述，例如“网状结构”、“非线性结构”等，同样给分。

#subquestions(start: 2, allow-oversize: true)[
+ 链式存储结构的数据类型定义如下：（3分）

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

  对应题42表的链式存储结构示意图如下。（2分）

  #align(center, image("../../../../历年真题+参考解答/2014/official-images/page-020-img-6.jpg", width: 27em))

]
*【评分说明】*
①若考生给出的答案是将链表中的表头结点保存在一个一维数组中（即采用邻接表形式），同样给分。

②若考生给出的答案中，弧结点没有使用union定义，而是采用两种不同的结构分别表示
Link和Net，同时在表头结点中定义了两个指针，分别指向由这两种类型的结点构成的两个链表，同样给分。

③考生所给答案的弧结点中，可以在单独定义的域中保存各直连网络IP地址的前缀长度，也可以与网络地址保存在同一个域中。

④数据类型定义中，只要采用了可行的链式存储结构，并保存了题目中所给的LSI信息，例如将网络抽象为一类结点，写出含8个表头结点的链式存储结构，均可参照
① $tilde.op$ ③的标准给分。

⑤考生给出的答案中，图示部分应与其数据类型定义部分一致，图示只要能够体现链式存储结构及题42图中的网络连接关系（可以不给出结点内的细节信息），即可给分。

⑥若解答不完全正确，酌情给分。

#subquestions(start: 3, allow-oversize: true)[
+ 计算结果如下表所示。（4分）

  #figure(
    align(center)[#table(
      columns: 4,
      align: (auto,auto,auto,auto,),
      [], [目的网络], [路径], [代价(费用)],
      [步骤1], [192.1.1.0/24], [直接到达], [1],
      [步骤2], [192.1.5.0/24], [R1→R3→192.1.5.0/24], [3],
      [步骤3], [192.1.6.0/24], [R1→R2→192.1.6.0/24], [4],
      [步骤4], [192.1.7.0/24], [R1→R2→R4→192.1.7.0/24], [8],
    )]
    , kind: table
    )

]
*【评分说明】*
①若考生给出的各条最短路径的结果部分正确，可酌情给分。

②若考生给出的从R1到达子网192.1.x.x的最短路径及代价正确，但不完全符合代价不减的次序，可酌情给分。
