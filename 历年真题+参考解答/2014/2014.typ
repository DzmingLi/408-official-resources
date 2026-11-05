#import "../../template.typ": exam, choices, subquestions, statements, inline-node
#show: exam.with(year: 2014, subject: "计算机学科专业基础", code: "408")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz
#let exam-diagram = diagram.with(
  node-stroke: 0.065em,
  node-fill: white,
  edge-stroke: 0.065em,
)

#set document(title: "2014年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题")
= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项符合试题要求。
#question[
下列程序段的时间复杂度是

```c
count = 0;
for (k = 1; k <= n; k *= 2)
    for (j = 1; j <= n; j++)
        count++;
```

#choices(
  [$O(log_2 n)$],
  [$O(n)$],
  [$O(n log_2 n)$],
  [$O(n^2)$],
)
]

#question[
假设栈初始为空，将中缀表达式
$a \/ b + (c ast d - e ast f) \/ g$ 转换为等价的后缀表达式的过程中，当扫描到 $f$ 时，栈中的元素依次是

#choices(
  [$+ ( ast -$],
  [$+ ( - ast$],
  [$\/ + ( ast - ast$],
  [$\/ + - ast$],
)
]

#question[
循环队列存放在一维数组 $A[0 dots M - 1]$ 中，$italic("end1")$ 指向队头元素，$italic("end2")$ 指向队尾元素的后一个位置。假设队列两端均可进行入队和出队操作，队列中最多能容纳 $M - 1$ 个元素，初始时为空。下列判断队空和队满的条件中，正确的是

#choices(
  [队空：$italic("end1") == italic("end2")$；队满：$italic("end1") == (italic("end2") + 1) mod M$],
  [队空：$italic("end1") == italic("end2")$；队满：$italic("end2") == (italic("end1") + 1) mod (M - 1)$],
  [队空：$italic("end2") == (italic("end1") + 1) mod M$；队满：$italic("end1") == (italic("end2") + 1) mod M$],
  [队空：$italic("end1") == (italic("end2") + 1) mod M$；队满：$italic("end2") == (italic("end1") + 1) mod (M - 1)$],
)
]

#question[
若对如下的二叉树进行中序线索化，则结点 $x$ 的左、右线索指向的结点分别是

#align(center)[
  #text(size: 0.86em)[
    #exam-diagram(
      spacing: 1.95em,
      node((0, 0), [a], radius: 1.17em),
      node((-0.78, 0.88), [b], radius: 1.17em),
      node((0.77, 0.88), [c], radius: 1.17em),
      node((-1.59, 1.82), [d], radius: 1.17em),
      node((0.03, 1.83), [x], radius: 1.17em),
      node((-0.70, 2.77), [e], radius: 1.17em),
      edge((0, 0), (-0.78, 0.88)),
      edge((0, 0), (0.77, 0.88)),
      edge((-0.78, 0.88), (-1.59, 1.82)),
      edge((-0.78, 0.88), (0.03, 1.83)),
      edge((-1.59, 1.82), (-0.70, 2.77)),
    )
  ]
]

#choices(
  [e、c],
  [e、a],
  [d、c],
  [b、a],
)
]

#question[
将森林 $F$ 转换为对应的二叉树 $T$，$F$ 中叶结点的个数等于

#choices(
  [$T$ 中叶结点的个数],
  [$T$ 中度为1的结点个数],
  [$T$ 中左孩子指针为空的结点个数],
  [$T$ 中右孩子指针为空的结点个数],
)
]

#question[
5个字符有如下4种编码方案，不是前缀编码的是

#choices(
  [01,0000,0001,001,1],
  [011,000,001,010,1],
  [000,001,010,011,100],
  [0,100,110,1110,1100],
)

]

#question[
对如下所示的有向图进行拓扑排序，得到的拓扑序列可能是

