// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：二叉树

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

== 二叉树的定义及其主要特性

#block(breakable: false)[#question(label: n => [2009 5])[
已知一棵完全二叉树的第6层（设根为第1层）有8个叶结点，则该完全二叉树的结点个数最多是

#choices(
  [39],
  [52],
  [111],
  [119],
)
]]

#block(breakable: false)[#question(label: n => [2011 4])[
若一棵完全二叉树有768个结点，则该二叉树中叶结点的个数是

#choices(
  [257],
  [258],
  [384],
  [385],
)
]]

#block(breakable: false)[#question(label: n => [2018 4])[
设一棵非空完全二叉树 $T$ 的所有叶结点均位于同一层，且每个非叶结点都有2个子结点。若 $T$ 有 $k$ 个叶结点，则 $T$ 的结点总数是

#choices([$2k-1$], [$2k$], [$k^2$], [$2^k-1$])
]]

== 二叉树的顺序存储结构和链式存储结构

#block(breakable: false)[#question(label: n => [2020 3])[
对于任意一棵高度为5且有10个结点的二叉树，若采用顺序存储结构保存，每个结点占1个存储单元（仅存放结点的数据信息），则存放该二叉树需要的存储单元的数量至少是

#choices([31], [16], [15], [10])
]]

#block(breakable: false)[#question(label: n => [2025 3])[
若二叉树的结点值均为正整数，采用顺序存储方式保存在数组 $R$ 中，用 $-1$ 表示结点不存在，则下列数组中，#emphasis[不能]表示一棵二叉树的是

#choices([$R[ ]={20,15,40,-1,-1,35}$],[$R[ ]={15,40,10,18,35,-1,-1}$],[$R[ ]={15,40,10,-1,-1,-1,12}$],[$R[ ]={17,20,35,-1,18,45,-1,-1,19,27}$])
]]

== 二叉树的遍历

#block(breakable: false)[#question(label: n => [2009 3])[
给定二叉树如右图所示。设
N代表二叉树的根，L代表根结点的左子树，R代表根结点的右子树。若遍历后的结点序列为3，1，
7，5，6，2，4，则其遍历方式是

#align(center)[
  #cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(stroke: 0.055em, content: (wrap: body => box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
    // 2010 大纲 PDF 第 27 页，按正文 31 px/em 恢复层间距。
    let p(x,y)=((x - 834) / 31,(1604 - y) / 31)
    let ns=((971,1349),(901,1431),(1039,1433),(834,1518),(972,1518),(905,1604),(1041,1604))
    for (a,b) in ((0,1),(0,2),(1,3),(1,4),(4,5),(4,6)) {line(p(..ns.at(a)),p(..ns.at(b)))}
    for (i,n) in ns.enumerate() {
      circle(p(..n),radius:26 / 31,fill:white)
      content(p(..n),str(i+1))
    }
  })
]

#choices(
  [LRN],
  [NRL],
  [RLN],
  [RNL],
)
]]

#block(breakable: false)[#question(label: n => [2011 5])[
若一棵二叉树的前序遍历序列和后序遍历序列分别为1,2,3,4和4,3,2,1，则该二叉树的中序遍历序列不会是

#choices(
  [1,2,3,4],
  [2,3,4,1],
  [3,2,4,1],
  [4,3,2,1],
)
]]

#block(breakable: false)[#question(label: n => [2012 3])[
若一棵二叉树的前序遍历序列为
a,e,b,d,c，后序遍历序列为 b,c,d,e,a，则根结点的孩子结点

#choices(
  [只有e],
  [有e、b],
  [有e、c],
  [无法确定],
)
]]

#question(label: n => [2014 41])[
（13分）二叉树的带权路径长度（WPL）是二叉树中所有叶结点的带权路径长度之和。给定一棵二叉树 $T$，采用二叉链表存储，结点结构为：#inline-node(
  columns: (3.2em, 4em, 3.2em),
  [left], [weight], [right],
)，其中叶结点的 weight 域保存该结点的非负权值。设 root 为指向 $T$ 的根结点的指针，请设计求 $T$ 的 WPL 的算法。要求：

