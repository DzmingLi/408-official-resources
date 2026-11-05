// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：差错控制

== 检错编码

#question(label: n => [2023 37])[
若甲向乙发送数据时采用 CRC 校验，生成多项式为 $G(X)=X^4+X+1$（即 $G=10011$），则乙接收到下列比特串时，可以断定其在传输过程中未发生错误的是
#choices([1 0111 0000], [1 0111 0100], [1 0111 1000], [1 0111 1100])
]

== 纠错编码

#question(label: n => [2013 15])[
用海明码对长度为8位的数据进行检/纠错时，若能纠正一位错，则校验位数至少为

#choices(
  [2],
  [3],
  [4],
  [5],
)
]

#question(label: n => [2025 34])[
若某差错编码的编码集为{1001 1010，0101 1100，1111 0000，0000 1111}，则该差错编码的检错和纠错能力是

#choices([不超过2位错的100%检错、不超过1位错的纠错],[不超过2位错的100%检错、不超过2位错的纠错],[不超过3位错的100%检错、不超过1位错的纠错],[不超过3位错的100%检错、不超过2位错的纠错])
]
