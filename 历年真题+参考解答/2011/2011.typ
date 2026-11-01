#import "../../template.typ": exam, choices, subquestions
#show: exam.with(year: 2011, subject: "计算机学科专业基础", code: "408")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#import "@preview/cetz:0.5.2" as cetz

#set document(title: "2011年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题")
= 一、单项选择题：第1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项最符合题目要求。
#question[
设 $n$ 是描述问题规模的非负整数，下面程序片段的时间复杂度是

```c
x = 2;
while (x < n / 2)
    x = 2 * x;
```

#choices(
  [$O(log_2 n)$],
  [$O(n)$],
  [$O(n log_2 n)$],
  [$O(n^2)$],
)
]

#question[
元素
a,b,c,d,e依次进入初始为空的栈中，若元素进栈后可停留、可出栈，直到所有元素都出栈，则在所有可能的出栈序列中，以元素
d开头的序列个数是

#choices(
  [3],
  [4],
  [5],
  [6],
)
]

#question[
已知循环队列存储在一维数组
A[0..n-1]中，且队列非空时front和rear分别指向队头元素和队尾元素。若初始时队列为空，且要求第1个进入队列的元素存储在A[0]处，则初始时front和rear的值分别是

#choices(
  [0,0],
  [0,n-1],
  [n-1,0],
  [n-1,n-1],
)
]

#question[
若一棵完全二叉树有768个结点，则该二叉树中叶结点的个数是

#choices(
  [257],
  [258],
  [384],
  [385],
)
]

#question[
若一棵二叉树的前序遍历序列和后序遍历序列分别为1,2,3,4和4,3,2,1，则该二叉树的中序遍历序列不会是

#choices(
  [1,2,3,4],
  [2,3,4,1],
  [3,2,4,1],
  [4,3,2,1],
)
]

#question[
已知一棵有2011个结点的树，其叶结点个数为116，该树对应的二叉树中无右孩子的结点个数是

#choices(
  [115],
  [116],
  [1895],
  [1896],
)
]

#question[
对于下列关键字序列，不可能构成某二叉排序树中一条查找路径的序列是

#choices(
  [95，22，91，24，94，71],
  [92，20，91，34，88，35],
  [21，89，77，29，36，38],
  [12，25，71，68，33，34],
)
]

#question[
下列关于图的叙述中，正确的是

I. 回路是简单路径

Ⅱ. 存储稀疏图，用邻接矩阵比邻接表更省空间

Ⅲ. 若有向图中存在拓扑序列，则该图不存在回路

#choices(
  [仅Ⅱ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅲ],
  [仅Ⅰ、Ⅲ],
)
]

#question[
为提高散列（Hash）表的查找效率，可以采取的正确措施是

I. 增大装填（载）因子

Ⅱ. 设计冲突（碰撞）少的散列函数

Ⅲ. 处理冲突（碰撞）时避免产生聚集（堆积）现象

#choices(
  [仅Ⅰ],
  [仅Ⅱ],
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
)
]

#question[
为实现快速排序算法，待排序序列宜采用的存储方式是

#choices(
  [顺序存储],
  [散列存储],
  [链式存储],
  [索引存储],
)
]

#question[
已知序列25，13，10，12，9是大根堆，在序列尾部插入新元素18，将其再调整为大根堆，调整过程中元素之间进行的比较次数是

#choices(
  [1],
  [2],
  [4],
  [5],
)
]

#question[
下列选项中，描述浮点数操作速度指标的是

#choices(
  [MIPS],
  [CPI],
  [IPC],
  [MFLOPS],
)
]

#question[
float型数据通常用IEEE754单精度浮点数格式表示。若编译器将float型变量x分配在一个32位浮点寄存器FR1中，且
$x = - 8.25$ ，则FR1的内容是

#choices(
  [C1040000H],
  [C2420000H],
  [C1840000H],
  [C1C20000H],
)
]

#question[
下列各类存储器中，不采用随机存取方式的是

#choices(
  [EPROM],
  [CDROM],
  [DRAM],
  [SRAM],
)
]

#question[
某计算机存储器按字节编址，主存地址空间大小为64
MB，现用 $4 "M" times 8$位的RAM芯片组成32
MB的主存储器，则存储器地址寄存器MAR的位数至少是

#choices(
  [22位],
  [23位],
  [25位],
  [26位],
)
]

