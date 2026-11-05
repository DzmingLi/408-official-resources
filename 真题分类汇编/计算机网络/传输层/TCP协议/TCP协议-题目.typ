// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：TCP协议

== TCP段

#question(label: n => [2009 38])[
主机甲与主机乙间已建立一个TCP连接，主机甲向主机乙发送了两个连续的TCP段，分别包含300字节和500字节的有效载荷，第一个段的序列号为200，主机乙正确接收到两个段后，发送给主机甲的确认序列号是

#choices(
  [500],
  [700],
  [800],
  [1000],
)
]

#question(label: n => [2013 39])[
主机甲与主机乙之间已建立一个TCP连接，双方持续有数据传输，且数据无差错与丢失。若甲收到1个来自乙的TCP段，该段的序号为1913、确认序号为2046、有效载荷为100字节，则甲立即发送给乙的TCP段的序号和确认序号分别是

#choices(
  [2046、2012],
  [2046、2013],
  [2047、2012],
  [2047、2013],
)
]

#question(label: n => [2020 39])[
若主机甲与主机乙建立 TCP 连接时，发送的 SYN 段中的序号为1000，在断开连接时，甲发送给乙的 FIN 段中的序号为5001，则在无任何重传的情况下，甲向乙已经发送的应用层数据的字节数为

#choices([4002], [4001], [4000], [3999])
]

== TCP连接管理

#question(label: n => [2011 39])[
主机甲向主机乙发送一个（$"SYN" = 1$，$"seq" = 11220$
）的TCP段，期望与主机乙建立TCP连接，若主机乙接受该连接请求，则主机乙向主机甲发送的正确的TCP段可能是

#choices(
  [（$"SYN" = 0$，$"ACK" = 0$，$"seq" = 11221$，$"ack" = 11221$）],
  [（$"SYN" = 1$，$"ACK" = 1$，$"seq" = 11220$，$"ack" = 11220$）],
  [（$"SYN" = 1$，$"ACK" = 1$，$"seq" = 11221$，$"ack" = 11221$）],
  [（$"SYN" = 0$，$"ACK" = 0$，$"seq" = 11220$，$"ack" = 11220$）],
)
]

#question(label: n => [2019 39])[
若主机甲主动发起一个与主机乙的 TCP 连接，甲、乙选择的初始序列号分别为2018和2046，则第三次握手 TCP 段的确认序列号是

#choices([2018], [2019], [2046], [2047])
]

#question(label: n => [2021 38])[
若客户首先向服务器发送 FIN 段请求断开 TCP 连接，则当客户收到服务器发送的 FIN 段并向服务器发送了 ACK 段后，客户的 TCP 状态转换为

#choices([CLOSE_WAIT], [TIME_WAIT], [FIN_WAIT_1], [FIN_WAIT_2])
]

#question(label: n => [2022 39])[
假设客户 C 和服务器 S 已建立一个 TCP 连接，通信往返时间 RTT = 50 ms，最长报文段寿命 MSL = 800 ms，数据传输结束后，C 主动请求断开连接。若从 C 主动向 S 发出 FIN 段时刻算起，则 C 和 S 进入 CLOSED 状态所需的时间至少分别是

#choices([850 ms，50 ms], [1 650 ms，50 ms], [850 ms，75 ms], [1 650 ms，75 ms])
]

#question(label: n => [2024 38])[
假设主机 H 通过 TCP 向服务器发送长度为3000 B的报文，往返时间 RTT=10 ms，最长报文段寿命 MSL=30 s，最大报文段长度 MSS=1000 B，忽略 TCP 段的传输时延，报文传输结束后 H 首先请求断开连接，则从 H 请求建立 TCP 连接时刻起，到 H 进入 CLOSED 状态为止，所需的时间至少是

#choices([30.03 s], [30.04 s], [60.03 s], [60.04 s])
]

#question(label: n => [2025 39])[
Time 是一个提供时间查询服务的 C/S 架构网络应用，支持客户通过 UDP 或 TCP 向 Time 服务器请求时间服务。若某客户与某 Time 服务器通信的往返时间 RTT=8 ms，则该客户分别通过 UDP 和 TCP 向该服务器请求服务，所需的最少时间分别是

#choices([8 ms，8 ms],[8 ms，16 ms],[16 ms，8 ms],[16 ms，16 ms])
]

