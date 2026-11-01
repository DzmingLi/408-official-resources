// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：FTP

== 控制连接与数据连接

#question(label: n => [2009 40])[
FTP客户和服务器间传递FTP命令时，使用的连接是

#choices(
  [建立在TCP之上的控制连接],
  [建立在TCP之上的数据连接],
  [建立在UDP之上的控制连接],
  [建立在UDP之上的数据连接],
)
]

#question(label: n => [2017 40])[
下列关于 FTP 协议的叙述中，#emphasis[错误]的是
#choices([数据连接在每次数据传输完毕后就关闭], [控制连接在整个会话期间保持打开状态], [服务器与客户端的 TCP 20端口建立数据连接], [客户端与服务器的 TCP 21端口建立控制连接])
]
