// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：文件

== 文件元数据和索引节点（inode）

#block(breakable: false)[#question(label: n => [2020 31])[
某文件系统的目录项由文件名和索引节点号构成。若每个目录项长度为64字节，其中4个字节存放索引节点号，60个字节存放文件名，文件名由小写英文字母构成，则该文件系统能创建的文件数量的上限为

#choices([$2^26$], [$2^32$], [$2^60$], [$2^64$])
]]

== 文件的操作

#block(breakable: false)[#question(label: n => [2014 29])[
在一个文件被用户进程首次打开的过程中，操作系统需做的是

#choices(
  [将文件内容读到内存中],
  [将文件控制块读到内存中],
  [修改文件控制块中的读写权限],
  [将文件的数据缓冲区首指针返回给用户进程],
)
]]

#block(breakable: false)[#question(label: n => [2020 23])[
若多个进程共享同一个文件 F，则下列叙述中，正确的是

#choices([各进程只能用“读”方式打开文件 F], [在系统打开文件表中仅有一个表项包含 F 的属性], [各进程的用户打开文件表中关于 F 的表项内容相同], [进程关闭 F 时，系统删除 F 在系统打开文件表中的表项])
]]

#block(breakable: false)[#question(label: n => [2023 31])[
若文件 F 仅被进程 P 打开并访问，则当进程 P 关闭 F 时，下列操作中，文件系统需要完成的是
#choices([删除目录中文件 F 的目录项], [释放 F 的索引节点所占的内存空间], [释放 F 的索引节点所占的外存空间], [将文件磁盘索引节点中的链接计数减1])
]]

#block(breakable: false)[#question(label: n => [2024 29])[
下列系统调用的实现中，包含文件按名查找功能的是

#choices([open()], [read()], [write()], [close()])
]]

== 文件的保护

#block(breakable: false)[#question(label: n => [2009 30])[
文件系统中，文件访问控制信息存储的合理位置是

#choices(
  [文件控制块],
  [文件分配表],
  [用户口令表],
  [系统注册表],
)
]]

#block(breakable: false)[#question(label: n => [2017 30])[
某文件系统中，针对每个文件，用户类别分为4类：安全管理员、文件主、文件主的伙伴、其他用户；访问权限分为5种：完全控制、执行、修改、读取、写入。若文件控制块中用二进制位串表示文件权限，为表示不同类别用户对一个文件的访问权限，则描述文件权限的位数至少应为
#choices([5], [9], [12], [20])
]]

== 文件的物理结构

#block(breakable: false)[#question(label: n => [2009 28])[
下列文件物理结构中，适合随机访问且易于文件扩展的是

#choices(
  [连续结构],
  [索引结构],
  [链式结构且磁盘块定长],
  [链式结构且磁盘块变长],
)
]]

#block(breakable: false)[#question(label: n => [2010 30])[
设文件索引节点中有7个地址项，其中4个地址项是直接地址索引，2个地址项是一级间接地址索引，1个地址项是二级间接地址索引，每个地址项大小为4字节。若磁盘索引块和磁盘数据块大小均为256字节，则可表示的单个文件最大长度是

#choices(
  [33KB],
  [519KB],
  [1057KB],
  [16513KB],
)
]]

#question(label: n => [2011 46])[
（7分）某文件系统为一级目录结构，文件的数据一次性写入磁盘，已写入的文件不可修改，但可多次创建新文件。请回答如下问题。

#subquestions[
+ 
  在连续、链式、索引三种文件的数据块组织方式中，哪种更合适？要求说明理由。为定位文件数据块，需在FCB中设计哪些相关描述字段？
  \
+ 
  为快速找到文件，对于FCB，是集中存储好，还是与对应的文件数据块连续存储好？要求说明理由。
  
    
]
]

#question(label: n => [2012 46])[
（8分）某文件系统空间的最大容量为
$4 "TB" space (1 "T" = 2^40)$
，以磁盘块为基本分配单位，磁盘块大小为1KB。文件控制块（FCB）包含一个512B的索引表区。请回答下列问题。

