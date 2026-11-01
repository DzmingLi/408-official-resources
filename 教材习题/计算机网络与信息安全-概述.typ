// 人工对照《计算机网络与信息安全》（2024年版，李全龙）第70—71页；PDF第77—78页。
// 原章名为“计算机网络与信息安全概述”，保留第16—20题的信息安全内容。
#import "template.typ": textbook, question, subquestions
#import "@preview/cetz:0.5.2" as cetz
#show: textbook.with(topic: "计算机网络与信息安全概述")
= 习题

#question[什么是计算机网络？]

#question[网络协议的三要素是什么？每个要素的含义分别是什么？]

#question[计算机网络的功能是什么？]

#question[按网络覆盖范围划分，主要有哪几类计算机网络？它们各有什么特点？]

#question[按网络拓扑划分，主要有哪几类计算机网络？它们各有什么特点？]

#question[计算机网络结构主要包括哪几部分？每部分的主要功能分别是什么？]

#question[简述你了解的接入网络，以及这些接入网络的特点。你经常使用的是哪类接入网络？]

#question[简述电路交换工作过程以及电路交换的特点。]

#question[什么是报文交换？什么是分组交换？试比较二者的优劣。]

#question[OSI参考模型包括几层？每层的主要功能分别是什么？]

#question[TCP/IP参考模型包括几层？每层主要包括哪些协议？]

#question[
主机A和主机B由一条带宽为 $R$、长度为 $D$ 的链路互连，信号传播速率为 $V$。假设主机A从 $t = 0$ 时刻开始向主机B发送分组，分组长度为 $L$。试求：

#subquestions[
+ 传播延迟（时延）$d_p$；
+ 传输延迟 $d_t$；
+ 若忽略结点处理延迟和排队延迟，则端到端延迟 $T$ 是多少？
+ 若 $d_p > d_t$，则 $t = d_t$ 时刻，分组的第一个比特在哪里？
+ 若 $V = 250000 "km/s"$，$L = 512 "bit"$，$R = 100 "Mbit/s"$，则使时延带宽积刚好为一个分组长度（即512 bit）的链路长度 $D$ 是多少？
]
]

#question[
假设主机A向主机B以存储-转发的分组交换方式发送一个大文件。主机A到达主机B的路径上有3段链路，其传输速率分别是R1 = 500 kbit/s、R2 = 2 Mbit/s、R3 = 1 Mbit/s。试求：

#subquestions[
+ 假设网络没有其他流量，则该文件传送过程的吞吐量是多少？
+ 假设文件大小为4 MB，则传输该文件到主机B需要多少时间？
]
]

#question[
假设主机A向主机B发送一个 $L = 1500 "B"$ 的分组，主机A到达主机B的路径上有3段链路、两个分组交换机，3段链路长度分别为 $D_1 = 5000 "km"$、$D_2 = 4000 "km"$、$D_3 = 1000 "km"$；每段链路的传输速率均为 $R = 2 "Mbit/s"$，信号传播速率为 $V = 250000 "km/s"$，分组交换机处理每个分组的时延为 $d_c = 3 "ms"$。试求：

#subquestions[
+ 若采用存储-转发的分组交换方式，则该分组从主机A到达主机B的端到端时延是多少？
+ 若 $d_c = 0$，且不采取存储-转发的分组交换方式，而是分组交换机直接转发收到的每个比特（即直通交换），则该分组从主机A到达主机B的端到端时延是多少？
]
]

#question[
如下图所示网络。A在 $t = 0$ 时刻开始向C发送一个2 Mbit的文件；B在 $t = 0.1 + e$ 秒（$e$ 为无限趋近于0的小正实数）向D发送一个1 Mbit的文件。忽略传播延迟和结点处理延迟。（注：$"k" = 10^3$，$"M" = 10^6$）

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(stroke: 0.6pt, content: (wrap: body => box(text(top-edge: "ascender", bottom-edge: "descender", body))))
    line((0, 4), (7, 4), (7, -4), (0, -4))
    line((7, 0), (21, 0))
    line((28, 4), (21, 4), (21, -4), (28, -4))
    for x in (7, 21) {
      content((x, 0), image("../历年真题+参考解答/2012/assets/visio-2003-router.svg", width: 3.6em, height: 3.2em, fit: "stretch"))
    }
    for (y, name) in ((4, [A]), (-4, [B])) {
      content((0, y), image("../历年真题+参考解答/2012/assets/visio-2003-pc.svg", width: 2.4em, height: 2.4em, fit: "stretch"))
      content((0, y - 1.85), text(size: 0.9em, name))
    }
    for (y, name) in ((4, [C]), (-4, [D])) {
      content((28, y), image("../历年真题+参考解答/2012/assets/visio-2003-server.svg", width: 1.4em, height: 2.4em, fit: "stretch"))
      content((28, y - 1.85), text(size: 0.9em, name))
    }
    for (x, y, body) in ((4, 5.1, [10 Mbit/s]), (4, -5.1, [10 Mbit/s]), (14, 1, [20 Mbit/s]), (24, 5.1, [10 Mbit/s]), (24, -5.1, [10 Mbit/s])) {
      content((x, y), text(size: 0.85em, body))
    }
    // Small file markers visible on the original links.
    rect((2.5, 4.15), (3.1, 4.55), fill: black, stroke: none)
    rect((2.5, -3.85), (3.1, -3.45), fill: luma(45%), stroke: none)
    rect((9, 0.25), (9.6, 0.65), fill: black, stroke: none)
    rect((25, 4.15), (25.6, 4.55), fill: black, stroke: none)
    rect((25, -3.85), (25.6, -3.45), fill: luma(45%), stroke: none)
  }),
  kind: image,
  numbering: none,
)

请回答下列问题：

#subquestions[
+ 如果图中网络采用存储-转发的报文交换方式，则A将2 Mbit的文件交付给C需要多长时间？B将1 Mbit的文件交付给D需要多长时间？
+ 如果图中网络采用存储-转发的分组交换方式，分组长度为等长的1 kbit，且忽略分组头开销以及报文的拆、装开销，则A将2 Mbit的文件交付给C需要多长时间？B将1 Mbit的文件交付给D需要多长时间？
+ 报文交换与分组交换相比，哪种交换方式更公平？
]
]

#question[互联网主要安全威胁有哪些？]

#question[面向目标的信息安全体系结构包括哪些内容？]

#question[面向应用的层次信息安全体系结构包括哪些内容？]

#question[基于OSI参考模型的信息安全体系结构定义了哪些安全服务？]

#question[基于OSI参考模型的信息安全体系结构定义了哪些安全机制？]
