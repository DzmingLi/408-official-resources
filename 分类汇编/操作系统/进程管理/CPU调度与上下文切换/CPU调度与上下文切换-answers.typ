// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：CPU调度与上下文切换

== 调度的实现

=== 2012 30：C

=== 2017 27：B

=== 2021 27：D

== CPU调度算法

=== 2009 24：D

=== 2010 26：A

=== 2011 23：B

=== 2012 29：B

=== 2013 31：B

=== 2014 23：A

=== 2016 24：B

=== 2016 46

#subquestions(allow-oversize: true)[
+ 由于采用了静态优先数，当就绪队列中总有优先数较小的进程时，优先数较大的进程一直没有机会运行，因而会出现饥饿现象。
+ 优先数priority的计算公式为：

  $ "priority" = "nice" + k_1 times "cpuTime" - k_2 times "waitTime" $，其中 $k_1>0$，$k_2>0$，用来分别调整cpuTime和waitTime在priority中所占的比例。waitTime可使长时间等待的进程优先数减小，从而避免出现饥饿现象。
]

=== 2017 23：D

=== 2019 27：C

=== 2020 26：D

=== 2021 25：C

=== 2022 25：C

== 上下文及其切换机制

=== 2018 24：D