#question[
偏移寻址通过将某个寄存器内容与一个形式地址相加而生成有效地址。下列寻址方式中，不属于偏移寻址方式的是

#choices(
  [间接寻址],
  [基址寻址],
  [相对寻址],
  [变址寻址],
)
]

#question[
某机器有一个标志寄存器，其中有进位/借位标志CF、零标志ZF、符号标志SF和溢出标志OF，条件转移指令bgt（无符号整数比较大于时转移）的转移条件是

#choices(
  [$"CF" + "OF" = 1$],
  [$overline("SF") + "ZF" = 1$],
  [$overline("CF" + "ZF") = 1$],
  [$overline("CF" + "SF") = 1$],
)
]

#question[
下列给出的指令系统特点中，有利于实现指令流水线的是

I. 指令格式规整且长度一致

Ⅱ. 指令和数据按边界对齐存放

Ⅲ. 只有 Load/Store 指令才能对操作数进行存储访问

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ、Ⅲ],
  [仅Ⅰ、Ⅲ],
  [I、Ⅱ、Ⅲ],
)
]

#question[
假定不采用
Cache和指令预取技术，且机器处于“开中断”状态，则在下列有关指令执行的叙述中，错误的是

#choices(
  [每个指令周期中 CPU 都至少访问内存一次],
  [每个指令周期一定大于或等于一个 CPU 时钟周期],
  [空操作指令的指令周期中任何寄存器的内容都不会被改变],
  [当前程序在每条指令执行结束时都可能被外部中断打断],
)
]

#question[
在系统总线的数据线上，不可能传输的是

#choices(
  [指令],
  [操作数],
  [握手（应答）信号],
  [中断类型号],
)
]

#question[
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

]

#question[
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
]

#question[
下列选项中，满足短任务优先且不会发生饥饿现象的调度算法是

#choices(
  [先来先服务],
  [高响应比优先],
  [时间片轮转],
  [非抢占式短任务优先],
)
]

#question[
下列选项中，在用户态执行的是

#choices(
  [命令解释程序],
  [缺页处理程序],
  [进程调度程序],
  [时钟中断处理程序],
)
]

#question[
在支持多线程的系统中，进程P创建的若干个线程不能共享的是

#choices(
  [进程P的代码段],
  [进程P中打开的文件],
  [进程P的全局变量],
  [进程P中某线程的栈指针],
)
]

#question[
用户程序发出磁盘 I/O 请求后，系统的正确处理流程是

#choices(
  [用户程序 $arrow.r$系统调用处理程序 $arrow.r$中断处理程序 $arrow.r$设备驱动程序],
  [用户程序 $arrow.r$系统调用处理程序 $arrow.r$设备驱动程序 $arrow.r$中断处理程序],
  [用户程序 $arrow.r$设备驱动程序 $arrow.r$系统调用处理程序 $arrow.r$中断处理程序],
  [用户程序 $arrow.r$设备驱动程序 $arrow.r$中断处理程序 $arrow.r$系统调用处理程序],
)
]

#question[
某时刻进程的资源使用情况如下表所示。

#align(center)[#box(width: 76%)[#text(size: 0.82em)[#table(
  columns: (1.8fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  table.cell(rowspan: 2)[进程],
  table.cell(colspan: 3)[已分配资源],
  table.cell(colspan: 3)[尚需资源],
  table.cell(colspan: 3)[可用资源],
  [R1], [R2], [R3], [R1], [R2], [R3], [R1], [R2], [R3],
  [P1], [2], [0], [0], [0], [0], [1],
  table.cell(rowspan: 4)[0],
  table.cell(rowspan: 4)[2],
  table.cell(rowspan: 4)[1],
  [P2], [1], [2], [0], [1], [3], [2],
  [P3], [0], [1], [1], [1], [3], [1],
  [P4], [0], [0], [1], [2], [0], [0],
)]]]

此时的安全序列是

#choices(
  [P1,P2,P3,P4],
  [P1,P3,P2,P4],
  [P1,P4,P3,P2],
  [不存在],
)
]

#question[
在缺页处理过程中，操作系统执行的操作可能是

I. 修改页表 II. 磁盘I/O III. 分配页框

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅱ],
  [仅Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]

#question[
当系统发生抖动（thrashing）时，可以采取的有效措施是

I. 撤销部分进程

