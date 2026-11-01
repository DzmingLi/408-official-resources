// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：进程与线程

== 进程与线程的基本概念

#block(breakable: false)[#question(label: n => [2011 25])[
在支持多线程的系统中，进程P创建的若干个线程不能共享的是

#choices(
  [进程P的代码段],
  [进程P中打开的文件],
  [进程P的全局变量],
  [进程P中某线程的栈指针],
)
]]

#block(breakable: false)[#question(label: n => [2012 31])[
下列关于进程和线程的叙述中，正确的是

#choices(
  [不管系统是否支持线程，进程都是资源分配的基本单位],
  [线程是资源分配的基本单位，进程是调度的基本单位],
  [系统级线程和用户级线程的切换都需要内核的支持],
  [同一进程中的各个线程拥有各自不同的地址空间],
)
]]

#block(breakable: false)[#question(label: n => [2020 29])[
下列关于父进程与子进程的叙述中，#emphasis[错误]的是

#choices([父进程与子进程可以并发执行], [父进程与子进程共享虚拟地址空间], [父进程与子进程有不同的进程控制块], [父进程与子进程不能同时使用同一临界资源])
]]

== 进程/线程的状态与转换

#block(breakable: false)[#question(label: n => [2014 26])[
一个进程的读磁盘操作完成后，操作系统针对该进程必做的是

#choices(
  [修改进程状态为就绪态],
  [降低进程优先级],
  [为进程分配用户内存空间],
  [增加进程的时间片大小],
)
]]

#block(breakable: false)[#question(label: n => [2015 25])[
下列选项中，会导致进程从执行态变为就绪态的事件是

#choices([执行P（wait）操作], [申请内存失败], [启动I/O设备], [被高优先级进程抢占])
]]

#block(breakable: false)[#question(label: n => [2018 27])[
下列选项中，可能导致当前进程 P 阻塞的事件是

Ⅰ．进程 P 申请临界资源 \
Ⅱ．进程 P 从磁盘读数据 \
Ⅲ．系统将 CPU 分配给高优先权的进程

#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2019 24])[
下列选项中，可能将进程唤醒的事件是

#statements(columns: (1fr, 1fr), [Ⅰ．I/O 结束], [Ⅱ．某进程退出临界区],
  [Ⅲ．当前进程的时间片用完],
)

#choices([仅Ⅰ], [仅Ⅲ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2022 28])[
下列事件或操作中，可能导致进程 P 由执行态变为阻塞态的是

#statements(columns: (1fr, 1.4fr), [Ⅰ．进程 P 读文件], [Ⅱ．进程 P 的时间片用完],
  [Ⅲ．进程 P 申请外设], [Ⅳ．进程 P 执行信号量的 wait() 操作],
)

#choices([Ⅰ、Ⅳ], [Ⅱ、Ⅲ], [Ⅲ、Ⅳ], [Ⅰ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [旧版题型示例])[
下列进程状态转换中，不可能发生的转换是

#choices([运行→就绪], [运行→等待], [等待→运行], [等待→就绪])
]]

== 线程的实现

#block(breakable: false)[#question(label: n => [2019 23])[
下列关于线程的描述中，错误的是

#choices(
  [内核级线程的调度由操作系统完成],
  [操作系统为每个用户级线程建立一个线程控制块],
  [用户级线程间的切换比内核级线程间的切换效率高],
  [用户级线程可以在不支持内核级线程的操作系统上实现],
)
]]

== 进程与线程的组织与控制

#block(breakable: false)[#question(label: n => [2010 24])[
下列选项中，导致创建新进程的操作是

I. 用户登录成功 II. 设备分配 III. 启动程序执行

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅱ和Ⅲ],
  [仅Ⅰ和Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2021 24])[
下列操作中，操作系统在创建新进程时，必须完成的是

#statements(columns:(1fr,1fr),[Ⅰ．申请空白的进程控制块], [Ⅱ．初始化进程控制块], [Ⅲ．设置进程状态为执行态],
)

#choices([仅Ⅰ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ])
]]

== 进程间通信

#block(breakable: false)[#question(label: n => [2014 31])[
下列关于管道（Pipe）通信的叙述中，正确的是

#choices(
  [一个管道可实现双向数据传输],
  [管道的容量仅受磁盘容量大小限制],
  [进程对管道进行读操作和写操作都可能被阻塞],
  [一个管道只能有一个读进程或一个写进程对其操作],
)
]]