#align(center)[
  #exam-diagram(
    mark-scale: 94%,
    spacing: 1.85em,
    node((-0.82, 0), [1], radius: 0.76em),
    node((0.82, 0.03), [2], radius: 0.76em),
    node((-1.68, 1.47), [3], radius: 0.76em),
    node((0, 1.48), [4], radius: 0.76em),
    node((1.53, 1.49), [5], radius: 0.76em),
    node((0, 2.96), [6], radius: 0.76em),
    edge((-1.68, 1.47), (-0.82, 0), "-|>"),
    edge((-0.82, 0), (0.82, 0.03), "-|>"),
    edge((-0.82, 0), (0, 1.48), "-|>"),
    edge((0, 1.48), (0.82, 0.03), "-|>"),
    edge((0.82, 0.03), (1.53, 1.49), "-|>"),
    edge((-1.68, 1.47), (0, 2.96), "-|>"),
    edge((0, 1.48), (0, 2.96), "-|>"),
    edge((0, 2.96), (1.53, 1.49), "-|>"),
  )
]

#choices(
  [3,1,2,4,5,6],
  [3,1,2,4,6,5],
  [3,1,4,2,5,6],
  [3,1,4,2,6,5],
)
]

#question[
用哈希（散列）方法处理冲突（碰撞）时可能出现堆积（聚集）现象。下列选项中，会受堆积现象直接影响的是

#choices(
  [存储效率],
  [散列函数],
  [装填（装载）因子],
  [平均查找长度],
)
]

#question[
在一棵具有15个关键字的4阶B树中，含关键字的结点个数最多是

#choices(
  [5],
  [6],
  [10],
  [15],
)
]

#question[
用希尔排序方法对一个数据序列进行排序时，若第1趟排序结果为9，1，4，13，7，8，20，
23，15，则该趟排序采用的增量（间隔）可能是

#choices(
  [2],
  [3],
  [4],
  [5],
)
]

#question[
下列选项中，不可能是快速排序第2趟排序结果的是

#choices(
  [2,3,5,4,6,7,9],
  [2,7,5,6,4,3,9],
  [3,2,5,4,7,6,9],
  [4,2,3,5,7,6,9],
)
]

#question[
程序 $P$ 在机器 $M$ 上的CPU执行时间是20秒，编译优化后，$P$ 执行的指令数减少到原来的70%，而 CPI 增加到原来的1.2倍，则 $P$ 在 $M$ 上的CPU执行时间是

#choices(
  [8.4秒],
  [11.7秒],
  [14.0秒],
  [16.8秒],
)
]

#question[
若 $x = 103$，$y = -25$，则下列表达式采用8位定点补码运算实现时，会发生溢出的是

#choices(
  [$x + y$],
  [$-x + y$],
  [$x - y$],
  [$-x - y$],
)
]

#question[
float 型数据通常用 IEEE 754 单精度浮点格式表示。假定两个 float 型变量 $x$ 和 $y$ 分别存放在32位寄存器 f1 和 f2 中，若（f1）= CC90 0000H，（f2）= B0C0 0000H，则 $x$ 和 $y$ 之间的关系为

#choices(
  [$x < y$ 且符号相同],
  [$x < y$ 且符号不同],
  [$x > y$ 且符号相同],
  [$x > y$ 且符号不同],
)

]

#question[
某容量为256 MB的存储器由若干
$4 "M" times 8$位的DRAM芯片构成，该DRAM芯片的地址引脚和数据引脚总数是

#choices(
  [19],
  [22],
  [30],
  [36],
)
]

#question[
采用指令 Cache 与数据 Cache 分离的主要目的是

#choices(
  [降低 Cache 的缺失损失],
  [提高 Cache 的命中率],
  [降低CPU平均访存时间],
  [减少指令流水线资源冲突],
)
]

#question[
某计算机有16个通用寄存器，采用32位定长指令字，操作码字段（含寻址方式位）为8位，Store指令的源操作数和目的操作数分别采用寄存器直接寻址和基址寻址方式。若基址寄存器可使用任一通用寄存器，且偏移量用补码表示，则Store指令中偏移量的取值范围是

#choices(
  [$-32768 tilde.op +32767$],
  [$-32767 tilde.op +32768$],
  [$-65536 tilde.op +65535$],
  [$-65535 tilde.op +65536$],
)
]

