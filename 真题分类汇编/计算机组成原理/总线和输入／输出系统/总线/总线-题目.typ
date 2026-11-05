// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：总线

== 总线的基本概念

#block(breakable: false)[#question(label: n => [2010 20])[
下列选项中的英文缩写均为总线标准的是

#choices(
  [PCI、CRT、USB、EISA],
  [ISA、CPI、VESA、EISA],
  [ISA、SCSI、RAM、MIPS],
  [ISA、EISA、PCI、PCI-Express],
)
]]

#block(breakable: false)[#question(label: n => [2011 20])[
在系统总线的数据线上，不可能传输的是

#choices(
  [指令],
  [操作数],
  [握手（应答）信号],
  [中断类型号],
)
]]

#block(breakable: false)[#question(label: n => [2012 20])[
下列关于USB总线特性的描述中，错误的是

#choices(
  [可实现外设的即插即用和热插拔],
  [可通过级联方式连接多台外设],
  [是一种通信总线，可连接不同外设],
  [同时可传输2位数据，数据传输率高],
)
]]

#block(breakable: false)[#question(label: n => [2012 21])[
下列选项中，在 I/O 总线的数据线上传输的信息包括

I. I/O接口中的命令字 II. I/O接口中的状态字 III.
中断类型号

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ、Ⅲ],
)
]]

#block(breakable: false)[#question(label: n => [2021 19])[
下列关于总线的叙述中，#emphasis[错误]的是

#choices([总线是在两个或多个部件之间进行数据交换的传输介质], [同步总线由时钟信号定时，时钟频率不一定等于工作频率], [异步总线由握手信号定时，一次握手过程完成一位数据交换], [突发（Burst）传送总线事务可以在总线上连续传送多个数据])
]]

== 总线的组成及性能指标

#block(breakable: false)[#question(label: n => [2009 20])[
假设某系统总线在一个总线周期中并行传输4字节信息，一个总线周期占用2个时钟周期，总线时钟频率为10
MHz，则总线带宽是

#choices(
  [10 MB/s],
  [20 MB/s],
  [40 MB/s],
  [80 MB/s],
)
]]

#block(breakable: false)[#question(label: n => [2014 19])[
某同步总线采用数据线和地址线复用方式，其中地址/数据线有32根，总线时钟频率为
66
MHz，每个时钟周期传送两次数据（上升沿和下降沿各传送一次数据），该总线的最大数据传输率（总线带宽）是

#choices(
  [132 MB/s],
  [264 MB/s],
  [528 MB/s],
  [1056 MB/s],
)
]]

#block(breakable: false)[#question(label: n => [2019 19])[
假定一台计算机采用3通道存储器总线，配套的内存条型号为 DDR3-1333，即内存条所接插的存储器总线的工作频率为 1333 MHz，总线宽度为64位，则存储器总线的总带宽大约是

#choices([10.66 GB/s], [32 GB/s], [64 GB/s], [96 GB/s])
]]

#block(breakable: false)[#question(label: n => [2020 19])[
QPI 总线是一种点对点全双工同步串行总线，总线上的设备可同时接收和发送信息，每个方向可同时传输20位信息（16位数据+4位校验位），每个 QPI 数据包有80位信息，分2个时钟周期传送，每个时钟周期传送2次。因此，QPI 总线带宽为：每秒传送次数×2 B×2。若 QPI 时钟频率为2.4 GHz，则总线带宽为

#choices([4.8 GB/s], [9.6 GB/s], [19.2 GB/s], [38.4 GB/s])
]]

#block(breakable: false)[#question(label: n => [2024 20])[
某存储器总线的时钟频率为420 MHz，总线宽度为64位，每个时钟周期传送2次数据；其总线事务支持突发传送方式，最多传送8次数据，第1个时钟周期传送地址和读/写命令，从第4个至第7个时钟周期连续传送8次数据。该总线的总线带宽（最大数据传输率）为

#choices([3.84 GB/s], [6.72 GB/s], [30.72 GB/s], [53.76 GB/s])
]]

