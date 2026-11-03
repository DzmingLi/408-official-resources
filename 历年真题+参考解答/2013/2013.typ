#import "../../template.typ": exam, choices, subquestions
#show: exam.with(year: 2013, subject: "计算机学科专业基础", code: "408")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz

#set document(title: "2013年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题")
= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项符合试题要求。
#question[
已知两个长度分别为 m和
n的升序链表，若将它们合并为一个长度为
m+n的降序链表，则最坏情况下的时间复杂度是

#choices(
  [$O(n)$],
  [$O(m times n)$],
  [$O(min(m, n))$],
  [$O(max(m, n))$],
)
]

#question[
一个栈的入栈序列为1，2，3，…，n，其出栈序列是
$p_1 \, p_2 \, p_3 \, dots.h \, p_n$ 。若 $p_2 = 3$ ，则
$p_3$可能取值的个数是

#choices(
  [n-3],
  [n-2],
  [n-1],
  [无法确定],
)
]

#question[
若将关键字1,2,3,4,5,6,7依次插入到初始为空的平衡二叉树 T中，则
T中平衡因子为0的分支结点的个数是

#choices(
  [0],
  [1],
  [2],
  [3],
)
]

#question[
已知三叉树
T中6个叶结点的权分别是2，3，4，5，6，7，T的带权（外部）路径长度最小是

#choices(
  [27],
  [46],
  [54],
  [56],
)
]

#question[
若 X是后序线索二叉树中的叶结点，且
X存在左兄弟结点 Y，则 X的右线索指向的是

#choices(
  [X的父结点],
  [以 Y为根的子树的最左下结点],
  [X的左兄弟结点 Y],
  [以 Y为根的子树的最右下结点],
)
]

#question[
在任意一棵非空二叉排序树 $T_1$中，删除某结点
v之后形成二叉排序树 $T_2$，再将 v插入 $T_2$形成二叉排序树
$T_3$。下列关于 $T_1$与 $T_3$的叙述中，正确的是

I. 若 v是 $T_1$的叶结点，则 $T_1$与 $T_3$不同

Ⅱ. 若 v是 $T_1$的叶结点，则 $T_1$与 $T_3$相同

Ⅲ. 若 v不是 $T_1$的叶结点，则 $T_1$与 $T_3$不同

Ⅳ. 若 v不是 $T_1$的叶结点，则 $T_1$与 $T_3$相同

#choices(
  [仅Ⅰ、Ⅲ],
  [仅Ⅰ、Ⅳ],
  [仅Ⅱ、Ⅲ],
  [仅Ⅱ、Ⅳ],
)
]

#question[
设图的邻接矩阵 A 如下所示。各顶点的度依次是

$ bold(A) = mat(delim: "[", 0, 1, 0, 1; 0, 0, 1, 1; 0, 1, 0, 0; 1, 0, 0, 0) $

#choices(
  [1,2,1,2],
  [2,2,1,1],
  [3,4,2,3],
  [4,4,2,2],
)
]

#question[
若对如下无向图进行遍历，则下列选项中，不是广度优先遍历序列的是

#align(center)[
  #diagram(
    node-stroke: 0.065em,
    node-fill: white,
    edge-stroke: 0.065em,
    spacing: (1.2em, 1.55em),
    node((0, 0), text(size: 0.9em, weight: "semibold")[a], radius: 0.82em),
    node((-2.07, 1.43), text(size: 0.9em, weight: "semibold")[b], radius: 0.82em),
    node((-3.15, 2.75), text(size: 0.9em, weight: "semibold")[c], radius: 0.82em),
    node((-0.99, 2.75), text(size: 0.9em, weight: "semibold")[d], radius: 0.82em),
    node((2.06, 1.43), text(size: 0.9em, weight: "semibold")[e], radius: 0.82em),
    node((1.02, 2.75), text(size: 0.9em, weight: "semibold")[f], radius: 0.82em),
    node((3.13, 2.75), text(size: 0.9em, weight: "semibold")[g], radius: 0.82em),
    node((0, 4.14), text(size: 0.9em, weight: "semibold")[h], radius: 0.82em),
    edge((0, 0), (-2.07, 1.43)),
    edge((-2.07, 1.43), (-3.15, 2.75)),
    edge((-2.07, 1.43), (-0.99, 2.75)),
    edge((-3.15, 2.75), (-0.99, 2.75)),
    edge((-3.15, 2.75), (0, 4.14)),
    edge((0, 0), (0, 4.14)),
    edge((0, 0), (2.06, 1.43)),
    edge((2.06, 1.43), (1.02, 2.75)),
    edge((2.06, 1.43), (3.13, 2.75)),
  )
]

