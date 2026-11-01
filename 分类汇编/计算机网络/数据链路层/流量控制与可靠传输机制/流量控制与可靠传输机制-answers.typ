// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：流量控制与可靠传输机制

== 滑动窗口与信道利用率

=== 2015 35：B

=== 2019 35：B

== 停止－等待协议

=== 2018 36：D

=== 2020 36：D

== 后退N帧协议（GBN）

=== 2009 35：C

=== 2012 36：B

=== 2014 36：C

=== 2017 47

#block(breakable: false)[
#subquestions(allow-oversize: true)[
+ 从 $t_0$ 到 $t_1$ 期间，甲方可以断定乙方已正确接收3个数据帧，分别为S0,0、S1,0、S2,0。（2分）
+ 从 $t_1$ 起，甲方最多还可以发送5个数据帧，其中第一个为S5,2，最后一个为S1,2。（3分）
+ 甲方需要重传3个数据帧，重传的第一个帧为S2,3。（2分）
+ 甲方可以达到的最大信道利用率为
  $ (7 times (8 times 1000) / (100 times 10^6)) / (0.96 times 10^(-3) + 2 times (8 times 1000) / (100 times 10^6)) times 100% = 50%. $（2分）
]
【评分说明】答案部分正确，酌情给分。
]

== 选择重传协议（SR）

=== 2011 35：B

=== 旧版题型示例

#block(breakable: false)[
编注：以下为本仓库整理解析，非官方参考答案。

B
]
