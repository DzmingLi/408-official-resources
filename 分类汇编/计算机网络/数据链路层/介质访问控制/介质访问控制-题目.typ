// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：介质访问控制

== 信道划分

#question(label: n => [2014 37])[
站点A、B、C通过CDMA共享链路，A、B、C的码片序列（chipping
sequence）分别是 $(1,1,1,1)$、$(1,-1,1,-1)$ 和 $(1,1,-1,-1)$。若C从链路上收到的序列是 $(2,0,2,0,0,-2,0,-2,0,2,0,2)$，则C收到A发送的数据是

#choices(
  [000],
  [101],
  [110],
  [111],
)
]

== 随机访问

#question(label: n => [2009 37])[
在一个采用CSMA/CD协议的网络中，传输介质是一根完整的电缆，传输速率为1Gbps，电缆中的信号传播速度是200000km/s。若最小数据帧长度减少800比特，则最远的两个站点之间的距离至少需要

#choices(
  [增加160m],
  [增加80m],
  [减少160m],
  [减少80m],
)
]

#question(label: n => [2010 47])[
（9分）某局域网采用CSMA/CD协议实现介质访问控制，数据传输速率为10
Mbps，主机甲和主机乙之间的距离为2km，信号传播速度是200000km/s。请回答下列问题，要求说明理由或写出计算过程。

#subquestions[
+ 
  若主机甲和主机乙发送数据时发生冲突，则从开始发送数据时刻起，到两台主机均检测到冲突时刻止，最短需经过多长时间？最长需经过多长时间？（假设主机甲和主机乙发送数据过程中，其他主机不发送数据）
  \
+ 
  若网络不存在任何冲突与差错，主机甲总是以标准的最长以太网数据帧（1518字节）向主机乙发送数据，主机乙每成功收到一个数据帧后立即向主机甲发送一个
  64字节的确认帧，主机甲收到确认帧后方可发送下一个数据帧。此时主机甲的有效数据传输速率是多少？（不考虑以太网帧的前导码）
    
]
]

#question(label: n => [2011 36])[
下列选项中，对正确接收到的数据帧进行确认的 MAC
协议是

#choices(
  [CSMA],
  [CDMA],
  [CSMA/CD],
  [CSMA/CA],
)
]

#question(label: n => [2013 36])[
下列介质访问控制方法中，可能发生冲突的是

#choices(
  [CDMA],
  [CSMA],
  [TDMA],
  [FDMA],
)
]

#question(label: n => [2015 36])[
下列关于CSMA/CD协议的叙述中，错误的是

#choices(
  [边发送数据帧，边检测是否发生冲突],
  [适用于无线网络，以实现无线链路共享],
  [需要根据网络跨距和数据传输速率限定最小帧长],
  [当信号传播延迟趋近0时，信道利用率趋近100%],
)
]

#question(label: n => [2016 36])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

若Hub再生比特流过程中，会产生1.535 μs延时，信号传播速率为200 m/μs，不考虑以太网帧的前导码，则H3与H4之间理论上可以相距的最远距离是
#choices([200 m], [205 m], [359 m], [512 m])
]

#question(label: n => [2018 35])[
IEEE 802.11 无线局域网的 MAC 协议 CSMA/CA 进行信道预约的方法是

#choices([发送确认帧], [采用二进制指数退避], [使用多个 MAC 地址], [交换 RTS 与 CTS 帧])
]

#question(label: n => [2019 36])[
假设一个采用 CSMA/CD 协议的100 Mbps 局域网，最小帧长是128 B，则在一个冲突域内两个站点之间的单向传播延时最多是

#choices([2.56 μs], [5.12 μs], [10.24 μs], [20.48 μs])
]

#block(breakable: false)[#question(label: n => [2020 37])[
某 IEEE 802.11 无线局域网中，主机 H 与 AP 之间发送或接收 CSMA/CA 帧的过程如下图所示。在 H 或 AP 发送帧前所等待的帧间间隔时间（IFS）中，最长的是

#align(center, cetz.canvas(length:1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  content((0,1.7),[H]); content((8,1.7),[AP])
  merge-path({line((-0.5,0.8),(0.5,0.5),(0.3,-0.1),(-0.7,0.2))},close:true,fill:white)
  merge-path({line((-0.7,0.2),(0.3,-0.1),(0.65,-0.5),(-0.3,-0.25))},close:true,fill:luma(90%))
  line((0.4,0.7),(0.65,1.1)); line((0.7,0.8),(0.85,1.2))
  merge-path({line((7.75,-0.3),(8.25,-0.3),(8.1,0.7),(7.9,0.7))},close:true,fill:white)
  line((8,0.7),(8,1.2)); circle((8,1.2),radius:0.15)
  line((0,-0.6),(0,-11.5),mark:(end:">",scale:0.8))
  line((8,-0.3),(8,-11.5),mark:(end:">",scale:0.8))
  let frame(y1,y2,back:false,name:[]) = {
    let slope = if back {0.45} else {-0.45}
    merge-path({line((0,y1),(8,y1+slope),(8,y2+slope),(0,y2))},close:true,fill:luma(96%))
    content((3.5,(y1+y2+slope)/2),text(size:0.85em)[#name])
    if back {line((3.5,(y1+y2)/2),(2,(y1+y2)/2-0.1),mark:(end:">",scale:0.7))}
    else {line((4.2,(y1+y2)/2-0.25),(5.5,(y1+y2)/2-0.35),mark:(end:">",scale:0.7))}
  }
  frame(-1.1,-2.1,name:[RTS]); frame(-3.6,-4.6,back:true,name:[CTS])
  frame(-5.2,-7.2,name:[DATA]); frame(-9.2,-10.2,back:true,name:[ACK])
  content((-0.2,-0.9),text(size:0.8em)[IFS1],anchor:"east")
  content((8.2,-2.85),text(size:0.8em)[IFS2],anchor:"west")
  content((-0.2,-4.9),text(size:0.8em)[IFS3],anchor:"east")
  content((8.2,-8.1),text(size:0.8em)[IFS4],anchor:"west")
  content((-0.2,-11.1),[时间],anchor:"east")
}))

#choices([IFS1], [IFS2], [IFS3], [IFS4])
]]

#question(label: n => [2023 36])[
已知10BaseT以太网的争用时间片为51.2 μs。若网卡在发送某帧时发生了连续4次冲突，则基于二进制指数退避算法确定的再次尝试重发该帧前等待的最长时间是
#choices([51.2 μs], [204.8 μs], [768 μs], [819.2 μs])
]

#question(label: n => [2025 35])[
在某个10 BaseT以太网的冲突域内，若主机甲向主机乙发送数据帧时发生了连续11次冲突，则甲再次尝试发送该数据帧的最大间隔时间是

#choices([0.512 ms],[0.5632 ms],[52.3776 ms],[104.8064 ms])
]

#question(label: n => [旧版题型示例])[
根据 CSMA/CD 协议的工作原理，下列情形中需要提高最短帧长度的是

#choices(
  [网络传输速率不变，冲突域的最大距离变短],
  [冲突域的最大距离不变，网络传输速率提高],
  [上层协议使用 TCP 的概率增加],
  [在冲突域不变的情况下减少线路中的中继器数量],
)
]
