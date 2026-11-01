// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：线性表的实现

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

== 链式存储

#block(breakable: false)[#question(label: n => [2013 1])[
已知两个长度分别为 m和
n的升序链表，若将它们合并为一个长度为
m+n的降序链表，则最坏情况下的时间复杂度是

#choices(
  [$O(n)$],
  [$O(m times n)$],
  [$O(min(m, n))$],
  [$O(max(m, n))$],
)
]]

#block(breakable: false)[#question(label: n => [2016 1])[
已知表头元素为 c 的单链表在内存中的存储状态如下表所示。

#align(center, table(columns: (4em, 3em, 6em), align: center, stroke: none,
  [地址], [元素], [链接地址],
  [1000H], table.cell(stroke: 0.5pt)[a], table.cell(stroke: 0.5pt)[1010H],
  [1004H], table.cell(stroke: 0.5pt)[b], table.cell(stroke: 0.5pt)[100CH],
  [1008H], table.cell(stroke: 0.5pt)[c], table.cell(stroke: 0.5pt)[1000H],
  [100CH], table.cell(stroke: 0.5pt)[d], table.cell(stroke: 0.5pt)[NULL],
  [1010H], table.cell(stroke: 0.5pt)[e], table.cell(stroke: 0.5pt)[1004H],
  [1014H], table.cell(stroke: 0.5pt)[], table.cell(stroke: 0.5pt)[],
))

现将 f 存放于1014H处并插入到单链表中，若 f 在逻辑上位于 a 和 e 之间，则 a，e，f 的“链接地址”依次是
#choices([1010H,1014H,1004H], [1010H,1004H,1014H], [1014H,1010H,1004H], [1014H,1004H,1010H])
]]

#block(breakable: false)[#question(label: n => [2016 2])[
已知一个带有表头结点的双向循环链表 $L$，结点结构为 #inline-node([prev], [data], [next])，其中，prev 和 next 分别是指向其直接前驱和直接后继结点的指针。现要删除指针 $p$ 所指的结点，正确的语句序列是
#choices(
  [`p->next->prev=p->prev; p->prev->next=p->prev; free(p);`],
  [`p->next->prev=p->next; p->prev->next=p->next; free(p);`],
  [`p->next->prev=p->next; p->prev->next=p->prev; free(p);`],
  [`p->next->prev=p->prev; p->prev->next=p->next; free(p);`],
)
]]

#block(breakable: false)[#question(label: n => [2021 1])[
已知头指针 h 指向一个带头结点的非空单循环链表，结点结构为 #inline-node(columns:2,[data],[next])，其中 next 是指向直接后继结点的指针，p 是尾指针，q 是临时指针。现要删除该链表的第一个元素，正确的语句序列是

#choices(
  [`h->next = h->next->next; q = h->next; free(q);`],
  [`q = h->next; h->next = h->next->next; free(q);`],
  [`q = h->next; h->next = q->next; if(p != q)p = h; free(q);`],
  [`q = h->next; h->next = q->next; if(p == q)p = h; free(q);`],
)
]]
