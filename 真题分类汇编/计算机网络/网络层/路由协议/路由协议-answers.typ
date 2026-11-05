// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：路由协议

== RIP路由协议

=== 2010 35：D

=== 2016 37：B

== OSPF路由协议

=== 2026 38

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

== BGP路由协议

=== 2017 37：D

=== 2024 47

#subquestions(allow-oversize: true)[
+ AS4 应该选择 OSPF 协议。
+ 初始 TTL 值应该至少设置为16。
+ R11～R16 路由器均获得到达网络210.2.3.0/24的正确路由，至少需要30 s。均获得到达网络210.2.4.0/24的正确路由，至少需要60 s。
+ 由 BGP 协议外部会话（eBGP）完成。通过 UPDATE 报文通告。R13 通过 BGP 协议内部会话（iBGP）通告给 R14 和 R15。
+ R14 路由表中到达网络136.5.16.0/20路由的下一跳是 R11；R15 路由表中到达网络136.5.16.0/20路由的下一跳是 R13。

]
