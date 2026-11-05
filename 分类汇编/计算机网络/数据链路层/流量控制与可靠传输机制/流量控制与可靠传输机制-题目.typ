// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：流量控制与可靠传输机制

== 滑动窗口与信道利用率

#question(label: n => [2015 35])[
主机甲通过128 kbps卫星链路，采用滑动窗口协议向主机乙发送数据，链路单向传播延迟为250 ms，帧长为1000字节。不考虑确认帧的开销，为使链路利用率不小于80%，帧序号的比特数至少是

#choices([3], [4], [7], [8])
]

#question(label: n => [2019 35])[
对于滑动窗口协议，如果分组序号采用3比特编号，发送窗口大小为5，则接收窗口最大是

#choices([2], [3], [4], [5])
]

== 停止－等待协议

#question(label: n => [2018 36])[
主机甲采用停-等协议向主机乙发送数据，数据传输速率是3 kbps，单向传播延时是200 ms，忽略确认帧的传输延时。当信道利用率等于40%时，数据帧的长度为

#choices([240比特], [400比特], [480比特], [800比特])
]

#question(label: n => [2020 36])[
假设主机甲采用停—等协议向主机乙发送数据帧，数据帧长与确认帧长均为1000 B，数据传输速率是10 kbps，单向传播时延是200 ms，则甲的最大信道利用率为

#choices([80%], [66.7%], [44.4%], [40%])
]

== 后退N帧协议（GBN）

#question(label: n => [2009 35])[
数据链路层采用后退N帧（GBN）协议，发送方已经发送了编号为0～7的帧。当计时器超时时，若发送方只收到0、2、3号帧的确认，则发送方需要重发的帧数是

#choices(
  [2],
  [3],
  [4],
  [5],
)
]

#question(label: n => [2012 36])[
两台主机之间的数据链路层采用后退N帧协议（GBN）传输数据，数据传输速率为
16
kbps，单向传播时延为270ms，数据帧长度范围是128～512字节，接收方总是以与数据帧等长的帧进行确认。为使信道利用率达到最高，帧序号的比特数至少为

#choices(
  [5],
  [4],
  [3],
  [2],
)
]

#question(label: n => [2014 36])[
主机甲与主机乙之间使用后退
N帧协议（GBN）传输数据，甲的发送窗口尺寸为1000，数据帧长为1000字节，信道带宽为100
Mbps，乙每收到一个数据帧立即利用一个短帧（忽略其传输延迟）进行确认。若甲乙之间的单向传播延迟是
50 ms，则甲可以达到的最大平均数据传输速率约为

#choices(
  [10 Mbps],
  [20 Mbps],
  [80 Mbps],
  [100 Mbps],
)
]

#question(label: n => [2017 47])[
（9分）甲乙双方均采用后退 N 帧协议（GBN）进行持续的双向数据传输，且双方始终采用捎带确认，帧长均为1000 B。$S x,y$ 和 $R x,y$ 分别表示甲方和乙方发送的数据帧，其中：$x$ 是发送序号；$y$ 是确认序号（表示希望接收对方的下一帧序号）；数据帧的发送序号和确认序号字段均为3比特。信道传输速率为100 Mbps，RTT=0.96 ms。下图给出了甲方发送数据帧和接收数据帧的两种场景，其中 $t_0$ 为初始时刻，此时甲方的发送和确认序号均为0，$t_1$ 时刻甲方有足够多的数据待发送。
#align(center)[
#set text(size: .85em)
#cetz.canvas(length: .9em, {
 import cetz.draw: *
 set-style(stroke: .05em)
 for (offset, entries, t1, label) in (
  (0, ((true,21,20.1,[S0,0]),(true,19.5,18.6,[S1,0]),(true,18,17.1,[S2,0]),(true,16.5,15.6,[S3,0]),(false,14.9,13.2,[R0,1]),(true,12.2,11.3,[S4,1]),(false,10.3,8.6,[R1,3]),(false,8.6,6.9,[R3,3])), 5, [（a）]),
  (15, ((true,21,20.1,[S0,0]),(true,19.5,18.6,[S1,0]),(true,18,17.1,[S2,0]),(false,16.5,14.8,[R0,1]),(false,14.9,13.2,[R1,2]),(true,12.4,11.5,[S3,2]),(true,10.8,9.9,[S4,2]),(false,9.2,7.5,[R2,2])), 6, [（b）]),
 ) {
  content((offset,23.5),[甲方])
  line((offset,22.6),(offset,0),mark:(end:">"))
  circle((offset,22),radius:.15,fill:black)
  content((offset - .8,22.3),[$t_0$])
  for (outgoing,y1,y2,text) in entries {
   let x1 = if outgoing { offset } else { offset+9 }
   let x2 = if outgoing { offset+9 } else { offset }
   line((x1,y1),(x2,y2),mark:(end:">"))
   content((offset+4.4,(y1+y2)/2+.65),text)
  }
  circle((offset,t1),radius:.15,fill:black)
  content((offset - .8,t1+.3),[$t_1$])
  if offset == 15 {
   line((offset+.2,t1),(offset+2.5,t1+.5),stroke:.035em)
   circle((offset+5.3,t1+.65),radius:(3.05,.825),fill:luma(90%))
   content((offset+5.3,t1+.65),[S2,0超时])
  }
  let y = if offset == 0 { t1 } else { t1 - 1.6 }
  line((offset,y),(offset+9,y - .9),mark:(end:">"))
  content((offset+4.4,y+.25),[?])
  content((offset+4.5,y - 1.65),[……])
  line((offset,y - 3),(offset+9,y - 3.9),mark:(end:">"))
  content((offset+4.4,y - 2.6),[?])
  content((offset,-1),[时间]); content((offset+4.4,-2.2),label)
 }
})
]
请回答下列问题。
#subquestions[
 + 对于图（a），$t_0$ 时刻到 $t_1$ 时刻期间，甲方可以断定乙方已正确接收的数据帧数是多少？正确接收的是哪几个帧（请用 $S x,y$ 形式给出）？
 + 对于图（a），从 $t_1$ 时刻起，甲方在不出现超时且未收到乙方新的数据帧之前，最多还可以发送多少个数据帧？其中第一个帧和最后一个帧分别是哪个（请用 $S x,y$ 形式给出）？
 + 对于图（b），从 $t_1$ 时刻起，甲方在不出现新的超时且未收到乙方新的数据帧之前，需要重发多少个数据帧？重发的第一个帧是哪个（请用 $S x,y$ 形式给出）？
 + 甲方可以达到的最大信道利用率是多少？
]
]

