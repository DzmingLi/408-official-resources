// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：路由协议

== RIP路由协议

#question(label: n => [2010 35])[
某自治系统内采用 RIP协议，若该自治系统内的路由器
R1收到其邻居路由器 R2的距离矢量，距离矢量中包含信息
〈net1，16〉，则能得出的结论是

#choices(
  [R2可以经过R1到达net1，跳数为17],
  [R2可以到达net1，跳数为16],
  [R1可以经过R2到达net1，跳数为17],
  [R1不能经过R2到达net1],
)
]

#question(label: n => [2016 37])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

假设R1、R2、R3采用RIP协议交换路由信息，且均已收敛。若R3检测到网络201.1.2.0/25不可达，并向R2通告一次新的距离向量，则R2更新后，其到达该网络的距离是
#choices([2], [3], [16], [17])
]

== BGP路由协议

#question(label: n => [2017 37])[
直接封装 RIP、OSPF、BGP 报文的协议分别是
#choices([TCP、UDP、IP], [TCP、IP、UDP], [UDP、TCP、IP], [UDP、IP、TCP])
]
