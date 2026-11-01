// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：栈和队列的顺序存储结构

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2011 3])[
已知循环队列存储在一维数组
A[0..n-1]中，且队列非空时front和rear分别指向队头元素和队尾元素。若初始时队列为空，且要求第1个进入队列的元素存储在A[0]处，则初始时front和rear的值分别是

#choices(
  [0,0],
  [0,n-1],
  [n-1,0],
  [n-1,n-1],
)
]]

#block(breakable: false)[#question(label: n => [2014 3])[
循环队列存放在一维数组 $A[0 dots M - 1]$ 中，$italic("end1")$ 指向队头元素，$italic("end2")$ 指向队尾元素的后一个位置。假设队列两端均可进行入队和出队操作，队列中最多能容纳 $M - 1$ 个元素，初始时为空。下列判断队空和队满的条件中，正确的是

#choices(
  [队空：$italic("end1") == italic("end2")$；队满：$italic("end1") == (italic("end2") + 1) mod M$],
  [队空：$italic("end1") == italic("end2")$；队满：$italic("end2") == (italic("end1") + 1) mod (M - 1)$],
  [队空：$italic("end2") == (italic("end1") + 1) mod M$；队满：$italic("end1") == (italic("end2") + 1) mod M$],
  [队空：$italic("end1") == (italic("end2") + 1) mod M$；队满：$italic("end2") == (italic("end1") + 1) mod (M - 1)$],
)
]]
