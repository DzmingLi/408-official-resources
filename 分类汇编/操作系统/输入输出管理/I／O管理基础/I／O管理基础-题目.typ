// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：I/O管理基础

== I/O控制方式

#block(breakable: false)[#question(label: n => [2017 32])[
系统将数据从磁盘读到内存的过程包括以下操作：
#statements(columns: 1, [① DMA 控制器发出中断请求], [② 初始化 DMA 控制器并启动磁盘], [③ 从磁盘传输一块数据到内存缓冲区], [④ 执行“DMA 结束”中断服务程序])
正确的执行顺序是
#choices([③→①→②→④], [②→③→①→④], [②→①→③→④], [①→②→④→③])
]]

== I/O软件层次结构

#block(breakable: false)[#question(label: n => [2011 26])[
用户程序发出磁盘 I/O 请求后，系统的正确处理流程是

#choices(
  [用户程序 $arrow.r$系统调用处理程序 $arrow.r$中断处理程序 $arrow.r$设备驱动程序],
  [用户程序 $arrow.r$系统调用处理程序 $arrow.r$设备驱动程序 $arrow.r$中断处理程序],
  [用户程序 $arrow.r$设备驱动程序 $arrow.r$系统调用处理程序 $arrow.r$中断处理程序],
  [用户程序 $arrow.r$设备驱动程序 $arrow.r$中断处理程序 $arrow.r$系统调用处理程序],
)
]]

#block(breakable: false)[#question(label: n => [2012 26])[
操作系统的 I/O
子系统通常由四个层次组成，每一层明确定义了与邻近层次的接口。其合理的层次组织排列顺序是

#choices(
  [用户级 I/O 软件、设备无关软件、设备驱动程序、中断处理程序],
  [用户级 I/O 软件、设备无关软件、中断处理程序、设备驱动程序],
  [用户级 I/O 软件、设备驱动程序、设备无关软件、中断处理程序],
  [用户级 I/O 软件、中断处理程序、设备无关软件、设备驱动程序],
)
]]

#block(breakable: false)[#question(label: n => [2013 25])[
用户程序发出磁盘 I/O
请求后，系统的处理流程是：用户程序 $arrow.r$系统调用处理程序
$arrow.r$设备驱动程序
$arrow.r$中断处理程序。其中，计算数据所在磁盘的柱面号、磁头号、扇区号的程序是

#choices(
  [用户程序],
  [系统调用处理程序],
  [设备驱动程序],
  [中断处理程序],
)
]]

#block(breakable: false)[#question(label: n => [2022 32])[
下列关于驱动程序的叙述中，#emphasis[不正确]的是

#choices([驱动程序与 I/O 控制方式无关], [初始化设备是由驱动程序控制完成的], [进程在执行驱动程序时可能进入阻塞态], [读/写设备的操作是由驱动程序控制完成的])
]]
