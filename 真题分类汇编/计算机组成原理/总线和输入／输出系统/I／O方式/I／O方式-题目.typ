// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：I/O方式

== 程序查询方式

#block(breakable: false)[#question(label: n => [2011 22])[
某计算机处理器主频为 50
MHz，采用定时查询方式控制设备 A的
I/O，查询程序运行一次所用的时钟周期数至少为500。在设备
A工作期间，为保证数据不丢失，每秒需对其查询至少200次，则 CPU 用于设备
A的 I/O的时间占整个 CPU时间的百分比至少是

#choices(
  [0.02%],
  [0.05%],
  [0.20%],
  [0.50%],
)
]]

== 程序中断方式

#block(breakable: false)[#question(label: n => [2010 21])[
单级中断系统中，中断服务程序内的执行顺序是

#statements(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 0.6em,
  [I. 保护现场], [II. 开中断], [III. 关中断], [IV. 保存断点],
  [V. 中断事件处理], [VI. 恢复现场], [VII. 中断返回], [],
)

#choices(
  [$"I" arrow.r "V" arrow.r "VI" arrow.r "II" arrow.r "VII"$],
  [$"III" arrow.r "I" arrow.r "V" arrow.r "VII"$],
  [$"III" arrow.r "IV" arrow.r "V" arrow.r "VI" arrow.r "VII"$],
  [$"IV" arrow.r "I" arrow.r "V" arrow.r "VI" arrow.r "VII"$],
)
]]

#block(breakable: false)[#question(label: n => [2011 21])[
某计算机有五级中断
$L_4 tilde.op L_0$，中断屏蔽字为
$M_4 M_3 M_2 M_1 M_0$，
$M_i = 1 space (0 lt.eq i lt.eq 4)$ 表示对
$L_i$级中断进行屏蔽。若中断响应优先级从高到低的顺序是
$L_0 arrow.r L_1 arrow.r L_2 arrow.r L_3 arrow.r L_4$
，且要求中

断处理优先级从高到低的顺序为
$L_4 arrow.r L_0 arrow.r L_2 arrow.r L_1 arrow.r L_3$
，则 $L_1$的中断处理程序中设置的中断屏蔽字是

#choices(
  [11110],
  [01101],
  [00011],
  [01010],
)

]]

#block(breakable: false)[#question(label: n => [2012 22])[
响应外部中断的过程中，中断隐指令完成的操作，除保护断点外，还包括

I. 关中断 II. 保存通用寄存器的内容

Ⅲ. 形成中断服务程序入口地址并送PC

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ、Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2014 22])[
若某设备中断请求的响应和处理时间为100 ns，每400
ns发出一次中断请求，中断响应所允许的最长延迟时间为50
ns，则在该设备持续工作过程中，CPU用于该设备的I/O时间占整个CPU时间的百分比至少是

#choices(
  [12.5%],
  [25%],
  [37.5%],
  [50%],
)
]]

