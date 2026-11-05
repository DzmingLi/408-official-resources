// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：散列（hash）表

=== 2010 41

#subquestions(after-heading: true, allow-oversize: true)[
+ 由装载因子0.7，数据总数7个
  $arrow.r$存储空间长度为 $10 arrow.r P = 10$ 。所以，构造的散列表为：

  $ upright("H") \( 7 \) = \( 7 times 3 \) upright("MOD") 7 = 0 $

  $ upright("H") \( 8 \) = \( 8 times 3 \) upright("MOD") 7 = 3 $

  $ upright("H") \( 11 \) = \( 11 times 3 \) upright("MOD") 7 = 5 $

  $ upright("H") \( 18 \) = \( 18 times 3 \) upright("MOD") 7 = 5 $

  $ upright("H") \( 9 \) = \( 9 times 3 \) upright("MOD") 7 = 6 $

  $ upright("H") \( 14 \) = \( 14 times 3 \) upright("MOD") 7 = 0 $

  $ upright("H") \( 30 \) = \( 30 times 3 \) upright("MOD") 7 = 6 $

  #figure(
    align(center)[#table(
      columns: 11,
      align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
      [下标], [0], [1], [2], [3], [4], [5], [6], [7], [8], [9],
      [关键字], [7], [14], [], [8], [], [11], [30], [18], [9], [],
    )]
    , kind: table
    )

+ 查找成功的平均查找长度：
  $upright("ASL")_(upright("成功")) = \( 1 + 1 + 1 + 1 + 2 + 3 + 3 \) \/ 7 = 12 \/ 7 。$查找不成功的平均查找长度：
  $upright("ASL")_(upright("不成功")) = \( 3 + 2 + 1 + 2 + 1 + 5 + 4 \) \/ 7 = 18 \/ 7 。$

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
