// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：DNS系统

== 域名解析过程

#question(label: n => [2010 40])[
如果本地域名服务器无缓存，当采用递归方法解析另一网络某主机域名时，用户主机、本地域名服务器发送的域名请求消息数分别为

#choices(
  [一条、一条],
  [一条、多条],
  [多条、一条],
  [多条、多条],
)
]

#question(label: n => [2016 40])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

假设所有域名服务器均采用迭代查询方式进行域名解析。当H4访问规范域名为www.abc.xyz.com的网站时，域名服务器201.1.1.1在完成该域名解析过程中，可能发出DNS查询的最少和最多次数分别是
#choices([0,3], [1,3], [0,4], [1,4])
]

#question(label: n => [2021 47])[
（9分）某网络拓扑如题47图所示，以太网交换机 S 通过路由器 R 与 Internet 互联。路由器部分接口、本地域名服务器、H1、H2 的 IP 地址和 MAC 地址如图中所示。在 $t_0$ 时刻 H1 的 ARP 表和 S 的交换表均为空，H1 在此刻利用浏览器通过域名 www.abc.com 请求访问 Web 服务器，在 $t_1$ 时刻（$t_1>t_0$）S 第一次收到了封装 HTTP 请求报文的以太网帧，假设从 $t_0$ 到 $t_1$ 期间网络未发生任何与此次 Web 访问无关的网络通信。

#figure(cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  let label(x,y,body,anchor:"center") = content((x,y),text(size:0.85em)[#body],anchor:anchor)
  merge-path({
    bezier((-1,6),(-1,9),(-3,6),(-3,9))
    bezier((-1,9),(4,9),(0,10),(3,10))
    bezier((4,9),(5,6),(6,9),(7,6))
    bezier((5,6),(-1,6),(4,4.5),(-0.5,4.5))
  },close:true,fill:luma(90%))
  line((5.5,7.5),(9,7.5));line((9,7.5),(9,0))
  line((0,1.2),(16,1.2));line((9,1.2),(9,-3))
  content((1,8.3),image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-server.png",width:1.5em))
  label(1,6.75,[Web服务器]);label(1,5.8,[www.abc.com]);label(3.8,8.7,[Internet])
  merge-path({
    line((8.1,7.8),(8.1,7.1))
    bezier((8.1,7.1),(9.9,7.1),(8.1,6.6),(9.9,6.6))
    line((9.9,7.1),(9.9,7.8))
  },close:true,fill:white)
  circle((9,7.8),radius:(0.9,0.35),fill:luma(94%))
  line((8.5,7.9),(9.1,7.73),mark:(end:">",fill:black,scale:0.5))
  line((9.55,7.92),(9.1,7.8),mark:(end:">",fill:black,scale:0.5))
  line((8.8,7.6),(8.6,7.82),mark:(end:">",fill:black,scale:0.5))
  line((9.25,7.77),(9.5,7.58),mark:(end:">",fill:black,scale:0.5))
  label(9,8.6,[R]);label(9.8,6.6,[192.168.1.1/25],anchor:"west")
  label(9.8,5.5,[00-11-22-33-44-aa],anchor:"west")
  content((0,1.2),image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-server.png",width:1.5em))
  label(0,2.8,[本地域名服务器]);label(0,-0.6,[192.168.1.126/25])
  label(0,-1.7,[00-11-22-33-44-bb])
  merge-path({line((8,1.5),(8,0.9),(9,0.4),(10,0.9),(10,1.5))},close:true,fill:luma(90%))
  merge-path({line((8,1.5),(9,2),(10,1.5),(9,1))},close:true,fill:luma(94%))
  line((9,1),(9,0.4))
  line((8.4,1.6),(9.4,1.3),mark:(end:">",scale:0.6))
  line((9.6,1.8),(8.6,1.5),mark:(end:">",scale:0.6))
  label(8.4,2.3,[S]);label(7.7,1.6,[1]);label(9.4,2.6,[2]);label(10.4,1.6,[3]);label(9.5,0.1,[4])
  merge-path({line((15.2,1.8),(16.7,2),(16.8,0.8),(15.3,0.6))},close:true,fill:luma(92%))
  merge-path({line((15.3,0.6),(16.8,0.8),(17.3,0.2),(15.8,0))},close:true,fill:white)
  label(17.5,1.5,[H2]);label(16,-0.6,[192.168.1.3/25])
  label(16,-1.7,[00-11-22-33-44-dd])
  content((9,-3.2),image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-pc.png",width:2em))
  label(7.6,-3,[H1]);label(9,-4.7,[192.168.1.2/25])
  label(9,-5.8,[00-11-22-33-44-cc])
}),caption:[题47图],numbering:none)

请回答下列问题。

#subquestions[
+ 从 $t_0$ 到 $t_1$ 期间，H1 除了 HTTP 之外还运行了哪个应用层协议？从应用层到数据链路层，该应用层协议报文是通过哪些协议进行逐层封装的？
+ 若 S 的交换表结构为：〈MAC 地址，端口〉，则 $t_1$ 时刻 S 交换表的内容是什么？
+ 从 $t_0$ 到 $t_1$ 期间，H2 至少会接收到几个与此次 Web 访问相关的帧？接收到的是什么帧？帧的目的 MAC 地址是什么？

]
]