#question(label: n => [2016 44])[
（9分）假定CPU主频为50 MHz，CPI为4。设备D采用异步串行通信方式向主机传送7位ASCII字符，通信规程中有1位奇校验位和1位停止位，从D接收启动命令到字符送入I/O端口需要0.5 ms。请回答下列问题，要求说明理由。
#subquestions[
+ 每传送一个字符，在异步串行通信线上共需传输多少位？在设备D持续工作过程中，每秒钟最多可向I/O端口送入多少个字符？
+ 设备D采用中断方式进行输入/输出，示意图如下：

  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    // 对照原考纲书内第47页：后两次启动发生在中断服务期间。
    let pen = 0.045em
    let dashed = (thickness: pen, dash: "dashed")
    let arrow = (end: ">", fill: black, scale: 0.7)
    let label(x, y, body) = content((x, y), {
      set par(leading: 0.2em, spacing: 0pt)
      show par: it => it
      box(text(top-edge: "bounds", bottom-edge: "bounds", body))
    }, anchor: "center")
    let device-y = 4.4
    let service-y = 2.4
    let starts = (1.3, 10.1, 18.9)
    let work = 5.4
    let response-delay = 0.75
    let service = 3.4

    label(-2, device-y, [外设D])
    label(-2, 0.8, [CPU])
    for (i, start) in starts.enumerate() {
      let request = start + work
      let response = request + response-delay
      let returned = response + service
      let previous-return = if i == 0 { 0 } else {
        starts.at(i - 1) + work + response-delay + service
      }
      // 设备启动和工作完成用虚线；完成时向CPU提出中断请求。
      line((start, if i == 0 { 0 } else { service-y }),
        (start, device-y), stroke: dashed)
      line((start, device-y), (request, device-y), stroke: pen)
      line((request, device-y), (request, 0), stroke: dashed, mark: arrow)
      label(start + work / 2, device-y + 0.9, [工作])
      label(request + 0.8, device-y + 0.05, [完\ 成])

      // CPU响应后进入中断服务，随后返回原程序。
      line((previous-return, 0), (response, 0), stroke: pen)
      line((response, 0), (response, service-y), stroke: pen, mark: arrow)
      line((response, service-y), (returned, service-y), stroke: pen)
      line((returned, service-y), (returned, 0), stroke: dashed, mark: arrow)
      label(request - 0.3, -1.35, [请\ 求])
      label(response + 0.4, -1.35, [响\ 应])
      if i == 0 { label(start, -1.35, [启\ 动]) }
      if i < starts.len() - 1 {
        label(starts.at(i + 1), service-y / 2, [启\ 动])
        label(returned + 0.05, -1.35, [返\ 回])
      } else {
        line((returned, 0), (returned + 0.65, 0), stroke: pen)
      }
    }
  }))

  I/O端口每收到一个字符申请一次中断，中断响应需10个时钟周期，中断服务程序共有20条指令，其中第15条指令启动D工作。若CPU需从D读取1000个字符，则完成这一任务所需时间大约是多少个时钟周期？CPU用于完成这任务的时间大约是多少个时钟周期？在中断响应阶段CPU进行了哪些操作？
]
]

#block(breakable: false)[#question(label: n => [2017 22])[
下列关于多重中断系统的叙述中，#emphasis[错误]的是
#choices([在一条指令执行结束时响应中断], [中断处理期间 CPU 处于关中断状态], [中断请求的产生与当前指令的执行无关], [CPU 通过采样中断请求信号检测中断请求])
]]

#block(breakable: false)[#question(label: n => [2018 22])[
下列关于外部 I/O 中断的叙述中，正确的是

#choices(
  [中断控制器按所接收中断请求的先后次序进行中断优先级排队],
  [CPU 响应中断时，通过执行中断隐指令完成通用寄存器的保护],
  [CPU 只有在处于中断允许状态时，才能响应外部设备的中断请求],
  [有中断请求时，CPU 立即暂停当前指令执行，转去执行中断服务程序],
)
]]

#block(breakable: false)[#question(label: n => [2019 21])[
某设备以中断方式与 CPU 进行数据交换，CPU 主频为1 GHz，设备接口中的数据缓冲寄存器为32位，设备的数据传输率为50 kB/s。若每次中断开销（包括中断响应和中断处理）为1000个时钟周期，则 CPU 用于该设备输入/输出的时间占整个 CPU 时间的百分比最多是

#choices([1.25%], [2.5%], [5%], [12.5%])
]]

#block(breakable: false)[#question(label: n => [2020 21])[
外部中断包括不可屏蔽中断（NMI）和可屏蔽中断。下列关于外部中断的叙述中，#emphasis[错误]的是

#choices([CPU 处于关中断状态时，也能响应 NMI 请求], [一旦可屏蔽中断请求信号有效，CPU 将立即响应], [不可屏蔽中断的优先级比可屏蔽中断的优先级高], [可通过中断屏蔽字改变可屏蔽中断的处理优先级])
]]

#block(breakable: false)[#question(label: n => [2021 22])[
下列是关于多重中断系统中 CPU 响应中断的叙述，其中#emphasis[错误]的是

#choices([仅在用户态（执行用户程序）下，CPU 才能检测和响应中断], [CPU 只有在检测到中断请求信号后，才会进入中断响应周期], [进入中断响应周期时，CPU 一定处于中断允许（开中断）状态], [若 CPU 检测到中断请求信号，则一定存在未被屏蔽的中断源请求信号])
]]

