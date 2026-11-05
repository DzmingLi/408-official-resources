// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：路由协议

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

== OSPF路由协议

#question(label: n => [2026 38])[
下列路由协议中，可以将一个自治系统划分为多个区域（Area）的内部网关协议是
#statements(columns: 3, [Ⅰ．OSPF], [Ⅱ．RIP], [Ⅲ．BGP])
#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ])
]

== BGP路由协议

#question(label: n => [2017 37])[
直接封装 RIP、OSPF、BGP 报文的协议分别是
#choices([TCP、UDP、IP], [TCP、IP、UDP], [UDP、TCP、IP], [UDP、IP、TCP])
]

#question(label: n => [2024 47])[
（本题9分）网络空间是继陆海空天之后的“第五疆域”，网络技术是网络疆域建设与治理的基础。路由算法与协议是网络核心技术之一，对其准确认知、合理选择与应用，对于网络建设十分重要。假设现有互联网中的4个自治系统互连拓扑示意图如题47图所示。其中，AS1 运行内部网关协议 RIP；AS3 规模较小，自治系统内任意两个主机间通信，经过路由器数量不超过15个；AS4 规模较大，自治系统内任意两个主机间通信，经过路由器数量可能超过20个。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.055em)
  circle((0,0),radius: (10,3.4)); circle((-9,5),radius: (3.2,2)); circle((0,6.5),radius: (3.2,2)); circle((9,5),radius: (3.2,2))
  let ps=((-3.3,1.3),(0,1.3),(3.3,1.3),(-3.3,-1.3),(0,-1.3),(3.3,-1.3),(-8,4.8),(0,5.8),(8,4.8))
  for (a,b) in ((0,1),(1,2),(0,3),(3,4),(4,5),(2,5),(2,4),(0,6),(1,7),(2,8)) { line(ps.at(a),ps.at(b)) }
  line((-6.5,-1.3),ps.at(3)); line(ps.at(5),(6.5,-1.3))
  for (a,b) in (((-8,4.8),(-10.5,4.8)),((-8,4.8),(-10,6.2)),((-8,4.8),(-8,6.6)),((0,5.8),(-1.3,7.1)),((0,5.8),(1.3,7.1)),((8,4.8),(8,6.6)),((8,4.8),(10.2,6)),((8,4.8),(10.7,4.8))) { line(a,b) }
  for (i,p) in ps.enumerate() {
    content(p,image("../../../../assets/network/cisco-router.svg",width: 1.4em))
    let label=[#("R"+str(if i < 6 {11+i} else {(22,33,44).at(i - 6)}))]
    content(if i==0 {(p.at(0) - 1.35,p.at(1))} else if i==2 {(p.at(0)+1.35,p.at(1))} else if i==7 {(p.at(0) - 1.4,p.at(1))} else {(p.at(0),p.at(1) - 1.05)},text(size: 0.8em,label))
  }
  for (x,y,label) in ((-7.6,1,[AS1]),(-11,5.5,[AS2]),(0,7.9,[AS3]),(10.4,5.5,[AS4])) { content((x,y),strong(label)) }
  content((0,-4.2),text(size: 0.8em)[内部网关协议：RIP])
  content((-7.2,-1.3),std.ellipse(fill: luma(95%),stroke: none,inset: 0.2em)[#text(size: 0.8em)[210.2.3.0/24]])
  content((7.2,-1.3),std.ellipse(fill: luma(95%),stroke: none,inset: 0.2em)[#text(size: 0.8em)[210.2.4.0/24]])
  for p in ((-9,7),(0,8.5),(9,7)) { line((0,10.4),p,stroke: (dash: "dashed",thickness: 0.055em)) }
  content((0,10.4),std.ellipse(fill: white,stroke: none,inset: 0.3em)[136.5.16.0/20])
})),caption: [题47图],kind: image)

请回答下列问题。

#subquestions[
+ 若仅有 RIP 和 OSPF 内部网关协议供选择，则 AS4 应该选择哪个协议？（1分）
+ 若 AS3 中的某主机向本自治系统内另一主机发送1个 IP 分组，为确保该 IP 分组能够被正常接收，则 IP 分组的初始 TTL 值应该至少设置为多少？（1分）
+ 假设 AS1 中的路由器同一时刻启动，启动后立即构建并交换初始距离向量，之后每隔30 s交换一次最新的距离向量，则从交换初始距离向量时刻算起，R11～R16 路由器均获得到达网络210.2.3.0/24的正确路由，至少需要多长时间？均获得到达网络210.2.4.0/24的正确路由，至少需要多长时间？（2分）
+ R44 向 R13 通告到达网络136.5.16.0/20路由时，由 BGP 协议哪类会话完成？通过哪个 BGP 报文通告？R13 通过 BGP 协议的哪类会话将该网络可达性信息通告给 R14 和 R15？（3分）
+ 若 R14 和 R15 均收到分别由 R11、R12、R13 通告的到达网络136.5.16.0/20的可达性信息如下。

  目的网络：136.5.16.0/20，AS 路径：AS2 AS8 AS19，下一跳：R11\
  目的网络：136.5.16.0/20，AS 路径：AS3 AS7 AS11 AS19，下一跳：R12\
  目的网络：136.5.16.0/20，AS 路径：AS4 AS10 AS19，下一跳：R13

  则在无策略约束情况下，R14 和 R15 更新路由表后，各自路由表中到达网络136.5.16.0/20路由的下一跳分别是什么（用路由器名称表示）？（2分）
]
]