#question[
#strike[某计算机采用微程序控制器，共有32条指令，公共的取指令微程序包含2条微指令，各指令对应的微程序平均由4条微指令组成，采用断定法（下址字段法）确定下条微指令地址，则微指令中下址字段的位数至少是

#choices(
  [5],
  [6],
  [8],
  [9],
)
]
]

#question[
某同步总线采用数据线和地址线复用方式，其中地址/数据线有32根，总线时钟频率为
66
MHz，每个时钟周期传送两次数据（上升沿和下降沿各传送一次数据），该总线的最大数据传输率（总线带宽）是

#choices(
  [132 MB/s],
  [264 MB/s],
  [528 MB/s],
  [1056 MB/s],
)
]

#question[
一次总线事务中，主设备只需给出一个首地址，从设备就能从首地址开始的若干连续单元读出或写入多个数据。这种总线事务方式称为

#choices(
  [并行传输],
  [串行传输],
  [突发传输],
  [同步传输],
)
]

#question[
下列有关 I/O接口的叙述中，错误的是

#choices(
  [状态端口和控制端口可以合用同一个寄存器],
  [I/O接口中CPU可访问的寄存器称为I/O端口],
  [采用独立编址方式时，I/O端口地址和主存地址可能相同],
  [采用统一编址方式时，CPU不能用访存指令访问I/O端口],
)
]

#question[
若某设备中断请求的响应和处理时间为100 ns，每400
ns发出一次中断请求，中断响应所允许的最长延迟时间为50
ns，则在该设备持续工作过程中，CPU用于该设备的I/O时间占整个CPU时间的百分比至少是

#choices(
  [12.5%],
  [25%],
  [37.5%],
  [50%],
)
]

#question[
下列调度算法中，不可能导致饥饿现象的是

#choices(
  [时间片轮转],
  [静态优先数调度],
  [非抢占式短作业优先],
  [抢占式短作业优先],
)
]

#question[
某系统有 $n$ 台互斥使用的同类设备，三个并发进程分别需要3、4、5台设备。可确保系统不发生死锁的设备数 $n$ 最小为

#choices(
  [9],
  [10],
  [11],
  [12],
)
]

#question[
下列指令中，不能在用户态执行的是

#choices(
  [trap指令],
  [跳转指令],
  [压栈指令],
  [关中断指令],
)
]

#question[
一个进程的读磁盘操作完成后，操作系统针对该进程必做的是

#choices(
  [修改进程状态为就绪态],
  [降低进程优先级],
  [为进程分配用户内存空间],
  [增加进程的时间片大小],
)
]

#question[
现有一个容量为10GB的磁盘分区，磁盘空间以簇（Cluster）为单位进行分配，簇的大小为4KB，若采用位图法管理该分区的空闲空间，即用一位（bit）标识一个簇是否被分配，则存放该位图所需簇的个数为

#choices(
  [80],
  [320],
  [80K],
  [320K],
)
]

#question[
下列措施中，能加快虚实地址转换的是

#statements(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1em,
  [I. 增大快表（TLB）容量],
  [II. 让页表常驻内存],
  [III. 增大交换区（swap）],
)

#choices(
  [仅Ⅰ],
  [仅Ⅱ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
)
]

#question[
在一个文件被用户进程首次打开的过程中，操作系统需做的是

#choices(
  [将文件内容读到内存中],
  [将文件控制块读到内存中],
  [修改文件控制块中的读写权限],
  [将文件的数据缓冲区首指针返回给用户进程],
)
]

#question[
在页式虚拟存储管理系统中，采用某些页面置换算法，会出现Belady异常现象，即进程的缺页次数会随着分配给该进程的页框个数的增加而增加。下列算法中，可能出现
Belady异常现象的是

I. LRU算法 II. FIFO算法 III. OPT算法

#choices(
  [仅Ⅱ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
)
]

#question[
下列关于管道（Pipe）通信的叙述中，正确的是

#choices(
  [一个管道可实现双向数据传输],
  [管道的容量仅受磁盘容量大小限制],
  [进程对管道进行读操作和写操作都可能被阻塞],
  [一个管道只能有一个读进程或一个写进程对其操作],
)
]