#block(breakable: false)[#question(label: n => [2022 21])[
下列关于中断 I/O 方式的叙述中，#emphasis[不正确]的是

#choices(
  [适用于键盘、针式打印机等字符型设备],
  [外设和主机之间的数据传送通过软件完成],
  [外设准备数据的时间应小于中断处理时间],
  [外设为某进程准备数据时 CPU 可运行其他进程],
)
]]

#block(breakable: false)[#question(label: n => [2024 21])[
下列关于中断 I/O 方式的叙述中，#emphasis[错误]的是

#choices([中断屏蔽字用于确定中断响应的优先级], [保存断点和程序状态字在中断响应阶段完成], [保存通用寄存器和设置新中断屏蔽字由软件实现], [单重中断方式下中断处理时 CPU 处于关中断状态])
]]

#block(breakable: false)[#question(label: n => [2026 22])[
中断控制 I/O 方式下，实现 I/O 需要硬件和软件协同完成。中断响应及处理过程所包含的下列工作中，必须由硬件完成的是
#choices([开中断], [中断判优], [保存断点], [保存通用寄存器])
]]

== DMA方式

#question(label: n => [2009 43])[
（8分）某计算机的CPU主频为500MHz，CPI为5（即执行每条指令平均需5个时钟周期）。假定某外设的数据传输率为0.5MB/s，采用中断方式与主机进行数据传送，以32位为传输单位，对应的中断服务程序包含18条指令，中断服务的其他开销相当于2条指令的执行时间。请回答下列问题，要求给出计算过程。

#subquestions[
+ 
  在中断方式下，CPU用于该外设I/O的时间占整个CPU时间的百分比是多少？
  \
+ 
  当该外设的数据传输率达到5MB/s时，改用DMA方式传送数据。假定每次DMA传送块大小为5000B，且DMA预处理和后处理的总开销为500个时钟周期，则CPU用于该外设I/O的时间占整个CPU时间的百分比是多少？（假设DMA与CPU之间没有访存冲突）
  
    
]
]

#question(label: n => [2012 43])[
（11分）假定某计算机的CPU主频为80MHz，CPI为4，并且平均每条指令访存1.5次，主存与Cache之间交换的块大小为16B，Cache的命中率为
99% ，存储器总线宽度为32位。请回答下列问题。

#subquestions[
+ 
  该计算机的MIPS数是多少？平均每秒Cache缺失的次数是多少？在不考虑DMA传送的情况下，主存带宽至少达到多少才能满足CPU的访存要求？
  \
+ 假定在 Cache 缺失的情况下访问主存时，存在 0.000
  5%的缺页率，则 CPU
  平均每秒产生多少次缺页异常？若页面大小为4KB，每次缺页都需要访问磁盘，访问磁盘时
  DMA 传送采用周期挪用公式，磁盘 I/O 接口的数据缓冲寄存器为32位，则磁盘
  I/O 接口平均每秒发出的 DMA 请求次数至少是多少？
  \
+ 
  CPU和DMA控制器同时要求使用存储器总线时，哪个优先级更高？为什么？
  \
+ 
  为了提高性能，主存采用4体交叉存储模式，工作时每1/4个存储周期启动一个体。若每个体的存储周期为
  50 ns，则该主存能提供的最大带宽是多少？
  
    
]
]

#block(breakable: false)[#question(label: n => [2013 22])[
下列关于中断 I/O 方式和 DMA
方式比较的叙述中，错误的是

#choices(
  [中断 I/O 方式请求的是 CPU 处理时间，DMA 方式请求的是总线使用权],
  [中断响应发生在一条指令执行结束后，DMA 响应发生在一个总线事务完成后],
  [中断 I/O 方式下数据传送通过软件完成，DMA 方式下数据传送由硬件完成],
  [中断 I/O 方式适用于所有外部设备，DMA 方式仅适用于快速外部设备],
)
]]

#question(label: n => [2018 43])[
（8分）假定计算机的主频为500 MHz，CPI 为4。现有设备 A 和 B，其数据传输率分别为2 MB/s 和40 MB/s，对应 I/O 接口中各有一个32位数据缓冲寄存器。请回答下列问题，要求给出计算过程。