Ⅱ. 增加磁盘交换区的容量

Ⅲ. 提高用户进程的优先级

#choices(
  [仅Ⅰ],
  [仅Ⅱ],
  [仅Ⅲ],
  [仅Ⅰ、Ⅱ],
)
]

#question[
在虚拟内存管理中，地址变换机构将逻辑地址变换为物理地址，形成该逻辑地址的阶段是

#choices(
  [编辑],
  [编译],
  [链接],
  [装载],
)
]

#question[
某文件占10个磁盘块，现要把该文件磁盘块逐个读入主存缓冲区，并送用户区进行分析。假设一个缓冲区与一个磁盘块大小相同，把一个磁盘块读入缓冲区的时间为
100 $mu s$ ，将缓冲区的数据传送到用户区的时间是 50 $mu s$
，CPU对一块数据进行分析的时间为 50 $mu s$
。在单缓冲区和双缓冲区结构下，读入并分析完该文件的时间分别是

#choices(
  [1 500 $mu s$ 、1 000 $mu s$],
  [1 550 $mu s$ 、1 100 $mu s$],
  [1 550 $mu s$ 、1 550 $mu s$],
  [2 000 $mu s$ 、2 000 $mu s$],
)
]

#question[
有两个并发执行的进程 P1 和 P2，共享初值为1的变量 $x$。P1 对 $x$ 加1，P2 对 $x$ 减1。加1和减1操作的指令序列分别如下所示。

```text
P1 // 加1操作                    P2 // 减1操作
load R1, x // 取x到寄存器R1中    load R2, x
inc R1                           dec R2
store x, R1 // 将R1的内容存入x   store x, R2
```

两个操作完成后，x的值

#choices(
  [可能为-1或3],
  [只能为1],
  [可能为0、1或2],
  [可能为-1、0、1或2],
)
]

#question[
TCP/IP参考模型的网络层提供的是

#choices(
  [无连接不可靠的数据报服务],
  [无连接可靠的数据报服务],
  [有连接不可靠的虚电路服务],
  [有连接可靠的虚电路服务],
)
]

#question[
若某通信链路的数据传输速率为2400bps，采用4相位调制，则该链路的波特率是

#choices(
  [600波特],
  [1200波特],
  [4800波特],
  [9600波特],
)
]

#question[
数据链路层采用选择重传协议（SR）传输数据，发送方已发送了0～3号数据帧，现已收到1号帧的确认，而0、2号帧依次超时，则此时需要重传的帧数是

#choices(
  [1],
  [2],
  [3],
  [4],
)
]

#question[
下列选项中，对正确接收到的数据帧进行确认的 MAC
协议是

#choices(
  [CSMA],
  [CDMA],
  [CSMA/CD],
  [CSMA/CA],
)
]

#question[
某网络拓扑如下图所示，路由器R1只有到达子网192.168.1.0/24的路由。为使R1可以将IP分组正确地路由到图中所有子网，则在R1中需要增加的一条路由（目的网络，子网掩码，下一跳）是

