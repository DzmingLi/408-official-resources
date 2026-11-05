// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：CPU调度与上下文切换

== 调度的实现

#block(breakable: false)[#question(label: n => [2012 30])[
若某单处理器多进程系统中有多个就绪态进程，则下列关于处理机调度的叙述中，错误的是

#choices(
  [在进程结束时能进行处理机调度],
  [创建新进程后能进行处理机调度],
  [在进程处于临界区时不能进行处理机调度],
  [在系统调用完成并返回用户态时能进行处理机调度],
)
]]

#block(breakable: false)[#question(label: n => [2017 27])[
下列有关基于时间片的进程调度的叙述中，#emphasis[错误]的是
#choices([时间片越短，进程切换的次数越多，系统开销越大], [当前进程的时间片用完后，该进程状态由执行态变为阻塞态], [时钟中断发生后，系统会修改当前进程在时间片内的剩余时间], [影响时间片大小的主要因素包括响应时间、系统开销和进程数量等])
]]

#block(breakable: false)[#question(label: n => [2021 27])[
下列事件中，可能引起进程调度程序执行的是

#statements(columns:(1fr,1fr),[Ⅰ．中断处理结束], [Ⅱ．进程阻塞], [Ⅲ．进程执行结束], [Ⅳ．进程的时间片用完],
)

#choices([仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ和Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2025 25])[
某基于优先权的进程调度程序中，进程就绪队列采用优先权由高到低的有序单链表实现。若就绪队列长度为 $n$，则就绪队列的插入操作和从就绪队列中选出将要执行进程的操作的时间复杂度分别是

#choices([$O(1)$，$O(1)$],[$O(1)$，$O(n)$],[$O(n)$，$O(1)$],[$O(n)$，$O(n)$])
]]

== CPU调度算法

#block(breakable: false)[#question(label: n => [2009 24])[
下列进程调度算法中，综合考虑进程等待时间和执行时间的是

#choices(
  [时间片轮转调度算法],
  [短进程优先调度算法],
  [先来先服务调度算法],
  [高响应比优先调度算法],
)
]]

#block(breakable: false)[#question(label: n => [2010 26])[
下列选项中，降低进程优先级的合理时机是

#choices(
  [进程的时间片用完],
  [进程刚完成 I/O，进入就绪队列],
  [进程长期处于就绪队列中],
  [进程从就绪态转为运行态],
)
]]

#block(breakable: false)[#question(label: n => [2011 23])[
下列选项中，满足短任务优先且不会发生饥饿现象的调度算法是

#choices(
  [先来先服务],
  [高响应比优先],
  [时间片轮转],
  [非抢占式短任务优先],
)
]]

#block(breakable: false)[#question(label: n => [2012 29])[
一个多道批处理系统中仅有P1和P2两个作业，P2比P1晚5ms到达。它们的计算和
I/O操作顺序如下：

P1：计算60ms，I/O80ms，计算20ms

P2：计算120ms，I/O40ms，计算40ms

若不考虑调度和切换时间，则完成两个作业需要的时间最少是

#choices(
  [240ms],
  [260ms],
  [340ms],
  [360ms],
)
]]

#block(breakable: false)[#question(label: n => [2013 31])[
某系统正在执行三个进程P1、P2和P3，各进程的计算（CPU）时间和I/O时间比例如下表所示。

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [进程], [计算时间], [I/O时间],
    [P1], [90%], [10%],
    [P2], [50%], [50%],
    [P3], [15%], [85%],
  )]
  , kind: table
  )

为提高系统资源利用率，合理的进程优先级设置应为

#choices(
  [P1 \> P2 \> P3],
  [P3 \> P2 \> P1],
  [P2 \> P1 = P3],
  [P1 \> P2 = P3],
)
]]

#block(breakable: false)[#question(label: n => [2014 23])[
下列调度算法中，不可能导致饥饿现象的是

#choices(
  [时间片轮转],
  [静态优先数调度],
  [非抢占式短作业优先],
  [抢占式短作业优先],
)
]]

#block(breakable: false)[#question(label: n => [2016 24])[
某单CPU系统中有输入和输出设备各1台，现有3个并发执行的作业，每个作业的输入、计算和输出时间均分别为2 ms、3 ms和4 ms，且都按输入、计算和输出的顺序执行，则执行完3个作业需要的时间最少是
#choices([15 ms], [17 ms], [22 ms], [27 ms])
]]