== TCP可靠传输

#question(label: n => [2011 40])[
主机甲与主机乙之间已建立一个TCP连接，主机甲向主机乙发送了3个连续的TCP段，分别包含300字节、400字节和500字节的有效载荷，第3个段的序号为900。若主机乙仅正确接收到第1和第3个段，则主机乙发送给主机甲的确认序号是

#choices(
  [300],
  [500],
  [1200],
  [1400],
)
]

#question(label: n => [2012 47])[
（9分）主机H通过快速以太网连接Internet，IP地址为192.168.0.8，服务器S的IP地址为211.68.71.80。H与S使用TCP通信时，在H上捕获的其中5个IP分组如题47-a表所示。

#{
  let packet-row(words) = text(size: 0.68em)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      row-gutter: 0.14em,
      align: center,
      ..words,
    )
  ]
  set figure.caption(position: top)
  figure(
    table(
      columns: (3.2em, 1fr),
      align: center + horizon,
      [编号], [IP分组的前40字节内容（十六进制）],
      [1], packet-row((
        [45 00 00 30], [01 9b 40 00], [80 06 1d e8], [c0 a8 00 08], [d3 44 47 50],
        [0b d9 13 88], [84 6b 41 c5], [00 00 00 00], [70 02 43 80], [5d b0 00 00],
      )),
      [2], packet-row((
        [45 00 00 30], [00 00 40 00], [31 06 6e 83], [d3 44 47 50], [c0 a8 00 08],
        [13 88 0b d9], [e0 59 9f ef], [84 6b 41 c6], [70 12 16 d0], [37 e1 00 00],
      )),
      [3], packet-row((
        [45 00 00 28], [01 9c 40 00], [80 06 1d ef], [c0 a8 00 08], [d3 44 47 50],
        [0b d9 13 88], [84 6b 41 c6], [e0 59 9f f0], [50 10 43 80], [2b 32 00 00],
      )),
      [4], packet-row((
        [45 00 00 38], [01 9d 40 00], [80 06 1d de], [c0 a8 00 08], [d3 44 47 50],
        [0b d9 13 88], [84 6b 41 c6], [e0 59 9f f0], [50 18 43 80], [c6 55 00 00],
      )),
      [5], packet-row((
        [45 00 00 28], [68 11 40 00], [31 06 06 7a], [d3 44 47 50], [c0 a8 00 08],
        [13 88 0b d9], [e0 59 9f f0], [84 6b 41 d6], [50 10 16 d0], [57 d2 00 00],
      )),
    ),
    kind: table,
    caption: [题47-a表],
    numbering: none,
  )
}
请回答下列问题。

#subquestions[
+ 
  题47-a表中的IP分组中，哪几个是由H发送的？哪几个完成了TCP连接建立过程？哪几个在通过快速以太网传输时进行了填充？
  \
+ 
  根据题47-a表中的IP分组，分析S已经收到的应用层数据字节数是多少？
  \
