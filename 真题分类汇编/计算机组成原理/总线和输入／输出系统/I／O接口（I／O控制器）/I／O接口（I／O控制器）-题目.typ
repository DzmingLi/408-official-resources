// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：I/O接口（I/O控制器）

== I/O接口的功能和基本结构

#block(breakable: false)[#question(label: n => [2013 19])[
下列选项中，用于设备和设备控制器（I/O接口）之间互连的接口标准是

#choices(
  [PCI],
  [USB],
  [AGP],
  [PCI-Express],
)
]]

#block(breakable: false)[#question(label: n => [2021 20])[
下列选项中，不属于 I/O 接口的是

#choices([磁盘驱动器], [打印机适配器], [网络控制器], [可编程中断控制器])
]]

== I/O端口及其编址

#block(breakable: false)[#question(label: n => [2014 21])[
下列有关 I/O接口的叙述中，错误的是

#choices(
  [状态端口和控制端口可以合用同一个寄存器],
  [I/O接口中CPU可访问的寄存器称为I/O端口],
  [采用独立编址方式时，I/O端口地址和主存地址可能相同],
  [采用统一编址方式时，CPU不能用访存指令访问I/O端口],
)
]]

#block(breakable: false)[#question(label: n => [2015 21])[
在采用中断I/O方式控制打印输出的情况下，CPU和打印控制接口中的I/O端口之间交换的信息不可能是

#choices([打印字符], [主存地址], [设备状态], [控制命令])
]]

#block(breakable: false)[#question(label: n => [2017 21])[
I/O 指令实现的数据传送通常发生在
#choices([I/O 设备和 I/O 端口之间], [通用寄存器和 I/O 设备之间], [I/O 端口和 I/O 端口之间], [通用寄存器和 I/O 端口之间])
]]
