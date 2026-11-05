// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：树形查找

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

== 二叉搜索树

#block(breakable: false)[#question(label: n => [2011 7])[
对于下列关键字序列，不可能构成某二叉排序树中一条查找路径的序列是

#choices(
  [95，22，91，24，94，71],
  [92，20，91，34，88，35],
  [21，89，77，29，36，38],
  [12，25，71，68，33，34],
)
]]

#block(breakable: false)[#question(label: n => [2013 6])[
在任意一棵非空二叉排序树 $T_1$中，删除某结点
v之后形成二叉排序树 $T_2$，再将 v插入 $T_2$形成二叉排序树
$T_3$。下列关于 $T_1$与 $T_3$的叙述中，正确的是

I. 若 v是 $T_1$的叶结点，则 $T_1$与 $T_3$不同

Ⅱ. 若 v是 $T_1$的叶结点，则 $T_1$与 $T_3$相同

Ⅲ. 若 v不是 $T_1$的叶结点，则 $T_1$与 $T_3$不同

Ⅳ. 若 v不是 $T_1$的叶结点，则 $T_1$与 $T_3$相同

#choices(
  [仅Ⅰ、Ⅲ],
  [仅Ⅰ、Ⅳ],
  [仅Ⅱ、Ⅲ],
  [仅Ⅱ、Ⅳ],
)
]]

#block(breakable: false)[#question(label: n => [2018 6])[
已知二叉排序树如下图所示，元素之间应满足的大小关系是

#align(center, diagram(
  node-stroke: 0.055em, edge-stroke: 0.055em, node-inset: 0pt,
  node((0em, 0em), text(size:0.85em)[$x_1$], radius: 0.78em),
  node((6.7em, -1.77em), text(size:0.85em)[$x_2$], radius: 0.78em),
  node((3.2em, -3.4em), text(size:0.85em)[$x_3$], radius: 0.78em),
  node((5.23em, -5.45em), text(size:0.85em)[$x_4$], radius: 0.78em),
  node((3.61em, -7.5em), text(size:0.85em)[$x_5$], radius: 0.78em),
  edge((0em, 0em), (6.7em, -1.77em)), edge((6.7em, -1.77em), (3.2em, -3.4em)),
  edge((3.2em, -3.4em), (5.23em, -5.45em)), edge((5.23em, -5.45em), (3.61em, -7.5em)),
))

#choices([$x_1 < x_2 < x_5$], [$x_1 < x_4 < x_5$], [$x_3 < x_5 < x_4$], [$x_4 < x_3 < x_5$])
]]

#block(breakable: false)[#question(label: n => [2020 5])[
下列给定的关键字输入序列中，不能生成如下二叉排序树的是

#align(center, diagram(node-stroke: 0.055em, edge-stroke: 0.055em, node-inset: 0pt,
  node((3.4em, 0em), text(size:0.85em)[4], radius: 0.7em),
  node((1.7em, -1.8em), text(size:0.85em)[2], radius: 0.7em),
  node((5.1em, -1.8em), text(size:0.85em)[5], radius: 0.7em),
  node((0em, -3.6em), text(size:0.85em)[1], radius: 0.7em),
  node((3.4em, -3.6em), text(size:0.85em)[3], radius: 0.7em),
  edge((3.4em, 0em), (1.7em, -1.8em)), edge((3.4em, 0em), (5.1em, -1.8em)),
  edge((1.7em, -1.8em), (0em, -3.6em)), edge((1.7em, -1.8em), (3.4em, -3.6em)),
))

#choices([4，5，2，1，3], [4，5，1，2，3], [4，2，5，3，1], [4，2，1，3，5])
]]

#question(label: n => [2022 41])[
（13分）已知非空二叉树 $T$ 的结点值均为正整数，采用顺序存储方式保存，数据结构定义如下：

```c
typedef struct {                  // MAX_SIZE为已定义常量
    int SqBiTNode[MAX_SIZE];       // 保存二叉树结点值的数组
    int ElemNum;                  // 实际占用的数组元素个数
} SqBiTree;
```

