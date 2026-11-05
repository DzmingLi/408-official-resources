// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：I/O管理基础

== I/O控制方式

=== 2017 32：B

== I/O软件层次结构

=== 2011 26：B

=== 2012 26：A

=== 2013 25：C

=== 2022 32：A

=== 2023 46

本仓库尚未收录本题参考答案。

=== 2024 31：C

=== 2025 46

#subquestions(allow-oversize: true)[
+ 进程控制块位于内核区。该进程处于阻塞态。
+ main() 函数的代码位于只读代码段。scanf() 和 printf() 的功能需要通过执行驱动程序实现。
+ $p t r$ 被分配在可读写数据段中。$l e n g t h$ 会被分配在用户栈中。$p t r$ 指向的字符串位于运行时堆中。

]

=== 2026 32

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]
