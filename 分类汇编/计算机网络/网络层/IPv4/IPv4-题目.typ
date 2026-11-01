// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：IPv4

== IPv4分组

#question(label: n => [2021 36])[
若路由器向 MTU = 800 B 的链路转发一个总长度为1580 B的 IP 数据报（首部长度为20 B）时，进行了分片，且每个分片尽可能大，则第2个分片的总长度字段和 MF 标志位的值分别是

#choices([796，0], [796，1], [800，0], [800，1])
]

== IPv4地址与NAT

#question(label: n => [2016 38])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

假设连接R1、R2和R3之间的点对点链路使用201.1.3.x/30地址，当H3访问Web服务器S时，R2转发出去的封装HTTP请求报文的IP分组的源IP地址和目的IP地址分别是
#choices([192.168.3.251,130.18.10.1], [192.168.3.251,201.1.3.9], [201.1.3.8,130.18.10.1], [201.1.3.10,130.18.10.1])
]

#question(label: n => [2017 36])[
下列 IP 地址中，只能作为 IP 分组的源 IP 地址但不能作为目的 IP 地址的是
#choices([0.0.0.0], [127.0.0.1], [200.10.10.3], [255.255.255.255])
]

#question(label: n => [2020 47])[
（9分）某校园网有两个局域网，通过路由器 R1、R2 和 R3 互联后接入 Internet，S1 和 S2 为以太网交换机。局域网采用静态 IP 地址配置，路由器部分接口以及各主机的 IP 地址如题47图所示。

#figure(cetz.canvas(length:1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  let label(x,y,body,anchor:"center") = content((x,y),text(size:0.7em)[#body],anchor:anchor)
  let router(x,y) = content((x,y),image("../../../../历年真题+参考解答/2009/assets/router-symbol.svg",width:2em,height:1.8em))
  let switch(x,y,name) = {
    merge-path({line((x - 1,y),(x - 1,y - 0.6),(x,y - 1.1),(x+1,y - 0.6),(x+1,y))},close:true,fill:luma(90%))
    merge-path({line((x - 1,y),(x,y+0.5),(x+1,y),(x,y - 0.5))},close:true,fill:luma(92%))
    line((x,y - 0.5),(x,y - 1.1))
    line((x - 0.6,y+0.1),(x+0.4,y - 0.2),mark:(end:">",scale:0.6))
    line((x+0.6,y+0.3),(x - 0.4,y),mark:(end:">",scale:0.6))
    label(x - 0.5,y+1.2,name)
  }
  merge-path({
    bezier((0,5),(0,7),(-1,5),(-1,7))
    bezier((0,7),(3.3,7),(0.8,8),(3,8))
    bezier((3.3,7),(3.3,5),(4.3,7),(4.3,5))
    bezier((3.3,5),(0,5),(2.4,4.2),(0.5,4.2))
  },close:true,fill:luma(90%))
  label(1.65,6,[Internet])
  line((3.5,6),(6,6),(6,3.5))
  line((0,0),(0,3.5),(12,3.5),(12,0))
  line((0,0),(6,0)); line((12,0),(18,0))
  line((6,-0.5),(2.8,-3)); line((6,-0.5),(8.3,-3))
  line((18,-0.5),(15.2,-3)); line((18,-0.5),(20.7,-3))
  router(6,3.5); router(0,0); router(12,0)
  switch(6,0,[S1]); switch(18,0,[S2])
  label(-0.8,1,[NAT]); label(10.6,1,[NAT])
  label(2.55,4.2,[203.10.2.1/30])
  label(7.2,3.9,[203.10.2.5/30],anchor:"west")
  label(0.2,1.5,[203.10.2.2/30],anchor:"west")
  label(12.2,1.5,[203.10.2.6/30],anchor:"west")
  label(1.1,0.5,[192.168.1.1],anchor:"west")
  label(13.1,0.5,[192.168.1.1],anchor:"west")
  content((2.8,-3.2),image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-server.png",width:1.5em))
  content((8.3,-3.2),image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-pc.png",width:1.7em))
  content((15.2,-3.2),image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-pc.png",width:1.7em))
  merge-path({line((20.3,-2.5),(21.3,-2.8),(21,-3.6),(20,-3.3))},close:true,fill:white)
  merge-path({line((20,-3.3),(21,-3.6),(21.5,-4),(20.4,-3.8))},close:true,fill:luma(92%))
  for (x,name,ip) in ((2.8,[Web服务器],[192.168.1.2]),(8.3,[H1],[192.168.1.3]),
    (15.2,[H2],[192.168.1.2]),(20.7,[H3],[192.168.1.3])) {
    label(x,-4.6,name); label(x,-5.6,ip)
  }
}),caption:[题47图],numbering:none)

