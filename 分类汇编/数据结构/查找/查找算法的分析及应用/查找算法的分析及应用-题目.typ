// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：查找算法的分析及应用

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#question(label: n => [2013 42])[
（10分）设包含4个数据元素的集合
$S$ = \{“do”，“for”，“repeat”，“while”\}，各元素的查找概率依次为：
$p_1 = 0.35$，$p_2 = 0.15$，$p_3 = 0.15$，$p_4 = 0.35$。将
S保存在一个长度为4的顺序表中，采用折半查找法，查找成功时的平均查找长度为2.2。请回答：

#subquestions[
+ 若采用顺序存储结构保存
  S，且要求平均查找长度更短，则元素应如何排列？应使用何种查找方法？查找成功时的平均查找长度是多少？
  \
+ 若采用链式存储结构保存
  S，且要求平均查找长度更短，则元素应如何排列？应使用何种查找方法？查找成功时的平均查找长度是多少？
  
    
]
]

#block(breakable: false)[#question(label: n => [2016 9])[
在有 $n$（$n > 1000$）个元素的升序数组 A 中查找关键字 $x$，查找算法的伪代码如下所示。

```text
k = 0;
while(k<n 且 A[k]<x) k=k+3;
if(k<n 且 A[k]==x) 查找成功;
else if(k-1<n 且 A[k-1]==x) 查找成功;
     else if(k-2<n 且 A[k-2]==x) 查找成功;
          else 查找失败;
```

本算法与折半查找算法相比，有可能具有更少比较次数的情形是
#choices([当 $x$ 不在数组中], [当 $x$ 接近数组开始处], [当 $x$ 接近数组结尾处], [当 $x$ 位于数组中间位置])
]]