+ 
  若题47-a表中的某个IP分组在S发出时的前40字节如题47-b表所示，则该IP分组到达H时经过了多少个路由器？
  
  #{
    set figure.caption(position: top)
    figure(
      align(center)[#table(
        columns: 6,
        align: (auto, auto, auto, auto, auto, auto),
        [S发出的], [45000028], [68114000], [4006ecad], [d3444750], [ca760106],
        [IP分组], [1388a108], [e0599ff0], [846b41d6], [501016d0], [b7d60000],
      )],
      kind: table,
      caption: [题47-b表],
      numbering: none,
    )
  }
  
  注：IP分组头和TCP段头结构分别如题47-a图、题47-b图所示。
  
  #figure(align(center,cetz.canvas(length:1em,{
    import cetz.draw: *
    set-style(stroke:0.055em,content:(wrap:body=>box(text(size:0.75em,top-edge:"bounds",bottom-edge:"bounds",body))))
    // 2013 大纲 PDF 第 57 页；位域宽度及各行高度按扫描图描点。
    let p(x,y)=((x - 288) / 32,(1140 - y) / 32)
    rect(p(288,881),p(849,1140))
    for y in (943,984,1056,1097) {line(p(288,y),p(849,y))}
    for x in (359,430,569) {line(p(x,881),p(x,943))}
    for x in (569,622) {line(p(x,943),p(x,984))}
    for x in (430,569) {line(p(x,984),p(x,1056))}
    for (x,y,body) in ((323,910,[版本]),(394,898,[头部]),(394,926,[长度]),
      (500,913,[服务类型]),(710,913,[总长度]),(428,965,[标识]),(596,965,[标志]),
      (735,965,[片偏移]),(359,1008,[生存时间]),(359,1035,[(TTL)]),(500,1021,[协议]),
      (710,1021,[头部校验和]),(568,1078,[源地址]),(568,1120,[目的地址])) {content(p(x,y),body)}
    line(p(288,876),p(849,876))
    for i in range(33) {
      let x=288+i*561/32
      line(p(x,876),p(x,if calc.rem(i,8)==0 or i==32 {856} else {867}))
    }
    for (x,body) in ((254,[比特]),(288,[0]),(430,[8]),(570,[16]),(710,[24]),(849,[31])) {content(p(x,842),body)}
  })),kind:image,caption:[题47-a图　IP分组头结构],numbering:none)
  
  #figure(align(center,cetz.canvas(length:1em,{
    import cetz.draw: *
    set-style(stroke:0.055em,content:(wrap:body=>box(text(size:0.75em,top-edge:"bounds",bottom-edge:"bounds",body))))
    let p(x,y)=((x - 288) / 32,(1540 - y) / 32)
    rect(p(288,1298),p(849,1540))
    for y in (1342,1383,1433,1498) {line(p(288,y),p(849,y))}
    line(p(570,1298),p(570,1342)); line(p(570,1498),p(570,1540))
    // 原图的窄标志位按可辨识宽度绘制，并非机械的等宽 32 列。
    for x in (344,414,439,465,492,516,542,570) {line(p(x,1433),p(x,1498))}
    for (x,y,body) in ((430,1320,[源端口]),(710,1320,[目的端口]),(570,1364,[序号（seq）]),
      (570,1408,[确认号（ack）]),(316,1453,[头部]),(316,1480,[长度]),(379,1468,[保留]),
      (710,1468,[窗口]),(430,1520,[校验和]),(710,1520,[紧急指针])) {content(p(x,y),body)}
    for (x,letters) in ((426.5,"URG"),(452,"ACK"),(478.5,"PSH"),(504,"RST"),(529,"SYN"),(556,"FIN")) {
      for (i,c) in letters.clusters().enumerate() {content(p(x,1446+20*i),text(size:0.67em,c))}
    }
    line(p(288,1293),p(849,1293))
    for i in range(33) {
      let x=288+i*561/32
      line(p(x,1293),p(x,if calc.rem(i,8)==0 or i==32 {1273} else {1284}))
    }
    for (x,body) in ((254,[比特]),(288,[0]),(430,[8]),(570,[16]),(710,[24]),(849,[31])) {content(p(x,1261),body)}
  })),kind:image,caption:[题47-b图　TCP段头结构],numbering:none)
    
]
]

