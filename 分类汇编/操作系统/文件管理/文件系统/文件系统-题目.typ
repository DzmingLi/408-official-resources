// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：文件系统

== 外存空闲空间管理方法

#block(breakable: false)[#question(label: n => [2014 27])[
现有一个容量为10GB的磁盘分区，磁盘空间以簇（Cluster）为单位进行分配，簇的大小为4KB，若采用位图法管理该分区的空闲空间，即用一位（bit）标识一个簇是否被分配，则存放该位图所需簇的个数为

#choices(
  [80],
  [320],
  [80K],
  [320K],
)
]]

#block(breakable: false)[#question(label: n => [2015 31])[
文件系统用位图法表示磁盘空间的分配情况，位图存于磁盘的32～127号块中，每个盘块占1024个字节，盘块和块内字节均从0开始编号。假设要释放的盘块号为409612，则位图中要修改的位所在的盘块号和块内字节序号分别是

#choices([81、1], [81、2], [82、1], [82、2])
]]

#block(breakable: false)[#question(label: n => [2019 26])[
下列选项中，可用于文件系统管理空闲磁盘块的数据结构是

#statements(columns: (1fr, 1fr), [Ⅰ．位图], [Ⅱ．索引节点],
  [Ⅲ．空闲磁盘块链], [Ⅳ．文件分配表（FAT）],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ、Ⅳ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ、Ⅳ])
]]
