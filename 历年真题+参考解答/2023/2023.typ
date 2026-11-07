// 官方来源：2024年计算机考试大纲.pdf，原书66—82页。
#import "../../template.typ": exam, choices, statements, subquestions, inline-node
#import "@preview/ezexam:0.3.1": question, mode-state, HANDOUTS, answer-state
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz
#show: exam.with(year: 2023)
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)

= 一、单项选择题：1～40小题，每小题2分，共80分。下列每小题给出的四个选项中，只有一个选项是最符合题目要求的。

#question[
下列对顺序存储的有序表（长度为 $n$）实现给定操作的算法中，平均时间复杂度为 $O(1)$ 的是
#choices([查找包含指定值元素的算法], [插入包含指定值元素的算法], [删除第 $i(1<=i<=n)$ 个元素的算法], [获取第 $i(1<=i<=n)$ 个元素的算法])
]
#question[
现有非空双向链表 $L$，其结点结构为：#inline-node([prev], [data], [next])，prev 是指向直接前驱结点的指针，next 是指向直接后继结点的指针。若要在 $L$ 中指针 p 所指向的结点（非尾结点）之后插入指针 s 指向的新结点，则在执行了语句序列“`s->next=p->next; p->next=s;`”后，下列语句序列中还需要执行的是
#choices([`s->next->prev=p; s->prev=p;`], [`p->next->prev=s; s->prev=p;`], [`s->prev=s->next->prev; s->next->prev=s;`], [`p->next->prev=s->prev; s->next->prev=p;`])
]
#question[
若采用三元组表存储结构存储稀疏矩阵 $M$，则除三元组表外，下列数据中还需要保存的是
#statements(columns: 2, [Ⅰ．$M$ 的行数], [Ⅱ．$M$ 中包含非零元素的行数], [Ⅲ．$M$ 的列数], [Ⅳ．$M$ 中包含非零元素的列数])
#choices([Ⅰ、Ⅲ], [Ⅰ、Ⅳ], [Ⅱ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]
#question[
在由6个字符组成的字符集 $S$ 中，各字符出现的频次分别为3，4，5，6，8，10，为 $S$ 构造的哈夫曼编码的加权平均长度为
#choices([2.4], [2.5], [2.67], [2.75])
]
#question[
已知一棵二叉树的树形如下图所示，若其后序遍历序列为 f，d，b，e，c，a，则其先（前）序遍历序列是
#align(center, diagram(spacing: (1.5em, 1.5em), node-stroke: .6pt,
 node((1,0), [], name: <a>, shape: circle, radius: .45em),
 node((0,1), [], name: <b>, shape: circle, radius: .45em),
 node((2,1), [], name: <c>, shape: circle, radius: .45em),
 node((-1,2), [], name: <d>, shape: circle, radius: .45em),
 node((1,2), [], name: <e>, shape: circle, radius: .45em),
 node((0,3), [], name: <f>, shape: circle, radius: .45em),
 edge(<a>,<b>), edge(<a>,<c>), edge(<b>,<d>), edge(<b>,<e>), edge(<d>,<f>)))
