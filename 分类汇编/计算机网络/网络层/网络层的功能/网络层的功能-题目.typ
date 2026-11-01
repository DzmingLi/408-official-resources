// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：网络层的功能

== 路由与转发

#question(label: n => [2011 33])[
TCP/IP参考模型的网络层提供的是

#choices(
  [无连接不可靠的数据报服务],
  [无连接可靠的数据报服务],
  [有连接不可靠的虚电路服务],
  [有连接可靠的虚电路服务],
)
]

#question(label: n => [2021 33])[
在 TCP/IP 参考模型中，由传输层相邻的下一层实现的主要功能是

#choices([对话管理], [路由选择], [端到端报文段传输], [结点到结点流量控制])
]

== SDN基本概念

#question(label: n => [2022 37])[
在 SDN 网络体系结构中，SDN 控制器向数据平面的 SDN 交换机下发流表时所使用的接口是

#choices([东向接口], [南向接口], [西向接口], [北向接口])
]
