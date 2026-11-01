// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：设备独立软件

== 缓冲区管理

#block(breakable: false)[#question(label: n => [2011 31])[
某文件占10个磁盘块，现要把该文件磁盘块逐个读入主存缓冲区，并送用户区进行分析。假设一个缓冲区与一个磁盘块大小相同，把一个磁盘块读入缓冲区的时间为
100 $mu s$ ，将缓冲区的数据传送到用户区的时间是 50 $mu s$
，CPU对一块数据进行分析的时间为 50 $mu s$
。在单缓冲区和双缓冲区结构下，读入并分析完该文件的时间分别是

#choices(
  [1 500 $mu s$ 、1 000 $mu s$],
  [1 550 $mu s$ 、1 100 $mu s$],
  [1 550 $mu s$ 、1 550 $mu s$],
  [2 000 $mu s$ 、2 000 $mu s$],
)
]]

#block(breakable: false)[#question(label: n => [2013 27])[
设系统缓冲区和用户工作区均采用单缓冲，从外设读入1个数据块到系统缓冲区的时间为100，从系统缓冲区读入1个数据块到用户工作区的时间为5，对用户工作区中的1个数据块进行分析的时间为90（如下图所示）。进程从外设读入并分析2个数据块的最短时间是

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    hide(rect((0, 0), (4.30, 4.08), stroke: none), bounds: true)

    rect((0.15, 2.95), (4.15, 3.52), fill: white, stroke: 0.055em)
    rect((0.15, 1.50), (4.15, 2.07), fill: white, stroke: 0.055em)
    rect((0.15, 0.05), (4.15, 0.62), fill: white, stroke: 0.055em)

    line((2.15, 0.62), (2.15, 1.50), stroke: 0.055em, mark: (end: ">", fill: black, scale: 0.65))
    line((2.15, 2.07), (2.15, 2.95), stroke: 0.055em, mark: (end: ">", fill: black, scale: 0.65))
    bezier(
      (2.84, 3.52),
      (1.34, 3.52),
      (2.78, 4.35),
      (1.40, 4.35),
      stroke: 0.055em,
      mark: (end: ">", fill: black, scale: 0.65),
    )

    content((2.15, 3.23), text(size: 0.96em)[用户工作区])
    content((2.15, 1.78), text(size: 0.96em)[系统缓冲区])
    content((2.15, 0.33), text(size: 0.96em)[外设])
    content((2.48, 2.52), text(size: 0.88em)[5], anchor: "west")
    content((2.48, 1.07), text(size: 0.88em)[100], anchor: "west")
    content((2.09, 3.84), text(size: 0.82em)[90])
  })
]

#choices(
  [200],
  [295],
  [300],
  [390],
)
]]

#block(breakable: false)[#question(label: n => [2015 28])[
在系统内存中设置磁盘缓冲区的主要目的是

#choices([减少磁盘I/O次数], [减少平均寻道时间], [提高磁盘数据可靠性], [实现设备无关性])
]]

== 设备分配与回收

#block(breakable: false)[#question(label: n => [2009 32])[
程序员利用系统调用打开 I/O
设备时，通常使用的设备标识是

#choices(
  [逻辑设备名],
  [物理设备名],
  [主设备号],
  [从设备号],
)
]]

#block(breakable: false)[#question(label: n => [2020 30])[
对于具备设备独立性的系统，下列叙述中，#emphasis[错误]的是

#choices([可以使用文件名访问物理设备], [用户程序使用逻辑设备名访问物理设备], [需要建立逻辑设备与物理设备之间的映射关系], [更换物理设备后必须修改访问该设备的应用程序])
]]

== 假脱机技术（SPOOLing）

#block(breakable: false)[#question(label: n => [2016 31])[
下列关于SPOOLing技术的叙述中，#emphasis[错误]的是
#choices([需要外存的支持], [需要多道程序设计技术的支持], [可以让多个作业共享一台独占设备], [由用户作业控制设备与输入/输出井之间的数据传送])
]]
