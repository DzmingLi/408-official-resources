// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：散列（hash）表

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#question(label: n => [2010 41])[
（10分）将关键字序列（7，8，30，11，18，9，14）散列存储到散列表中，散列表的存储空间是一个下标从0开始的一维数组，散列函数为：
$H(k e y) = (k e y times 3) "MOD" 7$
，处理冲突采用线性探测再散列法，要求装填（载）因子为0.7。

#subquestions[
+ 请画出所构造的散列表。
  \
+ 
  分别计算等概率情况下查找成功和查找不成功的平均查找长度。
  
    
]
]

#block(breakable: false)[#question(label: n => [2011 9])[
为提高散列（Hash）表的查找效率，可以采取的正确措施是

I. 增大装填（载）因子

Ⅱ. 设计冲突（碰撞）少的散列函数

Ⅲ. 处理冲突（碰撞）时避免产生聚集（堆积）现象

#choices(
  [仅Ⅰ],
  [仅Ⅱ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2014 8])[
用哈希（散列）方法处理冲突（碰撞）时可能出现堆积（聚集）现象。下列选项中，会受堆积现象直接影响的是

#choices(
  [存储效率],
  [散列函数],
  [装填（装载）因子],
  [平均查找长度],
)
]]

#block(breakable: false)[#question(label: n => [2018 9])[
现有长度为7、初始为空的散列表 HT，散列函数 $H(k) = k % 7$，用线性探测再散列法解决冲突。将关键字22，43，15依次插入到 HT 后，查找成功的平均查找长度是

#choices([1.5], [1.6], [2], [3])
]]

#block(breakable: false)[#question(label: n => [2019 8])[
现有长度为11且初始为空的散列表 HT，散列函数是 H(key) = key % 7，采用线性探查（线性探测再散列）法解决冲突。将关键字序列87，40，30，6，11，22，98，20依次插入到 HT 后，HT 查找失败的平均查找长度是

#choices([4], [5.25], [6], [6.29])
]]

#block(breakable: false)[#question(label: n => [2022 9])[
下列因素中，影响散列（哈希）方法平均查找长度的是

#statements(columns: (1fr, 1fr), [Ⅰ．装填因子], [Ⅱ．散列函数], [Ⅲ．冲突解决策略],
)

#choices([Ⅰ、Ⅱ], [Ⅰ、Ⅲ], [Ⅱ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]]