$T$ 中不存在的结点在数组 SqBiTNode 中用−1表示。例如，对于下图所示的两棵非空二叉树 $T_1$ 和 $T_2$，$T_1$ 的存储结果如下：

#grid(columns: (1fr, 1fr), column-gutter: 2em,
  align(center, figure(diagram(
    node-stroke: 0.045em, node-outset: 0.15em, edge-stroke: 0.045em,
    node((0,0), [40], name: <a>, radius: 0.55em),
    node((-1.6,1.5), [25], name: <b>, radius: 0.55em),
    node((1.6,1.5), [60], name: <c>, radius: 0.55em),
    node((0,3), [30], name: <d>, radius: 0.55em),
    node((3.2,3), [80], name: <e>, radius: 0.55em),
    node((-1.6,4.5), [27], name: <f>, radius: 0.55em),
    edge(<a>,<b>), edge(<a>,<c>), edge(<b>,<d>), edge(<c>,<e>), edge(<d>,<f>),
    spacing: 1em,
  ), caption: [二叉树 $T_1$], numbering: none)),
  align(center, figure(diagram(
    node-stroke: 0.045em, node-outset: 0.15em, edge-stroke: 0.045em,
    node((0,0), [40], name: <a>, radius: 0.55em),
    node((-1.6,1.5), [50], name: <b>, radius: 0.55em),
    node((1.6,1.5), [60], name: <c>, radius: 0.55em),
    node((0,3), [30], name: <d>, radius: 0.55em),
    node((1.6,4.5), [35], name: <e>, radius: 0.55em),
    edge(<a>,<b>), edge(<a>,<c>), edge(<b>,<d>), edge(<d>,<e>),
    spacing: 1em,
  ), caption: [二叉树 $T_2$], numbering: none)),
)

#align(center, table(columns: (9em,) + (2em,) * 12, align: center, stroke: none,
  [T1.SqBiTNode], ..(40,25,60,-1,30,-1,80,-1,-1,27,"","").map(v => table.cell(stroke: 0.5pt)[#v]),
  table.cell(colspan: 13, align: left)[T1.ElemNum = 10],
))

$T_2$ 的存储结果如下：

#align(center, table(columns: (9em,) + (2em,) * 12, align: center, stroke: none,
  [T2.SqBiTNode], ..(40,50,60,-1,30,-1,-1,-1,-1,-1,35,"").map(v => table.cell(stroke: 0.5pt)[#v]),
  table.cell(colspan: 13, align: left)[T2.ElemNum = 11],
))

请设计一个尽可能高效的算法，判定一棵采用这种方式存储的二叉树是否为二叉搜索树，若是，则返回 true，否则，返回 false。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++语言描述算法，关键之处给出注释。

]
]

#block(breakable: false)[#question(label: n => [2024 7])[
一棵二叉搜索树如题7图所示，k1、k2、k3 分别是对应结点中保存的关键字。子树 $T$ 的任一结点中保存的关键字 $x$ 满足的是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 2026 大纲 PDF 第 50 页：以正文汉字字距 33 px 为 1em 描点。
  // 文字以实际字面包围盒居中，不让字体的 cap-height 把标记压向圆底。
  let p(x,y) = ((x - 570) / 33, (495 - y) / 33)
  set-style(stroke: 0.045em, content: (wrap: body =>
    box(text(size: 0.9em, top-edge: "bounds", bottom-edge: "bounds", body))))
  for (a,b) in (((647,258),(592,302)),((647,258),(723,318)),
    ((723,318),(657,386)),((723,318),(775,367)),
    ((657,386),(598,429)),((657,386),(715,430))) { line(p(..a),p(..b)) }
  for (x,y,label) in ((647,258,[k1]),(723,318,[k2]),(657,386,[k3])) {
    circle(p(x,y),radius: 23.5 / 33,fill: white)
    content(p(x,y),label)
  }
  for (a,b,c) in (((592,302),(570,365),(611,365)),
    ((775,367),(755,432),(796,432)),((598,429),(577,493),(619,493)),
    ((715,430),(693,495),(735,495))) { line(p(..a),p(..b),p(..c),close: true) }
  content(p(715,477),$T$)
})),caption: [题7图],kind: image)

