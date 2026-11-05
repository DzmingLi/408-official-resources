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

#block(breakable: false)[#question(label: n => [2023 9])[
现有长度为5、初始为空的散列表 HT，散列函数 $H(k)=(k+4) "%" 5$，用线性探查再散列法解决冲突。若将关键字序列2022，12，25依次插入 HT 中，然后删除关键字25，则 HT 中查找失败的平均查找长度为
#choices([1], [1.6], [1.8], [2.2])
]]

#question(label: n => [2024 42])[
（本题10分）将关键字序列20，3，11，18，9，14，7依次存储到初始为空、长度为11的散列表 $H T$ 中，散列函数 $H("key")=("key" times 3) % 11$。$H("key")$ 计算出的初始散列地址为 $H_0$，发生冲突时探查地址序列是 $H_1,H_2,H_3,dots$，其中，$H_k=(H_0+k^2)%11$，$k=1,2,3,dots$。

请回答下列问题。

#subquestions[
+ 画出所构造的 $H T$，并计算 $H T$ 的装填因子。（6分）
+ 给出在 $H T$ 中查找关键字14的关键字比较序列。（2分）
+ 在 $H T$ 中查找关键字8，确认查找失败时的散列地址是多少？（2分）
]
]

#block(breakable: false)[#question(label: n => [2025 9])[
下列关于散列方法处理冲突的叙述中，正确的是

#choices([只要散列表不满，线性探查再散列一定能找到一个空闲位置],[只要散列表不满，二次探查再散列一定能找到一个空闲位置],[线性探查再散列处理的冲突，一定是发生在同义词之间的冲突],[二次探查再散列处理的冲突，一定是发生在非同义词之间的冲突])
]]