#subquestions[
+ 给出算法的基本设计思想；
  \
+ 使用C或C++语言，给出二叉树结点的数据类型定义；
  \
+ 
  根据设计思想，采用C或C++语言描述算法，关键之处给出注释。
  
    
]
]

#block(breakable: false)[#question(label: n => [2015 2])[
先序序列为 $a,b,c,d$ 的不同二叉树的个数是

#choices([13], [14], [15], [16])
]]

#block(breakable: false)[#question(label: n => [2017 4])[
要使一棵非空二叉树的先序序列与中序序列相同，其所有非叶结点须满足的条件是
#choices([只有左子树], [只有右子树], [结点的度均为1], [结点的度均为2])
]]

#block(breakable: false)[#question(label: n => [2017 5])[
已知一棵二叉树的树形如下图所示，其后序序列为 e，a，c，b，d，g，f，树中与结点 a 同层的结点是
#align(center, diagram(spacing: (1.8em, 1.5em), node-stroke: .6pt,
 node((1,0), [], name: <a>, shape: circle, radius: .35em),
 node((0,1), [], name: <b>, shape: circle, radius: .35em),
 node((2,1), [], name: <c>, shape: circle, radius: .35em),
 node((.65,2), [], name: <d>, shape: circle, radius: .35em),
 node((1.35,2), [], name: <e>, shape: circle, radius: .35em),
 node((0,3), [], name: <f>, shape: circle, radius: .35em),
 node((2,3), [], name: <g>, shape: circle, radius: .35em),
 edge(<a>,<b>), edge(<a>,<c>), edge(<b>,<d>), edge(<c>,<e>), edge(<d>,<f>), edge(<e>,<g>)))
#choices([c], [d], [f], [g])
]]

#question(label: n => [2017 41])[
（15分）请设计一个算法，将给定的表达式树（二叉树）转换为等价的中缀表达式（通过括号反映操作符的计算次序）并输出。例如，当下列两棵表达式树作为算法的输入时：
#grid(columns: (1fr, 1fr), gutter: 1em,
 align(center, diagram(spacing: (1.5em, 1.5em), node-stroke: .6pt,
  node((2,0), [\*], name: <r>, shape: circle, radius: .6em),
  node((.7,1), [+], name: <p>, shape: circle, radius: .6em),
  node((3.3,1), [\*], name: <m>, shape: circle, radius: .6em),
  node((-.1,2), [a], name: <a>, shape: circle, radius: .6em),
  node((1.5,2), [b], name: <b>, shape: circle, radius: .6em),
  node((2.5,2), [c], name: <c>, shape: circle, radius: .6em),
  node((4.2,2), [−], name: <n>, shape: circle, radius: .6em),
  node((5,3), [d], name: <d>, shape: circle, radius: .6em),
  edge(<r>,<p>), edge(<r>,<m>), edge(<p>,<a>), edge(<p>,<b>), edge(<m>,<c>), edge(<m>,<n>), edge(<n>,<d>))),
 align(center, diagram(spacing: (1.5em, 1.5em), node-stroke: .6pt,
  node((2,0), [+], name: <r>, shape: circle, radius: .6em),
  node((.7,1), [\*], name: <m>, shape: circle, radius: .6em),
  node((3.3,1), [−], name: <n>, shape: circle, radius: .6em),
  node((-.1,2), [a], name: <a>, shape: circle, radius: .6em),
  node((1.5,2), [b], name: <b>, shape: circle, radius: .6em),
  node((4.2,2), [−], name: <p>, shape: circle, radius: .6em),
  node((3.4,3), [c], name: <c>, shape: circle, radius: .6em),
  node((5,3), [d], name: <d>, shape: circle, radius: .6em),
  edge(<r>,<m>), edge(<r>,<n>), edge(<m>,<a>), edge(<m>,<b>), edge(<n>,<p>), edge(<p>,<c>), edge(<p>,<d>))))
