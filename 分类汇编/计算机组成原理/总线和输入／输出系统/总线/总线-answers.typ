// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：总线

== 总线的基本概念

=== 2010 20：D

=== 2011 20：C

=== 2012 20：D

=== 2012 21：D

=== 2021 19：C

== 总线的组成及性能指标

=== 2009 20：B

=== 2014 19：C

=== 2019 19：B

=== 2020 19：C

=== 2024 20：B

=== 2025 20：A

== 总线事务和定时

=== 2012 19：C

=== 2013 43

#subquestions(allow-oversize: true)[
+ CPU的时钟周期为：
  $1 \/ 8 0 0 upright(M H z) = 1 . 2 5 upright(n s)$。（1分）
  
  总线的时钟周期为： $1 \/ 2 0 0 upright(M H z) = 5 upright(n s)$。（1分）
  
  总线带宽为：
  $4 upright(B) times 2 0 0 upright(M H z) = 8 0 0 upright(M B \/ s)$或4B/5ns。（1分）
  
+ 
  Cache块大小是32B，因此Cache缺失时需要一个读突发传送总线事务读取一个主存块。（1分）
  
+ 
  一次读突发传送总线事务包括一次地址传送和32B数据传送：用1个总线时钟周期传输地址；每隔
  40
  ns/8=5ns启动一个体工作（各进行1次存取），第一个体读数据花费40ns，之后数据存取与数据传输重叠；用8个总线时钟周期传输数据。读突发传送总线事务时间：
  $5 upright(med n s) + 4 0 upright(med n s) + 8 times 5 upright(med n s) = 8 5 upright(med n s) 。$
  （2分）
  
+ 
  BP的CPU执行时间包括Cache命中时的指令执行时间和Cache缺失时带来的额外开销。命中时的指令执行时间：
  $1 0 0 times 4 times 1 . 2 5 upright(med n s) = 5 0 0 upright(med n s)$。（1分）指令执行过程中Cache缺失时的额外开销：
  $1 . 2 times 1 0 0 times 5 % times 8 5 upright(med n s) = 5 1 0 upright(med n s)$
  。BP的CPU执行时间：
  $5 0 0 upright(med n s) + 5 1 0 upright(med n s) = 1 0 1 0 upright(med n s)$。（2分）
  

]
*【评分说明】*
①执行时间采用如下公式计算时，可酌情给分。

执行时间 = 指令条数 $times$ CPI $times$ 时钟周期 $times$ 命中率 +
访存次数 $times$ 缺失率 $times$ 缺失损失 ②
计算公式正确但运算结果不正确时，可酌情给分。

=== 2014 20：C

=== 2015 19：C

=== 2016 21：A

=== 2017 20：D

=== 2018 21：B

=== 2023 20

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]