#question[
下列选项中，属于多级页表优点的是

#choices(
  [加快地址变换速度],
  [减少缺页中断次数],
  [减少页表项所占字节数],
  [减少页表所占的连续内存空间],
)
]

#question[
在OSI参考模型中，直接为会话层提供服务的是

#choices(
  [应用层],
  [表示层],
  [传输层],
  [网络层],
)
]

#question[
某以太网拓扑及交换机当前转发表如下图所示。主机00-e1-d5-00-23-a1向主机00-e1-d5-00-23-c1发送1个数据帧，主机00-e1-d5-00-23-c1收到该帧后，向主机00-e1-d5-00-23-a1发送1个确认帧，交换机对这两个帧的转发端口分别是

#align(center)[
  #cetz.canvas(length: 2em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
    let host(x, address) = {
      content((x, 0.62), box(fill: white, inset: 0pt)[
        #image("../../assets/network/desktop-symbol.svg", width: 2.24em, height: 2.24em)
      ])
      // The shallow keyboard echoes the older PC symbols in the scan.
      rect((x - 0.60, 0.14), (x + 0.60, 0.34), fill: white, stroke: 0.52pt)
      content((x, -0.22), [#text(size: 0.80em)[#address]])
    }
  
    let label(x, y, body, anchor: "center", size: 0.72em) = content(
      (x, y), [#text(size: size)[#body]], anchor: anchor,
    )
  
    hide(rect((-0.05, -0.05), (14.35, 3.65), stroke: none), bounds: true)
  
    // Switch and its three physical links.
    rect((0.42, 2.42), (5.36, 3.56), fill: white, stroke: 0.58pt)
    label(2.89, 2.94, [交换机], size: 0.95em)
    line((0.93, 2.42), (0.93, 1.87), (-1.10, 1.87), (-1.10, 1.08), stroke: 0.58pt)
    line((2.76, 2.42), (2.76, 1.08), stroke: 0.58pt)
    line((4.63, 2.42), (4.63, 1.87), (6.73, 1.87), (6.73, 1.08), stroke: 0.58pt)
    label(1.14, 2.14, [1])
    label(2.97, 2.14, [2])
    label(4.84, 2.14, [3])
  
    host(-1.10, [00-e1-d5-00-23-a1])
    host(2.79, [00-e1-d5-00-23-b1])
    host(6.73, [00-e1-d5-00-23-c1])
  
    // Forwarding table: the source has only a header rule and one divider.
    line((8.55, 2.60), (14.30, 2.60), stroke: 0.58pt)
    line((12.31, 3.62), (12.31, 0.54), stroke: 0.58pt)
    label(10.42, 2.98, [目的地址], size: 0.86em)
    label(13.31, 2.98, [端口], size: 0.86em)
    label(10.42, 2.00, [00-e1-d5-00-23-b1], size: 0.80em)
    label(13.31, 2.00, [2], size: 0.82em)
  })
]

#choices(
  [{3}和{1}],
  [{2,3}和{1}],
  [{2,3}和{1,2}],
  [{1,2,3}和{1}],
)
]

#question[
下列因素中，不会影响信道数据传输速率的是

#choices(
  [信噪比],
  [频率带宽],
  [调制速率],
  [信号传播速度],
)
]

#question[
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

#question[
站点A、B、C通过CDMA共享链路，A、B、C的码片序列（chipping
sequence）分别是 $(1,1,1,1)$、$(1,-1,1,-1)$ 和 $(1,1,-1,-1)$。若C从链路上收到的序列是 $(2,0,2,0,0,-2,0,-2,0,2,0,2)$，则C收到A发送的数据是

#choices(
  [000],
  [101],
  [110],
  [111],
)
]

#question[
主机甲和主机乙已建立了TCP连接，甲始终以
MSS = 1 KB 大小的段发送数据，并一直有数据发送；乙每收到一个数据段都会发出一个接收窗口为10 KB的确认段。若甲在 $t$ 时刻发生超时时拥塞窗口为8 KB，则从 $t$ 时刻起，不再发生超时的情况下，经过10个 RTT 后，甲的发送窗口是

