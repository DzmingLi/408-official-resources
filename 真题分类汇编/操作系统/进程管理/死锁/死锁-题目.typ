// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：死锁

== 死锁的基本概念

#block(breakable: false)[#question(label: n => [2016 25])[
系统中有3个不同的临界资源R1、R2和R3，被4个进程p1、p2、p3及p4共享。各进程对资源的需求为：p1申请R1和R2，p2申请R2和R3，p3申请R1和R3，p4申请R2。若系统出现死锁，则处于死锁状态的进程数至少是
#choices([1], [2], [3], [4])
]]

== 死锁预防

#block(breakable: false)[#question(label: n => [2009 25])[
某计算机系统中有8台打印机，由
K个进程竞争使用，每个进程最多需要3台打印机。该系统可能会发生死锁的
K的最小值是

#choices(
  [2],
  [3],
  [4],
  [5],
)
]]

#block(breakable: false)[#question(label: n => [2014 24])[
某系统有 $n$ 台互斥使用的同类设备，三个并发进程分别需要3、4、5台设备。可确保系统不发生死锁的设备数 $n$ 最小为

#choices(
  [9],
  [10],
  [11],
  [12],
)
]]

#block(breakable: false)[#question(label: n => [2021 31])[
若系统中有 $n$（$n>=2$）个进程，每个进程均需要使用某类临界资源2个，则系统不会发生死锁所需的该类资源总数至少是

#choices([2], [$n$], [$n+1$], [$2n$])
]]

== 死锁避免

#block(breakable: false)[#question(label: n => [2011 27])[
某时刻进程的资源使用情况如下表所示。

#align(center)[#box(width: 76%)[#text(size: 0.82em)[#table(
  columns: (1.8fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  table.cell(rowspan: 2)[进程],
  table.cell(colspan: 3)[已分配资源],
  table.cell(colspan: 3)[尚需资源],
  table.cell(colspan: 3)[可用资源],
  [R1], [R2], [R3], [R1], [R2], [R3], [R1], [R2], [R3],
  [P1], [2], [0], [0], [0], [0], [1],
  table.cell(rowspan: 4)[0],
  table.cell(rowspan: 4)[2],
  table.cell(rowspan: 4)[1],
  [P2], [1], [2], [0], [1], [3], [2],
  [P3], [0], [1], [1], [1], [3], [1],
  [P4], [0], [0], [1], [2], [0], [0],
)]]]

此时的安全序列是

#choices(
  [P1,P2,P3,P4],
  [P1,P3,P2,P4],
  [P1,P4,P3,P2],
  [不存在],
)
]]

#block(breakable: false)[#question(label: n => [2012 27])[
假设5个进程P0、P1、P2、P3、P4共享三类资源R1、R2、R3，这些资源总数分别为18、6、
22。T0时刻的资源分配情况如下表所示，此时存在的一个安全序列是

#align(center)[
  #box(inset: 0pt)[#table(
    columns: (5em, 3em, 3em, 3em, 3em, 3em, 3em),
    align: center + horizon,
    stroke: 0.6pt,
    table.cell(rowspan: 2)[进程],
    table.cell(colspan: 3)[已分配资源],
    table.cell(colspan: 3)[资源最大需求],
    [R1], [R2], [R3], [R1], [R2], [R3],
    [P0], [3], [2], [3], [5], [5], [10],
    [P1], [4], [0], [3], [5], [3], [6],
    [P2], [4], [0], [5], [4], [0], [11],
    [P3], [2], [0], [4], [4], [2], [5],
    [P4], [3], [1], [4], [4], [2], [4],
  )]
]

#choices(
  [P0,P2,P4,P1,P3],
  [P1,P0,P3,P4,P2],
  [P2,P1,P0,P3,P4],
  [P3,P4,P2,P1,P0],
)
]]

#block(breakable: false)[#question(label: n => [2013 32])[
下列关于银行家算法的叙述中，正确的是

#choices(
  [银行家算法可以预防死锁],
  [当系统处于安全状态时，系统中一定无死锁进程],
  [当系统处于不安全状态时，系统中一定会出现死锁进程],
  [银行家算法破坏了死锁必要条件中的“请求和保持”条件],
)
]]

#block(breakable: false)[#question(label: n => [2018 26])[
假设系统中有4个同类资源，进程 $P_1$、$P_2$ 和 $P_3$ 需要的资源数分别为4、3和1，$P_1$、$P_2$ 和 $P_3$ 已申请到的资源数分别为2、1和0，则执行安全性检测算法的结果是

#choices(
  [不存在安全序列，系统处于不安全状态],
  [存在多个安全序列，系统处于安全状态],
  [存在唯一安全序列 $P_3$、$P_1$、$P_2$，系统处于安全状态],
  [存在唯一安全序列 $P_3$、$P_2$、$P_1$，系统处于安全状态],
)
]]

#block(breakable: false)[#question(label: n => [2020 27])[
某系统中有 A、B 两类资源各6个，$t$ 时刻资源分配及需求情况如下表所示。

#align(center, table(columns: (auto, auto, auto, auto, auto), align: center,
  [进程], [A 已分配数量], [B 已分配数量], [A 需求总量], [B 需求总量],
  [P1], [2], [3], [4], [4],
  [P2], [2], [1], [3], [1],
  [P3], [1], [2], [3], [4],
))

$t$ 时刻安全性检测结果是

#choices([存在安全序列 P1、P2、P3], [存在安全序列 P2、P1、P3], [存在安全序列 P2、P3、P1], [不存在安全序列])
]]

#block(breakable: false)[#question(label: n => [2022 26])[
系统中有三个进程 P0、P1、P2 及三类资源 A、B、C。若某时刻系统分配资源的情况如下表所示，则此时系统中存在的安全序列的个数为

#align(center, table(columns: (4em,) + (3em,) * 9, align: center + horizon,
  table.cell(rowspan: 2)[进程],
  table.cell(colspan: 3)[已分配资源数], table.cell(colspan: 3)[尚需资源数], table.cell(colspan: 3)[可用资源数],
  [A], [B], [C], [A], [B], [C], [A], [B], [C],
  [P0], [2], [0], [1], [0], [2], [1],
  table.cell(rowspan: 3)[1], table.cell(rowspan: 3)[3], table.cell(rowspan: 3)[2],
  [P1], [0], [2], [0], [1], [2], [3],
  [P2], [1], [0], [1], [0], [1], [3],
))

#choices([1], [2], [3], [4])
]]

== 死锁检测和解除

#block(breakable: false)[#question(label: n => [2015 26])[
若系统S1采用死锁避免方法，S2采用死锁检测方法。下列叙述中，正确的是

Ⅰ．S1会限制用户申请资源的顺序，而S2不会
\
Ⅱ．S1需要进程运行所需资源总量信息，而S2不需要
\
Ⅲ．S1不会给可能导致死锁的进程分配资源，而S2会

#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2019 30])[
下列关于死锁的叙述中，正确的是

Ⅰ．可以通过剥夺进程资源解除死锁 \
Ⅱ．死锁的预防方法能确保系统不发生死锁 \
Ⅲ．银行家算法可以判断系统是否处于死锁状态 \
Ⅳ．当系统出现死锁时，必然有两个或两个以上的进程处于阻塞态

#choices([仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅱ、Ⅳ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ])
]]
