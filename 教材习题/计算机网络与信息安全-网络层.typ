// 人工对照《计算机网络与信息安全》（2024年版，李全龙）第197—198页；PDF第204—205页。
#import "template.typ": textbook, question, subquestions
#import "@preview/cetz:0.5.2" as cetz
#show: textbook.with(topic: "网络层")
= 习题

#question[网络层提供的主要功能是什么？]

#question[转发和路由的含义是什么？它们之间有什么区别和联系？]

#question[简述虚电路网络和数据报网络各自的优缺点。]

#question[虚电路网络如何建立虚电路？虚电路网络分组转发的依据是什么？]

#question[实现异构网络互连的主要方法有哪些？实现异构网络互连的典型网络设备是什么？]

#question[路由器有哪些部分组成？各部分的主要功能是什么？]

#question[网络层出现拥塞的原因是什么？有哪些网络层拥塞控制策略？]

#question[请将IP网络183.164.128.0/17划分为等长的8个子网，并分别给出每个子网的子网地址、广播地址、子网掩码、IP地址总数、可分配IP地址数和可分配IP地址范围。]

#question[某ISP拥有一个网络地址块201.123.16.0/21，现在该ISP要为4个组织分配IP地址，它们需要的地址数量分别为985、486、246及211，请给出一个合理的分配方案，并说明各组织所分配子网的子网地址、广播地址、子网掩码、IP地址总数、可分配IP地址数和可分配IP地址范围。]

// 原文未标注3800和1500的单位，不自行增补首部长度等条件。
#question[现有一个总长度为3800的IP数据报，要通过MTU为1500的链路传输，在IPv4下应如何分片？每片的DF、MF标志的值是什么？片偏移的值是什么？]

#question[一个新加入到网络中的主机需要发送DHCP请求来获取一个可用的IP地址，为什么DHCP请求要以广播的形式发送出去？当某台DHCP服务器接收到一台主机的DHCP请求时，会返回一个DHCP响应，为什么DHCP响应也要以广播的形式发送出去？]

#question[简述ICMP的主要功能。]

#question[
某网络拓扑如下图所示，路由器R1通过接口E1、E2分别连接局域网1、局域网2，通过接口L0连接路由器R2，并通过路由器R2连接域名服务器与互联网。R1的L0接口的IP地址是202.118.2.1；R2的L0接口的IP地址是202.118.2.2，L1接口的IP地址是130.11.120.1，E0接口的IP地址是202.118.3.1；域名服务器的IP地址是202.118.3.2。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(stroke: 0.55pt, content: (wrap: body => box(text(top-edge: "ascender", bottom-edge: "descender", body))))
    // Source geometry: Internet and DNS on the left, two routers in the middle,
    // and two shallow LAN ellipses to the right. Links are behind the icons.
    line((1, 6), (1, 4), (9, 4), (21, 4))
    line((9, 4), (9, -0.8), (1, -0.8))
    line((21, 4), (21, 5.1), (29, 5.1))
    line((21, 4), (21, 2.3), (29, 2.3))
    content((1, 6.6), image("../历年真题+参考解答/2012/assets/visio-2003-cloud.svg", width: 6em, height: 2.8em, fit: "stretch"))
    content((1, 6.6), text(size: 0.8em, fill: white)[互联网])
    content((1, -0.8), image("../历年真题+参考解答/2009/assets/terminal-symbol.svg", width: 2.2em, height: 2em, fit: "stretch"))
    content((1, -2.4), text(size: 0.8em)[域名服务器])
    for (x, name) in ((9, [R2]), (21, [R1])) {
      content((x, 4), image("../历年真题+参考解答/2009/assets/router-symbol.svg", width: 2.6em, height: 2.7em, fit: "stretch"))
      content((x, 6), text(size: 0.9em, name))
    }
    for (y, name) in ((5.1, [局域网1]), (2.3, [局域网2])) {
      circle((29, y), radius: (3, 0.62), fill: luma(94%))
      content((29, y), text(size: 0.8em, name))
    }
    for (x, y, body) in (
      (6.7, 4.55, [L1]), (5, 3.35, [130.11.120.1]),
      (11.2, 4.65, [L0]), (13, 3.35, [202.118.2.2]),
      (18.7, 3.45, [L0]), (17.5, 2.7, [202.118.2.1]),
      (8.2, 1.9, [E0]), (5.2, 0.9, [202.118.3.1]),
      (5, -1.35, [202.118.3.2]),
      (23, 5.55, [E1]), (23, 2.8, [E2]),
    ) { content((x, y), text(size: 0.72em, body)) }
  }),
  kind: image,
  numbering: none,
)

R1和R2的路由表结构为：

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  stroke: (x, y) => (left: if x == 0 { none } else { 0.5pt }, right: none, top: 0.5pt, bottom: 0.5pt),
  [目的网络], [子网掩码], [下一跳], [接口],
  […], […], […], […],
)

请回答下列问题。

#subquestions[
+ 将IP地址空间202.118.1.0/24分配给局域网1、局域网2，每个局域网需要分配的IP地址数不少于120个。请给出分配结果，并分别写出局域网1、局域网2的子网地址、广播地址、子网掩码、IP地址总数、可分配IP地址数和可分配IP地址范围。
+ 请给出R1的路由表，使其明确包括到局域网1的路由、到局域网2的路由、到域名服务器的主机路由和到互联网的路由。
+ 请采用路由聚合技术，分别给出R2到局域网1、局域网2的路由。
]
]

#question[说明NAT的工作原理。如何实现NAT穿透？]

#question[IPv6提出的动机是什么？相比于IPv4，IPv6的数据报格式有什么特点？]

#question[简述链路状态路由选择算法与距离向量路由选择算法的实现过程。]

#question[为什么距离向量路由选择算法可能产生无穷计数问题？请举例说明。可以采取哪些措施来避免这一问题？]

#question[简述RIP、OSPF、BGP的异同。]