#choices(
  [10KB],
  [12KB],
  [14KB],
  [15KB],
)
]

#question[
下列关于 UDP 协议的叙述中，正确的是

I. 提供无连接服务

Ⅱ. 提供复用/分用服务

Ⅲ. 通过差错校验，保障可靠数据传输

#choices(
  [仅Ⅰ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ、Ⅲ],
)
]

#question[
使用浏览器访问某大学Web网站主页时，不可能使用到的协议是

#choices(
  [PPP],
  [ARP],
  [UDP],
  [SMTP],
)
]

= 二、综合应用题：41～47小题，共70分。
#question[
（13分）二叉树的带权路径长度（WPL）是二叉树中所有叶结点的带权路径长度之和。给定一棵二叉树 $T$，采用二叉链表存储，结点结构为：#inline-node(
  columns: (3.2em, 4em, 3.2em),
  [left], [weight], [right],
)，其中叶结点的 weight 域保存该结点的非负权值。设 root 为指向 $T$ 的根结点的指针，请设计求 $T$ 的 WPL 的算法。要求：

#subquestions[
+ 给出算法的基本设计思想；
  \
+ 使用C或C++语言，给出二叉树结点的数据类型定义；
  \
+ 
  根据设计思想，采用C或C++语言描述算法，关键之处给出注释。
  
    
]
]

#question[
（10分）某网络中的路由器运行OSPF路由协议，题42表是路由器R1维护的主要链路状态信息（LSI），题42图是根据题42表及R1的接口名构造出来的网络拓扑。

