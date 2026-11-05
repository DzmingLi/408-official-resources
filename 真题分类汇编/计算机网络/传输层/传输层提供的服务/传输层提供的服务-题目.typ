// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：传输层提供的服务

== 传输层的功能

#question(label: n => [2009 33])[
在OSI参考模型中，自下而上第一个提供端到端服务的层次是

#choices(
  [数据链路层],
  [传输层],
  [会话层],
  [应用层],
)
]

== 无连接服务与面向连接服务

#question(label: n => [2015 33])[
通过POP3协议接收邮件时，使用的传输层服务类型是

#choices(
  [无连接不可靠的数据传输服务],
  [无连接可靠的数据传输服务],
  [有连接不可靠的数据传输服务],
  [有连接可靠的数据传输服务],
)
]

#question(label: n => [2018 33])[
下列 TCP/IP 应用层协议中，可以使用传输层无连接服务的是

#choices([FTP], [DNS], [SMTP], [HTTP])
]