#choices([$x < "k1"$], [$x > "k2"$], [$"k1" < x < "k3"$], [$"k3" < x < "k2"$])
]]

#question(label: n => [2026 41])[
（本题13分）已知二叉搜索树采用二叉链表存储，类型定义如下：
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```c
typedef struct BSTNode                 //二叉搜索树结点
{
    int data;                         //保存结点的关键字值
    struct BSTNode *left, *right;      //指向左孩子、右孩子的指针
} BinTNode;
typedef BinTNode *BTree;               //二叉搜索树
```
]
对于给定的非空二叉搜索树 $T$（root 为指向 $T$ 的根结点的指针）和整数 $k$，请设计尽可能高效的查找算法：`void searchX(BTree root, int k)`，查找 $T$ 中其关键字值与 $k$ 之差的绝对值最小的所有结点，输出差值的绝对值和结点中的关键字值。要求：
#subquestions[
 + 给出算法的基本设计思想。（4分）
 + 根据设计思想，采用 C 或 C++语言描述算法，关键之处给出注释。（9分）
]
]

== 平衡二叉树

#block(breakable: false)[#question(label: n => [2009 4])[
下列二叉排序树中，满足平衡二叉树定义的是

#choices(
  [#box(baseline: 50%)[#diagram(
    node-stroke: 0.75pt,
    node-fill: white,
    edge-stroke: 0.75pt,
    spacing: 0.9em,
    node((0.70, 0), [], radius: 0.48em),
    node((0, 1), [], radius: 0.48em),
    node((0.70, 2), [], radius: 0.48em),
    edge((0.70, 0), (0, 1)),
    edge((0, 1), (0.70, 2)),
  )]],
  [#box(baseline: 50%)[#diagram(
    node-stroke: 0.75pt,
    node-fill: white,
    edge-stroke: 0.75pt,
    spacing: 0.9em,
    node((1, 0), [], radius: 0.48em),
    node((0.35, 1), [], radius: 0.48em),
    node((1.65, 1), [], radius: 0.48em),
    node((-0.30, 2), [], radius: 0.48em),
    node((1, 2), [], radius: 0.48em),
    edge((1, 0), (0.35, 1)),
    edge((1, 0), (1.65, 1)),
    edge((0.35, 1), (-0.30, 2)),
    edge((1.65, 1), (1, 2)),
  )]],
  [#box(baseline: 50%)[#diagram(
    node-stroke: 0.75pt,
    node-fill: white,
    edge-stroke: 0.75pt,
    spacing: 0.9em,
    node((0.65, 0), [], radius: 0.48em),
    node((0, 1), [], radius: 0.48em),
    node((1.30, 1), [], radius: 0.48em),
    node((1.95, 2), [], radius: 0.48em),
    node((1.30, 3), [], radius: 0.48em),
    edge((0.65, 0), (0, 1)),
    edge((0.65, 0), (1.30, 1)),
    edge((1.30, 1), (1.95, 2)),
    edge((1.95, 2), (1.30, 3)),
  )]],
  [#box(baseline: 50%)[#diagram(
    node-stroke: 0.75pt,
    node-fill: white,
    edge-stroke: 0.75pt,
    spacing: 0.9em,
    node((1, 0), [], radius: 0.48em),
    node((0.35, 1), [], radius: 0.48em),
    node((1.65, 1), [], radius: 0.48em),
    node((-0.30, 2), [], radius: 0.48em),
    node((1, 2), [], radius: 0.48em),
    node((0.35, 3), [], radius: 0.48em),
    node((1, 4), [], radius: 0.48em),
    edge((1, 0), (0.35, 1)),
    edge((1, 0), (1.65, 1)),
    edge((0.35, 1), (-0.30, 2)),
    edge((0.35, 1), (1, 2)),
    edge((-0.30, 2), (0.35, 3)),
    edge((0.35, 3), (1, 4)),
  )]],
)
]]