#{
  set figure.caption(position: top)
  figure(
    kind: table,
    caption: [题42表　R1所维护的LSI],
    numbering: none,
  )[
  #text(size: 0.8em)[
  #table(
    columns: (0.7fr, 0.75fr, 1.1fr, 1.1fr, 1.1fr, 1.1fr, 2.25fr),
    align: center + horizon,
    stroke: 0.6pt,
    table.cell(colspan: 2)[],
    [R1的LSI], [R2的LSI], [R3的LSI], [R4的LSI], [备注],

    table.cell(colspan: 2)[Router ID],
    [10.1.1.1], [10.1.1.2], [10.1.1.5], [10.1.1.6], [标识路由器的IP地址],

    table.cell(rowspan: 3)[Link1],
    [ID], [10.1.1.2], [10.1.1.1], [10.1.1.6], [10.1.1.5], [所连路由器的Router ID],
    [IP], [10.1.1.1], [10.1.1.2], [10.1.1.5], [10.1.1.6], [Link1的本地IP地址],
    [Metric], [3], [3], [6], [6], [Link1的费用],

    table.cell(rowspan: 3)[Link2],
    [ID], [10.1.1.5], [10.1.1.6], [10.1.1.1], [10.1.1.2], [所连路由器的Router ID],
    [IP], [10.1.1.9], [10.1.1.13], [10.1.1.10], [10.1.1.14], [Link2的本地IP地址],
    [Metric], [2], [4], [2], [4], [Link2的费用],

    table.cell(rowspan: 2)[Net1],
    [Prefix], [192.1.1.0/24], [192.1.6.0/24], [192.1.5.0/24], [192.1.7.0/24], [直连网络Net1的网络前缀],
    [Metric], [1], [1], [1], [1], [到达直连网络Net1的费用],
    )
  ]
  ]
}
#figure(
  align(center)[
    #cetz.canvas({
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    
      let cloud-path(cx, cy, fill: white, stroke: 0.6pt) = merge-path({
        bezier((cx - 1.45, cy - 0.05), (cx - 1.18, cy + 0.32), (cx - 1.43, cy + 0.18), (cx - 1.35, cy + 0.34))
        bezier((cx - 1.18, cy + 0.32), (cx - 0.72, cy + 0.48), (cx - 1.02, cy + 0.50), (cx - 0.86, cy + 0.52))
        bezier((cx - 0.72, cy + 0.48), (cx - 0.15, cy + 0.56), (cx - 0.52, cy + 0.64), (cx - 0.30, cy + 0.63))
        bezier((cx - 0.15, cy + 0.56), (cx + 0.36, cy + 0.50), (cx + 0.02, cy + 0.70), (cx + 0.23, cy + 0.65))
        bezier((cx + 0.36, cy + 0.50), (cx + 0.86, cy + 0.46), (cx + 0.57, cy + 0.64), (cx + 0.76, cy + 0.60))
        bezier((cx + 0.86, cy + 0.46), (cx + 1.28, cy + 0.27), (cx + 1.10, cy + 0.52), (cx + 1.28, cy + 0.43))
        bezier((cx + 1.28, cy + 0.27), (cx + 1.46, cy - 0.06), (cx + 1.48, cy + 0.18), (cx + 1.50, cy + 0.04))
        bezier((cx + 1.46, cy - 0.06), (cx + 1.19, cy - 0.35), (cx + 1.45, cy - 0.25), (cx + 1.35, cy - 0.38))
        bezier((cx + 1.19, cy - 0.35), (cx + 0.72, cy - 0.43), (cx + 1.02, cy - 0.52), (cx + 0.84, cy - 0.52))
        bezier((cx + 0.72, cy - 0.43), (cx + 0.20, cy - 0.50), (cx + 0.51, cy - 0.57), (cx + 0.34, cy - 0.58))
        bezier((cx + 0.20, cy - 0.50), (cx - 0.35, cy - 0.50), (cx + 0.02, cy - 0.66), (cx - 0.18, cy - 0.64))
        bezier((cx - 0.35, cy - 0.50), (cx - 0.83, cy - 0.42), (cx - 0.56, cy - 0.60), (cx - 0.72, cy - 0.56))
        bezier((cx - 0.83, cy - 0.42), (cx - 1.24, cy - 0.33), (cx - 1.05, cy - 0.53), (cx - 1.23, cy - 0.47))
        bezier((cx - 1.24, cy - 0.33), (cx - 1.45, cy - 0.05), (cx - 1.43, cy - 0.30), (cx - 1.49, cy - 0.17))
      }, close: true, fill: fill, stroke: stroke)
    
      let cloud(cx, cy, label) = {
        cloud-path(cx + 0.10, cy - 0.13, fill: luma(55%), stroke: none)
        cloud-path(cx, cy, fill: luma(95%), stroke: 0.55pt)
        content((cx, cy), [#text(size: 0.82em, weight: "semibold")[#label]])
      }
    
      let router(x, y, label) = {
        content((x, y), box(fill: white, inset: 0pt)[
          #image("../../assets/network/router-symbol.svg",
            width: 0.82cm, height: 0.82cm, fit: "stretch")
        ])
        content((x, y - 0.25), [#text(size: 0.86em)[#label]])
      }
    
      let label(x, y, body, anchor: "center") = content(
        (x, y), [#text(size: 0.72em)[#body]], anchor: anchor,
      )
    
      hide(rect((-0.2, -0.2), (14.2, 4.2), stroke: none), bounds: true)
      line((2.65, 3.55), (4.32, 3.55), stroke: 0.55pt)
      line((5.08, 3.55), (9.32, 3.55), stroke: 0.55pt)
      line((10.08, 3.55), (11.35, 3.55), stroke: 0.55pt)
      line((2.65, 0.45), (4.32, 0.45), stroke: 0.55pt)
      line((5.08, 0.45), (9.32, 0.45), stroke: 0.55pt)
      line((10.08, 0.45), (11.35, 0.45), stroke: 0.55pt)
      line((4.70, 3.19), (4.70, 0.81), stroke: 0.55pt)
      line((9.70, 3.19), (9.70, 0.81), stroke: 0.55pt)
    
      cloud(1.35, 3.55, [192.1.1.0/24])
      cloud(12.65, 3.55, [192.1.6.0/24])
      cloud(1.35, 0.45, [192.1.5.0/24])
      cloud(12.65, 0.45, [192.1.7.0/24])
      router(4.70, 3.55, [R1])
      router(9.70, 3.55, [R2])
      router(4.70, 0.45, [R3])
      router(9.70, 0.45, [R4])
    
      label(4.22, 3.94, [E0])
      label(4.97, 4.08, [L0])
      label(5.18, 3.78, [10.1.1.1], anchor: "west")
      label(9.24, 3.78, [10.1.1.2], anchor: "east")
      label(3.72, 3.28, [1])
      label(7.20, 3.28, [3])
      label(10.72, 3.78, [1])
    
      label(4.96, 3.02, [L1], anchor: "west")
      label(5.14, 2.72, [10.1.1.9], anchor: "west")
      label(4.48, 2.00, [2])
      label(10.14, 3.02, [10.1.1.13], anchor: "west")
      label(9.48, 2.00, [4])
    
      label(5.14, 0.98, [10.1.1.10], anchor: "west")
      label(5.16, 0.18, [10.1.1.5], anchor: "west")
      label(3.72, 0.18, [1])
      label(7.20, 0.78, [6])
      label(9.24, 0.18, [10.1.1.6], anchor: "east")
      label(10.14, 0.98, [10.1.1.14], anchor: "west")
      label(10.72, 0.18, [1])
    })
  ],
  kind: image,
  caption: [题42图　R1构造的网络拓扑],
  numbering: none,
)

请回答下列问题。

#subquestions[
+ 本题中的网络可抽象为数据结构中的哪种逻辑结构？
  \
+ 
  针对题42表中的内容，设计合理的链式存储结构，以保存题42表中的链路状态信息（LSI）。要求给出链式存储结构的数据类型定义，并画出对应题42表的链式存储结构示意图（示意图中可仅以ID标识结点）。
  \
+ 
  按照迪杰斯特拉（Dijkstra）算法的策略，依次给出R1到达题42图中子网192.1.x.x的最短路径及费用。
  
    
]
]

