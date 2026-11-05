// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：散列（hash）表

=== 2010 41

#subquestions(allow-oversize: true)[
+ 构造的散列表如下：

  #align(center, table(columns: 11, align: center + horizon,
    [下标], [0], [1], [2], [3], [4], [5], [6], [7], [8], [9],
    [关键字], [7], [14], [], [8], [], [11], [30], [18], [9], [],
  ))
+ 查找成功的平均查找长度：$"ASL"_("成功")=12/7$。

  查找不成功的平均查找长度：$"ASL"_("不成功")=18/7$。
]

=== 2011 9：D

=== 2014 8：D

=== 2018 9：C

=== 2019 8：C

=== 2022 9：D

=== 2023 9

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 2024 42

#subquestions(allow-oversize: true)[
+ $H T$ 如下。

  #align(center,table(columns: 11,align: center,stroke: none,
    [0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
    ..([11],[],[14],[7],[],[20],[9],[],[],[3],[18]).map(x=>table.cell(stroke: 0.045em,x)),
  ))

  装填因子 $α=7\/11$。

+ 查找关键字14的关键字比较序列：3，18，14。
+ 查找关键字8，确认查找失败时的散列地址是7。

]

=== 2025 9：A
