#set text(lang: "zh")
#import "@preview/taskize:0.2.8": tasks

= 2018年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题
== 一、单项选择题（第1\~40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项最符合试题要求）
#block(breakable: false)[\1. 若栈 $upright(S)_1$中保存整数，栈 $upright(S)_2$中保存运算符，函数 F()依次执行下述各步操作：

\\(1) 从 $S_1$中依次弹出两个操作数a和b；

\\(2) 从 $upright(S)_2$中弹出一个运算符 op;

\\(3) 执行相应的运算 b op a;

\\(4) 将运算结果压入 $upright(S)_1$中。

假定 $S_1$中的操作数依次是5,8,3,2（2在栈顶）， $S_2$中的运算符依次是 $""^(\*)$，-，+（+在栈顶）。调用3次 F()后， $S_1$栈顶保存的值是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. -15
+ B. 15
+ C. -20
+ D. 20
]
]
#block(breakable: false)[\2. 现有队列Q与栈S，初始时Q中的元素依次是1,2,3,4,5,6（1在队头），S为空。若仅允许下列3种操作： $①$出队并输出出队元素； $②$出队并将出队元素入栈； $③$出栈并输出出栈元素，则不能得到的输出序列是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1,2,5,6,4,3
+ B. 2,3,4,5,6,1
+ C. 3,4,5,6,1,2
+ D. 6,5,4,3,2,1
]
]
#block(breakable: false)[\3. 设有一个 $1 2 times 1 2$的对称矩阵 M，将其上三角部分的元素 $m_(i \, j)$ （ $1 lt.eq i lt.eq j lt.eq 1 2$ ）按行优先存入 C语言的一维数组 N中，元素 $m_(6 \, 6)$在 N中的下标是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 50
+ B. 51
+ C. 55
+ D. 66
]
]
#block(breakable: false)[\4. 设一棵非空完全二叉树T的所有叶结点均位于同一层，且每个非叶结点都有2个子结点。若T有 k个叶结点，则T的结点总数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $2 k - 1$
+ B. 2k
+ C. $k^2$
+ D. $2^k - 1$
]
]
#block(breakable: false)[\5. 已知字符集 {a,b,c,d,e,f}，若各字符出现的次数分别为6,3,8,2,10,4，则对应字符集中各字符的哈夫曼编码可能是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 00,1011,01,1010,11,100
+ B. 00,100,110,000,0010,01
+ C. 10,1011,11,0011,00,010
+ D. 0011,10,11,0010,01,000
]
]
#block(breakable: false)[\6. 已知二叉排序树如下图所示，元素之间应满足的大小关系是\_\_\_。

#image("images/img-1.jpg")

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $x_1 < x_2 < x_5$
+ B. $x_1 < x_4 < x_5$
+ C. $x_3 < x_5 < x_4$
+ D. $x_4 < x_3 < x_5$
]
]
#block(breakable: false)[\7. 下列选项中，不是如下有向图的拓扑序列的是\_\_\_。

#image("images/img-2.jpg")

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1,5,2,3,6,4
+ B. 5,1,2,6,3,4
+ C. 5,1,2,3,6,4
+ D. 5,2,1,6,3,4
]
]
#block(breakable: false)[\8. 高度为5的3阶B树含有的关键字个数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.15
+ B.31
+ C.62
+ D.242
]
]
#block(breakable: false)[\9. 现有长度为7、初始为空的散列表HT，散列函数 $H \( k \) = k % 7$ ，用线性探测再散列法解决冲突。将关键字22，43，15依次插入到HT后，查找成功的平均查找长度是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1.5
+ B. 1.6
+ C. 2
+ D. 3
]
]
#block(breakable: false)[\10. 对初始数据序列（8,3,9,11,2,1,4,7,5,10,6)进行希尔排序。若第一趟排序结果为(1,3, 7,5,2,6,4,9,11,10,8)，第二趟排序结果为(1,2,6,4,3,7,5,8,11,10,9)，则两趟排序采用的增量（间隔）依次是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 3,1
+ B. 3,2
+ C. 5,2
+ D. 5,3
]
]
#block(breakable: false)[\11. 在将数据序列（6,1,5,9,8,4,7)建成大根堆时，正确的序列变化过程是\_\_\_。