#subquestions[
+ 若设备 A 采用定时查询 I/O 方式，每次输入/输出都至少执行10条指令。设备 A 最多间隔多长时间查询一次才能不丢失数据？CPU 用于设备 A 输入/输出的时间占 CPU 总时间的百分比至少是多少？
+ 在中断 I/O 方式下，若每次中断响应和中断处理的总时钟周期数至少为400，则设备 B 能否采用中断 I/O 方式？为什么？
+ 若设备 B 采用 DMA 方式，每次 DMA 传送的数据块大小为1000 B，CPU 用于 DMA 预处理和后处理的总时钟周期数为500，则 CPU 用于设备 B 输入/输出的时间占 CPU 总时间的百分比最多是多少？

]
]

#block(breakable: false)[#question(label: n => [2019 22])[
下列关于 DMA 方式的叙述中，正确的是

Ⅰ．DMA 传送前由设备驱动程序设置传送参数 \
Ⅱ．数据传送前由 DMA 控制器请求总线使用权 \
Ⅲ．数据传送由 DMA 控制器直接控制总线完成 \
Ⅳ．DMA 传送结束后的处理由中断服务程序完成

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ、Ⅳ], [仅Ⅱ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2020 22])[
若设备采用周期挪用 DMA 方式进行输入输出，每次 DMA 传送的数据块大小为512字节，相应的 I/O 接口中有一个32位数据缓冲寄存器。对于数据输入过程，下列叙述中，#emphasis[错误]的是

#choices([每准备好32位数据，DMA 控制器就发出一次总线请求], [相对于 CPU，DMA 控制器的总线使用权的优先级更高], [在整个数据块的传送过程中，CPU 不可以访问主存储器], [数据块传送结束时，会产生“DMA 传送结束”中断请求])
]]

#question(label: n => [2022 44])[
（8分）假设某磁盘驱动器中有4个双面盘片，每个盘面有20 000个磁道，每个磁道有500个扇区，每个扇区可记录512字节的数据，盘片转速为7 200 r/m（转/分），平均寻道时间为5 ms。请回答下列问题。

#subquestions[
+ 每个扇区包含数据及其地址信息，地址信息分为3个字段。这3个字段的名称各是什么？对于该磁盘，各字段至少占多少位？
+ 一个扇区的平均访问时间约为多少？
+ 若采用周期挪用 DMA 方式进行磁盘与主机之间的数据传送，磁盘控制器中的数据缓冲区大小为64位，则在一个扇区读写过程中，DMA 控制器向 CPU 发送了多少次总线请求？若 CPU 检测到 DMA 控制器的总线请求信号时也需要访问主存，则 DMA 控制器是否可以获得总线使用权？为什么？

]
]

#block(breakable: false)[#question(label: n => [2023 22])[
下列关于 I/O 控制方式的叙述中，错误的是
#choices([查询方式下，通过 CPU 执行查询程序进行 I/O 操作], [中断方式下，通过 CPU 执行中断服务程序进行 I/O 操作], [DMA 方式下，通过 CPU 执行 DMA 传送程序进行 I/O 操作], [对于 SSD、网络适配器等高速设备，采用 DMA 方式输入/输出])
]]

#block(breakable: false)[#question(label: n => [2024 22])[
DMA 控制 I/O 方式下，设备的输入/输出由 DMA 控制器控制完成，此时，DMA 控制器控制的数据传输通路位于

#choices([CPU 和主存之间], [CPU 和 DMA 控制器之间], [设备接口和主存之间], [设备接口和 DMA 控制器之间])
]]

#block(breakable: false)[#question(label: n => [2025 21])[
下列设备中，适合采用 DMA 输入/输出方式的是

#statements(columns: (1fr,1fr,1fr,1fr),[Ⅰ．键盘],[Ⅱ．网卡],[Ⅲ．固态硬盘],[Ⅳ．针式打印机])

#choices([仅Ⅰ、Ⅱ],[仅Ⅱ、Ⅲ],[仅Ⅱ、Ⅳ],[仅Ⅲ、Ⅳ])
]]