输出的等价中缀表达式分别为 `(a+b)*(c*(-d))` 和 `(a*b)+(-(c-d))`。

二叉树结点定义如下：
```c
typedef struct node
{
    char data[10];       // 存储操作数或操作符
    struct node *left, *right;
} BTree;
```
要求：
#subquestions[
 + 给出算法的基本设计思想。
 + 根据设计思想，采用 C 或 C++语言描述算法，关键之处给出注释。
]
]

#block(breakable: false)[#question(label: n => [2022 3])[
若结点 p 与 q 在二叉树 $T$ 的中序遍历序列中相邻，且 p 在 q 之前，则下列 p 与 q 的关系中，#emphasis[不可能]的是

#statements(columns: (1fr, 1fr), [Ⅰ．q 是 p 的双亲], [Ⅱ．q 是 p 的右孩子],
  [Ⅲ．q 是 p 的右兄弟], [Ⅳ．q 是 p 的双亲的双亲],
)

#choices([仅Ⅰ], [仅Ⅲ], [Ⅱ、Ⅲ], [Ⅱ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2023 5])[
已知一棵二叉树的树形如下图所示，若其后序遍历序列为 f，d，b，e，c，a，则其先（前）序遍历序列是
#align(center, diagram(spacing: (1.5em, 1.5em), node-stroke: .6pt,
 node((1,0), [], name: <a>, shape: circle, radius: .45em),
 node((0,1), [], name: <b>, shape: circle, radius: .45em),
 node((2,1), [], name: <c>, shape: circle, radius: .45em),
 node((-1,2), [], name: <d>, shape: circle, radius: .45em),
 node((1,2), [], name: <e>, shape: circle, radius: .45em),
 node((0,3), [], name: <f>, shape: circle, radius: .45em),
 edge(<a>,<b>), edge(<a>,<c>), edge(<b>,<d>), edge(<b>,<e>), edge(<d>,<f>)))
#choices([a，e，d，f，b，c], [a，c，e，b，d，f], [c，a，b，e，f，d], [d，f，e，b，a，c])
]]

#block(breakable: false)[#question(label: n => [2024 3])[
若 $p$、$q$ 和 $v$ 均为二叉树 $T$ 中的结点，$v$ 有两个孩子结点，$T$ 的中序遍历序列形如“$dots, p, v, q, dots$”，则下列叙述中，正确的是

#choices([$p$ 没有右孩子，$q$ 没有左孩子], [$p$ 没有右孩子，$q$ 有左孩子], [$p$ 有右孩子，$q$ 没有左孩子], [$p$ 有右孩子，$q$ 有左孩子])
]]

#block(breakable: false)[#question(label: n => [2026 3])[
若二叉树 $T$ 的中序遍历序列是 $b,e,d,f,c,a,g$，层序遍历序列是 $a,b,g,c,d,e,f$，则 $T$ 的后序遍历序列是
#choices([$c,e,d,f,b,g,a$], [$c,e,f,d,b,g,a$], [$e,f,d,c,b,g,a$], [$e,g,f,d,b,c,a$])
]]

== 线索二叉树的基本概念和构造

#block(breakable: false)[#question(label: n => [2010 3])[
下列线索二叉树中（用虚线表示线索），符合后序线索树定义的是