A. 6,1,7,9,8,4,5 $arrow.r$ 6,9,7,1,8,4,5 $arrow.r$ 9,6,7,1,8,4,5 $arrow.r$ 9,8,7,1,6,4,5
B. 6,9,5,1,8,4,7 $arrow.r$ 6,9,7,1,8,4,5 $arrow.r$ 9,6,7,1,8,4,5 $arrow.r$ 9,8,7,1,6,4,5
C. 6,9,5,1,8,4,7 $arrow.r$ 9,6,5,1,8,4,7 $arrow.r$ 9,6,7,1,8,4,5 $arrow.r$ 9,8,7,1,6,4,5
D. 6,1,7,9,8,4,5 $arrow.r$ 7,1,6,9,8,4,5 $arrow.r$ 7,9,6,1,8,4,5 $arrow.r$ 9,7,6,1,8,4,5 $arrow.r$ 9,8,6,1
]
#block(breakable: false)[\12. 冯·诺依曼结构计算机中数据采用二进制编码表示，其主要原因是\_\_\_。

I. 二进制的运算规则简单

II. 制造两个稳态的物理器件较容易

III. 便于用逻辑门电路实现算术运算

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅I、III
+ C. 仅II、III
+ D.I、II和III
]
]
#block(breakable: false)[\13. 假定带符号整数采用补码表示，若 int 型变量 x 和 y 的机器数分别是 FFFF FFDFH 和 0000 0041H，则 x、y的值以及 x-y的机器数分别是\_\_\_。

A. $x = - 6 5 \, y = 4 1$ ，x-y的机器数溢出
B. $x = - 3 3 \, y = 6 5$ ，x-y的机器数为 FFFF FF9DH
C. $x = - 3 3 \, y = 6 5$ ，x-y的机器数为 FFFF FF9EH
D. $x = - 6 5 \, y = 4 1$ ，x-y的机器数为 FFFF FF96H
]
#block(breakable: false)[\14. IEEE 754 单精度浮点格式表示的数中，最小的规格化正数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $1 . 0 times 2^(- 1 2 6)$
+ B. $1 . 0 times 2^(- 1 2 7)$
+ C. $1 . 0 times 2^(- 1 2 8)$
+ D. $1 . 0 times 2^(- 1 4 9)$
]
]
#block(breakable: false)[\15. 某32位计算机按字节编址，采用小端（Little Endian）方式。若语句“int i=0;”对应指令的机器代码为“C745FC00000000”，则语句“int i=-64;”对应指令的机器代码是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. C745FC C0 FF FF FF
+ B. C745FC 0C FF FF FF
+ C. C745FC FF FF FF C0
+ D. C745FC FF FF FF 0C
]
]
#block(breakable: false)[\16. 整数 x的机器数为11011000，分别对 x进行逻辑右移1位和算术右移1位操作，得到的机器数分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 11101100，11101100
+ B. 01101100，11101100
+ C. 11101100，01101100
+ D. 01101100，01101100
]
]
#block(breakable: false)[\17. 假定 DRAM 芯片中存储阵列的行数为 r、列数为 c，对于一个 $2 upright(K) times 1$位的 DRAM芯片，为保证其地址引脚数最少，并尽量减少刷新开销，则 r、c的取值分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 2048、1
+ B. 64、32
+ C. 32、64
+ D. 1、2048
]
]
#block(breakable: false)[\18. 按字节编址的计算机中，某 double 型数组 A的首地址为 2000H，使用变址寻址和循环结构访问数组 A，保存数组下标的变址寄存器初值为 0，每次循环取一个数组元素，其偏移地址为变址值乘以 sizeof(double)，取完后变址寄存器内容自动加 1。若某次循环所取元素的地址为 2100H，则进入该次循环时变址寄存器的内容是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 25
+ B. 32
+ C. 64
+ D. 100
]
]
#block(breakable: false)[\19. 减法指令“sub R1，R2，R3”的功能为“ $upright(\( R 1 \)) - upright(\( R 2 \)) arrow.r upright(R 3)$”，该指令执行后将生成进位/借位标志CF和溢出标志OF。若 $upright(\( R 1 \)) = upright(F F F F F F F H) \,$ $upright(\( R 2 \)) = upright(F F F F F F 0 H)$ ，则该减法指令执行后，CF与OF分别为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. CF=0,OF=0
+ B. CF=1,OF=0
+ C. CF=0,OF=1
+ D. CF=1,OF=1
]
]
#block(breakable: false)[\20. 若某计算机最复杂指令的执行需要完成5个子功能，分别由功能部件A～E实现，各功能部件所需时间分别为80ps、50ps、50ps、70ps和50ps，采用流水线方式执行指令，流水段寄存器延时为20ps，则CPU时钟周期至少为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 60ps
+ B. 70ps
+ C. 80ps
+ D. 100ps
]
]
#block(breakable: false)[\21. 下列选项中，可提高同步总线数据传输率的是\_\_\_。