#choices(
  [h,c,a,b,d,e,g,f],
  [e,a,f,g,b,h,c,d],
  [d,b,c,a,h,e,f,g],
  [a,b,c,d,h,e,f,g],
)
]

#question[
下列 AOE
网表示一项包含8个活动的工程。通过同时加快若干活动的进度可以缩短整个工程的工期。下列选项中，加快其进度就可以缩短工程工期的是

#align(center)[
  #diagram(
    node-stroke: 0.065em,
    node-fill: white,
    edge-stroke: 0.065em,
    spacing: (2.1em, 1.6em),
    node((0, 1.35), [1], radius: 0.82em),
    node((2, 0), [2], radius: 0.82em),
    node((2, 2.60), [3], radius: 0.82em),
    node((4.10, 0), [4], radius: 0.82em),
    node((4.10, 2.60), [5], radius: 0.82em),
    node((6.20, 1.35), [6], radius: 0.82em),
    edge((0, 1.35), (2, 0), "->", label: $a = 3$, label-side: left),
    edge((0, 1.35), (2, 2.60), "->", label: $b = 8$, label-side: right),
    edge((2, 2.60), (2, 0), "->", label: $d = 4$, label-side: left),
    edge((2, 0), (4.10, 0), "->", label: $c = 9$, label-side: left),
    edge((2, 0), (4.10, 2.60), "->", label: $e = 6$, label-side: left),
    edge((2, 2.60), (4.10, 2.60), "->", label: $f = 10$, label-side: right),
    edge((4.10, 0), (6.20, 1.35), "->", label: $g = 6$, label-side: left),
    edge((4.10, 2.60), (6.20, 1.35), "->", label: $h = 9$, label-side: right),
  )
]

#choices(
  [c和e],
  [d和c],
  [f和d],
  [f和h],
)
]

#question[
在一棵高度为2的5阶B树中，所含关键字的个数最少是

#choices(
  [5],
  [7],
  [8],
  [14],
)
]

#question[
对给定的关键字序列110，119，007，911，114，120，122进行基数排序，则第2趟分配收集后得到的关键字序列是

#choices(
  [007，110，119，114，911，120，122],
  [007，110，119，114，911，122，120],
  [007，110，911，114，119，120，122],
  [110，120，911，122，114，007，119],
)
]

#question[
某计算机主频为1.2GHz，其指令分为4类，它们在基准程序中所占比例及CPI如下表所示。

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [指令类型], [所占比例], [CPI],
    [A], [50%], [2],
    [B], [20%], [3],
    [C], [10%], [4],
    [D], [20%], [5],
  )]
  , kind: table
  )

该机的 MIPS 数是

#choices(
  [100],
  [200],
  [400],
  [600],
)
]

#question[
某数采用IEEE754单精度浮点数格式表示为C6400000H，则该数的值是

#choices(
  [$- 1 . 5 times 2^(1 3)$],
  [$- 1 . 5 times 2^(1 2)$],
  [$- 0 . 5 times 2^(1 3)$],
  [$- 0 . 5 times 2^(1 2)$],
)
]

#question[
某字长为8位的计算机中，已知整型变量
x、y的机器数分别为 $\[x\]_("补") = 11110100$、
$\[y\]_("补") = 10110000$。若整型变量 $z = 2 ast x + y \/ 2$
，则 z的机器数为

#choices(
  [11000000],
  [00100100],
  [10101010],
  [溢出],
)

]

#question[
用海明码对长度为8位的数据进行检/纠错时，若能纠正一位错，则校验位数至少为

#choices(
  [2],
  [3],
  [4],
  [5],
)
]

#question[
某计算机主存地址空间大小为256MB，按字节编址。虚拟地址空间大小为4GB，采用页式存储管理，页面大小为4KB，TLB（快表）采用全相联映射，有4个页表项，内容如下表所示。

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [有效位], [标记], [页框号], […],
    [0], [FF180H], [0002H], […],
    [1], [3FFF1H], [0035H], […],
    [0], [02FF3H], [0351H], […],
    [1], [03FFFH], [0153H], […],
  )]
  , kind: table
  )

则对虚拟地址03FF F180H进行虚实地址变换的结果是

#choices(
  [0153180H],
  [0035180H],
  [TLB缺失],
  [缺页],
)
]

#question[
假设变址寄存器R的内容为1000H，指令中的形式地址为2000H；地址1000H中的内容为2000H，地址2000H中的内容为3000H，地址3000H中的内容为4000H，则变址寻址方式下访问到的操作数是

#choices(
  [1000H],
  [2000H],
  [3000H],
  [4000H],
)
]

