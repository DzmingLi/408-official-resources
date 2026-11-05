// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：二叉树

== 二叉树的定义及其主要特性

=== 2009 5：C

=== 2011 4：C

=== 2018 4：A

== 二叉树的顺序存储结构和链式存储结构

=== 2020 3：A

=== 2025 3：D

== 二叉树的遍历

=== 2009 3：D

=== 2011 5：C

=== 2012 3：A

=== 2014 41

【答案一】

1）算法的设计思想：（4分）

本问题可采用递归算法实现。根据定义：

二叉树的 WPL 值=树中全部叶结点的带权路径长度之和

\=根结点左子树中全部叶结点的带权路径长度之和+

根结点右子树中全部叶结点的带权路径长度之和

叶结点的带权路径长度=该结点的 weight 域的值 $times$该结点的深度

设根结点的深度为0，若某结点的深度为 d时，则其孩子结点的深度为 d+1

#subquestions(start: 2, allow-oversize: true)[
+ 算法中使用的二叉树结点的数据类型定义如下：（2分）

  ```c
  typedef struct node {
      int weight;
      struct node *left, *right;
  } BTree;
  ```

+ 算法实现：（7分）

  ```c
  int WPL(BTree *root) { // 根据WPL的定义采用递归算法实现
      return WPL1(root, 0);
  }
  int WPL1(BTree *root, int d) { // d为结点深度
      if (root->left == NULL && root->right == NULL)
          return root->weight * d;
      else
          return WPL1(root->left, d+1) + WPL1(root->right, d+1);
  }
  ```

]
*【答案二】*
#subquestions(after-heading: true, allow-oversize: true)[
+ 算法的设计思想：（4分）

  若借用非叶结点的 weight 域保存其孩子结点中 weight 域值的和，则树的 WPL
  等于树中所有非叶结点 weight 域值之和。

  采用后序遍历策略，在遍历二叉树
  $T$时递归计算每个非叶结点的weight域的值，则树
  $T$的WPL等于根结点左子树的WPL加上右子树的WPL，再加上根结点中weight域

  的值。

+
  算法中使用的二叉树结点的数据类型定义同【答案一】。（2分）

+ 算法实现：（7分）

  ```c
  int WPL(BTree *root) { // 基于递归的后序遍历算法实现
      int w_l, w_r;
      if (root->left == NULL && root->right == NULL)
          return 0;
      else {
          w_l = WPL(root->left);  // 计算左子树的WPL
          w_r = WPL(root->right); // 计算右子树的WPL
          root->weight = root->left->weight + root->right->weight;
          // 填写非叶结点的weight域
          return w_l + w_r + root->weight; // 返回WPL值
      }
  }
  ```

]
*【评分说明】*
①若考生给出能够满足题目要求的其他算法（包括用非递归的遍历方式实现的算法），且正确，可同样给分。

②参考答案中只给出了使用C语言的版本，使用C++语言正确实现的算法同样给分。

③若对算法的基本设计思想和主要数据结构的描述不十分清晰，但在算法实现中能够清晰反映出算法思想且正确，参照
①的标准给分。

④若考生给出的二叉树结点的数据类型定义及算法实现中，使用的是除整型之外的其他数值类型，可视同使用整型类型。

⑤若考生给出的答案中算法主要设计思想或算法实现中部分正确，可酌情给分。

=== 2015 2：B

=== 2017 4：B

=== 2017 5：B

=== 2017 41

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想

  表达式树的中序序列加上必要的括号即为等价的中缀表达式。可以基于二叉树的中序遍历策略得到所需的表达式。（3分）

  表达式树中分支结点所对应的子表达式的计算次序，由该分支结点所处的位置决定。为得到正确的中缀表达式，需要在生成遍历序列的同时，在适当位置增加必要的括号。显然，表达式的最外层（对应根结点）及操作数（对应叶结点）不需要添加括号。（2分）
+ 算法实现（10分）

  ```c
  void BtreeToE(BTree *root)
  {
      BtreeToExp(root, 1);           // 根的高度为1
  }

  void BtreeToExp(BTree *root, int deep)
  {
      if (root==NULL) return;
      else if (root->left==NULL && root->right==NULL)
          // 若为叶结点
          printf("%s", root->data);  // 输出操作数
      else
      {
          if (deep>1) printf("(");  // 若有子表达式则加1层括号
          BtreeToExp(root->left, deep+1);
          printf("%s", root->data);  // 输出操作符
          BtreeToExp(root->right, deep+1);
          if (deep>1) printf(")");  // 若有子表达式则加1层括号
      }
  }
  ```
]
【评分说明】

① 若考生设计的算法满足题目的功能要求，则（1）（2）根据所实现算法的策略及输出结果给分，细则见下表。

#table(columns: (auto, 1fr),
 [分数], [备注],
 [15], [采用中序遍历算法且正确，括号嵌套正确，层数适当。],
 [14], [采用中序遍历算法且正确，括号嵌套正确，但括号嵌套层数过多。例如，表达式最外层加上括号，或操作数加括号如（a）。],
 [11], [采用中序遍历算法，但括号嵌套层数不完全正确。例如，左右括号数量不匹配。],
 [9], [采用中序遍历算法，但没有考虑括号。],
 [≤7], [其他。],
)

② 若考生采用其他方法得到正确结果，可参照①的评分标准给分。

③ 如果程序中使用了求结点深度等辅助函数，但没有给出相应实现过程，只要考生进行了必要的说明，可不扣分。

④ 若考生算法的基本设计思想描述中因文字表达没有清晰反映出算法思路，但在算法实现中能够表达出算法思想且正确的，可参照①的标准给分。

⑤ 考生算法的基本设计思想描述或算法实现中部分正确，可参照①中各种情况的相应得分标准酌情给分。

⑥ 参考答案中只给出了使用C语言的版本，使用C++语言的答案参照以上评分标准。

=== 2022 3：B

=== 2023 5

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 2024 3：A

=== 2026 3

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 旧版题型示例

原考纲未附本题参考答案。

== 线索二叉树的基本概念和构造

=== 2010 3：D

=== 2013 5：A

=== 2014 4：D
