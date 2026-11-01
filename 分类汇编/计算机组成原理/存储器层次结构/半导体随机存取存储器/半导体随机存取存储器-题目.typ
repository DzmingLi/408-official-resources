// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：半导体随机存取存储器

== DRAM存储器

#block(breakable: false)[#question(label: n => [2015 17])[
下列存储器中，在工作期间需要周期性刷新的是

#choices([SRAM], [SDRAM], [ROM], [FLASH])
]]

#block(breakable: false)[#question(label: n => [2018 17])[
假定 DRAM 芯片中存储阵列的行数为 $r$、列数为 $c$，对于一个 $2 "K" times 1$ 位的 DRAM 芯片，为保证其地址引脚数最少，并尽量减少刷新开销，则 $r$、$c$ 的取值分别是

#choices([2048，1], [64，32], [32，64], [1，2048])
]]

== Flash存储器

#block(breakable: false)[#question(label: n => [2012 16])[
下列关于闪存（Flash Memory）的叙述中，错误的是

#choices(
  [信息可读可写，并且读、写速度一样快],
  [存储元由MOS管组成，是一种半导体存储器],
  [掉电后信息不丢失，是一种非易失性存储器],
  [采用随机访问方式，可替代计算机外部存储器],
)
]]