#question[
某CPU主频为1.03GHz，采用4级指令流水线，每个流水段的执行需要1个时钟周期。假定CPU执行了100条指令，在其执行过程中，没有发生任何流水线阻塞，此时流水线的吞吐率为

#choices(
  [$0 . 2 5 times 1 0^9$条指令/秒],
  [$0 . 9 7 times 1 0^9$条指令/秒],
  [$1 . 0 times 1 0^9$条指令/秒],
  [$1 . 0 3 times 1 0^9$条指令/秒],
)
]

#question[
下列选项中，用于设备和设备控制器（I/O接口）之间互连的接口标准是

#choices(
  [PCI],
  [USB],
  [AGP],
  [PCI-Express],
)
]

#question[
下列选项中，用于提高RAID可靠性的措施有

I. 磁盘镜像 II. 条带化 III. 奇偶校验 IV.
增加Cache机制

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅰ、Ⅲ和Ⅳ],
  [仅Ⅱ、Ⅲ和Ⅳ],
)
]

#question[
某磁盘的转速为10000转/分，平均寻道时间是6
ms，磁盘传输速率是20 MB/s，磁盘控制器延迟为0.2
ms，读取一个4KB的扇区所需的平均时间约为

#choices(
  [9 ms],
  [9.4 ms],
  [12 ms],
  [12.4 ms],
)
]

#question[
下列关于中断 I/O 方式和 DMA
方式比较的叙述中，错误的是

#choices(
  [中断 I/O 方式请求的是 CPU 处理时间，DMA 方式请求的是总线使用权],
  [中断响应发生在一条指令执行结束后，DMA 响应发生在一个总线事务完成后],
  [中断 I/O 方式下数据传送通过软件完成，DMA 方式下数据传送由硬件完成],
  [中断 I/O 方式适用于所有外部设备，DMA 方式仅适用于快速外部设备],
)
]

#question[
用户在删除某文件的过程中，操作系统不可能执行的操作是

#choices(
  [删除此文件所在的目录],
  [删除与此文件关联的目录项],
  [删除与此文件对应的文件控制块],
  [释放与此文件关联的内存缓冲区],
)
]

#question[
为支持
CD-ROM中视频文件的快速随机播放，播放性能最好的文件数据块组织方式是

#choices(
  [连续结构],
  [链式结构],
  [直接索引结构],
  [多级索引结构],
)
]

#question[
用户程序发出磁盘 I/O
请求后，系统的处理流程是：用户程序 $arrow.r$系统调用处理程序
$arrow.r$设备驱动程序
$arrow.r$中断处理程序。其中，计算数据所在磁盘的柱面号、磁头号、扇区号的程序是

#choices(
  [用户程序],
  [系统调用处理程序],
  [设备驱动程序],
  [中断处理程序],
)
]

#question[
若某文件系统索引结点（inode）中有直接地址项和间接地址项，则下列选项中，与单个文件长度#underline(
  stroke: (
    thickness: 0.75pt,
    dash: (array: (0pt, 1em), phase: 0.5em),
    cap: "round",
  ),
  offset: 1.8pt,
)[无关]的因素是

#choices(
  [索引结点的总数],
  [间接地址索引的级数],
  [地址项的个数],
  [文件块大小],
)
]

#question[
设系统缓冲区和用户工作区均采用单缓冲，从外设读入1个数据块到系统缓冲区的时间为100，从系统缓冲区读入1个数据块到用户工作区的时间为5，对用户工作区中的1个数据块进行分析的时间为90（如下图所示）。进程从外设读入并分析2个数据块的最短时间是

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    hide(rect((0, 0), (4.30, 4.08), stroke: none), bounds: true)

    rect((0.15, 2.95), (4.15, 3.52), fill: white, stroke: 0.055em)
    rect((0.15, 1.50), (4.15, 2.07), fill: white, stroke: 0.055em)
    rect((0.15, 0.05), (4.15, 0.62), fill: white, stroke: 0.055em)

    line((2.15, 0.62), (2.15, 1.50), stroke: 0.055em, mark: (end: ">", fill: black, scale: 0.65))
    line((2.15, 2.07), (2.15, 2.95), stroke: 0.055em, mark: (end: ">", fill: black, scale: 0.65))
    bezier(
      (2.84, 3.52),
      (1.34, 3.52),
      (2.78, 4.35),
      (1.40, 4.35),
      stroke: 0.055em,
      mark: (end: ">", fill: black, scale: 0.65),
    )

    content((2.15, 3.23), text(size: 0.96em)[用户工作区])
    content((2.15, 1.78), text(size: 0.96em)[系统缓冲区])
    content((2.15, 0.33), text(size: 0.96em)[外设])
    content((2.48, 2.52), text(size: 0.88em)[5], anchor: "west")
    content((2.48, 1.07), text(size: 0.88em)[100], anchor: "west")
    content((2.09, 3.84), text(size: 0.82em)[90])
  })
]

