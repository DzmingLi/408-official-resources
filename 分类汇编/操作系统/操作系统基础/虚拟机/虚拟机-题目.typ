// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：虚拟机

#block(breakable: false)[#question(label: n => [2025 24])[
下列关于虚拟化技术的叙述中，#emphasis[错误]的是

#choices([操作系统可以运行在虚拟机上],[虚拟化技术支持在一台计算机上构建多个虚拟机],[虚拟机监控程序（VMM）与操作系统的特权级相同],[虚拟化技术支持在一台计算机上模拟不同的指令集体系结构])
]]
