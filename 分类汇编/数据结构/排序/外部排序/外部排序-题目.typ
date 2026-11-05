// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：外部排序

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#question(label: n => [2012 41])[
（10分）设有6个有序表A、B、C、D、E、F，分别含有10、35、40、50、60和200个数据元素，各表中元素按升序排列。要求通过5次两两合并，将6个表最终合并成1个升序表，并在最坏情况下比较的总次数达到最小。请回答下列问题。

#subquestions[
+ 
  给出完整的合并过程，并求出最坏情况下比较的总次数。
  \
+ 根据你的合并过程，描述 n （ $n gt.eq 2$
  ）个不等长升序表的合并策略，并说明理由。
  
    
]
]

#block(breakable: false)[#question(label: n => [2016 11])[
对10 TB的数据文件进行排序，应使用的方法是
#choices([希尔排序], [堆排序], [快速排序], [归并排序])
]]

#block(breakable: false)[#question(label: n => [2019 11])[
设外存上有120个初始归并段，进行12路归并时，为实现最佳归并，需要补充的虚段个数是

#choices([1], [2], [3], [4])
]]

#question(label: n => [2023 42])[
（10分）对含有 $n(n>0)$ 个记录的文件进行外部排序，采用置换-选择排序生成初始归并段时需要使用一个工作区，工作区中能保存 $m$ 个记录。请回答下列问题。
#subquestions[
 + 若文件中含有19个记录，其关键字依次是51，94，37，92，14，63，15，99，48，56，23，60，31，17，43，8，90，166，100，则当 $m=4$ 时，可生成几个初始归并段？各是什么？
 + 对任意的 $m(n >> m > 0)$，生成的第一个初始归并段的长度最大值和最小值分别是多少？
]
]

#block(breakable: false)[#question(label: n => [2024 11])[
在外排序中，利用败者树对初始为升序的归并段进行多路归并，败者树中记录“冠军”的结点保存的是

#choices([最大关键字], [最小关键字], [最大关键字所在的归并段号], [最小关键字所在的归并段号])
]]

#block(breakable: false)[#question(label: n => [2026 11])[
采用 $k$-路归并对外存中保存的数据进行排序，排序的趟数记为 $d$。下列叙述中，正确的是
#statements(columns: 1, [Ⅰ．增大 $k$ 的值可能减小 $d$ 的值], [Ⅱ．初始归并段的个数不影响 $d$ 的值], [Ⅲ．可用内存大小限制了初始归并段的最大长度])
#choices([仅Ⅰ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ])
]]