#choices(
  [200],
  [295],
  [300],
  [390],
)
]

#question[
下列选项中，会导致用户进程从用户态切换到内核态的操作是

I. 整数除以零 II. sin()函数调用 III. read系统调用

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]

#question[
计算机开机后，操作系统最终被加载到

#choices(
  [BIOS],
  [ROM],
  [EPROM],
  [RAM],
)
]

#question[
若用户进程访问内存时产生缺页，则下列选项中，操作系统可能执行的操作是

I. 处理越界错 II. 置换页 III. 分配内存

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
  [仅Ⅰ、Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]

#question[
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
]

#question[
下列关于银行家算法的叙述中，正确的是

#choices(
  [银行家算法可以预防死锁],
  [当系统处于安全状态时，系统中一定无死锁进程],
  [当系统处于不安全状态时，系统中一定会出现死锁进程],
  [银行家算法破坏了死锁必要条件中的“请求和保持”条件],
)
]

#question[
在OSI参考模型中，下列功能需由应用层的相邻层实现的是

#choices(
  [对话管理],
  [数据格式转换],
  [路由选择],
  [可靠数据传输],
)
]

#question[
若下图为10BaseT网卡接收到的信号波形，则该网卡收到的比特串是

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    hide(rect((-0.18, 0), (8.18, 1.58), stroke: none), bounds: true)

    for x in range(9) {
      line(
        (x, 0),
        (x, 1.58),
        stroke: (paint: luma(55%), thickness: 0.035em, dash: "dashed"),
      )
    }

    line(
      (-0.16, 0.24),
      (0.50, 0.24),
      (0.50, 1.24),
      (1.00, 1.24),
      (1.00, 0.24),
      (1.50, 0.24),
      (1.50, 1.24),
      (2.50, 1.24),
      (2.50, 0.24),
      (3.00, 0.24),
      (3.00, 1.24),
      (3.50, 1.24),
      (3.50, 0.24),
      (4.50, 0.24),
      (4.50, 1.24),
      (5.50, 1.24),
      (5.50, 0.24),
      (6.00, 0.24),
      (6.00, 1.24),
      (6.50, 1.24),
      (6.50, 0.24),
      (7.50, 0.24),
      (7.50, 1.24),
      (8.16, 1.24),
      stroke: 0.115em,
    )
  })
]

#choices(
  [00110110],
  [10101101],
  [01010010],
  [11000101],
)
]

#question[
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

#question[
下列介质访问控制方法中，可能发生冲突的是

#choices(
  [CDMA],
  [CSMA],
  [TDMA],
  [FDMA],
)
]

#question[
#strike[HDLC协议对01111100 01111110组帧后对应的比特串为

#choices(
  [01111100 00111110 10],
  [01111100 01111101 01111110],
  [01111100 01111101 0],
  [01111100 01111110 01111101],
)
]
]

#question[
对于100
Mbps的以太网交换机，当输出端口无排队，以直通交换（cut-through
switching）方式转发一个以太网帧（不包括前导码）时，引入的转发延迟至少是

#choices(
  [0 $mu s$],
  [0.48 $mu s$],
  [5.12 $mu s$],
  [121.44 $mu s$],
)
]

#question[
主机甲与主机乙之间已建立一个TCP连接，双方持续有数据传输，且数据无差错与丢失。若甲收到1个来自乙的TCP段，该段的序号为1913、确认序号为2046、有效载荷为100字节，则甲立即发送给乙的TCP段的序号和确认序号分别是

#choices(
  [2046、2012],
  [2046、2013],
  [2047、2012],
  [2047、2013],
)
]

#question[
下列关于 SMTP 协议的叙述中，正确的是

I. 只支持传输7比特 ASC II码内容

Ⅱ. 支持在邮件服务器之间发送邮件

Ⅲ. 支持从用户代理向邮件服务器发送邮件

Ⅳ. 支持从邮件服务器向用户代理发送邮件

#choices(
  [仅Ⅰ、Ⅱ和Ⅲ],
  [仅Ⅰ、Ⅱ和Ⅳ],
  [仅Ⅰ、Ⅲ和Ⅳ],
  [仅Ⅱ、Ⅲ和Ⅳ],
)
]