#block(breakable: false)[#question(label: n => [2025 20])[
某处理器总线采用同步、并行传输方式，每个总线时钟周期传送4次数据（quadpumped 技术）。若该总线的工作频率为1333 MHz（实际单位是 MT/s，表示每秒传送1333 M次），总线宽度为64位，则总线带宽约为

#choices([10.66 GB/s],[42.66 GB/s],[85.31 GB/s],[341.25 GB/s])
]]

== 总线事务和定时

#block(breakable: false)[#question(label: n => [2012 19])[
某同步总线的时钟频率为100
MHz，宽度为32位，地址/数据线复用，每传输一个地址或数据占用一个时钟周期。若该总线支持突发（猝发）传输方式，则一次“主存写”总线事务传输128位数据所需要的时间至少是

#choices(
  [20 ns],
  [40 ns],
  [50 ns],
  [80 ns],
)
]]

#question(label: n => [2013 43])[
（9分）某32位计算机，CPU主频为800MHz，Cache命中时的CPI为4，Cache块大小为32字节；主存采用8体交叉存储方式，每个体的存储字长为32位、存储周期为40ns；存储器总线宽度为32位，总线时钟频率为200MHz，支持突发传送总线事务。每次读突发传送总线事务的过程包括：送首地址和命令、存储器准备数据、传送数据。每次突发传送32字节，传送地址或32位数据均需要一个总线时钟周期。请回答下列问题，要求给出理由或计算过程。

#subquestions[
+ 
  CPU和总线的时钟周期各为多少？总线的带宽（即最大数据传输率）为多少？
  \
+ 
  Cache缺失时，需要用几个读突发传送总线事务来完成一个主存块的读取？
  \
+ 
  存储器总线完成一次读突发传送总线事务所需的时间是多少？
  \
+ 
  若程序BP执行过程中，共执行了100条指令，平均每条指令需进行1.2次访存，
  Cache缺失率为 5% ，不考虑替换等开销，则BP的CPU执行时间是多少？
  
    
]
]

#block(breakable: false)[#question(label: n => [2014 20])[
一次总线事务中，主设备只需给出一个首地址，从设备就能从首地址开始的若干连续单元读出或写入多个数据。这种总线事务方式称为

#choices(
  [并行传输],
  [串行传输],
  [突发传输],
  [同步传输],
)
]]

#block(breakable: false)[#question(label: n => [2015 19])[
下列有关总线定时的叙述中，错误的是

#choices(
  [异步通信方式中，全互锁协议的速度最慢],
  [异步通信方式中，非互锁协议的可靠性最差],
  [同步通信方式中，同步时钟信号可由各设备提供],
  [半同步通信方式中，握手信号的采样由同步时钟控制],
)
]]

#block(breakable: false)[#question(label: n => [2016 21])[
下列关于总线设计的叙述中，#emphasis[错误]的是
#choices([并行总线传输比串行总线传输速度快], [采用信号线复用技术可减少信号线数量], [采用突发传输方式可提高总线数据传输率], [采用分离事务通信方式可提高总线利用率])
]]

#block(breakable: false)[#question(label: n => [2017 20])[
下列关于多总线结构的叙述中，#emphasis[错误]的是
#choices([靠近 CPU 的总线速度较快], [存储器总线可支持突发传送方式], [总线之间须通过桥接器相连], [PCI-Express×16采用并行传输方式])
]]

#block(breakable: false)[#question(label: n => [2018 21])[
下列选项中，可提高同步总线数据传输率的是

#statements(columns: (1fr, 1fr), [Ⅰ．增加总线宽度], [Ⅱ．提高总线工作频率],
  [Ⅲ．支持突发传输], [Ⅳ．采用地址/数据线复用],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ和Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2023 20])[
某存储器总线宽度为64 b，总线时钟频率为1 GHz，在总线上传输一个数据或地址需要一个时钟周期，不支持突发传送方式。若通过该总线连接 CPU 和主存，主存每次准备一个64 b数据需要6 ns，主存块大小为32 B，则读取一个主存块需要的时间是
#choices([8 ns], [11 ns], [26 ns], [32 ns])
]]