#choices([a，e，d，f，b，c], [a，c，e，b，d，f], [c，a，b，e，f，d], [d，f，e，b，a，c])
]
#question[
已知无向连通图 $G$ 中各边的权值均为1。下列算法中，一定能够求出图 $G$ 中从某顶点到其余各顶点最短路径的是
#statements(columns: 2, [Ⅰ．普里姆（Prim）算法], [Ⅱ．克鲁斯卡尔（Kruskal）算法], [Ⅲ．图的广度优先搜索算法])
#choices([仅Ⅰ], [仅Ⅲ], [Ⅰ、Ⅱ], [Ⅰ、Ⅱ、Ⅲ])
]
#question[
下列关于非空 B 树的叙述中，正确的是
#statements(columns: 1, [Ⅰ．插入操作可能增加树的高度], [Ⅱ．删除操作一定会导致叶结点的变化], [Ⅲ．查找某关键字总是要查找到叶结点], [Ⅳ．插入的新关键字最终位于叶结点中])
#choices([仅Ⅰ], [Ⅰ、Ⅱ], [Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅳ])
]
#question[
对含600个元素的有序顺序表进行折半查找，关键字间的比较次数最多是
#choices([9], [10], [30], [300])
]
#question[
现有长度为5、初始为空的散列表 HT，散列函数 $H(k)=(k+4) "%" 5$，用线性探查再散列法解决冲突。若将关键字序列2022，12，25依次插入 HT 中，然后删除关键字25，则 HT 中查找失败的平均查找长度为
#choices([1], [1.6], [1.8], [2.2])
]
#question[
下列排序算法中，不稳定的是
#statements(columns: 2, [Ⅰ．希尔排序], [Ⅱ．归并排序], [Ⅲ．快速排序], [Ⅳ．堆排序], [Ⅴ．基数排序])
#choices([Ⅰ、Ⅱ], [Ⅱ、Ⅴ], [Ⅰ、Ⅲ、Ⅳ], [Ⅲ、Ⅳ、Ⅴ])
]
#question[
使用快速排序算法对数据进行升序排序，若经过一次划分后得到的数据序列是68，11，70，23，80，77，48，81，93，88，则该次划分的枢轴是
#choices([11], [70], [80], [81])
]
#question[
若机器 M 的主频为1.5 GHz，在 M 上执行程序 P 的指令条数为 $5 times 10^5$，P 的平均 CPI 为1.2，则 P 在 M 上的指令执行速度和用户 CPU 时间分别为
#choices([0.8 GIPS，0.4 ms], [0.8 GIPS，0.4 μs], [1.25 GIPS，0.4 ms], [1.25 GIPS，0.4 μs])
]
#question[
若 short 型变量 $x=-8190$，则 $x$ 的机器数是
#choices([E002H], [E001H], [9FFFH], [9FFEH])
]
#question[
已知 float 型变量用 IEEE 754 单精度浮点数格式表示。若 float 型变量 $x$ 的机器数为8020 0000H，则 $x$ 的值是
#choices([$-2^(-128)$], [$-1.01 times 2^(-127)$], [$-1.01 times 2^(-126)$], [非数（NaN）])
]
#question[
某计算机的 CPU 有30根地址线，按字节编址，CPU 和主存芯片连接时，要求主存芯片占满所有可能的存储地址空间，并且 RAM 区和 ROM 区所分配的空间大小比是3∶1。若 RAM 在连续低地址区，ROM 在连续高地址区，则 ROM 的地址范围是
#choices([0000 0000H～0FFF FFFFH], [1000 0000H～2FFF FFFFH], [3000 0000H～3FFF FFFFH], [4000 0000H～4FFF FFFFH])
]
#question[
已知 $x,y$ 为 int 类型，当 $x=100,y=200$ 时，执行“$x$ 减 $y$”指令得到的溢出标志 OF 和借位标志 CF 分别为0、1，那么，当 $x=10,y=-20$ 时，执行该指令得到的 OF 和 CF 分别为
#choices([OF=0，CF=0], [OF=0，CF=1], [OF=1，CF=0], [OF=1，CF=1])
]
#question[
某运算类指令中有一个地址码为通用寄存器编号，对应通用寄存器中存放的是操作数或操作数的地址，CPU 区分两者的依据是
#choices([操作数的寻址方式], [操作数的编码方式], [通用寄存器的编号], [通用寄存器的内容])
]
#question[
数据通路由组合逻辑元件（操作元件）和时序逻辑元件（状态元件）组成。下列给出的元件中，属于操作元件的是
#statements(columns: 1, [Ⅰ．算术逻辑部件（ALU）], [Ⅱ．程序计数器（PC）], [Ⅲ．通用寄存器组（GPRs）], [Ⅳ．多路选择器（MUX）])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ、Ⅳ])
]
#question[
在采用“取指、译码/取数、执行、访存、写回”5段流水线的 RISC 处理器中，执行如下指令序列（第一列为指令序号），其中 s0、s1、s2、s3 和 t2 表示寄存器编号。
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```
I1    add s2, s1, s0     // R[s2]←R[s1]+R[s0]
I2    load s3, 0(s2)     // R[s3]←M[R[s2]+0]
I3    beq t2, s3, L1     // if R[t2]=R[s3] jump to L1
I4    addi t2, t2, 20    // R[t2]←R[t2]+20
I5  L1: …
```
]
若采用转发（旁路）技术处理数据冒险，采用硬件阻塞方式处理控制冒险，则在指令 I1～I4 执行过程中，发生流水线阻塞的指令有
#choices([仅 I3], [I2、I4], [I3、I4], [I2、I3、I4])
]
#question[
某存储器总线宽度为64 b，总线时钟频率为1 GHz，在总线上传输一个数据或地址需要一个时钟周期，不支持突发传送方式。若通过该总线连接 CPU 和主存，主存每次准备一个64 b数据需要6 ns，主存块大小为32 B，则读取一个主存块需要的时间是
#choices([8 ns], [11 ns], [26 ns], [32 ns])
]
#question[
下列关于硬件和异常/中断关系的叙述中，错误的是
#choices([CPU 在执行一条指令过程中检测异常事件], [CPU 在执行完一条指令时检测中断请求信号], [开中断时 CPU 检测到中断请求后就进行中断响应], [外部设备通过中断控制器向 CPU 发中断结束信号])
]
#question[
下列关于 I/O 控制方式的叙述中，错误的是
#choices([查询方式下，通过 CPU 执行查询程序进行 I/O 操作], [中断方式下，通过 CPU 执行中断服务程序进行 I/O 操作], [DMA 方式下，通过 CPU 执行 DMA 传送程序进行 I/O 操作], [对于 SSD、网络适配器等高速设备，采用 DMA 方式输入/输出])
]
#question[
与宏内核操作系统相比，下列特征中，微内核操作系统具有的是
#statements(columns: 2, [Ⅰ．较好的性能], [Ⅱ．较高的可靠性], [Ⅲ．较高的安全性], [Ⅳ．较强的可扩展性])
#choices([Ⅱ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ], [Ⅰ、Ⅲ、Ⅳ], [Ⅱ、Ⅲ、Ⅳ])
]
#question[
在操作系统内核中，中断向量表适合采用的数据结构是
#choices([数组], [队列], [单向链表], [双向链表])
]
#question[
某系统采用页式存储管理，用位图管理空闲页框。若页大小为4 KB，物理内存大小为16 GB，则位图所占空间的大小是
#choices([128 B], [128 KB], [512 KB], [4 MB])
]
#question[
下列操作完成时，导致 CPU 从内核态转为用户态的是
#choices([阻塞进程], [执行 CPU 调度], [唤醒进程], [执行系统调用])
]
#question[
下列由当前线程引起的事件或执行的操作中，可能导致该线程由执行态变为就绪态的是
#choices([键盘输入], [缺页异常], [主动出让 CPU], [执行信号量的 wait()操作])
]
#question[
对于采用虚拟内存管理方式的系统，下列关于进程虚拟地址空间的叙述中，错误的是
#choices([每个进程都有自己独立的虚拟地址空间], [C 语言中 malloc()函数返回的是虚拟地址], [进程对数据段和代码段可以有不同的访问权限], [虚拟地址空间的大小由内存和硬盘的大小决定])
]
#question[
进程 P1、P2 和 P3 进入就绪队列的时刻、优先级（值越大优先权越高）及 CPU 执行时间如下表所示。
#table(columns: (1fr, 2.2fr, 1.2fr, 1.4fr), align: center,
 [进程名], [进入就绪队列的时刻], [优先级], [CPU 执行时间],
 [P1], [0 ms], [1], [60 ms], [P2], [20 ms], [10], [42 ms], [P3], [30 ms], [100], [13 ms])