#align(center)[
  #cetz.canvas(length: 0.90cm, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let cloud-path(cx, cy, sx: 1, sy: 1, fill: white, stroke: 0.55pt) = merge-path({
      bezier((cx - 1.45 * sx, cy - 0.04 * sy), (cx - 1.18 * sx, cy + 0.32 * sy), (cx - 1.43 * sx, cy + 0.18 * sy), (cx - 1.35 * sx, cy + 0.34 * sy))
      bezier((cx - 1.18 * sx, cy + 0.32 * sy), (cx - 0.72 * sx, cy + 0.48 * sy), (cx - 1.02 * sx, cy + 0.50 * sy), (cx - 0.86 * sx, cy + 0.52 * sy))
      bezier((cx - 0.72 * sx, cy + 0.48 * sy), (cx - 0.15 * sx, cy + 0.56 * sy), (cx - 0.52 * sx, cy + 0.64 * sy), (cx - 0.30 * sx, cy + 0.63 * sy))
      bezier((cx - 0.15 * sx, cy + 0.56 * sy), (cx + 0.36 * sx, cy + 0.50 * sy), (cx + 0.02 * sx, cy + 0.70 * sy), (cx + 0.23 * sx, cy + 0.65 * sy))
      bezier((cx + 0.36 * sx, cy + 0.50 * sy), (cx + 0.86 * sx, cy + 0.46 * sy), (cx + 0.57 * sx, cy + 0.64 * sy), (cx + 0.76 * sx, cy + 0.60 * sy))
      bezier((cx + 0.86 * sx, cy + 0.46 * sy), (cx + 1.28 * sx, cy + 0.27 * sy), (cx + 1.10 * sx, cy + 0.52 * sy), (cx + 1.28 * sx, cy + 0.43 * sy))
      bezier((cx + 1.28 * sx, cy + 0.27 * sy), (cx + 1.46 * sx, cy - 0.06 * sy), (cx + 1.48 * sx, cy + 0.18 * sy), (cx + 1.50 * sx, cy + 0.04 * sy))
      bezier((cx + 1.46 * sx, cy - 0.06 * sy), (cx + 1.19 * sx, cy - 0.35 * sy), (cx + 1.45 * sx, cy - 0.25 * sy), (cx + 1.35 * sx, cy - 0.38 * sy))
      bezier((cx + 1.19 * sx, cy - 0.35 * sy), (cx + 0.72 * sx, cy - 0.43 * sy), (cx + 1.02 * sx, cy - 0.52 * sy), (cx + 0.84 * sx, cy - 0.52 * sy))
      bezier((cx + 0.72 * sx, cy - 0.43 * sy), (cx + 0.20 * sx, cy - 0.50 * sy), (cx + 0.51 * sx, cy - 0.57 * sy), (cx + 0.34 * sx, cy - 0.58 * sy))
      bezier((cx + 0.20 * sx, cy - 0.50 * sy), (cx - 0.35 * sx, cy - 0.50 * sy), (cx + 0.02 * sx, cy - 0.66 * sy), (cx - 0.18 * sx, cy - 0.64 * sy))
      bezier((cx - 0.35 * sx, cy - 0.50 * sy), (cx - 0.83 * sx, cy - 0.42 * sy), (cx - 0.56 * sx, cy - 0.60 * sy), (cx - 0.72 * sx, cy - 0.56 * sy))
      bezier((cx - 0.83 * sx, cy - 0.42 * sy), (cx - 1.24 * sx, cy - 0.33 * sy), (cx - 1.05 * sx, cy - 0.53 * sy), (cx - 1.23 * sx, cy - 0.47 * sy))
      bezier((cx - 1.24 * sx, cy - 0.33 * sy), (cx - 1.45 * sx, cy - 0.04 * sy), (cx - 1.43 * sx, cy - 0.30 * sy), (cx - 1.49 * sx, cy - 0.17 * sy))
    }, close: true, fill: fill, stroke: stroke)

    let cloud(cx, cy, sx: 1, sy: 1) = {
      cloud-path(cx + 0.12, cy - 0.11, sx: sx, sy: sy, fill: luma(60%), stroke: none)
      cloud-path(cx, cy, sx: sx, sy: sy, fill: luma(96%), stroke: 0.55pt)
    }

    hide(rect((0, 0.40), (14.40, 5.60), stroke: none), bounds: true)

    // Draw the links first so the clouds and router symbols mask their ends.
    line((7.20, 5.03), (7.20, 4.02), stroke: 0.58pt)
    line((7.20, 2.76), (7.20, 1.82), stroke: 0.58pt)
    line((4.17, 1.50), (6.66, 1.50), stroke: 0.58pt)
    line((7.74, 1.50), (10.23, 1.50), stroke: 0.58pt)

    cloud(7.20, 3.38, sx: 1.20, sy: 1.02)
    cloud(2.15, 1.25, sx: 1.35, sy: 1.04)
    cloud(12.25, 1.25, sx: 1.35, sy: 1.04)

    content((7.20, 5.05), box(inset: 0pt)[
      #image("assets/router-symbol.svg", width: 1.04cm, height: 0.73cm)
    ])
    content((7.20, 1.50), box(inset: 0pt)[
      #image("assets/router-symbol.svg", width: 1.04cm, height: 0.73cm)
    ])

    content((6.50, 5.43), text(size: 0.82em)[R1])
    content((7.72, 4.48), text(size: 0.78em)[192.168.1.1], anchor: "west")
    content((7.20, 3.38), text(size: 0.84em)[192.168.1.0/24])
    content((6.48, 2.12), text(size: 0.82em)[R2])
    content((7.72, 2.42), text(size: 0.78em)[192.168.1.2], anchor: "west")
    content((2.15, 1.25), text(size: 0.84em)[192.168.2.0/25])
    content((12.25, 1.25), text(size: 0.84em)[192.168.2.128/25])
    content((5.35, 1.05), text(size: 0.78em)[192.168.2.1])
    content((9.05, 1.05), text(size: 0.78em)[192.168.2.130])
  })
]

