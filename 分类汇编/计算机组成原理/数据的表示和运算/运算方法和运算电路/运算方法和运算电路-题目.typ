// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：运算方法和运算电路

== 加/减运算

#block(breakable: false)[#question(label: n => [2011 17])[
某机器有一个标志寄存器，其中有进位/借位标志CF、零标志ZF、符号标志SF和溢出标志OF，条件转移指令bgt（无符号整数比较大于时转移）的转移条件是

#choices(
  [$"CF" + "OF" = 1$],
  [$overline("SF") + "ZF" = 1$],
  [$overline("CF" + "ZF") = 1$],
  [$overline("CF" + "SF") = 1$],
)
]]

#block(breakable: false)[#question(label: n => [2018 19])[
减法指令“`sub R1, R2, R3`”的功能为“（R1）-（R2）→R3”，该指令执行后将生成进位/借位标志 CF 和溢出标志 OF。若（R1）=FFFF FFFFH，（R2）=FFFF FFF0H，则该减法指令执行后，CF 与 OF 分别为

#choices([CF=0，OF=0], [CF=1，OF=0], [CF=0，OF=1], [CF=1，OF=1])
]]
