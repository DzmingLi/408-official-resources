// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：文件系统

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

#block(breakable: false)[#question(label: n => [2024 26])[
文件系统需占用部分外存空间记录空闲块位置。下列方法中，占用外存空间的大小与当前空闲块数量无关的是

#choices([位图法], [空闲表法], [成组链接法], [空闲链表法])
]]

#block(breakable: false)[#question(label: n => [2025 31])[
下列选项中，文件系统可用于记录外存空间使用情况的是

#choices([目录],[系统打开文件表],[文件分配表（FAT）],[文件控制块（FCB）])
]]

#question(label: n => [2026 46])[
（本题8分）某基于索引节点（inode）的文件系统的目录项由文件名和索引节点号构成。磁盘中存放了索引节点表、位图、目录等元数据以及文件数据，盘块大小为4 KB，盘块号占4 B。索引节点表包含了所有文件的索引节点，位于从100号盘块开始的4096个连续盘块中，索引节点号是索引节点在该表中的序号，从0开始编号。每个索引节点占128 B，包含直接地址项5个，一次间接地址项、二次间接地址项、三次间接地址项各1个。磁盘块位图和索引节点位图分别用于描述磁盘块和索引节点占用情况，0表示未占用，1表示已占用。某子目录树如题46图所示，其中各文件的文件名和索引节点号如题46表所示，file 大小为30 KB。
#grid(columns: (1fr, 1fr), gutter: 2em,
 figure(image("../../../../历年真题+参考解答/2026/official-images/q46-directory.png", width: 12em), caption: [题46图]),
 figure(table(columns: (5em, 7em), align: center,
 [文件名], [索引节点号], [dir], [100], [dir1], [201], [file], [1000]), kind: table, caption: [题46表]))
请回答下列问题。
#subquestions[
 + file 的索引节点存放在磁盘的几号盘块中？若 file 的索引节点已读入内存，则访问 file 中偏移地址为21460的一个字节数据，最多需要访问几个磁盘块？该文件系统在空间足够大的磁盘中最多能创建多少个文件？（3分）
 + 若要删除目录 dir1，则文件系统需要对哪些元数据执行哪些操作？（5分）
]
]

== 虚拟文件系统

#block(breakable: false)[#question(label: n => [2025 28])[
下列关于虚拟文件系统（VFS）的叙述中，正确的是

#choices([VFS 是在虚拟内存中建立的文件系统],[VFS 能提高不同文件系统中文件的访问速度],[VFS 定义了可以访问不同文件系统的统一接口],[通过 VFS 只能访问本地文件，不能访问网络文件])
]]
