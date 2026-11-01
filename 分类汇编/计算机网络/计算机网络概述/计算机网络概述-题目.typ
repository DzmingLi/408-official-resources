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