#question(label: n => [2019 38])[
某客户通过一个 TCP 连接向服务器发送数据的部分过程如题38图所示。客户在 $t_0$ 时刻第一次收到确认序列号 ack_seq = 100 的段，并发送序列号 seq = 100 的段，但发生丢失。若 TCP 支持快速重传，则客户重新发送 seq = 100 段的时刻是

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em)
    line((0, 17.5), (0, 0), mark: (end: ">", fill: black, scale: 0.8))
    line((12, 17.5), (12, 0), mark: (end: ">", fill: black, scale: 0.8))
    let message(a, b, body, angle, fraction: auto) = {
      line(a, b, mark: (end: ">", fill: black, scale: 0.75))
      let fraction = if fraction != auto { fraction } else if a.at(0) > b.at(0) { 0.83 } else { 0.25 }
      let m = (a.at(0) + fraction * (b.at(0) - a.at(0)),
        a.at(1) + fraction * (b.at(1) - a.at(1)) + 0.55)
      content(m, std.rotate(-angle, reflow: true, text(size: 0.8em, body)))
    }
    message((12, 16.8), (0, 13.8), [ack_seq=100], 14deg, fraction: 0.7)
    message((0, 13.8), (7.5, 12), [seq=100], -14deg, fraction: 0.55)
    content((8.7, 11.8), [丢失])
    message((0, 12.3), (12, 9.3), [seq=200], -14deg)
    message((0, 10.8), (12, 7.8), [seq=300], -14deg)
    message((0, 9.3), (12, 6.3), [seq=400], -14deg)
    message((12, 9.3), (0, 6.3), [ack_seq=100], 14deg)
    message((12, 7.8), (0, 4.8), [ack_seq=100], 14deg)
    message((12, 6.3), (0, 3.3), [ack_seq=100], 14deg)
    for (i, y) in ((0, 13.8), (1, 6.3), (2, 4.8), (3, 3.3), (4, 1.8)) {
      content((-0.9, y), $t_#i$)
    }
    circle((0, 1.8), radius: 0.09, fill: black)
    line((0, 1.8), (0.6, 2.1), (1.6, 2.1))
    content((1.8, 2.1), text(size: 0.85em)[$t_4$ 时刻 seq=100 段超时], anchor: "west")
    content((-1.7, 0.6), [时间])
    content((0, 20.5), [客户])
    content((12, 20.5), [服务器])
    // 客户端的 CRT 显示器与键盘。
    line((-0.7, 18.9), (0.4, 18.5), (0.4, 17.5), (-0.7, 17.9), close: true, fill: luma(85%))
    line((0.4, 18.5), (1.1, 18.9), (1.1, 17.9), (0.4, 17.5), close: true, fill: luma(55%))
    line((-0.55, 18.65), (0.22, 18.37), (0.22, 17.75), (-0.55, 18.03), close: true, fill: white)
    line((-0.8, 17.7), (0.5, 17.25), (0.9, 17.5), (-0.4, 17.95), close: true, fill: luma(80%))
    line((-1.1, 17.35), (-0.2, 17.0), (0.15, 16.8), (-0.8, 17.12), close: true, fill: white)
    // 服务器机箱。
    line((11.2, 19.15), (12.2, 18.65), (12.2, 17.0), (11.2, 17.5), close: true, fill: luma(35%))
    line((12.2, 18.65), (13, 19.1), (13, 17.45), (12.2, 17.0), close: true, fill: luma(55%))
    line((11.2, 19.15), (12, 19.6), (13, 19.1), (12.2, 18.65), close: true, fill: luma(70%))
    line((11.4, 18.6), (11.9, 18.35), stroke: white + 0.08em)
    circle((11.55, 18.1), radius: 0.05, fill: white, stroke: none)
  }),
  caption: [题38图], numbering: none,
)

#choices([$t_1$], [$t_2$], [$t_3$], [$t_4$])
]

== TCP流量控制

#question(label: n => [2010 39])[
主机甲和主机乙之间已建立了一个TCP连接，TCP最大段长度为1000字节。若主机甲的当前拥塞窗口为4000字节，在主机甲向主机乙连续发送两个最大段后，成功收到主机乙发送的对第一个段的确认段，确认段中通告的接收窗口大小为2000字节，则此时主机甲还可以向主机乙发送的最大字节数是

#choices(
  [1000],
  [2000],
  [3000],
  [4000],
)
]

#question(label: n => [2021 40])[
假设主机甲通过 TCP 向主机乙发送数据，部分过程如下图所示。甲在 $t_0$ 时刻发送了一个序号 seq = 501、封装200 B数据的段，在 $t_1$ 时刻收到乙发送的序号 seq = 601、确认序号 ack_seq = 501、接收窗口 rcwnd = 500 B的段，则甲在未收到新的确认段之前可以继续向乙发送的数据序号范围是

#align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  content((0,1.7),image("../../../../历年真题+参考解答/2012/assets/visio-2003-pc.svg",width:2.1em))
  content((13,1.7),image("../../../../历年真题+参考解答/2012/assets/visio-2003-server.svg",width:1.5em))
  content((0,3.2),[甲]);content((13,3.2),[乙])
  line((0,0),(0,-4.7),mark:(end:">",scale:0.7));line((13,0),(13,-4.7),mark:(end:">",scale:0.7))
  line((0,-0.4),(7.7,-1.1),mark:(end:">",scale:0.7))
  line((13,-1.9),(0,-3.1),mark:(end:">",scale:0.7))
  line((0,-3.1),(2,-3.6),mark:(end:">",scale:0.7))
  content((3.8,-0.15),std.rotate(5deg,reflow:true,text(size:0.8em)[seq=501,200 B数据]))
  content((7,-2),std.rotate(-5deg,reflow:true,text(size:0.8em)[seq=601,ack_seq=501,rcwnd=500 B]))
  content((-0.15,-0.4),[$t_0$],anchor:"east");content((-0.15,-3.1),[$t_1$],anchor:"east")
  content((-0.15,-4.3),[时间],anchor:"east")
}))

