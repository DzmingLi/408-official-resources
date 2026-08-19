#set text(lang: "zh")
#import "@preview/taskize:0.2.8": tasks

= 2011年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题
== 一、单项选择题（1\~40小题，每小题2分，共80分。下列每小题给出的四个选项中，只有一项符合题目要求）
#block(breakable: false)[\1. 设 n是描述问题规模的非负整数，下面程序片段的时间复杂度是\_\_\_。

```c
x=2;
while(x<n/2)
x=2*x;
```

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $upright(O) \( log_2 n \)$
+ B. $upright(O) \( n \)$
+ C. $upright(O) \( n log_2 n \)$
+ D. $upright(O) \( n^2 \)$
]
]
#block(breakable: false)[\2. 元素 a, b, c, d, e 依次进入初始为空的栈中，若元素进栈后可停留、可出栈，直到所有元素都出栈，则在所有可能的出栈序列中，以元素 d 开头的序列个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 3
+ B. 4
+ C. 5
+ D. 6
]
]
#block(breakable: false)[\3. 已知循环队列存储在一维数组 A\[0…n-1\]中，且队列非空时 front 和 rear 分别指向队头元素和队尾元素。若初始时队列为空，且要求第1个进入队列的元素存储在 A\[0\]处，则初始时 front和rear的值分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0,0
+ B. 0,n-1
+ C. n-1,0
+ D. n-1,n-1
]
]
#block(breakable: false)[\4. 若一棵完全二叉树有768个结点，则该二叉树中叶结点的个数是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 257
+ B. 258
+ C. 384
+ D. 385
]
]
#block(breakable: false)[\5. 若一棵二叉树的前序遍历序列和后序遍历序列分别为1,2,3,4和4,3,2,1，则该二叉树的中序遍历序列不会是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1,2,3,4
+ B. 2,3,4,1
+ C. 3,2,4,1
+ D. 4,3,2,1.
]
]
#block(breakable: false)[\6. 已知一棵有2011个结点的树，其叶结点个数为116，该树对应的二叉树中无右孩子的结点个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 115
+ B. 116
+ C. 1895
+ D. 1896
]
]
#block(breakable: false)[\7. 对于下列关键字序列，不可能构成某二叉排序树中一条查找路径的序列是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 95,22,91,24,94,71
+ B. 92,20,91,34,88,35
+ C. 21,89,77,29,36,38
+ D. 12,25,71,68,33,34
]
]
#block(breakable: false)[\8. 下列关于图的叙述中，正确的是\_\_\_。

I. 回路是简单路径

II. 存储稀疏图，用邻接矩阵比邻接表更省空间

III. 若有向图中存在拓扑序列，则该图不存在回路

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅Ⅱ
+ B. 仅I、II
+ C. 仅Ⅲ
+ D. 仅I、Ⅲ
]
]
#block(breakable: false)[\9. 为提高散列（Hash）表的查找效率，可以采取的正确措施是\_\_\_。

I. 增大装填（载）因子

II. 设计冲突（碰撞）少的散列函数

III. 处理冲突（碰撞）时避免产生聚集（堆积）现象

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I
+ B. 仅II
+ C. 仅I、II
+ D. 仅II、III
]
]
#block(breakable: false)[\10. 为实现快速排序算法，待排序序列宜采用的存储方式是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 顺序存储
+ B. 散列存储
+ C. 链式存储
+ D. 索引存储
]
]
#block(breakable: false)[\11. 已知序列25，13，10，12，9是大根堆，在序列尾部插入新元素18，将其再调整为大根堆，调整过程中元素之间进行的比较次数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1
+ B. 2
+ C. 4
+ D. 5
]
]
#block(breakable: false)[\12. 下列选项中，描述浮点数操作速度指标的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. MIPS
+ B. CPI
+ C. IPC
+ D. MFLOPS
]
]
#block(breakable: false)[\13. float型数据通常用IEEE754单精度浮点数格式表示。若编译器将float型变量x分配到一个32位浮点寄存器FR1中，且 $x = - 8.25$ ，则FR1的内容是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. C1040000H
+ B. C2420000H
+ C. C1840000H
+ D. C1C20000H
]
]
#block(breakable: false)[\14. 下列各类存储器中，不采用随机存取方式的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. EPROM
+ B. CDROM
+ C. DRAM
+ D. SRAM
]
]
#block(breakable: false)[\15. 某计算机存储器按字节编址，主存地址空间大小为64MB，现用 4MB×8位的RAM芯片组成32MB的主存储器，则存储器地址寄存器MAR的位数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 22位
+ B. 23位
+ C. 25位
+ D. 26位
]
]
#block(breakable: false)[\16. 偏移寻址通过将某个寄存器内容与一个形式地址相加而生成有效地址。下列寻址方式中，不属于偏移寻址方式的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 间接寻址
+ B. 基址寻址
+ C. 相对寻址
+ D. 变址寻址
]
]
#block(breakable: false)[\17. 某机器有一个标志寄存器，其中有进位/借位标志 CF、零标志 ZF、符号标志 SF和溢出标志 OF，条件转移指令 bgt（无符号整数比较大于时转移）的转移条件是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $upright(C F + O F = 1)$
+ B. $upright(overline(S F) + Z F = 1)$
+ C. $upright(overline(C F + Z F) = 1)$
+ D. $upright(overline(C F + S F) = 1)$
]
]
#block(breakable: false)[\18. 下列给出的指令系统特点中，有利于实现指令流水线的是\_\_\_。

