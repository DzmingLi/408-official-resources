// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：UDP协议

== UDP数据报

#question(label: n => [2018 39])[
UDP 协议实现分用（demultiplexing）时所依据的头部字段是

#choices([源端口号], [目的端口号], [长度], [校验和])
]

#question(label: n => [2021 39])[
若大小为12 B的应用层数据分别通过1个 UDP 数据报和1个 TCP 段传输，则该 UDP 数据报和 TCP 段实现的有效载荷（应用层数据）最大传输效率分别是

#choices([37.5%，16.7%], [37.5%，37.5%], [60.0%，16.7%], [60.0%，37.5%])
]

== UDP校验

#question(label: n => [2014 39])[
下列关于 UDP 协议的叙述中，正确的是

I. 提供无连接服务

Ⅱ. 提供复用/分用服务

Ⅲ. 通过差错校验，保障可靠数据传输

#choices(
  [仅Ⅰ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ、Ⅲ],
)
]

#question(label: n => [2024 39])[
若 UDP 协议在计算校验和过程中，计算得到中间结果为1011 1001 1011 0110时，还需要加上最后一个16位数0110 0101 1100 0101，则最终计算得到的校验和是

#choices([0001 1111 0111 1011], [0001 1111 0111 1100], [1110 0000 1000 0011], [1110 0000 1000 0100])
]

#question(label: n => [2025 37])[
假设路由器实现 NAT 功能，内网中主机 H 的 IP 地址为192.168.1.5/24。若 H 运行某应用向 Internet 发送了一个 UDP 报文段，则路由器在转发封装该 UDP 报文段的 IP 数据报的过程中，UDP 报文段的首部字段会被修改的是

#statements(columns: (1fr,1fr,1fr,1fr),[Ⅰ．源端口号],[Ⅱ．目的端口号],[Ⅲ．总长度],[Ⅳ．校验和])

#choices([仅Ⅰ、Ⅲ],[仅Ⅰ、Ⅳ],[仅Ⅱ、Ⅲ],[仅Ⅱ、Ⅳ])
]