I. 增加总线宽度 II. 提高总线工作频率

III. 支持突发传输 IV. 采用地址/数据线复用

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅I、II、III
+ C. 仅III、IV
+ D.I、II、III和IV
]
]
#block(breakable: false)[\22. 下列关于外部 I/O 中断的叙述中，正确的是\_\_\_。

A. 中断控制器按所接收中断请求的先后次序进行中断优先级排队

B. CPU 响应中断时，通过执行中断隐指令完成通用寄存器的保护

C. CPU 只有在处于中断允许状态时，才能响应外部设备的中断请求

D. 有中断请求时，CPU 立即暂停当前指令执行，转去执行中断服务程序
]
#block(breakable: false)[\23. 下列关于多任务操作系统的叙述中，正确的是\_\_\_。

I. 具有并发和并行的特点

II. 需要实现对共享资源的保护

III. 需要运行在多CPU的硬件平台上

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅Ⅰ
+ B. 仅Ⅱ
+ C. 仅Ⅰ、Ⅱ
+ D.I、Ⅱ、Ⅲ
]
]
#block(breakable: false)[\24. 某系统采用基于优先权的非抢占式进程调度策略，完成一次进程调度和进程切换的系统时间开销为 $1 mu s$ 。在 T时刻就绪队列中有3个进程 $upright(P)_1$ 、 $upright(P)_2$和 $upright(P)_3$ ，其在就绪队列中的等待时间、需要的CPU时间和优先权如下表所示。

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [进程], [等待时间], [需要的CPU时间], [优先权],
    [P1], [30μs], [12μs], [10],
    [P2], [15μs], [24μs], [30],
    [P3], [18μs], [36μs], [20],
  )]
  , kind: table
  )

若优先权值大的进程优先获得 CPU，从 T时刻起系统开始进程调度，系统的平均周转时间为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 54μs
+ B. 73μs
+ C. 74μs
+ D. 75μs
]
]
#block(breakable: false)[\25. 属于同一进程的两个线程 thread1和 thread2 并发执行，共享初值为 0 的全局变量 x。 thread1和 thread2实现对全局变量 x加1的机器级代码描述如下。

thread1
thread2
mov R1,x
\\/\/(x)→R1
mov R2,x
\\/\/(x)→R2
inc R1
\\/\/(R1)+1→R1
inc R2
\\/\/(R2)+1→R2
mov x,R1
\\/\/(R1)→x
mov x,R2
\\/\/(R2)→x
在所有可能的指令执行序列中，使 x的值为2的序列个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.1
+ B.2
+ C.3
+ D.4
]
]
#block(breakable: false)[\26. 假设系统中有4个同类资源，进程 $upright(P)_1 \, upright(P)_2$和 $upright(P)_3$需要的资源数分别为4,3和1， $upright(P)_1 \, upright(P)_2$和 $upright(P)_3$已申请到的资源数分别为2,1和0，则执行安全性检测算法的结果是\_\_\_。

A. 不存在安全序列，系统处于不安全状态
B. 存在多个安全序列，系统处于安全状态
C. 存在唯一安全序列 $upright(P)_3 \, upright(P)_1 \, upright(P)_2$，系统处于安全状态
D. 存在唯一安全序列 $upright(P)_3 \, upright(P)_2 \, upright(P)_1$，系统处于安全状态
]
#block(breakable: false)[\27. 下列选项中，可能导致当前进程 P 阻塞的事件是\_\_\_。

I. 进程 P 申请临界资源

II. 进程 P 从磁盘读数据

III. 系统将 CPU 分配给高优先权的进程

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅 I
+ B. 仅 II
+ C. 仅 I、II
+ D. I、II、III
]
]
#block(breakable: false)[\28. 若 x是管程内的条件变量，则当进程执行 x.wait()时所做的工作是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 实现对变量 x的互斥访问
+ B. 唤醒一个在 x上阻塞的进程
+ C. 根据 x的值判断该进程是否进入阻塞状态
+ D. 阻塞该进程，并将之插入 x的阻塞队列中
]
]
#block(breakable: false)[\29. 当定时器产生时钟中断后，由时钟中断服务程序更新的部分内容是\_\_\_。

I. 内核中时钟变量的值

II. 当前进程占用CPU的时间

III. 当前进程在时间片内的剩余执行时间

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅II、III
+ C. 仅I、III
+ D. I、II、III
]
]
#block(breakable: false)[\30. 系统总是访问磁盘的某个磁道而不响应对其他磁道的访问请求，这种现象称为磁臂黏着。下列磁盘调度算法中，不会导致磁臂黏着的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 先来先服务（FCFS）
+ B. 最短寻道时间优先（SSTF）
+ C. 扫描算法（SCAN）
+ D. 循环扫描算法（CSCAN）
]
]
#block(breakable: false)[\31. 下列优化方法中，可以提高文件访问速度的是\_\_\_。