I. 指令格式规整且长度一致 II. 指令和数据按边界对齐存放

III. 只有 Load/Store 指令才能对操作数进行存储访问

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅II、III
+ C. 仅I、III
+ D. I、II、III
]
]
#block(breakable: false)[\19. 假定不采用 Cache和指令预取技术，且机器处于“开中断”状态。在下列有关指令执行的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 每个指令周期中 CPU 都至少访问内存一次
+ B. 每个指令周期一定大于等于一个 CPU 时钟周期
+ C. 空操作指令的指令周期中任何寄存器的内容都不会被改变
+ D. 当前程序在每条指令执行结束时都可能被外部中断打断
]
]
#block(breakable: false)[\20. 在系统总线的数据线上，不可能传输的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 指令
+ B. 操作数
+ C. 握手（应答）信号
+ D. 中断类型号
]
]
#block(breakable: false)[\21. 某计算机有五级中断 $upright(L)_4 tilde.op upright(L)_0$ ，中断屏蔽字为 $upright(M)_4 upright(M)_3 upright(M)_2 upright(M)_1 upright(M)_0$ $upright(M)_i = 1$ （ $0 lt.eq i lt.eq 4$ ）表示对 $upright(L)_i$级中断进行屏蔽。若中断响应优先级从高到低的顺序是 $upright(L)_4 arrow.r upright(L)_0 arrow.r upright(L)_2 arrow.r upright(L)_1 arrow.r upright(L)_3$ ，则 $upright(L)_1$的中断处理程序中设置的中断屏蔽字是\_\_\_。


#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 11110
+ B. 01101
+ C. 00011
+ D. 01010
]
]
#block(breakable: false)[\22. 某计算机处理器主频为 50MHz，采用定时查询方式控制设备 A的 I/O，查询程序运行一次所用的时钟周期数至少为 500。在设备 A工作期间，为保证数据不丢失，每秒需对其查询至少 200次，则 CPU 用于设备 A的 I/O的时间占整个 CPU时间的百分比至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0.02%
+ B. 0.05%
+ C. 0.20%
+ D. 0.50%
]
]
#block(breakable: false)[\23. 下列选项中，满足短任务优先且不会发生饥饿现象的调度算法是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 先来先服务
+ B. 高响应比优先
+ C. 时间片轮转
+ D. 非抢占式短任务优先
]
]
#block(breakable: false)[\24. 下列选项中，在用户态执行的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 命令解释程序
+ B. 缺页处理程序
+ C. 进程调度程序
+ D. 时钟中断处理程序
]
]
#block(breakable: false)[\25. 在支持多线程的系统中，进程P创建的若干线程不能共享的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 进程P的代码段
+ B. 进程P中打开的文件
+ C. 进程P的全局变量
+ D. 进程P中某线程的栈指针
]
]
#block(breakable: false)[\26. 用户程序发出磁盘 I/O 请求后，系统的正确处理流程是\_\_\_。

A. 用户程序 $arrow.r$系统调用处理程序 $arrow.r$中断处理程序 $arrow.r$设备驱动程序
B. 用户程序 $arrow.r$系统调用处理程序 $arrow.r$设备驱动程序 $arrow.r$中断处理程序
C. 用户程序 $arrow.r$设备驱动程序 $arrow.r$系统调用处理程序 $arrow.r$中断处理程序
D. 用户程序 $arrow.r$设备驱动程序 $arrow.r$中断处理程序 $arrow.r$系统调用处理程序
]
#block(breakable: false)[\27. 某时刻进程的资源使用情况如下表所示。