假设 NAT 转换表结构为：

#align(center, table(columns:(1fr,1fr,1fr,1fr),align:center,
  table.cell(colspan:2)[外网], table.cell(colspan:2)[内网],
  [IP 地址], [端口号], [IP 地址], [端口号],
  [], [], [], [],
))

请回答下列问题。

#subquestions[
+ 为使 H2 和 H3 能够访问 Web 服务器（使用默认端口号），需要进行什么配置？给出具体配置。
+ 若 H2 主动访问 Web 服务器时，将 HTTP 请求报文封装到 IP 数据报 P 中发送，则 H2 发送的 P 的源 IP 地址和目的 IP 地址分别是什么？经过 R3 转发后，P 的源 IP 地址和目的 IP 地址分别是什么？经过 R2 转发后，P 的源 IP 地址和目的 IP 地址分别是什么？

]
]

== 子网划分、路由聚集、子网掩码与CIDR

#question(label: n => [2010 37])[
某网络的IP地址空间为192.168.5.0/24，采用定长子网划分，子网掩码为255.255.255.248，则该网络中的最大子网个数、每个子网内的最大可分配地址个数分别是

#choices(
  [32、8],
  [32、6],
  [8、32],
  [8、30],
)
]

#question(label: n => [2011 38])[
在子网192.168.4.0/30中，能接收目的地址为192.168.4.3的IP分组的最大主机数是

#choices(
  [0],
  [1],
  [2],
  [4],
)
]

#question(label: n => [2012 39])[
某主机的IP地址为180.80.77.55，子网掩码为255.255.252.0。若该主机向其所在子网发送广播分组，则目的地址可以是

#choices(
  [180.80.76.0],
  [180.80.76.255],
  [180.80.77.255],
  [180.80.79.255],
)
]

#question(label: n => [2016 39])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

假设H1与H2的默认网关和子网掩码均分别配置为192.168.3.1和255.255.255.128，H3与H4的默认网关和子网掩码均分别配置为192.168.3.254和255.255.255.128，则下列现象中可能发生的是
#choices([H1不能与H2进行正常IP通信], [H2与H4均不能访问Internet], [H1不能与H3进行正常IP通信], [H3不能与H4进行正常IP通信])
]

#question(label: n => [2017 38])[
若将网络21.3.0.0/16划分为128个规模相同的子网，则每个子网可分配的最大 IP 地址个数是
#choices([254], [256], [510], [512])
]

#question(label: n => [2018 38])[
某路由表中有转发接口相同的4条路由表项，其目的网络地址分别为35.230.32.0/21、35.230.40.0/21、35.230.48.0/21和35.230.56.0/21，将该4条路由聚合后的目的网络地址为

#choices([35.230.0.0/19], [35.230.0.0/20], [35.230.32.0/19], [35.230.32.0/20])
]