#question(label: n => [2016 46])[
（6分）某进程调度程序采用基于优先数（priority）的调度策略，即选择优先数最小的进程运行，进程创建时由用户指定一个 nice 作为静态优先数。为了动态调整优先数，引入运行时间 cpuTime 和等待时间 waitTime，初值均为0。进程处于执行态时，cpuTime 定时加1，且 waitTime 置0；进程处于就绪态时，cpuTime 置0，waitTime 定时加1。请回答下列问题。
#subquestions[
+ 若调度程序只将 nice 的值作为进程的优先数，即 priority=nice，则可能会出现饥饿现象，为什么？
+ 使用 nice、cpuTime 和 waitTime 设计一种动态优先数计算方法，以避免产生饥饿现象，并说明 waitTime 的作用。
]
]

#block(breakable: false)[#question(label: n => [2017 23])[
假设4个作业到达系统的时刻和运行时间如下表所示。
#align(center, table(columns: (5em, 7em, 6em), align: center,
 [作业], [到达时刻 $t$], [运行时间], [J1], [0], [3], [J2], [1], [3], [J3], [1], [2], [J4], [3], [1]))
系统在 $t=2$ 时开始作业调度。若分别采用先来先服务和短作业优先调度算法，则选中的作业分别是
#choices([J2、J3], [J1、J4], [J2、J4], [J1、J3])
]]

#block(breakable: false)[#question(label: n => [2019 27])[
系统采用二级反馈队列调度算法进行进程调度。就绪队列 Q1 采用时间片轮转调度算法，时间片为10 ms；就绪队列 Q2 采用短进程优先调度算法；系统优先调度 Q1 队列中的进程，当 Q1 为空时系统才会调度 Q2 中的进程；新创建的进程首先进入 Q1；Q1 中的进程执行一个时间片后，若未结束，则转入 Q2。若当前 Q1、Q2 为空，系统依次创建进程 P1、P2 后即开始进程调度，P1、P2 需要的 CPU 时间分别为30 ms 和20 ms，则进程 P1、P2 在系统中的平均等待时间为

#choices([25 ms], [20 ms], [15 ms], [10 ms])
]]

#block(breakable: false)[#question(label: n => [2020 26])[
下列与进程调度有关的因素中，在设计多级反馈队列调度算法时需要考虑的是

Ⅰ．就绪队列的数量 \
Ⅱ．就绪队列的优先级 \
Ⅲ．各就绪队列的调度算法 \
Ⅳ．进程在就绪队列间的迁移条件

#choices([仅Ⅰ、Ⅱ], [仅Ⅲ、Ⅳ], [仅Ⅱ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ和Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2021 25])[
下列内核的数据结构或程序中，分时系统实现时间片轮转调度需要使用的是

#statements(columns:(1fr,1fr),[Ⅰ．进程控制块], [Ⅱ．时钟中断处理程序], [Ⅲ．进程就绪队列], [Ⅳ．进程阻塞队列],
)

#choices([仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅳ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅰ、Ⅱ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2022 25])[
进程 P0、P1、P2 和 P3 进入就绪队列的时刻、优先级（值越小优先权越高）及 CPU 执行时间如下表所示。

#align(center, table(columns: (4em, 14em, 5em, 9em), align: center,
  [进程], [进入就绪队列的时刻], [优先级], [CPU执行时间],
  [P0], [0 ms], [15], [100 ms],
  [P1], [10 ms], [20], [60 ms],
  [P2], [10 ms], [10], [20 ms],
  [P3], [15 ms], [6], [10 ms],
))

若系统采用基于优先权的抢占式进程调度算法，则从0 ms时刻开始调度，到4个进程都运行结束为止，发生进程调度的总次数为

#choices([4], [5], [6], [7])
]]

#block(breakable: false)[#question(label: n => [2023 29])[
进程 P1、P2 和 P3 进入就绪队列的时刻、优先级（值越大优先权越高）及 CPU 执行时间如下表所示。
#table(columns: (1fr, 2.2fr, 1.2fr, 1.4fr), align: center,
 [进程名], [进入就绪队列的时刻], [优先级], [CPU 执行时间],
 [P1], [0 ms], [1], [60 ms], [P2], [20 ms], [10], [42 ms], [P3], [30 ms], [100], [13 ms])
