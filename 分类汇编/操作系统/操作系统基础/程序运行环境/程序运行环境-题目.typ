// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：程序运行环境

== CPU运行模式

#block(breakable: false)[#question(label: n => [2011 24])[
下列选项中，在用户态执行的是

#choices(
  [命令解释程序],
  [缺页处理程序],
  [进程调度程序],
  [时钟中断处理程序],
)
]]

#block(breakable: false)[#question(label: n => [2012 23])[
下列选项中，不可能在用户态发生的事件是

#choices(
  [系统调用],
  [外部中断],
  [进程切换],
  [缺页],
)
]]

#block(breakable: false)[#question(label: n => [2014 25])[
下列指令中，不能在用户态执行的是

#choices(
  [trap指令],
  [跳转指令],
  [压栈指令],
  [关中断指令],
)
]]

#block(breakable: false)[#question(label: n => [2015 24])[
假定下列指令已装入指令寄存器，则执行时不可能导致CPU从用户态变为内核态（系统态）的是

#choices(
  [DIV R0，R1；（R0）/（R1）→R0],
  [INT n；产生软中断],
  [NOT R0；寄存器R0的内容取非],
  [MOV R0，addr；把地址addr处的内存数据放入寄存器R0中],
)
]]

#block(breakable: false)[#question(label: n => [2021 23])[
下列指令中，只能在内核态执行的是

#choices([trap 指令], [I/O 指令], [数据传送指令], [设置断点指令])
]]

#block(breakable: false)[#question(label: n => [2022 27])[
下列关于 CPU 模式的叙述中，正确的是

#choices([CPU 处于用户态时只能执行特权指令], [CPU 处于内核态时只能执行特权指令], [CPU 处于用户态时只能执行非特权指令], [CPU 处于内核态时只能执行非特权指令])
]]

== 中断和异常的处理

#block(breakable: false)[#question(label: n => [2010 32])[
本地用户通过键盘登录系统时，首先获得键盘输入信息的程序是

#choices(
  [命令解释程序],
  [中断处理程序],
  [系统调用服务程序],
  [用户登录程序],
)
]]

#block(breakable: false)[#question(label: n => [2012 24])[
中断处理和子程序调用都需要压栈以保护现场，中断处理一定会保存而子程序调用不需要保存其内容的是

#choices(
  [程序计数器],
  [程序状态字寄存器],
  [通用数据寄存器],
  [通用地址寄存器],
)
]]

#block(breakable: false)[#question(label: n => [2015 23])[
处理外部中断时，应该由操作系统保存的是

#choices(
  [程序计数器（PC）的内容],
  [通用寄存器的内容],
  [快表（TLB）中的内容],
  [Cache中的内容],
)
]]

#block(breakable: false)[#question(label: n => [2018 29])[
当定时器产生时钟中断后，由时钟中断服务程序更新的部分内容是

Ⅰ．内核中时钟变量的值 \
Ⅱ．当前进程占用 CPU 的时间 \
Ⅲ．当前进程在时间片内的剩余执行时间

#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2020 25])[
下列与中断相关的操作中，由操作系统完成的是

#statements(columns: (1fr, 1fr), [Ⅰ．保存被中断程序的断点], [Ⅱ．提供中断服务],
  [Ⅲ．初始化中断向量表], [Ⅳ．保存中断屏蔽字],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ], [仅Ⅱ、Ⅲ、Ⅳ])
]]

== 系统调用

#block(breakable: false)[#question(label: n => [2010 23])[
下列选项中，操作系统提供给应用程序的接口是

#choices(
  [系统调用],
  [中断],
  [库函数],
  [原语],
)
]]

#block(breakable: false)[#question(label: n => [2012 28])[
若一个用户进程通过 read
系统调用读取一个磁盘文件中的数据，则下列关于此过程的叙述中，正确的是

I. 若该文件的数据不在内存，则该进程进入睡眠等待状态

Ⅱ. 请求 read 系统调用会导致 CPU 从用户态切换到核心态

Ⅲ. read 系统调用的参数应包含文件的名称

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2013 28])[
下列选项中，会导致用户进程从用户态切换到内核态的操作是

I. 整数除以零 II. sin()函数调用 III. read系统调用

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2017 24])[
执行系统调用的过程包括如下主要操作：
#statements(columns: 2, [① 返回用户态], [② 执行陷入（trap）指令], [③ 传递系统调用参数], [④ 执行相应的服务程序])
正确的执行顺序是
#choices([②→③→①→④], [②→④→③→①], [③→②→④→①], [③→④→②→①])
]]

#block(breakable: false)[#question(label: n => [2019 25])[
下列关于系统调用的叙述中，正确的是

Ⅰ．在执行系统调用服务程序的过程中，CPU 处于内核态 \
Ⅱ．操作系统通过提供系统调用避免用户程序直接访问外设 \
Ⅲ．不同的操作系统为应用程序提供了统一的系统调用接口 \
Ⅳ．系统调用是操作系统内核为应用程序提供服务的接口

#choices([仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅱ、Ⅳ], [仅Ⅰ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2021 32])[
下列选项中，通过系统调用完成的操作是

#choices([页置换], [进程调度], [创建新进程], [生成随机整数])
]]

#block(breakable: false)[#question(label: n => [2022 31])[
执行系统调用时的过程涉及下列操作，其中由操作系统完成的是

#statements(columns: (1fr, 1fr), [Ⅰ．保存断点和程序状态字], [Ⅱ．保存通用寄存器的内容],
  [Ⅲ．执行系统调用服务例程], [Ⅳ．将 CPU 模式改为内核态],
)

#choices([Ⅰ、Ⅲ], [Ⅱ、Ⅲ], [Ⅱ、Ⅳ], [Ⅱ、Ⅲ、Ⅳ])
]]

== 程序的链接与装入

#block(breakable: false)[#question(label: n => [2011 30])[
在虚拟内存管理中，地址变换机构将逻辑地址变换为物理地址，形成该逻辑地址的阶段是

#choices(
  [编辑],
  [编译],
  [链接],
  [装载],
)
]]
