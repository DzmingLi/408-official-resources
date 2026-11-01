// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：折半查找法

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2010 9])[
已知一个长度为16的顺序表
L，其元素按关键字有序排列。若采用折半查找法查找一个
L中不存在的元素，则关键字的比较次数最多是

#choices(
  [4],
  [5],
  [6],
  [7],
)
]]

#block(breakable: false)[#question(label: n => [2015 7])[
下列选项中，不能构成折半查找中关键字比较序列的是

#choices(
  [500, 200, 450, 180],
  [500, 450, 200, 180],
  [180, 500, 200, 450],
  [180, 200, 500, 450],
)
]]

#block(breakable: false)[#question(label: n => [2017 8])[
下列二叉树中，可能成为折半查找判定树（不含外部结点）的是
#choices(
 [#box(cetz.canvas(length: 1.7em, {
   import cetz.draw: *
   let p = ((2.4,3),(1.2,2),(3.6,2),(.45,1),(1.95,1),(2.85,1),(4.35,1),(-.3,0),(1.2,0),(2.1,0))
   for (a,b) in ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(3,7),(4,8),(5,9)) { line(p.at(a),p.at(b),stroke:.05em) }
   for v in p { circle(v,radius:.24,fill:white,stroke:.05em) }
 }))],
 [#box(cetz.canvas(length: 1.7em, {
   import cetz.draw: *
   let p = ((2.4,3),(1.2,2),(3.6,2),(.45,1),(1.95,1),(2.85,1),(4.35,1),(-.3,0),(1.2,0),(3.6,0),(5.1,0))
   for (a,b) in ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(3,7),(4,8),(5,9),(6,10)) { line(p.at(a),p.at(b),stroke:.05em) }
   for v in p { circle(v,radius:.24,fill:white,stroke:.05em) }
 }))],
 [#box(cetz.canvas(length: 1.7em, {
   import cetz.draw: *
   let p = ((2.4,3),(1.2,2),(3.6,2),(.45,1),(1.95,1),(2.85,1),(4.35,1),(1.2,0),(3.6,0))
   for (a,b) in ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(4,7),(5,8)) { line(p.at(a),p.at(b),stroke:.05em) }
   for v in p { circle(v,radius:.24,fill:white,stroke:.05em) }
 }))],
 [#box(cetz.canvas(length: 1.7em, {
   import cetz.draw: *
   let p = ((2.4,3),(1.2,2),(3.6,2),(.45,1),(1.95,1),(2.85,1),(4.35,1),(-.3,0),(2.1,0),(3.6,0))
   for (a,b) in ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(3,7),(5,8),(6,9)) { line(p.at(a),p.at(b),stroke:.05em) }
   for v in p { circle(v,radius:.24,fill:white,stroke:.05em) }
 }))])
]]