#block(breakable: false)[#question(label: n => [2010 4])[
在下图所示的平衡二叉树中，插入关键字48后得到一棵新平衡二叉树。在新平衡二叉树中，关键字37所在结点的左、右子结点中保存的关键字分别是

#align(center)[
  #diagram(
    node-stroke: 0.8pt,
    node-fill: white,
    spacing: (0.45em, 1em),
    node-inset: 0pt,
    node((2, 0), text(size:0.85em)[24], radius: 0.84em),
    node((1, 1), text(size:0.85em)[13], radius: 0.84em),
    node((3, 1), text(size:0.85em)[53], radius: 0.84em),
    node((2, 2), text(size:0.85em)[37], radius: 0.84em),
    node((4, 2), text(size:0.85em)[90], radius: 0.84em),
    edge((2, 0), (1, 1)),
    edge((2, 0), (3, 1)),
    edge((3, 1), (2, 2)),
    edge((3, 1), (4, 2)),
  )
]

#choices(
  [13、48],
  [24、48],
  [24、53],
  [24、90],
)
]]

#block(breakable: false)[#question(label: n => [2012 4])[
若平衡二叉树的高度为6，且所有非叶结点的平衡因子均为1，则该平衡二叉树的结点总数为

#choices(
  [12],
  [20],
  [32],
  [33],
)
]]

#block(breakable: false)[#question(label: n => [2013 3])[
若将关键字1,2,3,4,5,6,7依次插入到初始为空的平衡二叉树 T中，则
T中平衡因子为0的分支结点的个数是

#choices(
  [0],
  [1],
  [2],
  [3],
)
]]

#block(breakable: false)[#question(label: n => [2015 4])[
现有一棵无重复关键字的平衡二叉树（AVL树），对其进行中序遍历可得到一个降序序列。下列关于该平衡二叉树的叙述中，正确的是

#choices(
  [根结点的度一定为2],
  [树中最小元素一定是叶结点],
  [最后插入的元素一定是叶结点],
  [树中最大元素一定无左子树],
)
]]

#block(breakable: false)[#question(label: n => [2019 4])[
在任意一棵非空平衡二叉树（AVL 树）$T_1$ 中，删除某结点 $v$ 之后形成平衡二叉树 $T_2$，再将 $v$ 插入 $T_2$ 形成平衡二叉树 $T_3$。下列关于 $T_1$ 与 $T_3$ 的叙述中，正确的是

Ⅰ．若 $v$ 是 $T_1$ 的叶结点，则 $T_1$ 与 $T_3$ 可能不相同 \
Ⅱ．若 $v$ 不是 $T_1$ 的叶结点，则 $T_1$ 与 $T_3$ 一定不相同 \
Ⅲ．若 $v$ 不是 $T_1$ 的叶结点，则 $T_1$ 与 $T_3$ 一定相同

#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2021 6])[
给定平衡二叉树如下图所示，插入关键字23后，根中的关键字是

#align(center,diagram(node-stroke:0.055em,edge-stroke:0.055em,node-inset:0pt,
  // 大纲 PDF 第 60 页：结点直径约 1.45 个正文字，数字小于正文。
  node((1.7em,0em),text(size:0.85em)[20],radius:0.72em),
  node((0em,-2em),text(size:0.85em)[16],radius:0.72em),node((3.4em,-2em),text(size:0.85em)[30],radius:0.72em),
  node((1.7em,-4em),text(size:0.85em)[25],radius:0.72em),node((5.1em,-4em),text(size:0.85em)[40],radius:0.72em),
  edge((1.7em,0em),(0em,-2em)),edge((1.7em,0em),(3.4em,-2em)),
  edge((3.4em,-2em),(1.7em,-4em)),edge((3.4em,-2em),(5.1em,-4em)),
))

#choices([16], [20], [23], [25])
]]

#block(breakable: false)[#question(label: n => [2026 8])[
高度为4的平衡二叉树中，根结点左、右子树的结点个数相差最多是
#choices([1], [2], [3], [5])
]]
