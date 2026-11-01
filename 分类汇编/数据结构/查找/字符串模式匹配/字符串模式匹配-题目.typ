// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：字符串模式匹配

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2015 8])[
已知字符串 $s$ 为“abaabaabacacaabaabcc”，模式串 $t$ 为“abaabc”。采用KMP算法进行匹配，第一次出现“失配”（$s[i] != t[j]$）时，$i = j = 5$，则下次开始匹配时，$i$ 和 $j$ 的值分别是

#choices(
  [$i = 1, j = 0$],
  [$i = 5, j = 0$],
  [$i = 5, j = 2$],
  [$i = 6, j = 2$],
)
]]

#block(breakable: false)[#question(label: n => [2019 9])[
设主串 T = "abaabaabcabaabc"，模式串 S = "abaabc"，采用 KMP 算法进行模式匹配，到匹配成功时为止，在匹配过程中进行的单个字符间的比较次数是

#choices([9], [10], [12], [15])
]]
