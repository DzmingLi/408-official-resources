// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：外存管理

== 磁盘

#block(breakable: false)[#question(label: n => [2009 29])[
假设磁头当前位于第105道，正在向磁道序号增加的方向移动。现有一个磁道访问请求序列为35，45，12，68，110，180，170，195，采用SCAN调度（电梯调度）算法得到的磁道访问序列是

#choices(
  [110，170，180，195，68，45，35，12],
  [110，68，45，35，12，170，180，195],
  [110，170，180，195，12，35，45，68],
  [12，35，45，68，110，170，180，195],
)
]]

#question(label: n => [2010 45])[
（7分）假设计算机系统采用CSCAN（循环扫描）磁盘调度策略，使用2KB的内存空间记录16384个磁盘块的空闲状态。

#subquestions[
+ 请说明在上述条件下如何进行磁盘块空闲状态的管理。
  \
+ 
  设某单面磁盘旋转速度为每分钟6000转，每个磁道有100个扇区，相邻磁道间的平均移动时间为1ms。若在某时刻，磁头位于100号磁道处，并沿着磁道号增大的方向移动（如下图所示），磁道号请求队列为50、90、30、120，对请求队列中的每个磁道需读取1个随机分布的扇区，则读完这4个扇区总共需要多少时间？要求给出计算过程。
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
      let polar(radius, angle) = (
        radius * calc.cos(angle),
        radius * calc.sin(angle),
      )
      let label(pos, body, anchor: "center") = content(
        pos,
        text(size: 0.88em)[#body],
        anchor: anchor,
      )
  
      hide(rect((-5.65, -3.05), (6.25, 3.05), stroke: none), bounds: true)
  
      // Seven equally spaced tracks and twelve 30-degree sectors.
      for i in range(1, 8) {
        circle((0, 0), radius: 3 * i / 7, fill: none, stroke: 0.55pt)
      }
      for angle in (
        0deg, 30deg, 60deg, 90deg, 120deg, 150deg,
        180deg, 210deg, 240deg, 270deg, 300deg, 330deg,
      ) {
        line((0, 0), polar(3, angle), stroke: 0.55pt)
      }
  
      // Randomly distributed sectors, hatched along their radial direction.
      for angle in (3deg, 7deg, 11deg, 15deg, 19deg, 23deg, 27deg) {
        line(polar(18 / 7, angle), polar(3, angle), stroke: 0.45pt)
      }
      for angle in (153deg, 157deg, 161deg, 165deg, 169deg, 173deg, 177deg) {
        line(polar(9 / 7, angle), polar(12 / 7, angle), stroke: 0.45pt)
      }
      for angle in (-57deg, -53deg, -49deg, -45deg, -41deg, -37deg, -33deg) {
        line(polar(12 / 7, angle), polar(15 / 7, angle), stroke: 0.45pt)
      }
  
      // Head and arm at the current track.
      rect((1.95, -0.08), (3.72, 0.08), fill: white, stroke: 0.55pt)
      circle((1.92, 0), radius: 0.17, fill: black, stroke: black)
  
      // Track and sector callouts.
      bezier(
        (-1.55, 0.30),
        (-4.02, 1.25),
        (-2.55, 0.05),
        (-3.48, 0.42),
        stroke: 0.55pt,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      label((-4.25, 1.57), [随机分布的某扇区])
  
      bezier(
        (2.36, 1.18),
        (4.58, 1.66),
        (3.12, 2.05),
        (4.03, 2.06),
        stroke: 0.55pt,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      label((4.58, 1.20), [0号磁道])
  
      bezier(
        (1.07, -1.55),
        (3.73, -2.18),
        (1.98, -2.42),
        (3.02, -2.58),
        stroke: 0.55pt,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      label((4.02, -1.74), [100号磁道])
  
      line(
        (4.02, -0.24), (3.18, -0.24),
        stroke: 0.55pt,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      label((4.13, -0.61), [磁头当前运动方向], anchor: "west")
    })
  ]
  \
+ 
  如果将磁盘替换为随机访问的Flash半导体存储器（如U盘、SSD等），是否有比
  
  CSCAN更高效的磁盘调度策略？若有，给出磁盘调度策略的名称并说明理由；若无，说明理由。
  
    
]
]

#block(breakable: false)[#question(label: n => [2012 32])[
下列选项中，不能改善磁盘设备 I/O性能的是

#choices(
  [重排 I/O 请求次序],
  [在一个磁盘上设置多个分区],
  [预读和滞后写],
  [优化文件物理块的分布],
)
]]

