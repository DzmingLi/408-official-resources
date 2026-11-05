// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：层次化存储器的基本结构

#block(breakable: false)[#question(label: n => [2017 14])[
某 C 语言程序段如下：
```c
for(i=0; i<=9; i++)
{
    temp=1;
    for(j=0; j<=i; j++) temp *= a[j];
    sum += temp;
}
```
下列关于数组 a 的访问局部性的描述中，正确的是
#choices([时间局部性和空间局部性皆有], [无时间局部性，有空间局部性], [有时间局部性，无空间局部性], [时间局部性和空间局部性皆无])
]]

#block(breakable: false)[#question(label: n => [2024 16])[
对于页式虚拟存储管理系统，下列关于存储器层次结构的叙述中，#emphasis[错误]的是

#choices([Cache–主存层次的交换单位为主存块，主存–外存层次的交换单位为页], [Cache–主存层次替换算法由硬件实现，主存–外存层次替换算法由软件实现], [Cache–主存层次可采用回写法写策略，主存–外存层次通常采用回写法写策略], [Cache–主存层次可采用直接映射方式，主存–外存层次通常采用直接映射方式])
]]
