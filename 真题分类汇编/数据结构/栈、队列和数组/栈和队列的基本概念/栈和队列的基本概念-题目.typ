// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：栈和队列的基本概念

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2009 1])[
为解决计算机主机与打印机之间速度不匹配问题，通常设置一个打印数据缓冲区，主机将要输出的数据依次写入该缓冲区，而打印机则依次从该缓冲区中取出数据。该缓冲区的逻辑结构应该是

#choices(
  [栈],
  [队列],
  [树],
  [图],
)
]]

#block(breakable: false)[#question(label: n => [2009 2])[
设栈 S和队列 Q的初始状态均为空，元素
a,b,c,d,e,f,g依次进入栈 S。若每个元素出栈后立即进入队列
Q，且7个元素出队的顺序是 b,d,c,f,e,a,g，则栈 S的容量至少是

#choices(
  [1],
  [2],
  [3],
  [4],
)
]]

#block(breakable: false)[#question(label: n => [2010 1])[
若元素
a，b，c，d，e，f依次进栈，允许进栈、退栈操作交替进行，但不允许连续三次进行退栈操作，则不可能得到的出栈序列是

#choices(
  [d，c，e，b，f，a],
  [c，b，d，a，e，f],
  [b，c，a，e，f，d],
  [a，f，e，d，c，b],
)
]]

#block(breakable: false)[#question(label: n => [2010 2])[
某队列允许在其两端进行入队操作，但仅允许在一端进行出队操作。若元素
a，b，c，d， e依次入此队列后再进行出队操作，则不可能得到的出队序列是

#choices(
  [b，a，c，d，e],
  [d，b，a，c，e],
  [d，b，c，a，e],
  [e，c，b，a，d],
)
]]

#block(breakable: false)[#question(label: n => [2011 2])[
元素
a,b,c,d,e依次进入初始为空的栈中，若元素进栈后可停留、可出栈，直到所有元素都出栈，则在所有可能的出栈序列中，以元素
d开头的序列个数是

#choices(
  [3],
  [4],
  [5],
  [6],
)
]]

#block(breakable: false)[#question(label: n => [2013 2])[
一个栈的入栈序列为1，2，3，…，n，其出栈序列是
$p_1 \, p_2 \, p_3 \, dots.h \, p_n$ 。若 $p_2 = 3$ ，则
$p_3$可能取值的个数是

#choices(
  [n-3],
  [n-2],
  [n-1],
  [无法确定],
)
]]

#block(breakable: false)[#question(label: n => [2018 2])[
现有队列 Q 与栈 S，初始时 Q 中的元素依次是1，2，3，4，5，6（1在队头），S 为空。若仅允许下列3种操作：① 出队并输出出队元素；② 出队并将出队元素入栈；③ 出栈并输出出栈元素，则不能得到的输出序列是

#choices([1, 2, 5, 6, 4, 3], [2, 3, 4, 5, 6, 1], [3, 4, 5, 6, 1, 2], [6, 5, 4, 3, 2, 1])
]]

#block(breakable: false)[#question(label: n => [2020 2])[
对空栈 $S$ 进行 Push 和 Pop 操作，入栈序列为 a，b，c，d，e，经过 Push，Push，Pop，Push，Pop，Push，Push，Pop 操作后，得到的出栈序列是

#choices([b，a，c], [b，a，e], [b，c，a], [b，c，e])
]]

#block(breakable: false)[#question(label: n => [2021 2])[
已知初始为空的队列 Q 的一端仅能进行入队操作，另外一端既能进行入队操作又能进行出队操作。若 Q 的入队序列是1，2，3，4，5，则不能得到的出队序列是

#choices([5，4，3，1，2], [5，3，1，2，4], [4，2，1，3，5], [4，1，3，2，5])
]]

#block(breakable: false)[#question(label: n => [2022 2])[
给定有限符号集 $S$，in 和 out 均为 $S$ 中所有元素的任意排列。对于初始为空的栈 ST，下列叙述中，正确的是

#choices(
  [若 in 是 ST 的入栈序列，则不能判断 out 是否为其可能的出栈序列],
  [若 out 是 ST 的出栈序列，则不能判断 in 是否为其可能的入栈序列],
  [若 in 是 ST 的入栈序列，out 是对应 in 的出栈序列，则 in 与 out 一定不同],
  [若 in 是 ST 的入栈序列，out 是对应 in 的出栈序列，则 in 与 out 可能互为倒序],
)
]]

#question(label: n => [2026 42])[
（本题10分）一个栈的入栈序列是 $1,2,dots.c,n(n>=3)$。请回答下列问题。
#subquestions[
 + 当 $n=9$ 时，是否能得到出栈序列2，3，1，6，4，7，5，9，8？是否能得到出栈序列2，3，1，5，6，7，4，9，8？（2分）
 + 对于由 $1,2,dots.c,n$ 组成的任意序列 $P_1,P_2,dots.c,P_n$ 中的元素 $P_i,P_j,P_k(i<j<k)$，当 $P_i,P_j,P_k$ 的大小满足什么关系时，序列 $P_1,P_2,dots.c,P_n$ 不是可以得到的出栈序列？（2分）
 + 当 $n=4$ 时，可以得到的以2开头的出栈序列的个数是多少？（2分）
 + 若当 $n=k-1$ 时可以得到的出栈序列个数为 $M$，则当 $n=k$ 时可以得到的以1开头的出栈序列的个数是多少？可以得到的以2开头的出栈序列的个数是多少？可以得到的所有出栈序列的个数是多少？（4分）
]
]