#question[
（9分）请根据题42描述的网络，继续回答下列问题。

#subquestions[
+ 
  假设路由表结构如下表所示，请给出题42图中R1的路由表，要求包括到达题42图中子网192.1.x.x的路由，且路由表中的路由项尽可能少。
  
  #figure(
    align(center)[#table(
      columns: (17fr, 13.5fr, 7fr),
      align: center + horizon,
      [目的网络], [下一跳], [接口],
    )]
    , kind: table
    )
  \
+ 
  当主机192.1.1.130向主机192.1.7.211发送一个TTL=64的IP分组时，R1通过哪个接口转发该IP分组？主机192.1.7.211收到的IP分组的TTL是多少？
  \
+ 
  若R1增加一条Metric为10的链路连接Internet，则题42表中R1的LSI需要增加哪些信息？
  
    
]
]

#question[
（12分）某程序中有如下循环代码段 $P$：

```c
for (i = 0; i < N; i++)
    sum += A[i];
```

假设编译时变量 `sum` 和 $i$ 分别分配在寄存器 R1 和 R2 中，常量 $N$ 在寄存器 R6 中，数组 $A$ 的首地址在寄存器 R3 中。程序段 $P$ 起始地址为08048100H，对应的汇编代码和机器代码如题44表所示。

#{
  set figure.caption(position: top)
  figure(
    kind: table,
    caption: [题44表],
    numbering: none,
  )[
    #table(
      columns: (8.7%, 15.94%, 15.94%, 26.09%, 33.33%),
      align: (auto, auto, auto, auto, auto),
      [编号], [地址], [机器代码], [汇编代码], [注释],
      [1], [08048100H], [00022080H], [loop:sll R4,R2,2], [(R2)＜＜2→R4],
      [2], [08048104H], [00832020H], [add R4,R4,R3], [(R4)+(R3)→R4],
      [3], [08048108H], [8C850000H], [load R5,0(R4)], [((R4)+0)→R5],
      [4], [0804810CH], [00250820H], [add R1,R1,R5], [(R1)+(R5)→R1],
      [5], [08048110H], [20420001H], [addi R2,R2,1], [(R2)+1→R2],
      [6], [08048114H], [1446FFFAH], [bne R2,R6,loop], [if(R2)!=(R6)goto loop],
    )
  ]
}

执行上述代码的计算机M采用32位定长指令字，其中分支指令bne采用如下格式：