= 二、综合应用题：41～47小题，共70分。
#question[
（13分）已知一个整数序列
$A = （ a_0 \, a_1 \, dots.h.c \, a_(n - 1) ）$ ，其中 $0 lt.eq a_i < n$
（ $0 lt.eq i < n$ ）。若存在
$a_(p 1) = a_(p 2) = dots.h.c = a_(p m) = x$ 且 m\>n/2（
$0 lt.eq p_k < n \, 1 lt.eq k lt.eq m$ ），则称 x为 A的主元素。例如
$A = （ 0 \, 5 \, 5 \, 3 \, 5 \, 7 \, 5 \, 5 ）$ ，则5为主元素；又如
$A = （ 0 \, 5 \, 5 \, 3 \, 5 \, 1 \, 5 \, 7 ）$ ，则
A中没有主元素。假设 A中的
n个元素保存在一个一维数组中，请设计一个尽可能高效的算法，找出
A的主元素。若存在主元素，则输出该元素；否则输出-1。要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 
  根据设计思想，采用C或C++或Java语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度和空间复杂度。
  
    
]
]

#question[
（10分）设包含4个数据元素的集合
$S$ = \{“do”，“for”，“repeat”，“while”\}，各元素的查找概率依次为：
$p_1 = 0.35$，$p_2 = 0.15$，$p_3 = 0.15$，$p_4 = 0.35$。将
S保存在一个长度为4的顺序表中，采用折半查找法，查找成功时的平均查找长度为2.2。请回答：

#subquestions[
+ 若采用顺序存储结构保存
  S，且要求平均查找长度更短，则元素应如何排列？应使用何种查找方法？查找成功时的平均查找长度是多少？
  \
+ 若采用链式存储结构保存
  S，且要求平均查找长度更短，则元素应如何排列？应使用何种查找方法？查找成功时的平均查找长度是多少？
  
    
]
]

#question[
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

#question[
（14分）某计算机采用16位定长指令字格式，其CPU中有一个标志寄存器，其中包含进位/借位标志CF、零标志ZF和符号标志NF。假定为该机设计了条件转移指令，其格式如下：

