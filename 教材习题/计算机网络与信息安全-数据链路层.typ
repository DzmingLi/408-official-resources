// 人工转录《计算机网络与信息安全》（2024年版，李全龙）第238—239页习题。
// 对照原扫描PDF第245—246页及用户截图；不属于408官方真题。
// 第5题接收序列共32个码片，按原文顺序录入；第12题图为未添加交换机的原始题图。
#import "../template.typ": exam, subquestions
#import "@preview/ezexam:0.3.1": question, mode-state, HANDOUTS, answer-state
#import "@preview/cetz:0.5.2" as cetz
#show: exam.with(title: "数据链路层习题", subject: "计算机网络与信息安全", cover: false, wide-labels: true)
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#set page(width: 210mm, height: 297mm)
#set document(title: "计算机网络与信息安全：数据链路层习题")

= 习题

#question[
数据链路层协议能够向网络层提供哪些可能的服务？
]

#question[
为什么有些网络用纠错码而不用检错和重传机制？请给出两个理由。
]

#question[
差错编码的检错或纠错能力与什么有关？试举例说明。
]

#question[
假设在一个使用CSMA/CD协议的局域网中，两个结点同时经一个传输速率为 $R$ 的广播信道开始发送一个长度为 $L$ 的帧，$d_("prop")$ 为两个结点之间的单向传播延迟。如果 $d_("prop") < L \/ R$，是否会发生冲突？如果会发生冲突，两个结点能检测到冲突吗？为什么？
]

#question[
在一个CDMA网络中，某站点正接收另一编码序列为 $(-1, 1, 1, -1, -1, -1, 1, -1)$ 的站点发送的数据，若该站点收到
// 连续四个8码片组；分组仅用于源码核对，排版仍为原文连续序列。
（#for chip in (
  -1, 1, 1, -1, -1, -1, 1, -1,
  1, -1, -1, 1, 1, 1, -1, 1,
  1, -1, -1, 1, 1, 1, -1, 1,
  -1, 1, 1, -1, -1, -1, 1, -1,
) { box($#chip$); [ ] }），则该站点收到的数据是什么？
]

#question[
在低负载情况下，纯ALOHA与时隙ALOHA相比，哪个延迟更小？
]

#question[
ARP查询为什么要在广播帧中发送呢？ARP响应为什么要在一个特定目的MAC地址的帧中发送呢？
]

#question[
简述10BASE-T、100BASE-T和吉比特以太网的共同点与区别。
]

#question[
如果10BASE-T以太网中的某个主机在尝试发送帧，连续很多次发生冲突，试问该主机在放弃尝试发送帧之前，可能的等待（退避）时间最长是多少？为什么？
]

#question[
一个通过以太网传送的IP数据报的总长度为60字节。是否需要在封装到以太网帧中时进行填充？如果需要，需要填充多少字节？
]

#question[
什么是VLAN？划分VLAN主要有几种方法？
]

#pagebreak(weak: true)
#question[
如下图所示网络，通过两台路由器互连3个LAN（以太网），所有主机的MAC地址为#box[00-11-22-33-44-5$x$]，其中 $x$ 为图中主机名，如主机A的MAC地址是00-11-22-33-44-5A；路由器接口的MAC地址为#box[00-11-22-33-44-$y z$]，其中 $y z$ 为接口名，如E1接口的MAC地址是00-11-22-33-44-E1。请回答下列问题。

#subquestions[
+ 请在图中增加必要的交换机（数量尽可能少），并重画网络图。
+ 为所有必要的接口分配IP地址，其中子网1为111.111.111.0/25，子网2为122.122.122.128/26，子网3为133.133.133.64/27，并说明各主机的IP地址配置中的子网掩码和默认网关。
+ 假设所有主机的ARP表和新加入的交换机的交换表均为空。若主机A向主机F发送一个IP数据报，请描述此次发送主要通信过程。在F成功收到A发送的IP数据报时，在问题（1）中加入交换机的交换表分别是什么？
]

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(stroke: 0.55pt, content: (wrap: body => box(text(top-edge: "ascender", bottom-edge: "descender", body))))
    // Match the three vertical subnet branches and staggered router positions.
    line((1, 8), (3, 8), (3, 2), (1, 2))
    line((3, 5), (9, 5))
    line((9, 9), (9, -1))
    line((9, 2), (14, 2))
    line((17, 5), (14, 5), (14, -1), (17, -1))
    // The source has plain cylinders, without the usual crossed router arrows.
    for (x, y) in ((6, 5), (11, 2)) {
      circle((x, y - 0.65), radius: (0.9, 0.3), fill: white)
      rect((x - 0.9, y - 0.65), (x + 0.9, y + 0.12), fill: white, stroke: none)
      line((x - 0.9, y + 0.12), (x - 0.9, y - 0.65))
      line((x + 0.9, y + 0.12), (x + 0.9, y - 0.65))
      circle((x, y + 0.12), radius: (0.9, 0.43), fill: black)
    }
    for (x, y, name) in ((0, 8, [A]), (0, 2, [B]), (9, 9, [C]), (9, -1, [D]), (17, 5, [E]), (17, -1, [F])) {
      content((x, y), image("../历年真题+参考解答/2009/assets/terminal-symbol.svg", width: 2.3em, height: 2.2em, fit: "stretch"))
      content((x, y + 1.65), text(size: 0.85em, name))
    }
    for (x, y, name) in ((4.3, 5.55, [E1]), (7.5, 5.55, [E2]), (9.6, 2.6, [E3]), (12.5, 2.6, [E4])) {
      content((x, y), text(size: 0.85em, name))
    }
    content((0, 0.45), text(size: 0.85em)[子网1])
    content((9, -2.65), text(size: 0.85em)[子网2])
    content((17, -2.65), text(size: 0.85em)[子网3])
  }),
  kind: image,
  numbering: none,
)
]