#question(label: n => [2018 47])[
（7分）某公司网络如题47图所示。IP 地址空间192.168.1.0/24被均分给销售部和技术部两个子网，并已分别为部分主机和路由器接口分配了 IP 地址，销售部子网的 MTU=1500 B，技术部子网的 MTU=800 B。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.06em)
    line((7, 4), (31, 4))
    circle((7, 4), radius: (6.6, 3.6), fill: luma(94%))
    circle((31, 4), radius: (6.6, 3.6), fill: luma(94%))
    merge-path({
      line((18, 4.5), (18, 3.5))
      bezier((18, 3.5), (20, 3.5), (18, 2.8), (20, 2.8))
      line((20, 3.5), (20, 4.5))
    }, close: true, fill: white)
    circle((19, 4.5), radius: (1, 0.55), fill: white)
    for (a, b) in (((18.3, 4.8), (19, 4.45)), ((19.05, 4.5), (19.7, 4.85)),
      ((19.7, 4.2), (19.05, 4.55)), ((19, 4.5), (18.3, 4.15))) {
      line(a, b, stroke: 0.11em, mark: (end: ">", fill: black, scale: 0.55))
    }
    content((7, 6.2), [销售部])
    content((31, 6.2), [技术部])
    for x in (5.4, 8.3, 29.4, 32.3) {
      rect((x - 0.5, 4.25), (x + 0.5, 5.55), fill: white)
      rect((x - 0.35, 4.5), (x + 0.35, 5.3))
      line((x - 0.7, 4.25), (x + 0.7, 4.25), (x + 0.55, 3.85), (x - 0.85, 3.85), close: true, fill: white)
    }
    content((7, 3.1), text(size: 0.88em)[已分配地址])
    content((7, 2.1), text(size: 0.8em)[192.168.1.1～192.168.1.20])
    content((31, 3.1), text(size: 0.88em)[已分配地址])
    content((31, 2.1), text(size: 0.8em)[192.168.1.129～192.168.1.208])
    content((19, 1.95), text(size: 0.88em)[路由器])
    content((15.9, 5.6), text(size: 0.82em)[192.168.1.126])
    content((22.1, 5.6), text(size: 0.82em)[192.168.1.254])
    content((17.55, 4.4), text(size: 0.82em)[F0], anchor: "east")
    content((20.45, 4.4), text(size: 0.82em)[F1], anchor: "west")
    content((15.9, 3.3), text(size: 0.82em)[MTU=1500B])
    content((22.1, 3.3), text(size: 0.82em)[MTU=800B])
  }),
  caption: [题47图], numbering: none,
)

请回答下列问题：

#subquestions[
+ 销售部子网的广播地址是什么？技术部子网的子网地址是什么？若每个主机仅分配一个 IP 地址，则技术部子网还可以连接多少台主机？
+ 假设主机192.168.1.1向主机192.168.1.208发送一个总长度为1500 B 的 IP 分组，IP 分组的头部长度为20 B，路由器在通过接口 F1 转发该 IP 分组时进行了分片。若分片时尽可能分为最大片，则一个最大 IP 分片封装数据的字节数是多少？至少需要分为几个分片？每个分片的片偏移量是多少？

]
]

#question(label: n => [2019 37])[
若将101.200.16.0/20划分为5个子网，则可能的最小子网的可分配 IP 地址数是

#choices([126], [254], [510], [1022])
]

#question(label: n => [2021 35])[
现将一个 IP 网络划分为3个子网，若其中一个子网是192.168.9.128/26，则下列网络中，不可能是另外两个子网之一的是

#choices([192.168.9.0/25], [192.168.9.0/26], [192.168.9.192/26], [192.168.9.192/27])
]

#question(label: n => [2022 35])[
若某主机的 IP 地址是183.80.72.48，子网掩码是255.255.192.0，则该主机所在网络的网络地址是

#choices([183.80.0.0], [183.80.64.0], [183.80.72.0], [183.80.192.0])
]

#question(label: n => [2022 36])[
下图所示网络中的主机 H 的子网掩码与默认网关分别是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: 0.045em)
  line((0,3),(15,3),(15,0),(21,0))
  content((0,3), std.rect(radius: 1em, fill: luma(90%), stroke: none, inset: 0.5em)[Internet])
  for x in (6,15) {
    rect((x - 0.9,2.3),(x + 0.9,3.3), fill: white)
    circle((x,3.3), radius: (0.9,0.3), fill: white)
    for (a,b) in (((x - 0.6,3.4),(x + 0.5,3.15)),((x - 0.5,3.1),(x + 0.6,3.4))) {
      line(a,b, mark: (end: "stealth", scale: 0.6))
    }
  }
  content((6,1.7), [路由器])
  content((10.4,3.7), text(size: 0.8em)[192.168.1.1/30])
  content((16.2,1.7), text(size: 0.8em)[192.168.1.62/27], anchor: "west")
  content((15,0), std.rect(fill: white, inset: 0.3em, stroke: 0.045em)[⇄])
  content((13,-0.1), [交换机], anchor: "east")
  content((21,0), image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-pc.png", width: 2.5em))
  content((23,0), text(size: 0.8em)[H\ 192.168.1.60], anchor: "west")
}))

