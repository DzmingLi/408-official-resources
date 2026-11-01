// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：进程与线程

== 进程与线程的基本概念

=== 2011 25：D

=== 2012 31：A

=== 2020 29：B

== 进程/线程的状态与转换

=== 2014 26：A

=== 2015 25：D

=== 2018 27：C

=== 2019 24：C

=== 2022 28：D

=== 旧版题型示例

#block(breakable: false)[
自制解析（非官方）：原考纲未提供示例答案，以下答案与解析由本仓库自行编写。

C

在基本三状态模型中，等待态进程须先因等待事件完成而进入就绪态，再经调度进入运行态，不能直接从等待态转为运行态。时间片用完可使运行→就绪，等待资源可使运行→等待，事件完成可使等待→就绪。
]

== 线程的实现

=== 2019 23：B

== 进程与线程的组织与控制

=== 2010 24：C

=== 2021 24：B

== 进程间通信

=== 2014 31：C