进程
已分配资源
尚需分配
可用资源
R1
R2
R3
R1
R2
R3
R1
R2
R3
P1
2
0
0
0
0
1
0
2
1
P2
1
2
0
1
3
2
P3
0
1
1
1
3
1
P4
0
0
1
2
0
0
此时的安全序列是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $upright(P)_1 \, upright(P)_2 \, upright(P)_3 \, upright(P)_4$
+ B. $upright(P)_1 \, upright(P)_3 \, upright(P)_2 \, upright(P)_4$
+ C. $upright(P)_1 \, upright(P)_4 \, upright(P)_3 \, upright(P)_2$
+ D. 不存在的
]
]
#block(breakable: false)[\28. 在缺页处理过程中，操作系统执行的操作可能是\_\_\_。

I. 修改页表 II. 磁盘 I/O III. 分配页框

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅II
+ C. 仅III
+ D. I、II和III
]
]
#block(breakable: false)[\29. 当系统发生抖动（thrashing）时，可以采取的有效措施是\_\_\_。

I. 撤销部分进程 II. 增加磁盘交换区的容量

III. 提高用户进程的优先级

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I
+ B. 仅II
+ C. 仅III
+ D. 仅I、II
]
]
#block(breakable: false)[\30. 在虚拟内存管理中，地址变换机构将逻辑地址变换为物理地址，形成该逻辑地址的阶段是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 编辑
+ B. 编译
+ C. 链接
+ D. 装载
]
]
#block(breakable: false)[\31. 某文件占10个磁盘块，现要把该文件磁盘块逐个读入主存缓冲区，并送用户区进行分析，假设一个缓冲区与一个磁盘块大小相同，把一个磁盘块读入缓冲区的时间为 100 $mu s$ ，将缓冲区的数据传送到用户区的时间是 50 $mu s$ ，CPU对一块数据进行分析的时间为 50 $mu s$ 。在单缓冲区和双缓冲区结构下，读入并分析完该文件的时间分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1500 $mu s$ 、1000 $mu s$
+ B. 1550 $mu s$ 、1100 $mu s$
+ C. 1550 $mu s$ 、1550 $mu s$
+ D. 2000 $mu s$ 、2000 $mu s$
]
]
#block(breakable: false)[\32. 有两个并发执行的进程 $upright(P)_1$和 $upright(P)_2$，共享初值为1的变量x。 $upright(P)_1$对x加1， $upright(P)_2$对x减1。加1和减1操作的指令序列分别如下所示。

```c
//加1操作                        //减1操作
load R1,x //取 x到寄存器R1中     load R2, x
inc R1                           dec R2
store x,R1 //将R1的内容存入x     store x,R2
```

两个操作完成后，x的值\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 可能为-1或3
+ B. 只能为1
+ C. 可能为0、1或2
+ D. 可能为-1、0、1或2
]
]
#block(breakable: false)[\33. TCP/IP参考模型的网络层提供的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 无连接不可靠的数据报服务
+ B. 无连接可靠的数据报服务
+ C. 有连接不可靠的虚电路服务
+ D. 有连接可靠的虚电路服务
]
]
#block(breakable: false)[\34. 若某通信链路的数据传输速率为2400bps，采用四相位调制，则该链路的波特率是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 600波特
+ B. 1200波特
+ C. 4800波特
+ D. 9600波特
]
]
#block(breakable: false)[\35. 数据链路层采用选择重传协议（SR）传输数据，发送方已发送了0\~3号数据帧，现已收到1号帧的确认，而0、2号帧依次超时，则此时需要重传的帧数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.1
+ B.2
+ C.3
+ D.4
]
]
#block(breakable: false)[\36. 下列选项中，对正确接收到的数据帧进行确认的 MAC 协议是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. CSMA
+ B. CDMA
+ C. CSMA/CD
+ D. CSMA/CA
]
]
#block(breakable: false)[\37. 某网络拓扑如下图所示，路由器 R1 只有到达子网 192.168.1.0/24 的路由。为使 R1 可以将 IP 分组正确地路由到图中所有的子网，则在 R1 中需要增加的一条路由（目的网络，子网掩码，下一跳）是\_\_\_。

#image("images/img-1.jpg")