#choices(
  [255.255.255.192，192.168.1.1],
  [255.255.255.192，192.168.1.62],
  [255.255.255.224，192.168.1.1],
  [255.255.255.224，192.168.1.62],
)
]

== ARP协议、DHCP协议与ICMP协议

#question(label: n => [2010 36])[
若路由器R因为拥塞丢弃IP分组，则此时R可向发出该IP分组的源主机发送的ICMP报文类型是

#choices(
  [路由重定向],
  [目的不可达],
  [源抑制],
  [超时],
)
]

#question(label: n => [2012 33])[
在 TCP/IP 体系结构中，直接为 ICMP
提供服务的协议是

#choices(
  [PPP],
  [IP],
  [UDP],
  [TCP],
)
]

#question(label: n => [2012 38])[
ARP协议的功能是

#choices(
  [根据IP地址查询MAC地址],
  [根据MAC地址查询IP地址],
  [根据域名查询IP地址],
  [根据IP地址查询域名],
)
]

#question(label: n => [2015 47])[
（9分）某网络拓扑如题47图所示，其中路由器内网接口、DHCP服务器、WWW服务器与主机1均采用静态IP地址配置，相关地址信息见图中标注；主机2～主机N通过DHCP服务器动态获取IP地址等配置信息。

#figure(
  align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.055em)
    let label(x, y, body, anchor: "center") = content((x, y), text(size: 0.92em)[#body], anchor: anchor)
    // 先铺连线，设备图标遮住进入设备内部的端点。
    line((7.4, 14.5), (13, 10.5))
    line((14.3, 14.4), (13, 10.5))
    line((13, 10.5), (34.1, 10.5))
    line((34.1, 11.4), (34.1, 17.6))
    line((13, 10.5), (3.5, 4.4))
    line((13, 10.5), (10.3, 4.4))
    line((13, 10.5), (22.5, 4.4))

    // 服务器按原图的机箱外形重建；CRT 主机复用已有 Visio 图标。
    let server(x, y) = {
      let at(a, b) = (x + a, y + b)
      line(at(-1.7, 1.5), at(-0.35, 0.8), at(-0.35, -2.4), at(-1.7, -1.7), close: true, fill: luma(93%))
      line(at(-0.35, 0.8), at(1.65, 1.9), at(1.65, -1.3), at(-0.35, -2.4), close: true, fill: luma(77%))
      line(at(-1.7, 1.5), at(0.35, 2.6), at(1.65, 1.9), at(-0.35, 0.8), close: true, fill: luma(97%))
      for b in (1.05, 0.65, 0.25) {
        line(at(-1.4, b), at(-0.6, b - 0.42), stroke: 0.11em)
      }
      circle(at(-1.08, -0.48), radius: 0.12, fill: black, stroke: none)
      for b in (-1.1, -1.32, -1.54) {
        line(at(-1.4, b), at(-0.6, b - 0.42), stroke: 0.045em)
      }
    }
    server(7.4, 16.6)
    server(14.3, 16.6)
    for x in (3.5, 10.3, 22.5) {
      content((x, 4.4), image("../../../../历年真题+参考解答/2015/assets/visio-2007-isometric-pc.png", width: 5.4em))
    }
    label(7.4, 19.8, [WWW服务器])
    label(14.3, 19.8, [DHCP服务器])
    label(8.8, 13.1, [111.123.15.3/24], anchor: "east")
    label(14.8, 13.5, [111.123.15.2/24], anchor: "west")
    label(14.8, 12.3, [00-b1-b1-b1-b1-b1], anchor: "west")

    // 交换机顶部及两侧保持原图的等距投影方向。
    line((10.5, 10.8), (13, 9.3), (13, 7.9), (10.5, 9.4), close: true, fill: luma(92%))
    line((13, 9.3), (15.5, 10.8), (15.5, 9.4), (13, 7.9), close: true, fill: luma(80%))
    line((10.5, 10.8), (13, 12.1), (15.5, 10.8), (13, 9.3), close: true, fill: luma(97%))
    for (a, b) in (((11.4, 10.9), (12.7, 10.2)), ((12.5, 11.6), (13.8, 10.9)),
      ((12, 10.5), (13.3, 11.2)), ((13.3, 9.9), (14.6, 10.6))) {
      line(a, b, stroke: 0.16em, mark: (end: ">", fill: black, scale: 0.9))
    }
    label(9.5, 9.7, [以太网交换机], anchor: "east")

    // 圆柱路由器：黑箭头、浅灰侧面。
    merge-path({
      line((31.9, 10.5), (31.9, 8.7))
      bezier((31.9, 8.7), (36.3, 8.7), (31.9, 7.05), (36.3, 7.05))
      line((36.3, 8.7), (36.3, 10.5))
    }, close: true, fill: luma(88%))
    circle((34.1, 10.5), radius: (2.2, 1.2), fill: luma(97%))
    for (a, b) in (((32.7, 11.1), (34, 10.45)), ((34.2, 10.5), (35.55, 11.15)),
      ((35.55, 9.9), (34.2, 10.55)), ((34, 10.5), (32.7, 9.85))) {
      line(a, b, stroke: 0.18em, mark: (end: ">", fill: black, scale: 0.9))
    }
    label(34.1, 6.7, [路由器])
    label(31.4, 11.05, [111.123.15.1/24], anchor: "east")
    label(31.4, 9.7, [00-a1-a1-a1-a1-a1], anchor: "east")

    let cloud(cx, cy, fill) = merge-path({
      bezier((cx - 3.5, cy), (cx - 2.7, cy + 1.3), (cx - 4.1, cy + 0.9), (cx - 3.1, cy + 1.8))
      bezier((cx - 2.7, cy + 1.3), (cx - 1.3, cy + 1.7), (cx - 2.7, cy + 2.3), (cx - 1.6, cy + 2.3))
      bezier((cx - 1.3, cy + 1.7), (cx + 0.2, cy + 1.9), (cx - 1.2, cy + 2.5), (cx - 0.2, cy + 2.6))
      bezier((cx + 0.2, cy + 1.9), (cx + 1.7, cy + 1.5), (cx + 0.5, cy + 2.6), (cx + 1.5, cy + 2.3))
      bezier((cx + 1.7, cy + 1.5), (cx + 3.1, cy + 0.5), (cx + 2.7, cy + 2.1), (cx + 3.3, cy + 1.3))
      bezier((cx + 3.1, cy + 0.5), (cx + 2.7, cy - 1), (cx + 4.2, cy + 0.6), (cx + 3.8, cy - 1.1))
      bezier((cx + 2.7, cy - 1), (cx + 0.8, cy - 1.6), (cx + 2.8, cy - 2), (cx + 1.4, cy - 2.1))
      bezier((cx + 0.8, cy - 1.6), (cx - 0.8, cy - 1.5), (cx + 0.7, cy - 2.4), (cx - 0.4, cy - 2.3))
      bezier((cx - 0.8, cy - 1.5), (cx - 2.8, cy - 0.8), (cx - 1.3, cy - 2.3), (cx - 2.8, cy - 1.7))
      bezier((cx - 2.8, cy - 0.8), (cx - 3.5, cy), (cx - 3.8, cy - 1.2), (cx - 4, cy - 0.3))
    }, close: true, fill: fill)
    cloud(34.25, 17.45, black)
    cloud(34.05, 17.75, luma(88%))
    label(34.05, 17.75, [Internet])
    label(3.5, 0.95, [主机1])
    label(10.3, 0.95, [主机2])
    label(22.5, 0.95, [主机$N$])
    label(3.5, -0.3, [111.123.15.4/24])
    label(16.5, 4.15, [⋯ ⋯])
  })),
  kind: image,
  caption: [题47图],
  numbering: none,
)