若系统采用基于优先权的抢占式 CPU 调度算法，从0 ms时刻开始进行调度，则 P1、P2 和 P3 的平均周转时间为
#choices([60 ms], [61 ms], [70 ms], [71 ms])
]
#question[
进程 R 和 S 共享数据 data，若 data 在 R 和 S 中所在页的页号分别为 p1 和 p2，两个页所对应的页框号分别为 f1 和 f2，则下列叙述中，正确的是
#choices([p1 和 p2 一定相等，f1 和 f2 一定相等], [p1 和 p2 一定相等，f1 和 f2 不一定相等], [p1 和 p2 不一定相等，f1 和 f2 一定相等], [p1 和 p2 不一定相等，f1 和 f2 不一定相等])
]
#question[
若文件 F 仅被进程 P 打开并访问，则当进程 P 关闭 F 时，下列操作中，文件系统需要完成的是
#choices([删除目录中文件 F 的目录项], [释放 F 的索引节点所占的内存空间], [释放 F 的索引节点所占的外存空间], [将文件磁盘索引节点中的链接计数减1])
]
#question[
下列因素中，设备分配需要考虑的是
#statements(columns: 2, [Ⅰ．设备的类型], [Ⅱ．设备的访问权限], [Ⅲ．设备的占用状态], [Ⅳ．逻辑设备与物理设备的映射关系])
#choices([Ⅰ、Ⅱ], [Ⅱ、Ⅲ], [Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]
#question[
在下图所示的分组交换网络中，主机 H1 和 H2 通过路由器互连，2段链路的带宽均为100 Mb/s，时延带宽积（即单向传播时延×带宽）均为1000 b。若 H1 向 H2 发送1个大小为1 MB的文件，分组长度为1000 B，则从 H1 开始发送时刻起到 H2 收到文件全部数据时刻止，所需的时间至少是（注：$"M"=10^6$）
#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke:.055em)
  line((0,0),(16,0))
  for (x,name,file,width) in ((0,[H1],"visio-2007-desktop.svg",2.4),(8,[路由器],"cisco-router.svg",3.3),(16,[H2],"visio-2007-workstation.svg",2.7)) {
    content((x,0),image("../../assets/network/"+file,width:width*1em))
    content((x,-2.1),text(size:.85em,name))
  }
}))
#choices([80.02 ms], [80.08 ms], [80.09 ms], [80.10 ms])
]
#question[
某无噪声理想信道带宽为4 MHz，采用 QAM 调制，若该信道的最大数据传输速率是48 Mb/s，则该信道采用的 QAM 调制方案是
#choices([QAM-16], [QAM-32], [QAM-64], [QAM-128])
]
#question[
假设通过同一条信道，数据链路层分别采用停-等协议、GBN 协议和 SR 协议（发送窗口和接收窗口相等）传输数据，3个协议的数据帧长相同，忽略确认帧长度，帧序号位数为3比特。若对应3个协议的发送方最大信道利用率分别是 U1、U2 和 U3，则 U1、U2 和 U3 满足的关系是
#choices([$"U1"<="U2"<="U3"$], [$"U1"<="U3"<="U2"$], [$"U2"<="U3"<="U1"$], [$"U3"<="U2"<="U1"$])
]
#question[
已知10BaseT以太网的争用时间片为51.2 μs。若网卡在发送某帧时发生了连续4次冲突，则基于二进制指数退避算法确定的再次尝试重发该帧前等待的最长时间是
#choices([51.2 μs], [204.8 μs], [768 μs], [819.2 μs])
]
#question[
若甲向乙发送数据时采用 CRC 校验，生成多项式为 $G(X)=X^4+X+1$（即 $G=10011$），则乙接收到下列比特串时，可以断定其在传输过程中未发生错误的是
#choices([1 0111 0000], [1 0111 0100], [1 0111 1000], [1 0111 1100])
]
#question[
某网络拓扑如下图所示，其中路由器 R2 实现 NAT 功能。若主机 H 向 Internet 发送1个 IP 分组，则经过 R2 转发后，该 IP 分组的源 IP 地址是
#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke:.055em,content:(wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .8em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  line((0,0),(24,0))
  content((0,0),image("../../assets/network/cisco-cloud.svg",width:5em))
  content((0,0),[Internet])
  for (x,name) in ((6,[R1]),(16,[R2])) {
    content((x,0),image("../../assets/network/cisco-router.svg",width:3.1em))
    content((x,-.35),text(fill:white,name))
  }
  content((24,0),image("../../assets/network/visio-2007-workstation.svg",width:2.6em))
  content((16,1.6),[NAT]); content((11,.7),[195.123.0.34/30]); content((20,.7),[192.168.0.1])
  content((24,-1.8),[H]); content((24,-2.7),[192.168.0.3])
}))
#choices([195.123.0.33], [195.123.0.35], [192.168.0.1], [192.168.0.3])
]
#question[
主机168.16.84.24/20所在子网的最小可分配 IP 地址和最大可分配 IP 地址分别是
#choices([168.16.80.1，168.16.84.254], [168.16.80.1，168.16.95.254], [168.16.84.1，168.16.84.254], [168.16.84.1，168.16.95.254])
]
#question[
下列关于 IPv4 和 IPv6 的叙述中，正确的是
#statements(columns: 1, [Ⅰ．IPv6 地址空间是 IPv4 地址空间的96倍], [Ⅱ．IPv4 首部和 IPv6 基本首部的长度均可变], [Ⅲ．IPv4 向 IPv6 过渡可以采用双协议栈和隧道技术], [Ⅳ．IPv6 首部的 Hop Limit 字段等价于 IPv4 首部的 TTL 字段])
#choices([Ⅰ、Ⅱ], [Ⅰ、Ⅳ], [Ⅱ、Ⅲ], [Ⅲ、Ⅳ])
]