#subquestions[
+ 
  假设索引表区仅采用直接索引结构，索引表区存放文件占用的磁盘块号。索引表项中块号最少占多少字节？可支持的单个文件最大长度是多少字节？
  \
+ 假设索引表区采用如下结构：第0～7字节采用
  〈起始块号，块数〉格式表示文件创建时预分配的连续存储空间，其中起始块号占6B，块数占2B；剩余504字节采用直接索引结构，一个索引项占6B，则可支持的单个文件最大长度是多少字节？为了使单个文件的长度达到最大，请指出起始块号和块数分别所占字节数的合理值并说明理由。
  
    
]
]

#block(breakable: false)[#question(label: n => [2013 24])[
为支持
CD-ROM中视频文件的快速随机播放，播放性能最好的文件数据块组织方式是

#choices(
  [连续结构],
  [链式结构],
  [直接索引结构],
  [多级索引结构],
)
]]

#block(breakable: false)[#question(label: n => [2013 26])[
若某文件系统索引结点（inode）中有直接地址项和间接地址项，则下列选项中，与单个文件长度#underline(
  stroke: (
    thickness: 0.75pt,
    dash: (array: (0pt, 1em), phase: 0.5em),
    cap: "round",
  ),
  offset: 1.8pt,
)[无关]的因素是

#choices(
  [索引结点的总数],
  [间接地址索引的级数],
  [地址项的个数],
  [文件块大小],
)
]]

#question(label: n => [2014 46])[
（7分）文件F由200条记录组成，记录从1开始编号。用户打开文件后，欲将内存中的一条记录插入到文件F中，作为其第30条记录。请回答下列问题，并说明理由。

#subquestions[
+ 
  若文件系统采用连续分配方式，每个磁盘块存放一条记录，文件F存储区域前后均有足够的空闲磁盘空间，则完成上述插入操作最少需要访问多少次磁盘块？F的文件控制块内容会发生哪些改变？
  \
+ 
  若文件系统采用链接分配方式，每个磁盘块存放一条记录和一个链接指针，则完成上述插入操作需要访问多少次磁盘块？若每个磁盘块大小为1KB，其中4个字节存放链接指针，则该文件系统支持的文件最大长度是多少？
  
    
]
]

#block(breakable: false)[#question(label: n => [2015 29])[
在文件的索引结点中存放直接索引指针10个，一级和二级索引指针各1个。磁盘块大小为1KB，每个索引指针占4个字节。若某文件的索引结点已在内存中，则把该文件偏移量（按字节编址）为1234和307400处所在的磁盘块读入内存，需访问的磁盘块个数分别是

#choices([1、2], [1、3], [2、3], [2、4])
]]

#question(label: n => [2016 47])[
（9分）某磁盘文件系统使用链接分配方式组织文件，簇大小为4 KB。目录文件的每个目录项包括文件名和文件的第一个簇号，其他簇号存放在文件分配表FAT中。
#subquestions[
+ 假定目录树如下图所示，各文件占用的簇号及顺序如下表所示，其中 dir、dir1 是目录，file1、file2 是用户文件。请给出所有目录文件的内容。

  #align(center,grid(columns:(10em,auto),gutter:2em,
    image("../../../../历年真题+参考解答/2016/official-images/q47-directory.png",width:10em),
    table(columns:(4em,9em),align:center,[文件名],[簇号],[dir],[1],[dir1],[48],[file1],[100,106,108],[file2],[200,201,202]),
  ))
+ 若FAT的每个表项仅存放簇号，占2个字节，则FAT的最大长度为多少字节？该文件系统支持的文件长度最大是多少？
+ 系统通过目录文件和FAT实现对文件的按名存取，说明 file1 的106、108两个簇号分别存放在FAT的哪个表项中。
+ 假设仅FAT和dir目录文件已读入内存，若需将文件dir/dir1/file1的第5000个字节读入内存，则要访问哪几个簇？
]
]

