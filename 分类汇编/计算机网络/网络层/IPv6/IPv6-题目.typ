// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：IPv6

== IPv6的主要特点

#question(label: n => [2023 40])[
下列关于 IPv4 和 IPv6 的叙述中，正确的是
#statements(columns: 1, [Ⅰ．IPv6 地址空间是 IPv4 地址空间的96倍], [Ⅱ．IPv4 首部和 IPv6 基本首部的长度均可变], [Ⅲ．IPv4 向 IPv6 过渡可以采用双协议栈和隧道技术], [Ⅳ．IPv6 首部的 Hop Limit 字段等价于 IPv4 首部的 TTL 字段])
#choices([Ⅰ、Ⅱ], [Ⅰ、Ⅳ], [Ⅱ、Ⅲ], [Ⅲ、Ⅳ])
]