= 二、综合应用题：41～47小题，共70分。

#question[
（13分）已知有向图 $G$ 采用邻接矩阵存储，类型定义如下：
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```c
typedef struct                  // 图的类型定义
{
    int numVertices, numEdges;   // 图的顶点数和有向边数
    char VerticesList[MAXV];     // 顶点表，MAXV为已定义常量
    int Edge[MAXV][MAXV];        // 邻接矩阵
} MGraph;
```
]
将图中出度大于入度的顶点称为 K 顶点。例如题41图中，顶点 a 和 b 为 K 顶点。
#figure(diagram(spacing: (2.3em, 1.8em), node-stroke: .6pt,
 node((1,0), [a], name: <a>, shape: circle, radius: .55em),
 node((0,1), [b], name: <b>, shape: circle, radius: .55em),
 node((2,1), [d], name: <d>, shape: circle, radius: .55em),
 node((1,2), [c], name: <c>, shape: circle, radius: .55em),
 edge(<a>,<b>, "->"), edge(<a>,<d>, "->"), edge(<b>,<d>, "->"), edge(<b>,<c>, "->"), edge(<c>,<d>, "->")), caption: [题41图])
请设计算法：`int printVertices(MGraph G)`，对给定的任意非空有向图 $G$，输出 $G$ 中所有的 K 顶点，并返回 K 顶点的个数。要求：
#subquestions[
 + 给出算法的基本设计思想。
 + 根据设计思想，采用 C 或 C++语言描述算法，关键之处给出注释。
]
]
#question[
（10分）对含有 $n(n>0)$ 个记录的文件进行外部排序，采用置换-选择排序生成初始归并段时需要使用一个工作区，工作区中能保存 $m$ 个记录。请回答下列问题。
#subquestions[
 + 若文件中含有19个记录，其关键字依次是51，94，37，92，14，63，15，99，48，56，23，60，31，17，43，8，90，166，100，则当 $m=4$ 时，可生成几个初始归并段？各是什么？
 + 对任意的 $m(n >> m > 0)$，生成的第一个初始归并段的长度最大值和最小值分别是多少？
]
]
#question[
（14分）已知计算机 M 字长为32位，按字节编址，采用请求调页策略的虚拟存储管理方式，虚拟地址为32位，页大小为4 KB；数据 Cache 采用4路组相联映射方式，数据区大小为8 KB，主存块大小为32 B。现有 C 语言程序段如下：
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```c
int a[24][64];
…
for(i=0; i<24; i++)
    for(j=0; j<64; j++) a[i][j]=10;
```
]
已知二维数组 a 按行优先存放，在虚拟地址空间中分配的起始地址为0042 2000H，sizeof(int)=4，假定在 M 上执行上述程序段之前数组 a 不在主存，且在该程序段执行过程中不会发生页面置换。请回答下列问题：
#subquestions[
 + 数组 a 分布在几个页面中？对于数组 a 的访问，会发生几次缺页异常？页故障地址各是什么？
 + 不考虑变量 $i$ 和 $j$，该程序段的数据访问是否具有时间局部性？为什么？
 + 计算机 M 的虚拟地址（A31～A0）中哪几位用作块内地址？哪几位用作 Cache 组号？a\[1\]\[0\]的虚拟地址是多少？其所在主存块对应的 Cache 组号是多少？
 + 数组 a 占用多少主存块？假设上述程序段执行过程中数组 a 的访问不会和其他数据发生 Cache 访问冲突，则数组 a 的 Cache 命中率是多少？若将循环中 $i$ 和 $j$ 的次序按如下方式调换：

   #block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
   ```c
   for(j=0; j<64; j++)
       for(i=0; i<24; i++) a[i][j]=10;
   ```
   ]
   则数组 a 的 Cache 命中率又是多少？
]
]
#question[
（9分）题43中的 C 程序段在计算机 M 上的部分机器级代码如下，每个机器级代码行中依次包含指令序号、虚拟地址、机器指令和汇编指令。
#block(stroke: (dash: "dashed", thickness: .5pt), inset: 0pt)[
#table(columns: (1.5em, 5.5em, 11em, 1fr), stroke: none,
 table.cell(colspan: 4, fill: luma(82%))[`for(i=0; i<24; i++)`],
 [1], [00401072], [C7 45 F8 00 00 00 00], [`mov [ebp-8], 0`],
 [2], [*00401079*], [*EB 09*], [*`jmp 00401084h`*],
 [3], [0040107B], [8B 55 F8], [`mov eax, [ebp-8]`],
 [], […], […], […],
 [7], [*00401088*], [*7D 32*], [*`jge 004010bch`*],
 table.cell(colspan: 4, fill: luma(82%))[`for(j=0; j<64; j++)`],
 [8], [0040108A], [C7 45 FC 00 00 00 00], [`mov [ebp-4], 0`],
 [], […], […], […],
 table.cell(colspan: 4, fill: luma(82%))[`a[i][j]=10;`],
 [], […], […], […],
 [19], [*004010AE*], [*C7 84 82 00 20 42 00 0A 00 00 00*], [*`mov [ecx+edx*4+00422000h], 0Ah`*],
 [20], […], […], […])
]
请回答下列问题。
#subquestions[
 + 第20条指令的虚拟地址是多少？
 + 已知第2条 jmp 和第7条 jge 都是跳转指令，其操作码分别是 EBH 和7DH，跳转目标地址分别为0040 1084H、0040 10BCH，这两条指令都采用什么寻址方式？给出第2条指令 jmp 的跳转目标地址计算过程。
 + 已知第19条 mov 指令的功能为“a\[i\]\[j\]←10”，其中 ecx 和 edx 为寄存器名，0042 2000H是数组 a 的首地址，指令中源操作数采用什么寻址方式？已知 edx 中存放的是变量 $j$，ecx 中存放的是什么？根据该指令的机器码判断计算机 M 采用的是大端还是小端方式。
 + 第一次执行第19条指令时，取指令过程中是否会发生缺页异常？为什么？
]
]
#question[
（7分）现要求学生使用 swap 指令和布尔型变量 lock 实现临界区互斥。lock 为线程间共享的变量，lock 的值为 TRUE 时线程不能进入临界区，为 FALSE 时线程能够进入临界区。某同学编写的实现临界区互斥的伪代码如题45（a）图所示。
#figure([
#set text(size: .85em)
#grid(columns: (1.6fr, 1fr), gutter: .7em,
 [#table(columns: 1, rows: (auto, 20em), align: left + top,
 [#align(center)[某同学编写的伪代码]],
 [
 `bool lock = FALSE; // 共享变量`\
 ……
 #grid(columns: (1fr, auto), gutter: .8em,
 block(stroke: (dash: "dashed", thickness: .5pt), inset: .3em)[
 ```
 bool key = TRUE;
 if(key == TRUE)
     swap key, lock; // 交换key和lock的值
 ```
 ], [进入区])
 临界区；
 #grid(columns: (1fr, auto), gutter: .8em,
 block(width: 100%, stroke: (dash: "dashed", thickness: .5pt), inset: .3em)[`lock = TRUE;`], [退出区])
 ……
 ])
 #align(center)[（a）]],
 [#table(columns: 1, rows: (auto, 20em), align: left + top,
 [#align(center)[newSwap()的代码]],
 [```c
 void newSwap(bool *a, bool *b)
 {
     bool temp = *a;
     *a = *b;
     *b = temp;
 }
 ```])
 #align(center)[（b）]])
], caption: [题45图])
请回答下列问题。
#subquestions[
 + 题45（a）图的伪代码中哪些语句存在错误？将其改为正确的语句（不增加语句的条数）。
 + 题45（b）图给出了交换两个变量值的函数 newSwap()的代码，是否可以用函数调用语句“`newSwap(&key, &lock)`”代替指令“`swap key, lock`”以实现临界区互斥？为什么？
]
]
#question[
（8分）进程 P 通过执行系统调用从键盘接收一个字符的输入，已知此过程中与进程 P 相关的操作包括：① 将进程 P 插入就绪队列；② 将进程 P 插入阻塞队列；③ 将字符从键盘控制器读入系统缓冲区；④ 启动键盘中断处理程序；⑤ 进程 P 从系统调用返回；⑥ 用户在键盘上输入字符。以上编号①～⑥仅用于标记操作，与操作的先后顺序无关。请回答下列问题。
#subquestions[
 + 按照正确的操作顺序，操作①的前一个和后一个操作分别是上述操作中的哪一个？操作⑥的后一个操作是上述操作中的哪一个？
 + 在上述哪个操作之后 CPU 一定从进程 P 切换到其他进程？在上述哪个操作之后 CPU 调度程序才能选中进程 P 执行？
 + 完成上述哪个操作的代码属于键盘驱动程序？
 + 键盘中断处理程序执行时，进程 P 处于什么状态？CPU 处于内核态还是用户态？
]
]
#question[
（9分）某网络拓扑如题47图所示，主机 H 登录 FTP 服务器后，向服务器上传一个大小为18000 B的文件 F。假设 H 为传输 F 建立数据连接时，选择的初始序号为100，MSS=1000 B，拥塞控制初始阈值为4 MSS，RTT=10 ms，忽略 TCP 段的传输时延；在 F 的传输过程中，H 均以 MSS 段向服务器发送数据，且未发生差错、丢包和乱序现象。
#figure(cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke:.055em,content:(wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .85em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  line((0,0),(21,0))
  content((21,0),image("../../assets/network/cisco-cloud.svg",width:9em,height:5.5em,fit:"stretch"))
  content((0,0),image("../../assets/network/visio-2007-desktop.svg",width:2.5em))
  content((6,0),image("../../assets/network/visio-2007-multilayer-switch.svg",width:2.5em))
  content((12,0),image("../../assets/network/cisco-router.svg",width:3.2em))
  content((20,0),image("../../assets/network/visio-2003-server.svg",width:2.2em))
  content((23,1.6),[Internet]); content((20,-2),[FTP服务器])
  content((0,-1.8),[H]); content((6,-1.8),[交换机]); content((12,-1.8),[路由器])
}), caption: [题47图])
请回答下列问题。
#subquestions[
 + FTP 的控制连接是持久的还是非持久的？FTP 的数据连接是持久的还是非持久的？H 登录 FTP 服务器时，建立的 TCP 连接是控制连接还是数据连接？
 + H 通过数据连接发送 F 时，F 的第1个字节的序号是多少？在断开数据连接过程中，FTP 服务器发送的第二次挥手 ACK 段的确认序号是多少？
 + H 通过数据连接发送 F 的过程中，当 H 收到确认序号为2101的确认段时，H 的拥塞窗口调整为多少？收到确认序号为7101的确认段时，H 的拥塞窗口调整为多少？
 + H 从请求建立数据连接开始，到确认 F 已被服务器全部接收为止，至少需要多长时间？期间应用层数据平均发送速率是多少？
]
]