A. 192.168.2.0 255.255.255.128 192.168.1.1
B. 192.168.2.0 255.255.255.0 192.168.1.1
C. 192.168.2.0 255.255.255.128 192.168.1.2
D. 192.168.2.0 255.255.255.0 192.168.1.2
]
#block(breakable: false)[\38. 在子网192.168.4.0/30中能接收目的地址为192.168.4.3的IP分组的最大主机数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0
+ B. 1
+ C. 2
+ D. 4
]
]
#block(breakable: false)[\39. 主机甲向主机乙发送一个（SYN = 1, seq = 11220）的TCP段，期望与主机乙建立TCP


连接，若主机乙接受该连接请求，则主机乙向主机甲发送的正确的TCP段可能是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. （SYN=0，ACK=0，seq=11221，ack=11221）
+ B. （SYN=1，ACK=1，seq=11220，ack=11220）
+ C. （SYN=1，ACK=1，seq=11221，ack=11221）
+ D. （SYN=0，ACK=0，seq=11220，ack=11220）
]
]
#block(breakable: false)[\40. 主机甲与主机乙之间已建立一个TCP连接，主机甲向主机乙发送了3个连续的TCP段，分别包含300B、400B和500B的有效载荷，第3个段的序号为900。若主机乙仅正确接收到第1段和第3段，则主机乙发送给主机甲的确认序号是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 300
+ B. 500
+ C. 1200
+ D. 1400
]
]
== 二、综合应用题（第41\~47小题，共70分）
#block(breakable: false)[\41. （8分）已知有6个顶点（顶点编号为 $0 tilde.op 5$ ）的有向带权图G，其邻接矩阵 A为上三角矩阵，按行为主序（行优先）保存在如下的一维数组中。

#figure(
  align(center)[#table(
    columns: (6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%, 6.67%),
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    [4], [6], [∞], [∞], [∞], [5], [∞], [∞], [∞], [4], [3], [∞], [∞], [3], [3],
  )]
  , kind: table
  )

要求：

\\(1) 写出图G的邻接矩阵 A。

\\(2) 画出有向带权图 G。

\\(3) 求图G的关键路径，并计算该关键路径的长度。
]
#block(breakable: false)[\42. （15分）一个长度为 L（L≥1）的升序序列 S，处在第 $floor.l L \/ 2 floor.r$个位置的数称为 S的中位数。例如，若序列 S1=（11，13，15，17，19），则 S1的中位数是15，两个序列的中位数是含它们所有元素的升序序列的中位数。例如，若 S2=（2，4，6，8，20），则 S1和 S2的中位数是11。现在有两个等长升序序列 A和B，试设计一个在时间和空间两方面都尽可能高效的算法，找出两个序列 A和B的中位数。要求：

\\(1) 给出算法的基本设计思想。

\\(2) 根据设计思想，采用C、C++或Java语言描述算法，关键之处给出注释。

\\(3) 说明你所设计算法的时间复杂度和空间复杂度。
]
#block(breakable: false)[\43. （11分）假定在一个8位字长的计算机中运行如下C程序段：

```c
unsigned int  x=134;
unsigned int  y=246;
int  m=x;
int  n=y;
unsigned int  z1=x-y;
unsigned int  z2=x+y;
int  k1=m-n;
int  k2=m+n;
```

若编译器编译时将8个8位寄存器R1～R8分别分配给变量x、y、m、n、z1、z2、k1和k2。请回答下列问题。（提示：带符号整数用补码表示。）

\\(1) 执行上述程序段后，寄存器R1、R5和R6的内容分别是什么（用十六进制表示）？

\\(2) 执行上述程序段后，变量 m 和 k1的值分别是多少（用十进制表示）？

\\(3) 上述程序段涉及带符号整数加/减、无符号整数加/减运算，这四种运算能否利用同一个加法器辅助电路实现？简述理由。

\\(4) 计算机内部如何判断带符号整数加/减运算的结果是否发生溢出？上述程序段中，哪些带

符号整数运算语句的执行结果会发生溢出？
]
#block(breakable: false)[\44. （12分）某计算机存储器按字节编址，虚拟（逻辑）地址空间大小为16MB，主存（物理）地址空间大小为1MB，页面大小为4KB；Cache采用直接映射方式，共8行；主存与Cache之间交换的块大小为32B。系统运行到某一时刻时，页表的部分内容和Cache的部分内容分别如题44-a图、题44-b图所示，图中页框号及标记字段的内容为十六进制形式。

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [虚页号], [有效位], [页框号], […],
    [0], [1], [06], […],
    [1], [1], [04], […],
    [2], [1], [15], […],
    [3], [1], [02], […],
    [4], [0], [一], […],
    [5], [1], [2B], […],
    [6], [0], [一], […],
    [7], [1], [32], […],
  )]
  , kind: table
  )

