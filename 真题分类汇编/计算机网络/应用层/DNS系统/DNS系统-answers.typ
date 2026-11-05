// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：DNS系统

== 域名解析过程

=== 2010 40：A

=== 2016 40：C

=== 2021 47

#subquestions(allow-oversize: true)[
+ 从 $t_0$ 到 $t_1$ 期间，H1 除了 HTTP 之外还运行了 DNS 应用层协议；DNS 报文从应用层到数据链路层，逐层封装关系是：DNS 报文→UDP 数据报→IP 数据报→CSMA/CD 帧。
+ S 在 $t_1$ 时刻的交换表为：
  #figure([
  #table(columns:(2fr,1fr),align:center,
    [MAC 地址],[端口],
    [00-11-22-33-44-cc],[4],
    [00-11-22-33-44-bb],[1],
    [00-11-22-33-44-aa],[2],
  )
  ],numbering:none)
  
+ H2 至少会接收到2个帧；接收到的均是封装 ARP 查询报文的以太网帧；这些帧的目的 MAC 地址均是：FF-FF-FF-FF-FF-FF。

]