#choices(
  [#cetz.canvas(length: 2.50em, baseline: (0, 0), {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let thread = (
      paint: black,
      thickness: 0.055em,
      dash: (array: (0pt, 0.15em), phase: 0em),
      cap: "round",
    )
    let tree-node(pos, body) = {
      circle(pos, radius: 0.36, fill: white, stroke: 0.055em)
      content(pos, text(size: 0.82em)[#body])
    }

    hide(rect((-1.90, -1.55), (2.35, 1.70), stroke: none), bounds: true)
    line((0, 1.20), (-0.90, 0.25), stroke: 0.055em)
    line((0, 1.20), (0.90, 0.25), stroke: 0.055em)
    line((-0.90, 0.25), (0, -0.75), stroke: 0.055em)
    tree-node((0, 1.20), [a])
    tree-node((-0.90, 0.25), [b])
    tree-node((0.90, 0.25), [c])
    tree-node((0, -0.75), [d])

    bezier(
      (-1.22, 0.06), (-0.18, 1.51),
      (-2.00, -0.14), (-1.62, 1.58),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.56, 0.18), (-0.54, 0.27),
      (0.20, -0.02), (-0.10, 0.08),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (1.22, 0.06), (0.34, -0.69),
      (1.70, -0.05), (1.35, -0.73),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0, -1.11), (0.90, -0.11),
      (-0.12, -1.53), (0.88, -1.38),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.29, -0.95), (1.47, -1.13),
      (0.72, -0.96), (1.12, -1.06),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((1.59, -1.13), text(size: 0.78em)[NULL], anchor: "west")
  })],
  [#cetz.canvas(length: 2.50em, baseline: (0, 0), {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let thread = (
      paint: black,
      thickness: 0.055em,
      dash: (array: (0pt, 0.15em), phase: 0em),
      cap: "round",
    )
    let tree-node(pos, body) = {
      circle(pos, radius: 0.36, fill: white, stroke: 0.055em)
      content(pos, text(size: 0.82em)[#body])
    }

    hide(rect((-2.45, -1.55), (2.45, 1.70), stroke: none), bounds: true)
    line((0, 1.20), (-0.90, 0.25), stroke: 0.055em)
    line((0, 1.20), (0.90, 0.25), stroke: 0.055em)
    line((-0.90, 0.25), (0, -0.75), stroke: 0.055em)
    tree-node((0, 1.20), [a])
    tree-node((-0.90, 0.25), [b])
    tree-node((0.90, 0.25), [c])
    tree-node((0, -0.75), [d])

    bezier(
      (-1.25, 0.20), (-2.02, 0.16),
      (-1.55, 0.18), (-1.76, 0.17),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((-2.14, 0.16), text(size: 0.78em)[NULL], anchor: "east")
    bezier(
      (1.25, 0.18), (2.02, 0.04),
      (1.52, 0.12), (1.76, 0.07),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((2.14, 0.04), text(size: 0.78em)[NULL], anchor: "west")
    bezier(
      (-0.18, -1.07), (-0.90, -0.11),
      (-0.82, -1.54), (-1.34, -1.08),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.18, -1.07), (0.18, 0.89),
      (1.18, -1.54), (1.12, 0.28),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.62, 0.12), (-0.16, 0.89),
      (0.24, -0.03), (0.09, 0.64),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
  })],
  [#cetz.canvas(length: 2.50em, baseline: (0, 0), {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let thread = (
      paint: black,
      thickness: 0.055em,
      dash: (array: (0pt, 0.15em), phase: 0em),
      cap: "round",
    )
    let tree-node(pos, body) = {
      circle(pos, radius: 0.36, fill: white, stroke: 0.055em)
      content(pos, text(size: 0.82em)[#body])
    }

    hide(rect((-1.90, -1.55), (2.50, 1.70), stroke: none), bounds: true)
    line((0, 1.20), (-0.90, 0.25), stroke: 0.055em)
    line((0, 1.20), (0.90, 0.25), stroke: 0.055em)
    line((-0.90, 0.25), (0, -0.75), stroke: 0.055em)
    tree-node((0, 1.20), [a])
    tree-node((-0.90, 0.25), [b])
    tree-node((0.90, 0.25), [c])
    tree-node((0, -0.75), [d])

    bezier(
      (-1.22, 0.06), (-0.18, 1.51),
      (-2.00, -0.14), (-1.62, 1.58),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (-0.18, -1.07), (-0.90, -0.11),
      (-0.82, -1.52), (-1.34, -1.04),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.62, 0.10), (0.27, -0.50),
      (0.36, -0.02), (0.24, -0.26),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.18, -1.07), (0.90, -0.11),
      (0.82, -1.53), (1.34, -1.04),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (1.25, 0.22), (2.02, 0.20),
      (1.53, 0.21), (1.78, 0.20),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((2.14, 0.20), text(size: 0.78em)[NULL], anchor: "west")
  })],
  [#cetz.canvas(length: 2.50em, baseline: (0, 0), {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let thread = (
      paint: black,
      thickness: 0.055em,
      dash: (array: (0pt, 0.15em), phase: 0em),
      cap: "round",
    )
    let tree-node(pos, body) = {
      circle(pos, radius: 0.36, fill: white, stroke: 0.055em)
      content(pos, text(size: 0.82em)[#body])
    }

    hide(rect((-2.35, -1.55), (2.10, 1.70), stroke: none), bounds: true)
    line((0, 1.20), (-0.90, 0.25), stroke: 0.055em)
    line((0, 1.20), (0.90, 0.25), stroke: 0.055em)
    line((-0.90, 0.25), (0, -0.75), stroke: 0.055em)
    tree-node((0, 1.20), [a])
    tree-node((-0.90, 0.25), [b])
    tree-node((0.90, 0.25), [c])
    tree-node((0, -0.75), [d])

    bezier(
      (1.25, 0.28), (1.74, -0.43),
      (1.72, 0.20), (1.95, -0.15),
      stroke: thread,
    )
    bezier(
      (1.74, -0.43), (0.35, 1.30),
      (2.18, -1.13), (2.08, 1.56),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.58, 0.18), (-0.54, 0.28),
      (0.18, -0.06), (-0.10, 0.12),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.20, -1.07), (-0.58, 0.07),
      (0.93, -1.48), (0.80, -0.18),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (-1.24, 0.07), (-0.35, -0.72),
      (-1.86, -0.16), (-1.18, -0.80),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (-0.35, -0.88), (-1.68, -1.13),
      (-0.79, -0.99), (-1.30, -1.10),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((-1.82, -1.13), text(size: 0.78em)[NULL], anchor: "east")
  })],
)
]]