#align(center)[
  #box(width: 44%)[
    #let bit-range(first, last) = box(width: 100%)[
      #grid(
        columns: (1fr, 1fr),
        inset: (x: 0.10em),
        align: (left, right),
        first,
        last,
      )
    ]
    #grid(
      columns: 1,
      row-gutter: 0.15em,
      grid(
        columns: (5fr, 1fr, 1fr, 1fr, 8fr),
        column-gutter: 0pt,
        text(size: 0.75em)[#bit-range([15], [11])],
        text(size: 0.75em)[#align(center)[10]],
        text(size: 0.75em)[#align(center)[9]],
        text(size: 0.75em)[#align(center)[8]],
        text(size: 0.75em)[#bit-range([7], [0])],
      ),
      table(
        columns: (5fr, 1fr, 1fr, 1fr, 8fr),
        align: center + horizon,
        stroke: 0.6pt,
        [00000], [C], [Z], [N], [OFFSET],
      ),
    )
  ]
]

其中，00000为操作码OP；C、Z和N分别为CF、ZF和NF的对应检测位，某检测位为1时表示需检测对应标志，需检测的标志位中只要有一个为1就转移，否则不转移，例如，若
$"C" = 1, quad "Z" = 0, quad "N" = 1$
，则需检测CF和NF的值，当CF=1或NF=1时发生转移；OFFSET是相对偏移量，用补码表示。转移执行时，转移目标地址为（PC）+2+2×OFFSET；顺序执行时，下条指令地址为（PC）+2。请回答下列问题。

#subquestions[
+ 
  该计算机存储器按字节编址还是按字编址？该条件转移指令向后（反向）最多可跳转多少条指令？
  \
+ 
  某条件转移指令的地址为200CH，指令内容如下图所示，若该指令执行时
  $"CF" = 0$、$"ZF" = 0$、$"NF" = 1$
  ，则该指令执行后PC的值是多少？若该指令执行时 $"CF" = 1$、
  $"ZF" = 0$、$"NF" = 0$
  ，则该指令执行后PC的值又是多少？请给出计算过程。
  
  #align(center)[
    #box(width: 44%)[
      #let bit-range(first, last) = box(width: 100%)[
        #grid(
          columns: (1fr, 1fr),
          inset: (x: 0.10em),
          align: (left, right),
          first,
          last,
        )
      ]
      #grid(
        columns: 1,
        row-gutter: 0.15em,
        grid(
          columns: (5fr, 1fr, 1fr, 1fr, 8fr),
          column-gutter: 0pt,
          text(size: 0.75em)[#bit-range([15], [11])],
          text(size: 0.75em)[#align(center)[10]],
          text(size: 0.75em)[#align(center)[9]],
          text(size: 0.75em)[#align(center)[8]],
          text(size: 0.75em)[#bit-range([7], [0])],
        ),
        table(
          columns: (5fr, 1fr, 1fr, 1fr, 8fr),
          align: center + horizon,
          stroke: 0.6pt,
          [00000], [0], [1], [1], [11100011],
        ),
      )
    ]
  ]
  \
+ 
  实现“无符号数比较小于等于时转移”功能的指令中，C、Z和N应各是什么？
  \
+ 
  以下是该指令对应的数据通路示意图，要求给出图中部件①～③的名称或功能说明。
  
  #align(center)[
    #cetz.canvas(length: 0.95cm, {
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
      let wire = 0.55pt
      let and-gate(cx, top) = merge-path({
        line((cx - 0.47, top), (cx + 0.47, top), (cx + 0.47, top - 0.29))
        bezier(
          (cx + 0.47, top - 0.29), (cx, top - 0.98),
          (cx + 0.47, top - 0.72), (cx + 0.20, top - 0.98),
        )
        bezier(
          (cx, top - 0.98), (cx - 0.47, top - 0.29),
          (cx - 0.20, top - 0.98), (cx - 0.47, top - 0.72),
        )
      }, close: true, fill: white, stroke: wire)
      let or-gate(cx, top) = merge-path({
        bezier(
          (cx - 0.72, top), (cx + 0.72, top),
          (cx - 0.38, top - 0.54), (cx + 0.38, top - 0.54),
        )
        bezier(
          (cx + 0.72, top), (cx, top - 1.55),
          (cx + 0.70, top - 0.78), (cx + 0.35, top - 1.47),
        )
        bezier(
          (cx, top - 1.55), (cx - 0.72, top),
          (cx - 0.35, top - 1.47), (cx - 0.70, top - 0.78),
        )
      }, close: true, fill: white, stroke: wire)
  
      hide(rect((-0.15, 0), (14.45, 8.35), stroke: none), bounds: true)
  
      // The wires sit behind the components, matching the ordering in the scan.
      line((0.72, 6.88), (0.72, 5.70), stroke: wire)
      line((1.65, 6.88), (1.65, 5.70), stroke: wire)
      line((2.58, 6.88), (2.58, 5.70), stroke: wire)
      line((5.45, 6.88), (5.45, 6.35), (0.92, 6.35), (0.92, 5.70), stroke: wire)
      line((5.93, 6.88), (5.93, 6.08), (1.85, 6.08), (1.85, 5.70), stroke: wire)
      line((6.43, 6.88), (6.43, 5.82), (2.78, 5.82), (2.78, 5.70), stroke: wire)
  
      line((0.72, 4.72), (0.72, 3.96), (1.18, 3.96), (1.18, 3.41), stroke: wire)
      line((1.65, 4.72), (1.65, 3.19), stroke: wire)
      line((2.58, 4.72), (2.58, 3.96), (2.12, 3.96), (2.12, 3.41), stroke: wire)
      line(
        (1.65, 2.18), (1.65, 1.12), (7.78, 1.12),
        stroke: wire,
        mark: (end: ">", fill: black, scale: 0.68),
      )
  
      line((7.55, 6.88), (7.55, 5.47), stroke: wire)
      line((7.16, 4.67), (7.16, 4.30), stroke: wire)
      line((7.16, 3.63), (7.16, 2.79), stroke: wire)
      line((8.15, 2.36), (8.15, 1.55), stroke: wire)
  
      line((11.58, 7.00), (11.58, 5.77), stroke: wire)
      line((9.83, 6.63), (9.83, 5.77), stroke: wire)
      line((10.75, 4.65), (10.75, 2.78), (9.25, 2.78), stroke: wire)
      line((10.75, 2.78), (10.75, 1.55), stroke: wire)
      line((9.20, 0.72), (9.20, 0.18), (13.58, 0.18), (13.58, 8.10), (11.58, 8.10), (11.58, 7.75), stroke: wire)
  
      rect((0, 6.88), (3.30, 7.98), fill: white, stroke: wire)
      content((1.65, 7.43), text(size: 0.88em)[标志寄存器])
      line((1.65, 7.98), (1.65, 8.30), stroke: wire)
  
      rect((4.10, 6.88), (8.40, 7.98), fill: white, stroke: wire)
      content((6.25, 7.66), text(size: 0.88em)[①])
      content((4.43, 7.16), text(size: 0.78em)[OP])
      content((5.45, 7.16), text(size: 0.78em)[C])
      content((5.93, 7.16), text(size: 0.78em)[Z])
      content((6.43, 7.16), text(size: 0.78em)[N])
      content((7.55, 7.16), text(size: 0.78em)[OFFSET])
      line((6.25, 7.98), (6.25, 8.30), stroke: wire)
  
      and-gate(0.72, 5.70)
      and-gate(1.65, 5.70)
      and-gate(2.58, 5.70)
      or-gate(1.65, 3.73)
  
      rect((6.12, 4.67), (8.20, 5.47), fill: white, stroke: wire)
      content((7.16, 5.07), text(size: 0.86em)[符号扩展器])
      rect((6.10, 3.63), (8.22, 4.30), fill: white, stroke: wire)
      content((7.16, 3.97), text(size: 0.88em)[②])
      rect((7.00, 2.36), (9.25, 3.19), fill: white, stroke: wire)
      content((8.13, 2.78), text(size: 0.88em)[③])
  
      rect((10.50, 7.00), (12.66, 7.75), fill: white, stroke: wire)
      content((11.58, 7.38), text(size: 0.88em)[PC])
      content((9.60, 6.24), text(size: 0.82em)[2])
      line(
        (9.55, 5.77), (10.30, 5.77), (10.75, 5.43),
        (11.15, 5.77), (12.02, 5.77), (11.56, 4.65), (10.08, 4.65),
        close: true,
        fill: white,
        stroke: wire,
      )
      content((10.79, 5.11), text(size: 0.88em)[加法器])
  
      rect((7.78, 0.72), (10.75, 1.55), fill: white, stroke: wire)
      content((9.27, 1.13), text(size: 0.88em)[多路选择器])
    })
  ]
  
    
]
]