请回答下列问题。

#subquestions[
+ DHCP服务器可为主机2～主机N动态分配IP地址的最大范围是什么？主机2使用DHCP协议获取IP地址的过程中，发送的封装DHCP Discover报文的IP分组的源IP地址和目的IP地址分别是什么？
  \
+ 若主机2的ARP表为空，则该主机访问Internet时，发出的第一个以太网帧的目的MAC地址是什么？封装主机2发往Internet的IP分组的以太网帧的目的MAC地址是什么？
  \
+ 若主机1的子网掩码和默认网关分别配置为255.255.255.0和111.123.15.2，则该主机是否能访问WWW服务器？是否能访问Internet？请说明理由。
    
]
]

#question(label: n => [2022 47])[
（9分）某网络拓扑如题47图所示，R 为路由器，S 为以太网交换机，AP 是802.11接入点，路由器的 E0 接口和 DHCP 服务器的 IP 地址配置如图中所示；H1 与 H2 属于同一个广播域，但不属于同一个冲突域；H2 和 H3 属于同一个冲突域；H4 和 H5 已经接入网络，并通过 DHCP 动态获取了 IP 地址。现有路由器、100BaseT 以太网交换机和100BaseT 集线器（Hub）三类设备各若干台。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.045em)
  // 大纲 PDF 第 45 页；设备采用原始 Visio 矢量，文字和连接线独立重画。
  let p(x,y)=((x - 195) / 35,(1380 - y) / 35)
  let label(x,y,body)=content(p(x,y),text(size:0.72em,body))
  let icon(x,y,w,name)=content(p(x,y),image("../../../../历年真题+参考解答/2022/official-images/network-"+name+".png",width:w / 35 * 1em))
  let vector(x,y,w,h,name)=content(p(x,y),image("../../../../历年真题+参考解答/2012/assets/visio-2003-"+name+".svg",width:w / 35 * 1em,height:h / 35 * 1em,fit:"stretch"))
  for (a,b) in (((345,1075),(916,1075)),((456,1075),(456,1318)),
    ((285,1198),(456,1198)),((285,1318),(606,1318)),((760,1075),(760,1198))) {line(p(..a),p(..b))}
  vector(275,1078,160,77,"cloud")
  content(p(275,1078),text(size:0.72em,fill:white,[Internet]))
  vector(459,1076,80,73,"router"); label(459,1094,[R])
  vector(760,1081,77,65,"switch"); vector(911,1071,65,85,"server")
  label(572,1000,[192.168.0.1/25]); label(589,1025,[00-11-11-11-11-A1])
  label(513,1061,[E0]); label(734,1038,[S])
  for (y,body) in ((1136,[DHCP服务器]),(1162,[192.168.0.2/25]),(1188,[00-11-11-11-11-B1])) {label(915,y,body)}
  for (x,y,name) in ((275,1192,[H1]),(275,1314,[H2]),(605,1314,[H3])) {
    vector(x,y,88,80,"pc"); label(x+6,y+51,name)
  }
  for (y,name) in ((1198,[设备1]),(1318,[设备2])) {
    rect(p(419,y - 31),p(491,y+31),fill:white); label(455,y,name)
  }
  icon(769,1192,52,"ap"); label(719,1186,[AP]); label(613,1209,[00-11-11-11-11-C1])
  for (x,y,name,ip,mac) in ((754,1301,[H4],[192.168.0.3/25],[00-11-11-11-11-D1]),
    (922,1240,[H5],[192.168.0.4/25],[00-11-11-11-11-E1])) {
    vector(x,y+5,63,46,"laptop"); label(x - 50,y+3,name)
    // 无线波纹属于题图标记，不属于笔记本设备图标。
    for dx in (0,6,12) {
      bezier(p(x+12+dx,y - 21),p(x+13+dx,y - 35),p(x+17+dx,y - 25),p(x+17+dx,y - 32))
    }
    label(x,y+47,ip); label(x,y+78,mac)
  }
})),caption: [题47图],kind: image)


#subquestions[
+ 设备1和设备2应该分别选择哪类设备？
+ 若信号传播速率为 $2 times 10^8$ m/s，以太网最小帧长为64 B，信号通过设备2时会产生额外的1.51 μs的时间延迟，则 H2 与 H3 之间可以相距的最远距离是多少？
+ 在 H4 通过 DHCP 动态获取 IP 地址过程中，H4 首先发送了 DHCP 报文 M，M 是哪种 DHCP 报文？路由器 E0 接口能否收到封装 M 的以太网帧？S 向 DHCP 服务器转发的封装 M 的以太网帧的目的 MAC 地址是什么？
+ 若 H4 向 H5 发送一个 IP 分组 P，则 H5 收到的封装 P 的802.11帧的地址1、地址2和地址3分别是什么？

]
]