#choices([501～1000], [601～1100], [701～1000], [801～1100])
]

== TCP拥塞控制

#question(label: n => [2009 39])[
一个TCP连接总是以1KB的最大段长发送TCP段，发送方有足够多的数据要发送。当拥塞窗口为16KB时发生了超时，如果接下来的4个RTT（往返时间）时间内的TCP段的传输都是成功的，那么当第4个RTT时间内发送的所有TCP段都得到肯定应答时，拥塞窗口大小是

#choices(
  [7KB],
  [8KB],
  [9KB],
  [16KB],
)
]

#question(label: n => [2014 38])[
主机甲和主机乙已建立了TCP连接，甲始终以
MSS = 1 KB 大小的段发送数据，并一直有数据发送；乙每收到一个数据段都会发出一个接收窗口为10 KB的确认段。若甲在 $t$ 时刻发生超时时拥塞窗口为8 KB，则从 $t$ 时刻起，不再发生超时的情况下，经过10个 RTT 后，甲的发送窗口是

#choices(
  [10KB],
  [12KB],
  [14KB],
  [15KB],
)
]

#question(label: n => [2015 39])[
主机甲和主机乙新建一个TCP连接，甲的拥塞控制初始阈值为32KB，甲向乙始终以MSS=1KB大小的段发送数据，并一直有数据发送；乙为该连接分配16KB接收缓存，并对每个数据段进行确认，忽略段传输延迟。若乙收到的数据全部存入缓存，不被取走，则甲从连接建立成功时刻起，未发生超时的情况下，经过4个RTT后，甲的发送窗口是

#choices([1KB], [8KB], [16KB], [32KB])
]

#question(label: n => [2016 41])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

（9分）假设题33～41图中的H3访问Web服务器S时，S为新建的TCP连接分配了20 KB（K=1024）的接收缓存，最大段长MSS=1 KB，平均往返时间RTT=200 ms。H3建立连接时的初始序号为100，且持续以MSS大小的段向S发送数据，拥塞窗口初始阈值为32 KB；S对收到的每个段进行确认，并通告新的接收窗口。假定TCP连接建立完成后，S端的TCP接收缓存仅有数据存入而无数据取出。请回答下列问题。
#subquestions[
+ 在TCP连接建立过程中，H3收到的S发送过来的第二次握手TCP段的SYN和ACK标志位的值分别是多少？确认序号是多少？
+ H3收到的第8个确认段所通告的接收窗口是多少？此时H3的拥塞窗口变为多少？H3的发送窗口变为多少？
+ 当H3的发送窗口等于0时，下一个待发送的数据段序号是多少？H3从发送第1个数据段到发送窗口等于0时刻为止，平均数据传输速率是多少（忽略段的传输延时）？
+ 若H3与S之间通信已经结束，在 $t$ 时刻H3请求断开该连接，则从 $t$ 时刻起，S释放该连接的最短时间是多少？
]
]

#question(label: n => [2017 39])[
若甲向乙发起一个 TCP 连接，最大段长 MSS=1 KB，RTT=5 ms，乙开辟的接收缓存为64 KB，则甲从连接建立成功至发送窗口达到32 KB，需经过的时间至少是
#choices([25 ms], [30 ms], [160 ms], [165 ms])
]

#question(label: n => [2020 38])[
若主机甲与主机乙已建立一条 TCP 连接，最大段长（MSS）为1 KB，往返时间（RTT）为2 ms，则在不出现拥塞的前提下，拥塞窗口从8 KB增长到32 KB所需的最长时间是

#choices([4 ms], [8 ms], [24 ms], [48 ms])
]

#question(label: n => [2022 38])[
假设主机甲和主机乙已建立一个 TCP 连接，最大段长 MSS = 1 KB，甲一直有数据向乙发送，当甲的拥塞窗口为16 KB时，计时器发生了超时，则甲的拥塞窗口再次增长到16 KB所需要的时间至少是

#choices([4 RTT], [5 RTT], [11 RTT], [16 RTT])
]

