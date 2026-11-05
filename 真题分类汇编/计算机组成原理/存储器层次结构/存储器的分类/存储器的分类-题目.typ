// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：存储器的分类

#block(breakable: false)[#question(label: n => [2010 16])[
下列有关 RAM 和 ROM的叙述中，正确的是

I. RAM是易失性存储器，ROM是非易失性存储器

Ⅱ. RAM和ROM都采用随机存取方式进行信息访问

Ⅲ. RAM和ROM都可用作 Cache

Ⅳ. RAM和ROM都需要进行刷新

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅱ和Ⅲ],
  [仅Ⅰ、Ⅱ和Ⅳ],
  [仅Ⅱ、Ⅲ和Ⅳ],
)
]]

#block(breakable: false)[#question(label: n => [2011 14])[
下列各类存储器中，不采用随机存取方式的是

#choices(
  [EPROM],
  [CDROM],
  [DRAM],
  [SRAM],
)
]]