I. 提前读 II. 为文件分配连续的簇

III. 延迟写 IV. 采用磁盘高速缓存

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅II、III
+ C. 仅I、III、IV
+ D. I、II、III、IV
]
]
#block(breakable: false)[\32. 下列同步机制中，可以实现让权等待的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. Peterson方法
+ B. swap指令
+ C. 信号量方法
+ D. TestAndSet指令
]
]
#block(breakable: false)[\33. 下列 TCP/ P 应用层协议中，可以使用传输层无连接服务的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. FTP
+ B. DNS
+ C. SMTP
+ D. HTTP
]
]
#block(breakable: false)[\34. 下列选项中，不属于物理层接口规范定义范畴的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 接口形状
+ B. 引脚功能
+ C. 物理地址
+ D. 信号电平
]
]
#block(breakable: false)[\35. IEEE 802.11 无线局域网的 MAC 协议 CSMA/CA 进行信道预约的方法是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 发送确认帧
+ B. 采用二进制指数退避
+ C. 使用多个 MAC 地址
+ D. 交换 RTS 与 CTS 帧
]
]
#block(breakable: false)[\36. 主机甲采用停-等协议向主机乙发送数据，数据传输速率是 3kbps，单向传播延时是 200ms，忽略确认帧的传输延时。当信道利用率等于 40%时，数据帧的长度为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 240比特
+ B. 400比特
+ C. 480比特
+ D. 800比特
]
]
#block(breakable: false)[\37. 路由器 R 通过以太网交换机 S1 和 S2 连接两个网络，R 的接口、主机 H1 和 H2 的 IP 地址与 MAC 地址如下图所示。若 H1 向 H2 发送 1 个 IP 分组 P，则 H1 发出的封装 P 的以太网帧的目的 MAC 地址、H2 收到的封装 P 的以太网帧的源 MAC 地址分别是\_\_\_。

#image("images/img-3.jpg")

192.168.3.2

00-1a-2b-3c-4d-52

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 00-a1-b2-c3-d4-62, 00-1a-2b-3c-4d-52
+ B. 00-a1-b2-c3-d4-62, 00-a1-b2-c3-d4-61
+ C. 00-1a-2b-3c-4d-51, 00-1a-2b-3c-4d-52
+ D. 00-1a-2b-3c-4d-51, 00-a1-b2-c3-d4-61
]
]
#block(breakable: false)[\38. 某路由表中有转发接口相同的4条路由表项，其目的网络地址分别为35.230.32.0/21， 35.230.40.0/21，35.230.48.0/21和35.230.56.0/21，将该4条路由聚合后的目的网络地址为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 35.230.0.0/19
+ B. 35.230.0.0/20
+ C. 35.230.32.0/19
+ D. 35.230.32.0/20
]
]
#block(breakable: false)[\39. UDP协议实现分用（demultiplexing）时所依据的头部字段是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 源端口号
+ B. 目的端口号
+ C. 长度
+ D. 校验和
]
]
#block(breakable: false)[\40. 无须转换即可由 SMTP 协议直接传输的内容是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. JPEG 图像
+ B. MPEG 视频
+ C. EXE 文件
+ D. ASCII 文本
]
]
== 二、综合应用题（第41～47小题，共70分）
#block(breakable: false)[\41. （13分）给定一个含 n（ $n gt.eq 1$ ）个整数的数组，请设计一个在时间上尽可能高效的算法，找出数组中未出现的最小正整数。例如，数组 ${ - 5 \, 3 \, 2 \, 3 }$ 中未出现的最小正整数是1；数组 ${ 1 \, 2 \, 3 }$ 中未出现的最小正整数是4。要求：

\\(1) 给出算法的基本设计思想。

\\(2) 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。

\\(3) 说明你所设计算法的时间复杂度和空间复杂度。
]
#block(breakable: false)[\42. （12分）拟建设一个光通信骨干网络连通BJ、CS、XA、QD、JN、NJ、TL和WH等 8个城市，题42图中无向边上的权值表示两个城市间备选光纤的铺设费用。

#figure(image("images/img-4.jpg"),
  caption: [题42图]
)

请回答下列问题。

\\(1) 仅从铺设费用角度出发，给出所有可能的最经济的光纤铺设方案（用带权图表示），并计算相应方案的总费用。

