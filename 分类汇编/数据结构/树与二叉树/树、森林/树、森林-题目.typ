// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：树、森林

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

== 森林与二叉树的转换

#block(breakable: false)[#question(label: n => [2009 6])[
将森林转换为对应的二叉树，若在二叉树中，结点
u是结点 v的父结点的父结点，则在原来的森林中，u和 v可能具有的关系是

I. 父子关系 II. 兄弟关系 III. u的父结点与
v的父结点是兄弟关系

#choices(
  [只有Ⅱ],
  [I和Ⅱ],
  [I和Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2011 6])[
已知一棵有2011个结点的树，其叶结点个数为116，该树对应的二叉树中无右孩子的结点个数是

#choices(
  [115],
  [116],
  [1895],
  [1896],
)
]]

#block(breakable: false)[#question(label: n => [2014 5])[
将森林 $F$ 转换为对应的二叉树 $T$，$F$ 中叶结点的个数等于

#choices(
  [$T$ 中叶结点的个数],
  [$T$ 中度为1的结点个数],
  [$T$ 中左孩子指针为空的结点个数],
  [$T$ 中右孩子指针为空的结点个数],
)
]]

#block(breakable: false)[#question(label: n => [2021 4])[
某森林 $F$ 对应的二叉树为 $T$，若 $T$ 的先序遍历序列是 a，b，d，c，e，g，f，中序遍历序列是 b，d，a，e，g，c，f，则 $F$ 中树的棵数是

#choices([1], [2], [3], [4])
]]

#block(breakable: false)[#question(label: n => [2025 4])[
下列关于二叉树及森林的叙述中，正确的是

#choices([完全二叉树中不存在度为1的结点],[任意一个森林都可以转换为一棵二叉树],[二叉树的分支结点个数比叶结点个数少],[表达式树的根中保存的是最先计算的运算符])
]]

#block(breakable: false)[#question(label: n => [2026 4])[
已知由5棵树组成的森林 $F$ 中各棵树所含的结点个数分别是2，3，4，5，7。若 $F$ 中各棵树的排列次序任意，则与 $F$ 对应的二叉树的高度至少是
#choices([5], [6], [8], [10])
]]

== 树和森林的遍历

#block(breakable: false)[#question(label: n => [2019 2])[
若将一棵树 $T$ 转化为对应的二叉树 BT，则下列对 BT 的遍历中，其遍历序列与 $T$ 的后根遍历序列相同的是

#choices([先序遍历], [中序遍历], [后序遍历], [按层遍历])
]]

#block(breakable: false)[#question(label: n => [2020 4])[
已知森林 $F$ 及与之对应的二叉树 $T$，若 $F$ 的先根遍历序列是 a，b，c，d，e，f，后根遍历序列是 b，a，d，f，e，c，则 $T$ 的后序遍历序列是

#choices([b，a，d，f，e，c], [b，d，f，e，c，a], [b，f，e，d，c，a], [f，e，d，c，b，a])
]]