#question(label: n => [2025 38])[
主机甲通过 TCP 向主机乙发送数据的部分过程如题38图所示，seq 为序号，ack_seq 为确认序号，rcvwnd 为接收窗口。甲在 $t_0$ 时刻的拥塞窗口和发送窗口均为2000 B，拥塞控制阈值为8000 B，MSS=1000 B，甲始终以 MSS 发送 TCP 段。若甲在 $t_1$ 时刻收到如图所示的确认段，则甲在未收到新的确认段之前，还可以继续向乙发送的 TCP 段数是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 大纲 PDF 第 82 页，保留原图的斜率、两次发送的间距和标签离线距离。
  let p(x,y)=((x - 399) / 35,(1560 - y) / 35)
  set-style(stroke:0.045em,content:(wrap:body=>box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  content(p(400,1100),image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-pc.png",width:3.3em)); content(p(402,1027),[甲])
  content(p(978,1102),image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-server.png",width:2.3em)); content(p(983,1031),[乙])
  for x in (399,978) {line(p(x,1147),p(x,1560),mark:(end:">",fill:black,scale:0.7))}
  for (a,b) in (((399,1174),(978,1318)),((399,1222),(747,1308)),
    ((978,1318),(399,1484)),((399,1484),(496,1512))) {
    line(p(..a),p(..b),mark:(end:">",fill:black,scale:0.7))
  }
  content(p(567,1190),[seq=2001，1000 B数据],angle:-14deg)
  content(p(567,1237),[seq=3001，1000 B数据],angle:-14deg)
  content(p(674,1386),[seq=4001，ack_seq=3001，rcvwnd=4000 B],angle:16deg)
  for (y,label) in ((1174,[$t_0$]),(1484,[$t_1$])) {circle(p(399,y),radius:0.12,fill:black);content(p(368,y),label)}
  content(p(363,1547),[时间])
})),caption: [题38图],kind: image)

#choices([2],[3],[4],[5])
]

#question(label: n => [2026 47])[
（本题9分）人工智能（AI）是引领未来的战略性技术，其发展高度依赖强大的算力供给，通过网络互联分散的算力中心，可以充分聚合算力资源，满足人工智能对大规模算力的需求，支撑人工智能国家发展战略。某算力调度交易平台聚合各地的算力中心的算力，向用户提供算力服务的示意场景如题47图所示。算力用户 C 向平台申请算力服务，平台通过优化调度各算力中心算力，向 C 授权使用算力中心 $i$ 的算力，$S_i$ 为算力中心 $i$ 的负载均衡服务器，用于接收算力用户的计算任务描述数据文件，并向算力中心 $i$ 内部分派计算任务。为确保可靠传输，假设 C 建立一条 TCP 连接向服务器 $S_i$ 上传一个总长度为2000 B的计算任务描述数据文件，拥塞窗口初始阈值为8 MSS，MSS=500 B，$S_i$ 对收到的每个 TCP 段进行确认，且确认段不封装数据，接收窗口 rwnd 始终为1000 B，RTT=5 ms。C 建立连接时选择的初始序号为1000，$S_i$ 选择的初始序号为2000，SYN、ACK、FIN 为标志位，seq 为序号，ack\_seq 为确认序号。在整个文件传输过程中未出现任何重传或报文段丢失。
#figure(image("../../../../历年真题+参考解答/2026/official-images/q47.png", width: 25em), caption: [题47图])
请回答下列问题。
#subquestions[
 + C 与 $S_i$ 建立 TCP 连接过程需要几次握手？C 收到的 SYN=1、ACK=1的 TCP 段的确认序号（ack\_seq）是多少？（2分）
 + 当 C 接收到 $S_i$ 发送的“ACK=1，seq=2001，ack\_seq=2001，rwnd=1000”确认段后，C 的拥塞窗口增加到多少？C 的发送窗口设置为多少？（2分）
 + C 与 $S_i$ 释放 TCP 连接过程需要几次挥手？C 收到的最后一个 TCP 报文段的序号（seq）、确认序号（ack\_seq）、FIN 的值分别是多少？（4分）
 + 若忽略报文段传输时延，且时间从 C 请求建立 TCP 连接时刻算起，则 C 确认 $S_i$ 已成功接收到文件的时间是多少？（1分）
]
]