\\(2) 题42图可采用图的哪种存储结构？给出求解问题（1）所使用的算法名称。

\\(3) 假设每个城市采用一个路由器按（1）中得到的最经济方案组网，主机H1直接连接在 TL的路由器上，主机H2直接连接在BJ的路由器上。若H1向H2发送一个TTL=5的IP分组，则H2是否可以收到该IP分组？
]
#block(breakable: false)[\43. （8分）假定计算机的主频为 500MHz，CPI为4。现有设备A和B，其数据传输率分别为2MB/s和40MB/s，对应I/O接口中各有一个32位数据缓冲寄存器。请回答下列问题，要求给出计算过程。

\\(1) 若设备A采用定时查询I/O方式，每次输入/输出都至少执行10条指令。设备A最多间隔多长时间查询一次才能不丢失数据？CPU用于设备A输入/输出的时间占CPU总时间的百分比至少是多少？

\\(2) 在中断 I/O方式下，若每次中断响应和中断处理的总时钟周期数至少为400，则设备B能否采用中断 I/O方式？为什么？

\\(3) 若设备B采用DMA方式，每次DMA传送的数据块大小为1000B，CPU用于DMA预处理和后处理的总时钟周期数为500，则CPU用于设备B输入/输出的时间占CPU总时间的百分比最多是多少？
]
#block(breakable: false)[\44. （15分）某计算机采用页式虚拟存储管理方式，按字节编址。CPU进行存储访问的过程如题44图所示。

根据题44图回答下列问题。

\\(1) 主存物理地址占多少位？

\\(2) TLB采用什么映射方式？TLB是用SRAM还是用DRAM实现？

\\(3) Cache采用什么映射方式？若 Cache采用LRU替换算法和回写（Write Back）策略，则 Cache每行中除数据（Data）、Tag和有效位外，还应有哪些附加位？Cache的总容量是多少？ Cache中有效位的作用是什么？

\\(4) 若CPU给出的虚拟地址为0008C040H，则对应的物理地址是多少？是否在Cache中命中？说明理由。若CPU给出的虚拟地址为0007C260H，则该地址所在主存块映射到的Cache组号是多少？

#figure(image("images/img-5.jpg"),
  caption: [题44图]
)
]
#block(breakable: false)[\45. （8分）请根据题44图给出的虚拟存储管理方式，回答下列问题。

\\(1) 某虚拟地址对应的页目录号为6，在相应的页表中对应的页号为6，页内偏移量为8，该虚拟地址的十六进制表示是什么？

\\(2) 寄存器PDBR用于保存当前进程的页目录起始地址，该地址是物理地址还是虚拟地址？进程切换时，PDBR的内容是否会变化？说明理由。同一进程的线程切换时，PDBR的内容是否会变化？说明理由。

\\(3) 为了支持改进型 CLOCK置换算法，需要在页表项中设置哪些字段？
]
#block(breakable: false)[\46. （7分）某文件系统采用索引节点存放文件的属性和地址信息，簇大小为4KB。每个文件索引节点占64B，有11个地址项，其中直接地址项8个，一级、二级和三级间接地址项各1个，每个地址项长度为4B。请回答下列问题。

\\(1) 该文件系统能支持的最大文件长度是多少？（给出计算表达式即可。）

\\(2) 文件系统用 $1 upright(M)$ （ $1 upright(M) = 2^(2 0)$ ）个簇存放文件索引节点，用512M个簇存放文件数据。若一个图像文件的大小为5600B，则该文件系统最多能存放多少个图像文件？

\\(3) 若文件 F1的大小为6KB，文件 F2的大小为40KB，则该文系统获取 F1和F2最后一个簇的簇号需要的时间是否相同？为什么？
]
#block(breakable: false)[\47. （7分）某公司的网络如题47图所示。IP地址空间192.168.1.0/24被均分给销售部和技术部两个子网，并已分别为部分主机和路由器接口分配了IP地址，销售部子网的 MTU = 1500B，技术部子网的 MTU=800B。

请回答下列问题。

\\(1) 销售部子网的广播地址是什么？技术部子网的子网地址是什么？若每个主机仅分配一个IP地址，则技术部子网还可以连接多少台主机？

#figure(image("images/img-6.jpg"),
  caption: [题47图]
)

\\(2) 假设主机192.168.1.1向主机192.168.1.208发送一个总长度为1500B的IP分组，IP分组的头部长度为20B，路由器在通过接口F1转发该IP分组时进行了分片。若分片时尽可能分为最大片，则一个最大IP分片封装数据的字节数是多少？至少需要分为几个分片？每个分片的片偏移量是多少？]