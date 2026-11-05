// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：线性表的实现

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

== 顺序存储

#block(breakable: false)[#question(label: n => [2023 1])[
下列对顺序存储的有序表（长度为 $n$）实现给定操作的算法中，平均时间复杂度为 $O(1)$ 的是
#choices([查找包含指定值元素的算法], [插入包含指定值元素的算法], [删除第 $i(1<=i<=n)$ 个元素的算法], [获取第 $i(1<=i<=n)$ 个元素的算法])
]]

#block(breakable: false)[#question(label: n => [2026 1])[
线性表 $L$ 含有 $n(n>=3)$ 个元素，采用顺序存储方式保存。在 $L$ 中原有元素相对次序保持不变且仍有空闲存储空间的情况下，下列操作中，一定会移动多个元素的是
#statements(columns: 2, [Ⅰ．在表头插入一个元素], [Ⅱ．在表头删除一个元素], [Ⅲ．在表尾插入一个元素], [Ⅳ．在表尾删除一个元素])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ])
]]

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

#block(breakable: false)[#question(label: n => [2023 2])[
现有非空双向链表 $L$，其结点结构为：#inline-node([prev], [data], [next])，prev 是指向直接前驱结点的指针，next 是指向直接后继结点的指针。若要在 $L$ 中指针 p 所指向的结点（非尾结点）之后插入指针 s 指向的新结点，则在执行了语句序列“`s->next=p->next; p->next=s;`”后，下列语句序列中还需要执行的是
#choices([`s->next->prev=p; s->prev=p;`], [`p->next->prev=s; s->prev=p;`], [`s->prev=s->next->prev; s->next->prev=s;`], [`p->next->prev=s->prev; s->next->prev=p;`])
]]

#block(breakable: false)[#question(label: n => [2024 1])[
已知带头结点的非空单链表 $L$ 的头指针为 $h$，结点结构为 #inline-node(columns: 2, [data], [next])，其中 next 是指向直接后继结点的指针。现有指针 $p$ 和 $q$，若 $p$ 指向 $L$ 中非首且非尾的任意一个结点，则执行语句序列“q=p->next; p->next=q->next; q->next=h->next; h->next=q;”的结果是

#choices([在 $p$ 所指结点后插入 $q$ 所指结点], [在 $q$ 所指结点后插入 $p$ 所指结点], [将 $p$ 所指结点移到 $L$ 的头结点之后], [将 $q$ 所指结点移到 $L$ 的头结点之后])
]]

#block(breakable: false)[#question(label: n => [2026 2])[
已知带头结点的双向链表 $L$ 含有 $n(n>=3)$ 个元素，结点结构为 #inline-node([p2], [d], [p1])，其中，p2 和 p1 分别是指向其直接前驱和直接后继结点的指针，指针 head 指向头结点，指针 cu = head。现要将 $L$ 各结点中的 p2 指针修改为指向 p1 所指结点的直接后继结点。当指针指向的结点不存在时，相应的指针值为 NULL。下列选项中，可以完成修改功能的是
#choices(
 [`while(cu!=NULL){cu->p2=cu->p1->p1; cu=cu->p1;}`],
 [`while(cu!=NULL&&cu->p2!=NULL){cu->p2=cu->p1->p1; cu=cu->p1;}`],
 [`while(cu!=NULL){if(cu->p1!=NULL){cu->p2=cu->p1->p1; cu=cu->p1;}}`],
 [`while(cu!=NULL){if(cu->p1!=NULL) cu->p2=cu->p1->p1; else cu->p2=NULL; cu=cu->p1;}`])
]]
