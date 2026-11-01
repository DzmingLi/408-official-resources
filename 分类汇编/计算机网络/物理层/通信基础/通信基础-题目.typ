// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：通信基础

== 信道、信号、带宽、码元、波特、速率、信源与信宿等基本概念

#question(label: n => [2011 34])[
若某通信链路的数据传输速率为2400bps，采用4相位调制，则该链路的波特率是

#choices(
  [600波特],
  [1200波特],
  [4800波特],
  [9600波特],
)
]

== 奈奎斯特定理与香农定理

#question(label: n => [2016 34])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

若连接R2和R3链路的频率带宽为8 kHz，信噪比为30 dB，该链路实际数据传输速率约为理论最大数据传输速率的50%，则该链路的实际数据传输速率约是
#choices([8 kbps], [20 kbps], [40 kbps], [80 kbps])
]

#question(label: n => [2017 34])[
若信道在无噪声情况下的极限数据传输速率不小于信噪比为30 dB条件下的极限数据传输速率，则信号状态数至少是
#choices([4], [8], [16], [32])
]

== 编码与调制

#question(label: n => [2009 34])[
在无噪声情况下，若某通信链路的带宽为 3
kHz，采用4个相位、每个相位具有4种振幅的QAM调制技术，则该通信链路的最大数据传输速率是

#choices(
  [12 kbps],
  [24 kbps],
  [48 kbps],
  [96 kbps],
)
]

#question(label: n => [2014 35])[
下列因素中，不会影响信道数据传输速率的是

#choices(
  [信噪比],
  [频率带宽],
  [调制速率],
  [信号传播速度],
)
]

#question(label: n => [2015 34])[
使用两种编码方案对比特流01100111进行编码的结果如下图所示，编码1和编码2分别是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  for i in range(9) {
    line((2.5 * i, 0), (2.5 * i, 8.4), stroke: (thickness: 0.04em, dash: "dashed"))
  }
  content((-0.7, 9.1), [比特流], anchor: "east")
  for (i, bit) in (0, 1, 1, 0, 0, 1, 1, 1).enumerate() {
    content((2.5 * i + 1.25, 9.1), str(bit))
  }
  content((-0.7, 6.8), [编码1], anchor: "east")
  content((-0.7, 1.8), [编码2], anchor: "east")
  line((0, 5.5), (2.5, 5.5), (2.5, 8), (7.5, 8), (7.5, 5.5), (12.5, 5.5), (12.5, 8), (20, 8), stroke: 0.10em)
  line((0, 0.7), (1.25, 0.7), (1.25, 3.2), (3.75, 3.2), (3.75, 0.7),
    (5, 0.7), (5, 3.2), (6.25, 3.2), (6.25, 0.7), (8.75, 0.7),
    (8.75, 3.2), (10, 3.2), (10, 0.7), (11.25, 0.7), (11.25, 3.2),
    (13.75, 3.2), (13.75, 0.7), (15, 0.7), (15, 3.2), (16.25, 3.2),
    (16.25, 0.7), (17.5, 0.7), (17.5, 3.2), (18.75, 3.2), (18.75, 0.7), (20, 0.7), stroke: 0.10em)
}))

#choices(
  [NRZ和曼彻斯特编码],
  [NRZ和差分曼彻斯特编码],
  [NRZI和曼彻斯特编码],
  [NRZI和差分曼彻斯特编码],
)
]

#question(label: n => [2021 34])[
若下图为一段差分曼彻斯特编码信号波形，则其编码的二进制位串是

#align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  for x in range(9) {line((x*2.1,0.8),(x*2.1,-3.8),stroke:(paint:black,thickness:0.06em,dash:"dashed"))}
  line((0,0),(1.05,0),(1.05,-3),(2.1,-3),(2.1,0),(3.15,0),(3.15,-3),(5.25,-3),(5.25,0),(7.35,0),(7.35,-3),(9.45,-3),(9.45,0),(10.5,0),(10.5,-3),(11.55,-3),(11.55,0),(12.6,0),(12.6,-3),(13.65,-3),(13.65,0),(15.75,0),(15.75,-3),(16.8,-3),stroke:0.075em)
}))

#choices([1011 1001], [1101 0001], [0010 1110], [1011 0110])
]

#question(label: n => [2022 34])[
在一条带宽为200 kHz的无噪声信道上，若采用4个幅值的 ASK 调制，则该信道的最大数据传输速率是

#choices([200 kb/s], [400 kb/s], [800 kb/s], [1 600 kb/s])
]

== 电路交换、报文交换与分组交换

#question(label: n => [2013 35])[
主机甲通过1个路由器（存储转发方式）与主机乙互联，两段链路的数据传输速率均为
10
Mbps，主机甲分别采用报文交换和分组大小为10kb的分组交换向主机乙发送1个大小为
$8 "Mb" space (1 "M" = 10^6)$的报文。若忽略链路传播延迟、分组头开销和分组拆装时间，则两种交换方式完成该报文传输所需的总时间分别为

#choices(
  [800 ms、1600 ms],
  [801 ms、1600 ms],
  [1600 ms、800 ms],
  [1600 ms、801 ms],
)
]

== 数据报与虚电路

#question(label: n => [2020 34])[
下列关于虚电路网络的叙述中，#emphasis[错误]的是

#choices([可以确保数据分组传输顺序], [需要为每条虚电路预分配带宽], [建立虚电路时需要进行路由选择], [依据虚电路号（VCID）进行数据分组转发])
]