#question[
（7分）某博物馆最多可容纳500人同时参观，有一个出入口，该出入口一次仅允许一个人通过。参观者的活动描述如下：

```text
cobegin
参观者进程 i：
    ...
    进门；
    ...
    参观；
    ...
    出门；
    ...
coend
```

请添加必要的信号量和P、V（或wait（）、signal（））操作，以实现上述过程中的互斥与同步。要求写出完整的过程，说明信号量的含义并赋初值。

]

#question[
（8分）某计算机主存按字节编址，逻辑地址和物理地址都是32位，页表项大小为4字节。请回答下列问题。

#subquestions[
+ 
  若使用一级页表的分页存储管理方式，逻辑地址结构为：
  
  #figure(
    align(center)[#table(
      columns: (10em, 11.5em),
      align: center + horizon,
      [页号(20位)], [页内偏移量(12位)],
    )]
    , kind: table
    )
  
  则页的大小是多少字节？页表最大占用多少字节？
  \
+ 
  若使用二级页表的分页存储管理方式，逻辑地址结构为：
  
  #figure(
    align(center)[#table(
      columns: (9.5em, 9.5em, 10.5em),
      align: center + horizon,
      [页目录号(10位)], [页表索引(10位)], [页内偏移量(12位)],
    )]
    , kind: table
    )
  
  设逻辑地址为LA，请分别给出其对应的页目录号和页表索引的表达式。
  \
+ 
  采用（1）中的分页存储管理方式，一个代码段起始逻辑地址为00008000H，其长度为8KB，被装载到从物理地址00900000H开始的连续主存空间中。页表从主存
  00200000H开始的物理地址处连续存放，如下图所示（地址大小自下向上递增）。请计算出该代码段对应的两个页表项的物理地址，这两个页表项中的页框号以及代码页面2的起始物理地址。
  
  #align(center)[
    #cetz.canvas(length: 0.92cm, {
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
      let rule = 0.58pt
      hide(rect((-0.20, 0), (15.25, 5.30), stroke: none), bounds: true)
  
      // Page table and the two consecutive physical pages.
      rect((2.45, 0.25), (7.25, 4.55), fill: white, stroke: rule)
      line((2.45, 2.92), (7.25, 2.92), stroke: rule)
      line((2.45, 2.30), (7.25, 2.30), stroke: rule)
      line((2.45, 1.68), (7.25, 1.68), stroke: rule)
  
      rect((12.25, 0.72), (15.05, 5.05), fill: white, stroke: rule)
      line((12.25, 3.16), (15.05, 3.16), stroke: rule)
  
      // The arrows terminate at the physical addresses indicated in the scan.
      line(
        (7.25, 2.61), (9.30, 2.61), (9.30, 3.16), (12.25, 3.16),
        stroke: rule,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      line(
        (7.25, 1.99), (9.30, 1.99), (9.30, 1.15), (12.25, 1.15),
        stroke: rule,
        mark: (end: ">", fill: black, scale: 0.70),
      )
  
      content((4.85, 4.95), text(size: 0.92em)[页表])
      content((4.85, 2.61), text(size: 0.90em)[页框号 2])
      content((4.85, 1.99), text(size: 0.90em)[页框号 1])
      content((2.15, 2.61), text(size: 0.88em)[物理地址 2], anchor: "east")
      content((2.15, 1.99), text(size: 0.88em)[物理地址 1], anchor: "east")
      content((2.15, 0.48), text(size: 0.88em)[0020 0000H], anchor: "east")
  
      content((13.65, 4.10), text(size: 0.92em)[代码页面 2])
      content((13.65, 1.94), text(size: 0.92em)[代码页面 1])
      content((10.77, 3.52), text(size: 0.88em)[物理地址 3])
      content((10.75, 1.53), text(size: 0.88em)[0090 0000H])
    })
  ]
  
    
]
]