若系统采用基于优先权的抢占式 CPU 调度算法，从0 ms时刻开始进行调度，则 P1、P2 和 P3 的平均周转时间为
#choices([60 ms], [61 ms], [70 ms], [71 ms])
]]

#block(breakable: false)[#question(label: n => [2024 30])[
假设某系统使用时间片轮转调度算法进行 CPU 调度，时间片大小为5 ms，系统共有10个进程，初始时均处于就绪队列，执行结束前仅处于执行态或就绪态。某队尾的进程 P 所需 CPU 时间最短，时间为25 ms，在不考虑系统开销的情况下，则进程 P 的周转时间为

#choices([200 ms], [205 ms], [250 ms], [295 ms])
]]

#question(label: n => [2026 45])[
（本题7分）某系统采用基于抢占式优先权（优先权值越大优先权越高）和时间片轮转的 CPU 调度算法，仅在时钟中断发生时才能抢占 CPU，时钟中断间隔时间为10 ms。每当进程进入就绪队列时，其时间片大小均设置为50 ms。进程因时间片用完而再次进入就绪队列时，若其优先权值大于0，则优先权值减1。进程因优先权低被抢占 CPU 而再次进入就绪队列时，其优先权值不变。优先权相同时，先进入就绪队列的进程先执行。假设系统中有4个进程 P1～P4，各进程的到达时刻、初始优先权值、所需的 CPU 执行时间如题45表所示。
#figure(table(columns: (1fr, 1.5fr, 1.5fr, 1.6fr), align: center,
 [进程], [到达时刻], [初始优先权值], [CPU 执行时间],
 [P1], [10 ms], [3], [95 ms], [P2], [10 ms], [4], [20 ms],
 [P3], [12 ms], [2], [40 ms], [P4], [14 ms], [5], [60 ms]), kind: table, caption: [题45表])
请回答下列问题。
#subquestions[
 + 在忽略时钟中断处理及 CPU 调度时间开销的情况下，若将10 ms时刻发生的时钟中断记为第一次时钟中断，且从此时开始进行 CPU 调度，则从10 ms时刻开始到4个进程都运行结束为止，时钟中断和 CPU 调度各发生了多少次？第一次执行 P1、P3、P4 的时刻分别是什么？（5分）
 + 若时间片由50 ms改为100 ms，则 CPU 调度次数增加、不变还是减少？若时钟中断间隔时间由10 ms改为1 ms，则系统开销增加、不变还是减少？（2分）
]
]

== 上下文及其切换机制

#block(breakable: false)[#question(label: n => [2018 24])[
某系统采用基于优先权的非抢占式进程调度策略，完成一次进程调度和进程切换的系统时间开销为1 μs。在 $T$ 时刻就绪队列中有3个进程 $P_1$、$P_2$ 和 $P_3$，其在就绪队列中的等待时间、需要的 CPU 时间和优先权如下表所示。

#table(
  columns: (0.7fr, 1fr, 1.2fr, 0.8fr), align: center + horizon,
  [进程], [等待时间], [需要的 CPU 时间], [优先权],
  [$P_1$], [30 μs], [12 μs], [10],
  [$P_2$], [15 μs], [24 μs], [30],
  [$P_3$], [18 μs], [36 μs], [20],
)

若优先权值大的进程优先获得 CPU，从 $T$ 时刻起系统开始进程调度，则系统的平均周转时间为

#choices([54 μs], [73 μs], [74 μs], [75 μs])
]]

#block(breakable: false)[#question(label: n => [2024 25])[
在支持页式存储管理的系统中，进程切换时操作系统需要执行的操作是

#statements(columns: (1fr,1fr), [Ⅰ．更新程序计数器的值], [Ⅱ．更新栈基址寄存器的值], [Ⅲ．更新页表基地址寄存器的值])

#choices([仅Ⅲ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2025 23])[
在采用页式虚拟存储管理方式的系统中，当发生进程上下文切换时，下列寄存器中，操作系统#emphasis[不需要]更新的是

#choices([通用寄存器],[页表基址寄存器],[程序计数器],[内核中断向量表基址寄存器])
]]