#block(breakable: false)[#question(label: n => [2017 26])[
某文件系统的簇和磁盘扇区大小分别为1 KB和512 B。若一个文件的大小为1026 B，则系统分配给该文件的磁盘空间大小是
#choices([1026 B], [1536 B], [1538 B], [2048 B])
]]

#question(label: n => [2018 46])[
（7分）某文件系统采用索引节点存放文件的属性和地址信息，簇大小为4 KB。每个文件索引节点占64 B，有11个地址项，其中直接地址项8个，一级、二级和三级间接地址项各1个，每个地址项长度为4 B。请回答下列问题：

#subquestions[
+ 该文件系统能支持的最大文件长度是多少？（给出计算表达式即可）
+ 文件系统用1M（$1 "M"=2^20$）个簇存放文件索引节点，用512M个簇存放文件数据。若一个图像文件的大小为5600 B，则该文件系统最多能存放多少个这样的图像文件？
+ 若文件 F1 的大小为6 KB，文件 F2 的大小为40 KB，则该文件系统获取 F1 和 F2 最后一个簇的簇号需要的时间是否相同？为什么？

]
]

#block(breakable: false)[#question(label: n => [2020 24])[
下列选项中，支持文件长度可变、随机访问的磁盘存储空间分配方式是

#choices([索引分配], [链接分配], [连续分配], [动态分区分配])
]]

#question(label: n => [2022 45])[
（7分）某文件系统的磁盘块大小为4 KB，目录项由文件名和索引节点号构成，每个索引节点占256字节，其中包含直接地址项10个，一级、二级和三级间接地址项各1个，每个地址项占4字节。该文件系统中子目录 stu 的结构如题45（a）图所示，stu 包含子目录 course 和文件 doc，course 子目录包含文件 course1 和 course2。各文件的文件名、索引节点号、占用磁盘块的块号如题45（b）图所示。

#grid(columns: (1fr, 1.2fr), column-gutter: 2em,
  figure(align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(stroke: 0.045em)
    line((0,4),(0,-3),(2,-3))
    line((0,2),(2,2),(2,-1.5),(4,-1.5))
    line((2,0),(4,0))
    for (x,y,label,folder) in ((0,4,[stu],true),(2,2,[course],true),(4,0,[course1],false),(4,-1.5,[course2],false),(2,-3,[doc],false)) {
      if folder {
        line((x - 0.4,y - 0.35),(x - 0.4,y + 0.35),(x,y + 0.35),(x + 0.15,y + 0.15),(x + 0.6,y + 0.15),(x + 0.6,y - 0.35),close:true, fill:luma(90%))
      } else {
        rect((x - 0.3,y - 0.45),(x + 0.4,y + 0.45),fill:white)
        for dy in (-0.25,-0.05,0.15) {line((x - 0.15,y + dy),(x + 0.25,y + dy))}
      }
      content((x + 0.8,y), text(size:0.85em,label),anchor:"west")
    }
  })), caption: [题45（a）图], numbering: none),
  figure(table(columns: (6em,7em,6em), align: center,
    [文件名], [索引节点号], [磁盘块号],
    [stu], [1], [10],
    [course], [2], [20],
    [course1], [10], [30],
    [course2], [100], [40],
    [doc], [10], [$x$],
  ), caption: [题45（b）图], numbering: none),
)

请回答下列问题。

#subquestions[
+ 目录文件 stu 中每个目录项的内容是什么？
+ 文件 doc 占用的磁盘块的块号 $x$ 的值是多少？
+ 若目录文件 course 的内容已在内存，则打开文件 course1 并将其读入内存，需要读几个磁盘块？说明理由。
+ 若文件 course2 的大小增长到6 MB，则为了存取 course2 需要使用该文件索引节点的哪几级间接地址项？说明理由。

]
]