#block(breakable: false)[#question(label: n => [2015 32])[
某硬盘有200个磁道（最外侧磁道号为0），磁道访问请求序列为：130，42，180，15，199，当前磁头位于第58号磁道并从外侧向内侧移动。按照SCAN调度方法处理完上述请求后，磁头移过的磁道数是

#choices([208], [287], [325], [382])
]]

#block(breakable: false)[#question(label: n => [2017 29])[
下列选项中，磁盘逻辑格式化程序所做的工作是
#statements(columns: 1, [Ⅰ．对磁盘进行分区], [Ⅱ．建立文件系统的根目录], [Ⅲ．确定磁盘扇区校验码所占位数], [Ⅳ．对保存空闲磁盘块信息的数据结构进行初始化])
#choices([仅Ⅱ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ], [仅Ⅰ、Ⅱ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2018 30])[
系统总是访问磁盘的某个磁道而不响应对其他磁道的访问请求，这种现象称为磁臂黏着。下列磁盘调度算法中，不会导致磁臂黏着的是

#choices([先来先服务（FCFS）], [最短寻道时间优先（SSTF）], [扫描算法（SCAN）], [循环扫描算法（CSCAN）])
]]

#block(breakable: false)[#question(label: n => [2018 31])[
下列优化方法中，可以提高文件访问速度的是

#statements(columns: (1fr, 1fr), [Ⅰ．提前读], [Ⅱ．为文件分配连续的簇],
  [Ⅲ．延迟写], [Ⅳ．采用磁盘高速缓存],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]]

#question(label: n => [2019 44])[
（7分）某计算机系统中的磁盘有300个柱面，每个柱面有10个磁道，每个磁道有200个扇区，扇区大小为512 B。文件系统的每个簇包含2个扇区。请回答下列问题：

#subquestions[
+ 磁盘的容量是多少？
+ 假设磁头在85号柱面上，此时有4个磁盘访问请求，簇号分别为：100 260、60 005、101 660和110 560。若采用最短寻道时间优先（SSTF）调度算法，则系统访问簇的先后次序是什么？
+ 第100 530簇在磁盘上的物理地址是什么？将簇号转换成磁盘物理地址的过程是由 I/O 系统的什么程序完成的？

]
]

#block(breakable: false)[#question(label: n => [2021 26])[
某系统中磁盘的磁道数为200（0～199），磁头当前在184号磁道上。用户进程提出的磁盘访问请求对应的磁道号依次为184、187、176、182、199。若采用最短寻道时间优先调度算法（SSTF）完成磁盘访问，则磁头移动的距离（磁道数）是

#choices([37], [38], [41], [42])
]]

#question(label: n => [2021 46])[
（8分）某计算机用硬盘作为启动盘，硬盘第一个扇区存放主引导记录，其中包含磁盘引导程序和分区表。磁盘引导程序用于选择要引导哪个分区的操作系统，分区表记录硬盘上各分区的位置等描述信息。硬盘被划分成若干个分区，每个分区的第一个扇区存放分区引导程序，用于引导该分区中的操作系统。系统采用多阶段引导方式，除了执行磁盘引导程序和分区引导程序外，还需要执行 ROM 中的引导程序。请回答下列问题。

#subquestions[
+ 系统启动过程中操作系统的初始化程序、分区引导程序、ROM 中的引导程序、磁盘引导程序的执行顺序是什么？
+ 把硬盘制作为启动盘时，需要完成操作系统的安装、磁盘的物理格式化、逻辑格式化、对磁盘进行分区，执行这4个操作的正确顺序是什么？
+ 磁盘扇区的划分和文件系统根目录的建立分别是在第（2）问的哪个操作中完成的？

]
]

#block(breakable: false)[#question(label: n => [2024 32])[
某磁盘的磁道数为400（磁道号为0～399），采用循环扫描算法（CSCAN）进行磁盘调度，完成对200号磁道的请求后，磁头向磁道号减小的方向移动。若还有7个磁盘请求，对应的磁道号分别为300，120，110，0，160，210，399，则完成上述磁盘访问请求后磁头移动的距离是

#choices([599], [619], [788], [799])
]]

#block(breakable: false)[#question(label: n => [2025 32])[
下列选项中，文件系统需要为温彻斯特硬盘和固态硬盘都提供的功能是

#choices([划分扇区],[确定盘块大小],[降低寻道时间],[实现均衡磨损])
]]