#align(center)[
  #box(width: 58%)[
    #let bit-range(first, last) = box(width: 100%)[
      #grid(
        columns: (1fr, 1fr),
        inset: (x: 0.12em),
        align: (left, right),
        first,
        last,
      )
    ]
    #grid(
      columns: 1,
      row-gutter: 0.15em,
      grid(
        columns: (6fr, 5fr, 5fr, 16fr),
        column-gutter: 0pt,
        text(size: 0.75em)[#bit-range([31], [26])],
        text(size: 0.75em)[#bit-range([25], [21])],
        text(size: 0.75em)[#bit-range([20], [16])],
        text(size: 0.75em)[#bit-range([15], [0])],
      ),
      table(
        columns: (6fr, 5fr, 5fr, 16fr),
        align: center + horizon,
        stroke: 0.6pt,
        [OP], [Rs], [Rd], [OFFSET],
      ),
    )
  ]
]
OP为操作码；Rs和Rd为寄存器编号；OFFSET为偏移量，用补码表示。请回答下列问题，并说明理由。

#subquestions[
+ M的存储器编址单位是什么？
  \
+ 
  已知sll指令实现左移功能，数组A中每个元素占多少位？
  \
+ 
  题44表中bne指令的OFFSET字段的值是多少？已知bne指令采用相对寻址方式，当前PC内容为bne指令地址，通过分析题44表中指令地址和bne指令内容，推断出bne指令的转移目标地址计算公式。
  \
+ 
  若M采用如下“按序发射、按序完成”的5级指令流水线：IF（取指）、ID（译码及取数）、EXE（执行）、MEM（访存）、WB（写回寄存器），且硬件不采取任何转发措施，分支指令的执行均引起3个时钟周期的阻塞，则P中哪些指令的执行会由于数据相关而发生流水线阻塞？哪条指令的执行会发生控制冒险？为什么指令1的执行不会因为与指令5的数据相关而发生阻塞？
  
    
]
]

#question[
（11分）假设对于题44中的计算机M和程序段P的机器代码，M采用页式虚拟存储管理；P开始执行时，
（R1）=（R2）= 0，（R6）= 1000
，其机器代码已调入主存但不在Cache中；数组A未调入主存，且所有数组元素在同一页，并存储在磁盘同一个扇区。请回答下列问题，并说明理由。

#subquestions[
+ P执行结束时，R2的内容是多少？
  \
+ M的指令 Cache和数据 Cache分离。若指令
  Cache共有16行，Cache和主存交换的块大小为32字节，则其数据区的容量是多少？若仅考虑程序段P的执行，则指令
  Cache的命中率为多少？
  \
+ 
  P在执行过程中，哪条指令的执行可能发生溢出异常？哪条指令的执行可能产生缺页异常？对于数组A的访问，需要读磁盘和TLB至少各多少次？
  
    
]
]

#question[
（7分）文件F由200条记录组成，记录从1开始编号。用户打开文件后，欲将内存中的一条记录插入到文件F中，作为其第30条记录。请回答下列问题，并说明理由。

#subquestions[
+ 
  若文件系统采用连续分配方式，每个磁盘块存放一条记录，文件F存储区域前后均有足够的空闲磁盘空间，则完成上述插入操作最少需要访问多少次磁盘块？F的文件控制块内容会发生哪些改变？
  \
+ 
  若文件系统采用链接分配方式，每个磁盘块存放一条记录和一个链接指针，则完成上述插入操作需要访问多少次磁盘块？若每个磁盘块大小为1KB，其中4个字节存放链接指针，则该文件系统支持的文件最大长度是多少？
  
    
]
]

#question[
（8分）系统中有多个生产者进程和多个消费者进程，共享一个能存放1000件产品的环形缓冲区（初始为空）。当缓冲区未满时，生产者进程可以放入其生产的一件产品，否则等待；当缓冲区未空时，消费者进程可以从缓冲区取走一件产品，否则等待。要求一个消费者进程从缓冲区连续取走10件产品后，其他消费者进程才可以取产品。请使用信号量的P、V（wait（）、signal（））操作实现进程间的互斥与同步，要求写出完整的过程，并说明所用信号量的含义和初值。]