#question[
（9分）假设Internet的两个自治系统构成的网络如题47图所示，自治系统AS1由路由器R1连接两个子网构成；自治系统AS2由路由器R2、R3互联并连接3个子网构成。各子网地址、R2的接口名、R1与R3的部分接口IP地址如题47图所示。

#figure(
  align(center)[
    #cetz.canvas({
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

      hide(rect((0, 0), (14.4, 5.70), stroke: none), bounds: true)

      // Links are drawn first so that the subnet and router symbols mask
      // their endpoints, as in the printed figure.
      line((3.70, 5.00), (10.70, 5.00), stroke: 0.065em)
      line((7.00, 2.82), (10.70, 2.82), stroke: 0.065em)
      line((3.70, 0.65), (10.70, 0.65), stroke: 0.065em)
      line((7.00, 0.65), (7.00, 5.00), stroke: 0.065em)

      circle((1.95, 5.00), radius: (1.75, 0.38), fill: white, stroke: 0.065em)
      circle((12.45, 5.00), radius: (1.75, 0.38), fill: white, stroke: 0.065em)
      circle((12.45, 2.82), radius: (1.75, 0.38), fill: white, stroke: 0.065em)
      circle((1.95, 0.65), radius: (1.75, 0.38), fill: white, stroke: 0.065em)
      circle((12.45, 0.65), radius: (1.75, 0.38), fill: white, stroke: 0.065em)

      content((7.00, 5.00), box(inset: 0pt)[
        #image("assets/router-symbol.svg", width: 1.05cm, height: 0.75cm)
      ])
      content((7.00, 2.82), box(inset: 0pt)[
        #image("assets/router-symbol.svg", width: 1.05cm, height: 0.75cm)
      ])
      content((7.00, 0.65), box(inset: 0pt)[
        #image("assets/router-symbol.svg", width: 1.05cm, height: 0.75cm)
      ])

      content((1.95, 5.00), text(size: 0.90em)[153.14.5.0/25])
      content((12.45, 5.00), text(size: 0.90em)[153.14.5.128/25])
      content((12.45, 2.82), text(size: 0.90em)[194.17.20.128/25])
      content((1.95, 0.65), text(size: 0.90em)[194.17.20.0/25])
      content((12.45, 0.65), text(size: 0.90em)[194.17.21.0/24])

      content((0.28, 5.57), text(size: 0.90em, weight: "semibold")[AS1], anchor: "west")
      content((0.28, 1.63), text(size: 0.90em, weight: "semibold")[AS2], anchor: "west")
      content((6.50, 5.56), text(size: 0.90em, weight: "semibold")[R1])
      content((6.50, 3.38), text(size: 0.90em, weight: "semibold")[R2])
      content((6.50, 1.21), text(size: 0.90em, weight: "semibold")[R3])

      content((7.47, 4.35), text(size: 0.82em)[153.14.3.2], anchor: "west")
      content((7.24, 3.37), text(size: 0.82em)[S0])
      content((7.70, 3.12), text(size: 0.82em)[E0])
      content((7.24, 2.27), text(size: 0.82em)[S1])
      content((7.47, 1.70), text(size: 0.82em)[194.17.24.2], anchor: "west")
    })
  ],
  kind: image,
  caption: [题47图　网络拓扑结构],
  numbering: none,
)

请回答下列问题。

#subquestions[
+ 
  假设路由表结构如下表所示。请利用路由聚合技术，给出R2的路由表，要求包括到达题47图中所有子网的路由，且路由表中的路由项尽可能少。
  
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
  若R2收到一个目的IP地址为194.17.20.200的IP分组，R2会通过哪个接口转发该IP分组？
  \
+ 
  R1与R2之间利用哪个路由协议交换路由信息？该路由协议的报文被封装到哪个协议的分组中进行传输？
    
]
]
