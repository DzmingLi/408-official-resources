// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：计算机网络概述

== 计算机网络的主要性能指标

#question(label: n => [2010 34])[
在下图所示的采用“存储-转发”方式的分组交换网络中，所有链路的数据传输速率为
100
Mbps，分组大小为1000B，其中分组头大小为20B。若主机H1向主机H2发送一个大小为980000B的文件，则在不考虑分组拆装时间和传播延迟的情况下，从H1发送开始到H2接收完为止，需要的时间至少是

#align(center)[
  #cetz.canvas(length: 0.72cm, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let host(x, label) = {
      // VSDfx Generic 3D 的 CRT Monitor 与 Keyboard：原图也是两个符号叠放。
      content((x, 1.38), box(fill: white, inset: 0pt)[
        #image("../../../历年真题+参考解答/2010/assets/crt-monitor-symbol.png",
          width: 0.57cm, height: 0.60cm, fit: "stretch")
      ])
      content((x - 0.18, 0.94), box(fill: white, inset: 0pt)[
        #image("../../../历年真题+参考解答/2010/assets/keyboard-symbol.png",
          width: 0.47cm, height: 0.33cm, fit: "stretch")
      ])
      content((x, 0.40), [#text(size: 0.78em)[#label]])
    }

    let router(x, y) = content((x, y), box(fill: white, inset: 0pt)[
      #image("../../../历年真题+参考解答/2010/assets/router-symbol.svg",
        width: 0.78cm, height: 0.58cm, fit: "stretch")
    ])

    hide(rect((-0.50, -0.50), (9.90, 2.05), stroke: none), bounds: true)

    // Draw links first so the symbols cleanly cover their endpoints.
    line((0.38, 1.25), (2.65, 1.25), stroke: 0.55pt)
    line((3.45, 1.25), (6.45, 1.25), stroke: 0.55pt)
    line((7.25, 1.25), (9.08, 1.25), stroke: 0.55pt)
    line((3.18, 0.98), (4.63, 0.10), stroke: 0.55pt)
    line((5.37, 0.10), (6.82, 0.98), stroke: 0.55pt)

    host(0, [H1])
    router(3.05, 1.25)
    router(6.85, 1.25)
    router(5.00, 0.02)
    host(9.45, [H2])
  })
]

#choices(
  [80 ms],
  [80.08 ms],
  [80.16 ms],
  [80.24 ms],
)
]

#question(label: n => [2017 33])[
假设 OSI 参考模型的应用层欲发送400 B的数据（无拆分），除物理层和应用层之外，其他各层在封装 PDU 时均引入20 B的额外开销，则应用层数据传输效率约为
#choices([80%], [83%], [87%], [91%])
]

#question(label: n => [2023 33])[
在下图所示的分组交换网络中，主机 H1 和 H2 通过路由器互连，2段链路的带宽均为100 Mb/s，时延带宽积（即单向传播时延×带宽）均为1000 b。若 H1 向 H2 发送1个大小为1 MB的文件，分组长度为1000 B，则从 H1 开始发送时刻起到 H2 收到文件全部数据时刻止，所需的时间至少是（注：$"M"=10^6$）
#align(center, image("../../../历年真题+参考解答/2023/official-images/q33.png", width: 19em))
#choices([80.02 ms], [80.08 ms], [80.09 ms], [80.10 ms])
]

#question(label: n => [2024 33])[
若某分组交换网络及每段链路的带宽如题33图所示，则 H1 到 H2 的最大吞吐量约为

// 图标采用已有的黑底白箭头圆柱；连线和标签仍为题内矢量内容。
#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.045em)
  let ps=((-8,0),(-4,0),(1,3),(6,0),(1,-3),(10,0))
  for (a,b,label,pos) in ((0,1,[10 Mb/s],(-6,0.5)),(1,2,[1000 Mb/s],(-1.7,2)),(2,3,[1000 Mb/s],(3.7,2)),(1,3,[1 Mb/s],(1,0.5)),(1,4,[100 Mb/s],(-1.7,-2)),(4,3,[100 Mb/s],(3.7,-2)),(3,5,[10 Mb/s],(8,0.5))) {
    line(ps.at(a),ps.at(b))
    content(pos,text(size: 0.65em,label), angle: if a==1 and b==2 {31deg} else if a==2 and b==3 {-31deg} else if a==1 and b==4 {-31deg} else if a==4 and b==3 {31deg} else {0deg})
  }
  for i in (1,2,3,4) {
    content(ps.at(i),image("../../../历年真题+参考解答/2009/assets/router-symbol.svg",width: 1.3em))
    content((ps.at(i).at(0),ps.at(i).at(1)-1.05),text(size: 0.65em)[路由器])
  }
  for (i,label) in ((0,[H1]),(5,[H2])) {
    let (x,y)=ps.at(i)
    line((x - 0.8,y),(x - 0.5,y+0.8),(x+0.6,y+0.8),(x+0.3,y),close: true,fill: luma(75%))
    line((x - 0.8,y),(x - 1,y - 0.35),(x+0.4,y - 0.35),(x+0.3,y),fill: white,close: true)
    content((x,y - 0.9),label)
  }
})),caption: [题33图],kind: image)

#choices([1 Mb/s], [10 Mb/s], [100 Mb/s], [1000 Mb/s])
]

== 计算机网络分层结构

#question(label: n => [2010 33])[
下列选项中，不属于网络体系结构所描述的内容是

#choices(
  [网络的层次],
  [每一层使用的协议],
  [协议的内部实现细节],
  [每一层必须完成的功能],
)
]

#question(label: n => [2026 33])[
下列关于分层网络体系结构的叙述中，#emphasis[错误]的是
#choices([有利于标准化], [层次越多效率越高], [有利于各层技术独立演化], [降低网络系统设计与实现的复杂度])
]

== 计算机网络协议、接口、服务等概念

#question(label: n => [2020 33])[
下图描述的协议要素是

#statements(columns: (1fr, 1fr, 1fr), [Ⅰ．语法], [Ⅱ．语义], [Ⅲ．时序])

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  content((0, 0.8), [发送方]); content((7, 0.8), [接收方])
  line((0, 0), (0, -7), mark: (end: ">", scale: 0.7))
  line((7, 0), (7, -7), mark: (end: ">", scale: 0.7))
  line((0, -0.8), (7, -2.5), mark: (end: ">", scale: 0.7))
  line((7, -2.7), (0, -4.4), mark: (end: ">", scale: 0.7))
  line((0, -4.6), (4.3, -5.6), mark: (end: ">", scale: 0.7))
  content((-0.4, -6.8), [时间], anchor: "east")
}))

#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅲ], [Ⅰ、Ⅱ和Ⅲ])
]

== ISO/OSI参考模型和TCP/IP参考模型

#question(label: n => [2013 33])[
在OSI参考模型中，下列功能需由应用层的相邻层实现的是

#choices(
  [对话管理],
  [数据格式转换],
  [路由选择],
  [可靠数据传输],
)
]

#question(label: n => [2014 33])[
在OSI参考模型中，直接为会话层提供服务的是

#choices(
  [应用层],
  [表示层],
  [传输层],
  [网络层],
)
]

#question(label: n => [2019 33])[
OSI 参考模型的第5层（自下而上）完成的主要功能是

#choices([差错控制], [路由选择], [会话管理], [数据表示转换])
]