#choices(
  [192.168.2.0，255.255.255.128，192.168.1.1],
  [192.168.2.0，255.255.255.0，192.168.1.1],
  [192.168.2.0，255.255.255.128，192.168.1.2],
  [192.168.2.0，255.255.255.0，192.168.1.2],
)
]

#question[
在子网192.168.4.0/30中，能接收目的地址为192.168.4.3的IP分组的最大主机数是

#choices(
  [0],
  [1],
  [2],
  [4],
)
]

#question[
主机甲向主机乙发送一个（$"SYN" = 1$，$"seq" = 11220$
）的TCP段，期望与主机乙建立TCP连接，若主机乙接受该连接请求，则主机乙向主机甲发送的正确的TCP段可能是

#choices(
  [（$"SYN" = 0$，$"ACK" = 0$，$"seq" = 11221$，$"ack" = 11221$）],
  [（$"SYN" = 1$，$"ACK" = 1$，$"seq" = 11220$，$"ack" = 11220$）],
  [（$"SYN" = 1$，$"ACK" = 1$，$"seq" = 11221$，$"ack" = 11221$）],
  [（$"SYN" = 0$，$"ACK" = 0$，$"seq" = 11220$，$"ack" = 11220$）],
)
]

#question[
主机甲与主机乙之间已建立一个TCP连接，主机甲向主机乙发送了3个连续的TCP段，分别包含300字节、400字节和500字节的有效载荷，第3个段的序号为900。若主机乙仅正确接收到第1和第3个段，则主机乙发送给主机甲的确认序号是

#choices(
  [300],
  [500],
  [1200],
  [1400],
)
]

= 二、综合应用题：第41～47小题，共70分。
#question[
（8分）已知有6个顶点（顶点编号为0～5）的有向带权图 G，其邻接矩阵
A为上三角矩阵，按行为主序（行优先）保存在如下的一维数组中。

#figure(
  align(center)[#table(
    columns: (6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%),
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    [4], [6], [∞], [∞], [∞], [5], [∞], [∞], [∞], [4], [3], [∞], [∞], [3], [3],
  )]
  , kind: table
  )

要求：

#subquestions[
+ 写出图 G的邻接矩阵 A。
  \
+ 画出有向带权图 G。
  \
+ 求图 G的关键路径，并计算该关键路径的长度。
  
    
]
]

#question[
（15分）一个长度为
$L (L gt.eq 1)$的升序序列S，处在第
$ceil.l L \/ 2 ceil.r$个位置的数称为S的中位数。例如，若序列
$S_1 = (11, 13, 15, 17, 19)$
，则S1的中位数是15。两个序列的中位数是含它们所有元素的升序序列的中位数。例如，若
$S_2 = (2, 4, 6, 8, 20)$
，则S1和S2的中位数是11。现有两个等长升序序列A和B，试设计一个在时间和空间两方面都尽可能高效的算法，找出两个序列A和B的中位数。要求：

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
（11分）假定在一个8位字长的计算机中运行如下类C程序段：

```c
unsigned int x = 134;
unsigned int y = 246;
int m = x;
int n = y;
unsigned int z1 = x - y;
unsigned int z2 = x + y;
int k1 = m - n;
int k2 = m + n;
```

若编译器编译时将8个8位寄存器R1～R8分别分配给变量
x、y、m、n、z1、z2、k1和
k2。请回答下列问题。（提示：带符号整数用补码表示）

#subquestions[
+ 
  执行上述程序段后，寄存器R1、R5和R6的内容分别是什么？（用十六进制表示）
  \
+ 执行上述程序段后，变量 m和
  k1的值分别是多少？（用十进制表示）
  \
+ 
  上述程序段涉及带符号整数加/减、无符号整数加/减运算，这四种运算能否利用同一个加法器及辅助电路实现？简述理由。
  \
+ 
  计算机内部如何判断带符号整数加/减运算的结果是否发生溢出？上述程序段中，哪些带符号整数运算语句的执行结果会发生溢出？
  
    
]
]

