// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：计算机系统层次结构

== 计算机硬件的基本结构

#block(breakable: false)[#question(label: n => [2018 12])[
冯·诺依曼结构计算机中数据采用二进制编码表示，其主要原因是

Ⅰ．二进制的运算规则简单 \
Ⅱ．制造两个稳态的物理器件较容易 \
Ⅲ．便于用逻辑门电路实现算术运算

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ和Ⅲ])
]]

== 计算机系统的工作原理

#block(breakable: false)[#question(label: n => [2015 12])[
计算机硬件能够直接执行的是

#statements(
  columns: (1fr, 1fr, 1fr),
  [Ⅰ．机器语言程序], [Ⅱ．汇编语言程序], [Ⅲ．硬件描述语言程序],
)

#choices([仅Ⅰ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2019 12])[
下列关于冯·诺依曼结构计算机基本思想的叙述中，错误的是

#choices(
  [程序的功能都通过中央处理器执行指令实现],
  [指令和数据都用二进制表示，形式上无差别],
  [指令按地址访问，数据都在指令中直接给出],
  [程序执行前，指令和数据需预先存放在存储器中],
)
]]