#block(breakable: false)[#question(label: n => [2013 5])[
若 X是后序线索二叉树中的叶结点，且
X存在左兄弟结点 Y，则 X的右线索指向的是

#choices(
  [X的父结点],
  [以 Y为根的子树的最左下结点],
  [X的左兄弟结点 Y],
  [以 Y为根的子树的最右下结点],
)
]]

#block(breakable: false)[#question(label: n => [2014 4])[
若对如下的二叉树进行中序线索化，则结点 $x$ 的左、右线索指向的结点分别是

#align(center)[
  #text(size: 0.86em)[
    #exam-diagram(
      spacing: 1.95em,
      node((0, 0), [a], radius: 1.17em),
      node((-0.78, 0.88), [b], radius: 1.17em),
      node((0.77, 0.88), [c], radius: 1.17em),
      node((-1.59, 1.82), [d], radius: 1.17em),
      node((0.03, 1.83), [x], radius: 1.17em),
      node((-0.70, 2.77), [e], radius: 1.17em),
      edge((0, 0), (-0.78, 0.88)),
      edge((0, 0), (0.77, 0.88)),
      edge((-0.78, 0.88), (-1.59, 1.82)),
      edge((-0.78, 0.88), (0.03, 1.83)),
      edge((-1.59, 1.82), (-0.70, 2.77)),
    )
  ]
]

#choices(
  [e、c],
  [e、a],
  [d、c],
  [b、a],
)
]]