== 选择重传协议（SR）

#question(label: n => [2011 35])[
数据链路层采用选择重传协议（SR）传输数据，发送方已发送了0～3号数据帧，现已收到1号帧的确认，而0、2号帧依次超时，则此时需要重传的帧数是

#choices(
  [1],
  [2],
  [3],
  [4],
)
]

#question(label: n => [2023 35])[
假设通过同一条信道，数据链路层分别采用停-等协议、GBN 协议和 SR 协议（发送窗口和接收窗口相等）传输数据，3个协议的数据帧长相同，忽略确认帧长度，帧序号位数为3比特。若对应3个协议的发送方最大信道利用率分别是 U1、U2 和 U3，则 U1、U2 和 U3 满足的关系是
#choices([$"U1"<="U2"<="U3"$], [$"U1"<="U3"<="U2"$], [$"U2"<="U3"<="U1"$], [$"U3"<="U2"<="U1"$])
]

#question(label: n => [2024 37])[
主机甲通过选择重传（SR）滑动窗口协议向主机乙发送帧的部分过程如题37图所示，Fx 为数据帧，ACKx 为确认帧，$x$ 是位数为3比特的序号。乙只对正确接收的数据帧进行独立确认，发送窗口与接收窗口大小相同且均为最大值。甲在 $t_1$ 时刻和 $t_2$ 时刻发送的数据帧分别是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 2026 年大纲 PDF 第 58 页：按正文约 35 px/em 换算扫描坐标。
  let p(x,y) = ((x - 494) / 35, (867 - y) / 35)
  set-style(stroke: 0.06em, content: (wrap: body => box(text(size: 0.75em, top-edge: "bounds", bottom-edge: "bounds", body))))
  content(p(492,296),[甲]); content(p(941,296),[乙])
  content(p(492.5,365.5),image("../../../../历年真题+参考解答/2024/official-images/q37-pc.png",width: (93 / 35) * 1em))
  content(p(938,365.5),image("../../../../历年真题+参考解答/2024/official-images/q37-pc.png",width: (93 / 35) * 1em))
  for x in (494,943) { line(p(x,407),p(x,867),mark: (end: ">",fill: black,scale: 0.8)) }
  for (a,b,label,pos,angle) in (
    ((494,417),(943,529),[F0],(569,416),-14deg),
    ((494,479),(661,522),[F1],(569,472),-14deg),
    ((494,530),(943,642),[F2],(569,534),-14deg),
    ((494,594),(943,705),[F3],(569,586),-14deg),
    ((943,543),(494,650),[ACK0],(775,556),14deg),
    ((494,668),(644,707),[?],(566,676),-14deg),
    ((943,658),(494,771),[ACK2],(705,698),14deg),
    ((943,718),(747,771),[ACK3],(823,729),15deg),
    ((494,807),(644,845),[?],(566,811),-14deg),
  ) {
    line(p(..a),p(..b),mark: (end: ">",fill: black,scale: 0.8))
    content(p(..pos),label,angle: angle)
  }
  content(p(697,521),[丢失]); content(p(714,773),[丢失])
  for (y,label) in ((668,[$t_1$]),(807,[$t_2$])) {
    circle(p(494,y),radius: 0.09,fill: black)
    content(p(469,y+1),label)
  }
  line(p(429,791),p(486,791),p(494,807))
  content(p(379,791),[F1超时]); content(p(437,851),[时间])
})),caption: [题37图],kind: image)

#choices([F1，F3], [F1，F4], [F3，F1], [F4，F1])
]

#question(label: n => [旧版题型示例])[
在选择重传协议（SR）中，当帧的序号字段为3比特，且接收窗口与发送窗口尺寸相同时，发送窗口的最大尺寸为

#choices([2], [4], [6], [8])
]
