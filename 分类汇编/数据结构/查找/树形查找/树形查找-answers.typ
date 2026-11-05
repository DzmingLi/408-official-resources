// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：树形查找

== 二叉搜索树

=== 2011 7：A

=== 2013 6：C

=== 2018 6：C

=== 2020 5：B

=== 2022 41

【答案一】

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  
  对于采用顺序存储方式保存的二叉树，根结点保存在 SqBiTNode[0] 中；当某结点保存在 SqBiTNode[i] 中时，若有左孩子，则其值保存在 SqBiTNode[2i+1] 中；若有右孩子，则其值保存在 SqBiTNode[2i+2] 中；若有双亲结点，则其值保存在 SqBiTNode[(i−1)/2] 中。
  
  二叉搜索树需要满足的条件是：任一结点值大于其左子树中的全部结点值，小于其右子树中的全部结点值。中序遍历二叉搜索树得到一个升序序列。
  
  使用整型变量 val 记录中序遍历过程中已遍历结点的最大值，初值为一个负整数。若当前遍历的结点值小于等于 val，则算法返回 false，否则，将 val 的值更新为当前结点的值。
  
+ 算法实现
  
  ```c
  #define false 0
  #define true 1
  typedef int bool;
  bool judgeInOrderBST(SqBiTree bt, int k, int *val)
  // 初始调用时k的值是0
  {
      if (k < bt.ElemNum && bt.SqBiTNode[k] != -1)
      {
          if (!judgeInOrderBST(bt, 2*k+1, val)) return false;
          if (bt.SqBiTNode[k] <= *val) return false;
          *val = bt.SqBiTNode[k];
          if (!judgeInOrderBST(bt, 2*k+2, val)) return false;
      }
      return true;
  }
  ```
  
]

#block(sticky: true)[【答案二】]

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  
  对于采用顺序存储方式保存的二叉树，根结点保存在 SqBiTNode[0] 中；当某结点保存在 SqBiTNode[i] 中时，若有左孩子，则其值保存在 SqBiTNode[2i+1] 中；若有右孩子，则其值保存在 SqBiTNode[2i+2] 中；若有双亲结点，则其值保存在 SqBiTNode[(i−1)/2] 中。
  
  二叉搜索树需要满足的条件是：任一结点值大于其左子树中的全部结点值，小于其右子树中的全部结点值。设置两个数组 pmax 和 pmin。根据二叉搜索树的定义，SqBiTNode[i] 中的值应该大于以 SqBiTNode[2i+1] 为根的子树中的最大值（保存在 pmax[2i+1] 中），小于以 SqBiTNode[2i+2] 为根的子树中的最小值（保存在 pmin[2i+1] 中）。初始时，用数组 SqBiTNode 中前 ElemNum 个元素的值对数组 pmax 和 pmin 初始化。
  // pmin[2i+1]按官方印刷原文保留。
  
  在数组 SqBiTNode 中从后向前扫描，扫描过程中逐一验证结点与子树之间是否满足上述的大小关系。
  
+ 算法实现
  
  ```c
  #define false 0
  #define true 1
  typedef int bool;
  bool judgeBST(SqBiTree bt)
  {
      int k, m, *pmin, *pmax;
      pmin = (int *)malloc(sizeof(int) * (bt.ElemNum));
      pmax = (int *)malloc(sizeof(int) * (bt.ElemNum));
      for (k=0; k < bt.ElemNum; k++) // 辅助数组初始化
          pmin[k] = pmax[k] = bt.SqBiTNode[k];
      for (k=bt.ElemNum-1; k > 0; k--)
      // 从最后一个叶结点向根遍历
      {
          if (bt.SqBiTNode[k] != -1)
          {
              m = (k-1)/2; // 双亲
              if (k%2 == 1 && bt.SqBiTNode[m] > pmax[k])
              // 其为左孩子
                  pmin[m] = pmin[k];
              else if (k%2 == 0 && bt.SqBiTNode[m] < pmin[k])
                  // 其为右孩子
                  pmax[m] = pmax[k];
              else return false;
          }
      }
      return true;
  }
  ```

]

=== 2024 7：D

=== 2026 41

本仓库尚未收录本题参考答案。

== 平衡二叉树

=== 2009 4：B

=== 2010 4：C

=== 2012 4：B

=== 2013 3：D

=== 2015 4：D

=== 2019 4：A

=== 2021 6：D

=== 2026 8

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]
