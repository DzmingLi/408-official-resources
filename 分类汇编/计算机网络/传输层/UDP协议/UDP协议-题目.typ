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