#question[
（12分）某计算机存储器按字节编址，虚拟（逻辑）地址空间大小为16MB，主存（物理）地址空间大小为1MB，页面大小为4KB；Cache采用直接映射方式，共8行；主存与
Cache之间交换的块大小为32B。系统运行到某一时刻时，页表的部分内容和Cache的部分内容分别如题44-a图、题44-b图所示，图中页框号及标记字段的内容为十六进制形式。

#align(center)[#box(width: 82%)[#grid(
  columns: (1fr, 1fr),
  gutter: 1.8em,
  figure(
    align(center)[#text(size: 0.78em)[#stack(
      dir: ttb,
      spacing: 0pt,
      grid(
        columns: (1.1fr, 1.1fr, 1.1fr, 0.9fr),
        align: center,
        [虚页号], [有效位], [页框号], […],
      ),
      table(
        columns: (1.1fr, 1.1fr, 1.1fr, 0.9fr),
        align: center + horizon,
        stroke: (x, y) => (
          top: if y == 0 { 0.6pt } else { none },
          bottom: if y == 7 { 0.6pt } else { none },
          left: 0.45pt,
          right: if x == 3 { 0.45pt } else { none },
        ),
        [0], [1], [06], […],
        [1], [1], [04], […],
        [2], [1], [15], […],
        [3], [1], [02], […],
        [4], [0], [−], […],
        [5], [1], [2B], […],
        [6], [0], [−], […],
        [7], [1], [32], […],
      ),
    )]],
    kind: table,
    caption: [题44-a图　页表的部分内容],
    numbering: none,
  ),
  figure(
    align(center)[#text(size: 0.78em)[#stack(
      dir: ttb,
      spacing: 0pt,
      grid(
        columns: (1.1fr, 1.1fr, 1.1fr, 0.9fr),
        align: center,
        [行号], [有效位], [标记], […],
      ),
      table(
        columns: (1.1fr, 1.1fr, 1.1fr, 0.9fr),
        align: center + horizon,
        stroke: (x, y) => (
          top: if y == 0 { 0.6pt } else { none },
          bottom: if y == 7 { 0.6pt } else { none },
          left: 0.45pt,
          right: if x == 3 { 0.45pt } else { none },
        ),
        [0], [1], [020], […],
        [1], [0], [−], […],
        [2], [1], [01D], […],
        [3], [1], [105], […],
        [4], [1], [064], […],
        [5], [1], [14D], […],
        [6], [0], [−], […],
        [7], [1], [27A], […],
      ),
    )]],
    kind: table,
    caption: [题44-b图　Cache的部分内容],
    numbering: none,
  ),
)]]

请回答下列问题。

#subquestions[
+ 
  虚拟地址共有几位，哪几位表示虚页号？物理地址共有几位，哪几位表示页框号
  （物理页号）？
  \
+ 使用物理地址访问
  Cache时，物理地址应划分成哪几个字段？要求说明每个字段的位数及在物理地址中的位置。
  \
+ 
  虚拟地址001C60H所在的页面是否在主存中？若在主存中，则该虚拟地址对应的物理地址是什么？访问该地址时是否Cache命中？要求说明理由。
  \
+ 
  假定为该机配置一个4路组相联的TLB，该TLB共可存放8个页表项，若其当前内容（十六进制）如题44-c图所示，则此时虚拟地址024BACH所在的页面是否在主
  
  存中？要求说明理由。
  
  #figure(
    align(center)[#table(
      columns: (7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%, 7.69%),
      align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
      [组号], [有效位], [标记], [页框号], [有效位], [标记], [页框号], [有效位], [标记], [页框号], [有效位], [标记], [页框号],
      [0], [0], [-], [-], [1], [001], [15], [0], [-], [-], [1], [012], [1F],
      [1], [1], [013], [2D], [0], [-], [-], [1], [008], [7E], [0], [-], [-],
    )],
    kind: image,
    caption: [题44-c图　TLB的部分内容],
    numbering: none,
  )
  
    
]
]

#question[
（8分）某银行提供1个服务窗口和10个供顾客等待的座位。顾客到达银行时，若有空座位，则到取号机上领取一个号，等待叫号。取号机每次仅允许一位顾客使用。当营业员空闲时，通过叫号选取一位顾客，并为其服务。顾客和营业员的活动过程描述如下：

