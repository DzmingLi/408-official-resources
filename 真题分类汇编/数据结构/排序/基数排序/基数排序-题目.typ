// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：基数排序

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2013 11])[
对给定的关键字序列110，119，007，911，114，120，122进行基数排序，则第2趟分配收集后得到的关键字序列是

#choices(
  [007，110，119，114，911，120，122],
  [007，110，119，114，911，122，120],
  [007，110，911，114，119，120，122],
  [110，120，911，122，114，007，119],
)
]]

#block(breakable: false)[#question(label: n => [2015 9])[
下列排序算法中，元素的移动次数与关键字的初始排列次序无关的是

#choices([直接插入排序], [起泡排序], [基数排序], [快速排序])
]]

#block(breakable: false)[#question(label: n => [2021 10])[
设数组 S[] = {93，946，372，9，146，151，301，485，236，327，43，892}，采用最低位优先（LSD）基数排序将 S 排列成升序序列。第1趟分配、收集后，元素372之前、之后紧邻的元素分别是

#choices([43，892], [236，301], [301，892], [485，301])
]]

#block(breakable: false)[#question(label: n => [2026 10])[
某考试考查了课程 C1 和 C2，C1、C2 成绩及总成绩（C1、C2 成绩之和）均保存在数组 $M$ 中。现需根据考生的总成绩从高到低进行排名，总成绩相同者的排名由 C1 成绩从高到低决定，C1 成绩也相同者的排名由初始相对次序决定。假设先按 C1 成绩对 $M$ 排序，再按总成绩对 $M$ 排序，能得到正确的排名结果，则下列算法中，采用的是
#choices([基数排序], [快速排序], [希尔排序], [选择排序])
]]
