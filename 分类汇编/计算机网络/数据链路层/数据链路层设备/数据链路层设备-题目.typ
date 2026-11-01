// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：数据链路层设备

== 以太网交换机的工作原理

#question(label: n => [2009 36])[
以太网交换机进行转发决策时使用的PDU地址是

#choices(
  [目的物理地址],
  [目的IP地址],
  [源物理地址],
  [源IP地址],
)
]

#question(label: n => [2015 37])[
下列关于交换机的叙述中，正确的是

#choices(
  [以太网交换机本质上是一种多端口网桥],
  [通过交换机互连的一组工作站构成一个冲突域],
  [交换机每个端口所连网络构成一个独立的广播域],
  [以太网交换机可实现采用不同网络层协议的网络互联],
)
]

#question(label: n => [2016 35])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

若主机H2向主机H4发送1个数据帧，主机H4向主机H2立即发送一个确认帧，则除H4外，从物理层上能够收到该确认帧的主机还有
#choices([仅H2], [仅H3], [仅H1、H2], [仅H2、H3])
]

== 交换机自学习与帧转发

#question(label: n => [2014 34])[
某以太网拓扑及交换机当前转发表如下图所示。主机00-e1-d5-00-23-a1向主机00-e1-d5-00-23-c1发送1个数据帧，主机00-e1-d5-00-23-c1收到该帧后，向主机00-e1-d5-00-23-a1发送1个确认帧，交换机对这两个帧的转发端口分别是

#align(center)[
  #cetz.canvas(length: 2em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
    let host(x, address) = {
      content((x, 0.62), box(fill: white, inset: 0pt)[
        #image("../../../../历年真题+参考解答/2014/assets/desktop-symbol.svg", width: 2.24em, height: 2.24em)
      ])
      // The shallow keyboard echoes the older PC symbols in the scan.
      rect((x - 0.60, 0.14), (x + 0.60, 0.34), fill: white, stroke: 0.52pt)
      content((x, -0.22), [#text(size: 0.80em)[#address]])
    }
  
    let label(x, y, body, anchor: "center", size: 0.72em) = content(
      (x, y), [#text(size: size)[#body]], anchor: anchor,
    )
  
    hide(rect((-0.05, -0.05), (14.35, 3.65), stroke: none), bounds: true)
  
    // Switch and its three physical links.
    rect((0.42, 2.42), (5.36, 3.56), fill: white, stroke: 0.58pt)
    label(2.89, 2.94, [交换机], size: 0.95em)
    line((0.93, 2.42), (0.93, 1.87), (-1.10, 1.87), (-1.10, 1.08), stroke: 0.58pt)
    line((2.76, 2.42), (2.76, 1.08), stroke: 0.58pt)
    line((4.63, 2.42), (4.63, 1.87), (6.73, 1.87), (6.73, 1.08), stroke: 0.58pt)
    label(1.14, 2.14, [1])
    label(2.97, 2.14, [2])
    label(4.84, 2.14, [3])
  
    host(-1.10, [00-e1-d5-00-23-a1])
    host(2.79, [00-e1-d5-00-23-b1])
    host(6.73, [00-e1-d5-00-23-c1])
  
    // Forwarding table: the source has only a header rule and one divider.
    line((8.55, 2.60), (14.30, 2.60), stroke: 0.58pt)
    line((12.31, 3.62), (12.31, 0.54), stroke: 0.58pt)
    label(10.42, 2.98, [目的地址], size: 0.86em)
    label(13.31, 2.98, [端口], size: 0.86em)
    label(10.42, 2.00, [00-e1-d5-00-23-b1], size: 0.80em)
    label(13.31, 2.00, [2], size: 0.82em)
  })
]

#choices(
  [{3}和{1}],
  [{2,3}和{1}],
  [{2,3}和{1,2}],
  [{1,2,3}和{1}],
)
]

== 直通交换与转发时延

#question(label: n => [2013 38])[
对于100
Mbps的以太网交换机，当输出端口无排队，以直通交换（cut-through
switching）方式转发一个以太网帧（不包括前导码）时，引入的转发延迟至少是

#choices(
  [0 $mu s$],
  [0.48 $mu s$],
  [5.12 $mu s$],
  [121.44 $mu s$],
)
]