```text
cobegin
{
    process 顾客 i
    {
        从取号机获得一个号码；
        等待叫号；
        获得服务；
    }
    process 营业员
    {
        while (TRUE) {
            叫号；
            为顾客服务；
        }
    }
}
coend
```

请添加必要的信号量和 P、V（或
wait（）、signal（））操作，实现上述过程中的互斥与同步。要求写出完整的过程，说明信号量的含义并赋初值。

]

#question[
（7分）某文件系统为一级目录结构，文件的数据一次性写入磁盘，已写入的文件不可修改，但可多次创建新文件。请回答如下问题。

#subquestions[
+ 
  在连续、链式、索引三种文件的数据块组织方式中，哪种更合适？要求说明理由。为定位文件数据块，需在FCB中设计哪些相关描述字段？
  \
+ 
  为快速找到文件，对于FCB，是集中存储好，还是与对应的文件数据块连续存储好？要求说明理由。
  
    
]
]

#question[
（9分）某主机的MAC地址为00-15-C5-C1-5E-28，IP地址为10.2.128.100（私有地址）。题47-a图是网络拓扑，题47-b图是该主机进行Web请求的1个以太网数据帧前80个字节的十六进制及ASCII码内容。

请参考图中的数据回答以下问题。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    // Original proportions: host at left, gateway on the link, Internet at right.
    line((1.1, 0), (26.4, 0), stroke: 0.55pt)
    content((1.1, 0), image("../2012/assets/visio-2003-pc.svg", width: 2.2em, height: 2.2em, fit: "stretch"))
    content((13.4, 0), image("../2012/assets/visio-2003-router.svg", width: 2.9em, height: 1.85em, fit: "stretch"))
    content((26.6, 0.2), image("../2012/assets/visio-2003-cloud.svg", width: 6.3em, height: 3.5em, fit: "stretch"))
    content((26.6, 0.2), text(fill: white, size: 0.95em)[Internet])
    content((5.1, 0.75), text(size: 0.78em)[10.2.128.100])
    content((10.0, 0.75), text(size: 0.78em)[10.2.128.1])
    content((13.4, 1.55), text(size: 0.9em)[R])
    content((17.7, 0.75), text(size: 0.78em)[101.12.123.15])
    content((21.7, 2.15), text(size: 0.85em)[MTU = 1500 B])
    line((21.7, 1.7), (21.7, 0.05), stroke: 0.55pt, mark: (end: ">"))
  }),
  kind: image,
  caption: [题47-a图　网络拓扑],
  numbering: none,
)

#figure(
  {
    // Fixed byte columns preserve alignment without imposing a code font.
    let rows = (
      ("0000", "00 21 27 21 51 ee 00 15 c5 c1 5e 28 08 00 45 00"),
      ("0010", "01 ef 11 3b 40 00 80 06 ba 9d 0a 02 80 64 40 aa"),
      ("0020", "62 20 04 ff 00 50 e0 e2 00 fa 7b f9 f8 05 50 18"),
      ("0030", "fa f0 1a c4 00 00 47 45 54 20 2f 72 66 63 2e 68"),
      ("0040", "74 6d 6c 20 48 54 54 50 2f 31 2e 31 0d 0a 41 63"),
    )
    let cells = ()
    for (offset, bytes) in rows {
      cells.push(offset)
      for byte in bytes.split(" ") { cells.push(byte) }
      for byte in bytes.split(" ") {
        let value = int(byte, base: 16)
        cells.push(if 32 <= value and value <= 126 { str.from-unicode(value) } else { "." })
      }
    }
    text(size: 0.8em, font: "FZShuSong-Z01S", top-edge: "ascender", bottom-edge: "descender")[
      #block(stroke: 0.5pt, inset: 0.25em, width: auto)[#grid(
        columns: (3em, ..(1.65em,) * 16, 1.1em, ..(0.68em,) * 15),
        inset: 0pt,
        row-gutter: 0.25em,
        align: center,
        ..cells,
      )]
    ]
  },
  kind: image,
  caption: [题47-b图　以太网数据帧（前80字节）],
  numbering: none,
)

#subquestions[
+ 
  Web服务器的IP地址是什么？该主机的默认网关的MAC地址是什么？
  \