#block[
题44-a图 页表的部分内容

]
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [行号], [有效位], [标记], […],
    [0], [1], [020], […],
    [1], [0], [\-], […],
    [2], [1], [01D], […],
    [3], [1], [105], […],
    [4], [1], [064], […],
    [5], [1], [14D], […],
    [6], [0], [\-], […],
    [7], [1], [27A], […],
  )]
  , kind: table
  )

#block[
题44-b图 Cache的部分内容

]
请回答下列问题。

\\(1) 虚拟地址共有几位，哪几位表示虚页号？物理地址共有几位，哪几位表示页框号（物理页号）？

\\(2) 使用物理地址访问 Cache时，物理地址应划分成哪几个字段？要求说明每个字段的位数及在物理地址中的位置。

\\(3) 虚拟地址001C60H所在的页面是否在主存中？若在主存中，则该虚拟地址对应的物理地址是什么？访问该地址时是否Cache命中？要求说明理由。

\\(4) 假定为该机配置一个四路组相联的TLB共可存放8个页表项，若其当前内容（十六进制）如题44-c图所示，则此时虚拟地址024BACH所在的页面是否存在主存中？要求说明理由。

#figure(image("images/img-2.jpg"),
  caption: [题44-c图 TLB的部分内容]
)
]
#block(breakable: false)[\45. （8分）某银行提供1个服务窗口和10个供顾客等待的座位。顾客到达银行时，若有空座位，则到取号机上领取一个号，等待叫号。取号机每次仅允许一位顾客使用。当营业员空闲时，通过叫号选取一位顾客，并为其服务。顾客和营业员的活动过程描述如下：

cobegin

{

```
process 顾客 i

{

    从取号机获取一个号码；

    等待叫号；

    获取服务；

}

process 营业员
```

#image("images/img-3.jpg")

请添加必要的信号量和P、V（或wait()、signal()）操作，实现上述过程中的互斥与同步。要求写出完整的过程，说明信号量的含义并赋初值。
]
#block(breakable: false)[\46. （7分）某文件系统为一级目录结构，文件的数据一次性写入磁盘，已写入的文件不可修改，但可多次创建新文件。请回答如下问题。

\\(1) 在连续、链式、索引三种文件的数据块组织方式中，哪种更合适？要求说明理由。为定位文件数据块，需要FCB中设计哪些相关描述字段？

\\(2) 为快速找到文件，对于FCB，是集中存储好，还是与对应的文件数据块连续存储好？要求说明理由。
]
#block(breakable: false)[\47. （9分）某主机的MAC地址为00-15-C5-C1-5E-28，IP地址为10.2.128.100（私有地址）。题47-a图是网络拓扑，题47-b图是该主机进行Web请求的1个以太网数据帧前80B的十六进制及ASCII码内容。

#figure(image("images/img-4.jpg"),
  caption: [题47-a图 网络拓扑]
)

#figure(image("images/img-5.jpg"),
  caption: [题47-b图 以太网数据帧（前80B）]
)

请参考图中的数据回答以下问题。

\\(1) Web服务器的IP地址是什么？该主机的默认网关的MAC地址是什么？

\\(2) 该主机在构造题47-b图的数据帧时，使用什么协议确定目的MAC地址？封装该协议请求报文的以太网帧的目的MAC地址是什么？

\\(3) 假设 HTTP/1.1 协议以持续的非流水线方式工作，一次请求一响应时间为 RTT，rfc.html页面引用了5个JPEG小图像，则从发出题47-b图中的Web请求开始到浏览器收到全部内容为止，需要多少个RTT？

\\(4) 该帧所封装的IP分组经过路由器R转发时，需修改IP分组头中的哪些字段？

注：以太网数据帧结构和IP分组头结构分别如题47-c图、题47-d图所示。

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    [6B], [6B], [2B], [46-1500B], [4B],
    [目的MAC地址], [源MAC地址], [类型], [数据], [CRC],
  )]
  , kind: table
  )

#block[
题47-c图 以太网帧结构

]
#figure(image("images/img-6.jpg"),
  caption: [题47-d图 IP分组头结构]
)]