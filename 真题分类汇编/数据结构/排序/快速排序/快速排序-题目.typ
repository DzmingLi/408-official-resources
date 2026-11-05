// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：快速排序

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2010 10])[
采用递归方式对顺序表进行快速排序。下列关于递归次数的叙述中，正确的是

#choices(
  [递归次数与初始数据的排列次序无关],
  [每次划分后，先处理较长的分区可以减少递归次数],
  [每次划分后，先处理较短的分区可以减少递归次数],
  [递归次数与每次划分后得到的分区的处理顺序无关],
)
]]

#block(breakable: false)[#question(label: n => [2011 10])[
为实现快速排序算法，待排序序列宜采用的存储方式是

#choices(
  [顺序存储],
  [散列存储],
  [链式存储],
  [索引存储],
)
]]

#block(breakable: false)[#question(label: n => [2014 11])[
下列选项中，不可能是快速排序第2趟排序结果的是

#choices(
  [2,3,5,4,6,7,9],
  [2,7,5,6,4,3,9],
  [3,2,5,4,7,6,9],
  [4,2,3,5,7,6,9],
)
]]

#question(label: n => [2016 43])[
（15分）已知由 $n$（$n >= 2$）个正整数构成的集合 $A=\{a_k | 0 <= k < n\}$，将其划分为两个不相交的子集 $A_1$ 和 $A_2$，元素个数分别是 $n_1$ 和 $n_2$，$A_1$ 和 $A_2$ 中元素之和分别为 $S_1$ 和 $S_2$。设计一个尽可能高效的划分算法，满足 $abs(n_1-n_2)$ 最小且 $abs(S_1-S_2)$ 最大。要求：
#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。
+ 说明你所设计算法的平均时间复杂度和空间复杂度。
]
]

#block(breakable: false)[#question(label: n => [2019 10])[
排序过程中，对尚未确定最终位置的所有元素进行一遍处理称为一“趟”。下列序列中，不可能是快速排序第二趟结果的是

#choices(
  [5，2，16，12，28，60，32，72],
  [2，16，5，28，12，60，32，72],
  [2，12，16，5，28，32，72，60],
  [5，2，12，28，16，32，72，60],
)
]]

#block(breakable: false)[#question(label: n => [2023 11])[
使用快速排序算法对数据进行升序排序，若经过一次划分后得到的数据序列是68，11，70，23，80，77，48，81，93，88，则该次划分的枢轴是
#choices([11], [70], [80], [81])
]]

#block(breakable: false)[#question(label: n => [2024 8])[
使用快速排序算法对含 $n (n ≥ 3)$ 个元素的数组 $M$ 进行排序，若第一趟排序将 $M$ 中除枢轴外的 $n-1$ 个元素划分为均不为空的 $P$ 和 $Q$ 两块，则下列叙述中，正确的是

#choices([$P$ 与 $Q$ 块间有序], [$P$ 与 $Q$ 均块内有序], [$P$ 和 $Q$ 的元素个数大致相等], [$P$ 和 $Q$ 中均不存在相等的元素])
]]
