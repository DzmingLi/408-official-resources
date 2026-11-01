// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：目录

== 树形目录

#block(breakable: false)[#question(label: n => [2010 31])[
设置当前工作目录的主要目的是

#choices(
  [节省外存空间],
  [节省内存空间],
  [加快文件的检索速度],
  [加快文件的读/写速度],
)
]]

== 目录的操作

#block(breakable: false)[#question(label: n => [2013 23])[
用户在删除某文件的过程中，操作系统不可能执行的操作是

#choices(
  [删除此文件所在的目录],
  [删除与此文件关联的目录项],
  [删除与此文件对应的文件控制块],
  [释放与此文件关联的内存缓冲区],
)
]]

#block(breakable: false)[#question(label: n => [2021 30])[
若目录 dir 下有文件 file1，则为删除该文件内核#emphasis[不必]完成的工作是

#choices([删除 file1 的快捷方式], [释放 file1 的文件控制块], [释放 file1 占用的磁盘空间], [删除目录 dir 中与 file1 对应的目录项])
]]

== 硬链接和软链接

#block(breakable: false)[#question(label: n => [2009 31])[
设文件 F1的当前引用计数值为1，先建立
F1的符号链接（软链接）文件 F2，再建立 F1的硬链接文件 F3，然后删除
F1。此时，F2和F3的引用计数值分别是

#choices(
  [0、1],
  [1、1],
  [1、2],
  [2、1],
)
]]

#block(breakable: false)[#question(label: n => [2017 31])[
若文件 f1 的硬链接为 f2，两个进程分别打开 f1 和 f2，获得对应的文件描述符为 fd1 和 fd2，则下列叙述中，正确的是
#statements(columns: 1, [Ⅰ．f1 和 f2 的读写指针位置保持相同], [Ⅱ．f1 和 f2 共享同一个内存索引结点], [Ⅲ．fd1 和 fd2 分别指向各自的用户打开文件表中的一项])
#choices([仅Ⅲ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ和Ⅲ])
]]