+ 
  该主机在构造题47-b图的数据帧时，使用什么协议确定目的MAC地址？封装该
  协议请求报文的以太网帧的目的MAC地址是什么？
  \
+ 假设
  HTTP/1.1协议以持续的非流水线方式工作，一次请求-响应时间为RTT，rfc.html页面引用了5个JPEG小图像，则从发出题47-b图中的Web请求开始到浏览器收到全部内容为止，需要多少个RTT？
  \
+ 
  该帧所封装的IP分组经过路由器R转发时，需修改IP分组头中的哪些字段？注：以太网数据帧结构和IP分组头结构分别如题47-c图、题47-d图所示。
  
  #figure(
    align(center)[#box(width: 77%)[
      #text(size: 0.94em)[
        #stack(
          dir: ttb,
          spacing: 0.16em,
          grid(
            columns: (6fr, 6fr, 2.8fr, 4.4fr, 4.5fr),
            align: center,
            [6 B], [6 B], [2 B], [46-1500 B], [4 B],
          ),
          table(
            columns: (6fr, 6fr, 2.8fr, 4.4fr, 4.5fr),
            align: center + horizon,
            inset: (x: 0.24em, y: 0.50em),
            stroke: 0.55pt,
            [目的MAC地址], [源MAC地址], [类型], [数据], [CRC],
          ),
        )
      ]
    ]],
    kind: image,
    caption: [题47-c图　以太网帧结构],
    numbering: none,
  )
  
  #figure(
    align(center)[
      #cetz.canvas(length: 0.33cm, {
        import cetz.draw: *
        set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
        let rule = 0.55pt
        hide(rect((-2.15, 0.35), (32.15, 15.70), stroke: none), bounds: true)
  
        // Bit ruler. Major ticks mark byte boundaries; the right label is bit 31.
        line((0, 14.10), (32, 14.10), stroke: rule)
        for i in range(33) {
          let major = i == 0 or i == 8 or i == 16 or i == 24 or i == 32
          line((i, 14.10), (i, if major { 15.10 } else { 14.60 }), stroke: rule)
        }
        content((-0.8, 15.32), text(size: 0.84em)[比特], anchor: "east")
        content((0, 15.32), text(size: 0.84em)[0])
        content((8, 15.32), text(size: 0.84em)[8])
        content((16, 15.32), text(size: 0.84em)[16])
        content((24, 15.32), text(size: 0.84em)[24])
        content((32, 15.32), text(size: 0.84em)[31], anchor: "east")
  
        // Five 32-bit rows of the IPv4 header.
        rect((0, 0.50), (32, 13.50), fill: white, stroke: rule)
        line((0, 10.90), (32, 10.90), stroke: rule)
        line((0, 8.30), (32, 8.30), stroke: rule)
        line((0, 5.70), (32, 5.70), stroke: rule)
        line((0, 3.10), (32, 3.10), stroke: rule)
  
        line((4, 10.90), (4, 13.50), stroke: rule)
        line((8, 10.90), (8, 13.50), stroke: rule)
        line((16, 10.90), (16, 13.50), stroke: rule)
        line((16, 8.30), (16, 10.90), stroke: rule)
        line((19, 8.30), (19, 10.90), stroke: rule)
        line((8, 5.70), (8, 8.30), stroke: rule)
        line((16, 5.70), (16, 8.30), stroke: rule)
  
        content((2, 12.20), text(size: 0.95em)[版本])
        content((6, 12.20), text(size: 0.90em)[#stack(dir: ttb, spacing: 0pt, [头部], [长度])])
        content((12, 12.20), text(size: 0.95em)[服务类型])
        content((24, 12.20), text(size: 0.95em)[总长度])
  
        content((8, 9.60), text(size: 0.95em)[标识])
        content((17.5, 9.60), text(size: 0.95em)[标志])
        content((25.5, 9.60), text(size: 0.95em)[片偏移])
  
        content((4, 7.00), text(size: 0.90em)[生存时间 (TTL)])
        content((12, 7.00), text(size: 0.95em)[协议])
        content((24, 7.00), text(size: 0.95em)[头部校验和])
        content((16, 4.40), text(size: 0.95em)[源IP地址])
        content((16, 1.80), text(size: 0.95em)[目的IP地址])
      })
    ],
    kind: image,
    caption: [题47-d图　IP分组头结构],
    numbering: none,
  )
    
]
]
