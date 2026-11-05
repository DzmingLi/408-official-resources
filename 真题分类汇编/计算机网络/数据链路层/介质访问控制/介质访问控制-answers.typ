// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：介质访问控制

== 信道划分

=== 2014 37：B

== 随机访问

=== 2009 37：D

=== 2010 47

#subquestions(after-heading: true, allow-oversize: true)[
+ 主机甲和主机乙之间单向传播延迟时间：
  $10 med mu upright("s") 。$

  两台主机均检测到冲突时，最短所需时间和最长所需时间对应下面两种极端情况：

  ①主机甲和主机乙同时各发送一个数据帧，信号在信道中发生冲突后，冲突信号继续向两个方向传播。因此，甲乙两台主机均检测到冲突时，最短需经过
  10 $mu s$。

  ②主机甲（或主机乙）先发送一个数据帧，当该数据帧即将到达主机乙（或主机甲）时，主机乙（或主机甲）也开始发送一个数据帧。这时，主机乙（或主机甲）将立即检测到冲突；而主机甲（或主机乙）要检测到冲突，冲突信号还需要从主机乙（或主机甲）传播到主机甲（或主机乙），因此，甲乙两台主机均检测到冲突时，最长需经过
  $20 mu s 。$

+ 发送1518B的数据帧所用时间（传输延迟）：1214.4
  $mu s$。

  发送64B的确认帧所用时间（传输延迟）：51.2 $mu s$。

  主机甲从发送数据帧开始到收完确认帧为止的时间记为 $T_(upright("总"))$ ，则
  $T_(upright("总")) = 1285.6 mu upright("s") 。$ 主机甲的有效数据传输速率
  $= 12000 upright("bits") \/ 1285.6 mu upright("s") approx 9.33 upright("Mbps") 。$

]

=== 2011 36：D

=== 2013 36：B

=== 2015 36：B

=== 2016 36：B

=== 2018 35：D

=== 2019 36：B

=== 2020 37：A

=== 2023 36

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 2025 35：C
