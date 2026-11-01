// 来源：内容来源/2020a -- 教育部考试中心编…isbn13 9787040520217…Anna’s Archive.pdf
// 试题：书内第36～47页（PDF第42～53页），人工逐页录入；图表在题内重绘。
#import "../../template.typ": exam, choices, subquestions, statements
#show: exam.with(year: 2018, subject: "计算机学科专业基础", code: "408")
#set document(title: "2018年全国硕士研究生招生考试计算机科学与技术学科联考计算机学科专业基础综合试题")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz
#answer-state.update(false)

= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项符合试题要求。

#question[
若栈 $S_1$ 中保存整数，栈 $S_2$ 中保存运算符，函数 F() 依次执行下述各步操作：

#subquestions[
+ 从 $S_1$ 中依次弹出两个操作数 $a$ 和 $b$；
+ 从 $S_2$ 中弹出一个运算符 op；
+ 执行相应的运算 $b$ op $a$；
+ 将运算结果压入 $S_1$ 中。
  
  假定 $S_1$ 中的操作数依次是5，8，3，2（2在栈顶），$S_2$ 中的运算符依次是 $ast$，$-$，$+$（$+$ 在栈顶）。调用3次 F() 后，$S_1$ 栈顶保存的值是
  
  #choices([$-15$], [15], [$-20$], [20])

]
]

#question[
现有队列 Q 与栈 S，初始时 Q 中的元素依次是1，2，3，4，5，6（1在队头），S 为空。若仅允许下列3种操作：① 出队并输出出队元素；② 出队并将出队元素入栈；③ 出栈并输出出栈元素，则不能得到的输出序列是

#choices([1, 2, 5, 6, 4, 3], [2, 3, 4, 5, 6, 1], [3, 4, 5, 6, 1, 2], [6, 5, 4, 3, 2, 1])
]

#question[
设有一个 $12 times 12$ 的对称矩阵 $M$，将其上三角部分的元素 $m_(i,j)$（$1 <= i <= j <= 12$）按行优先存入 C 语言的一维数组 N 中，元素 $m_(6,6)$ 在 N 中的下标是

#choices([50], [51], [55], [66])
]

#question[
设一棵非空完全二叉树 $T$ 的所有叶结点均位于同一层，且每个非叶结点都有2个子结点。若 $T$ 有 $k$ 个叶结点，则 $T$ 的结点总数是

#choices([$2k-1$], [$2k$], [$k^2$], [$2^k-1$])
]

#question[
已知字符集 $\{a,b,c,d,e,f\}$，若各字符出现的次数分别为6，3，8，2，10，4，则对应字符集中各字符的哈夫曼编码可能是

#choices(
  [00, 1011, 01, 1010, 11, 100],
  [00, 100, 110, 000, 0010, 01],
  [10, 1011, 11, 0011, 00, 010],
  [0011, 10, 11, 0010, 01, 000],
)
]

#question[
已知二叉排序树如下图所示，元素之间应满足的大小关系是

#align(center, diagram(
  node-stroke: 0.055em, edge-stroke: 0.055em, node-inset: 0pt,
  node((0em, 0em), text(size:0.85em)[$x_1$], radius: 0.78em),
  node((6.7em, -1.77em), text(size:0.85em)[$x_2$], radius: 0.78em),
  node((3.2em, -3.4em), text(size:0.85em)[$x_3$], radius: 0.78em),
  node((5.23em, -5.45em), text(size:0.85em)[$x_4$], radius: 0.78em),
  node((3.61em, -7.5em), text(size:0.85em)[$x_5$], radius: 0.78em),
  edge((0em, 0em), (6.7em, -1.77em)), edge((6.7em, -1.77em), (3.2em, -3.4em)),
  edge((3.2em, -3.4em), (5.23em, -5.45em)), edge((5.23em, -5.45em), (3.61em, -7.5em)),
))

#choices([$x_1 < x_2 < x_5$], [$x_1 < x_4 < x_5$], [$x_3 < x_5 < x_4$], [$x_4 < x_3 < x_5$])
]

#question[
下列选项中，不是如下有向图的拓扑序列的是

#align(center, diagram(
  node-stroke: 0.055em, edge-stroke: 0.055em, node-inset: 0pt,
  node((0em, 0em), text(size: 0.85em)[1], radius: 0.76em), node((6.94em, 0em), text(size: 0.85em)[3], radius: 0.76em),
  node((3.39em, -2.35em), text(size: 0.85em)[2], radius: 0.76em), node((10.32em, -2.35em), text(size: 0.85em)[4], radius: 0.76em),
  node((0em, -4.61em), text(size: 0.85em)[5], radius: 0.76em), node((6.94em, -4.61em), text(size: 0.85em)[6], radius: 0.76em),
  edge((0em, 0em), (6.94em, 0em), "-|>"), edge((0em, 0em), (3.39em, -2.35em), "-|>"),
  edge((0em, -4.61em), (3.39em, -2.35em), "-|>"), edge((3.39em, -2.35em), (6.94em, 0em), "-|>"),
  edge((3.39em, -2.35em), (6.94em, -4.61em), "-|>"), edge((6.94em, 0em), (10.32em, -2.35em), "-|>"),
  edge((0em, -4.61em), (10.32em, -2.35em), "-|>"), edge((6.94em, -4.61em), (10.32em, -2.35em), "-|>"),
))

#choices([1, 5, 2, 3, 6, 4], [5, 1, 2, 6, 3, 4], [5, 1, 2, 3, 6, 4], [5, 2, 1, 6, 3, 4])
]

#question[
高度为5的3阶 B 树含有的关键字个数至少是

#choices([15], [31], [62], [242])
]

#question[
现有长度为7、初始为空的散列表 HT，散列函数 $H(k) = k % 7$，用线性探测再散列法解决冲突。将关键字22，43，15依次插入到 HT 后，查找成功的平均查找长度是

#choices([1.5], [1.6], [2], [3])
]

#question[
对初始数据序列（8，3，9，11，2，1，4，7，5，10，6）进行希尔排序。若第一趟排序结果为（1，3，7，5，2，6，4，9，11，10，8），第二趟排序结果为（1，2，6，4，3，7，5，8，11，10，9），则两趟排序采用的增量（间隔）依次是

#choices([3，1], [3，2], [5，2], [5，3])
]

#question[
在将数据序列（6，1，5，9，8，4，7）建成大根堆时，正确的序列变化过程是

#choices(
  [6, 1, 7, 9, 8, 4, 5 → 6, 9, 7, 1, 8, 4, 5 → 9, 6, 7, 1, 8, 4, 5 → 9, 8, 7, 1, 6, 4, 5],
  [6, 9, 5, 1, 8, 4, 7 → 6, 9, 7, 1, 8, 4, 5 → 9, 6, 7, 1, 8, 4, 5 → 9, 8, 7, 1, 6, 4, 5],
  [6, 9, 5, 1, 8, 4, 7 → 9, 6, 5, 1, 8, 4, 7 → 9, 6, 7, 1, 8, 4, 5 → 9, 8, 7, 1, 6, 4, 5],
  [6, 1, 7, 9, 8, 4, 5 → 7, 1, 6, 9, 8, 4, 5 → 7, 9, 6, 1, 8, 4, 5 → 9, 7, 6, 1, 8, 4, 5 → 9, 8, 6, 1, 7, 4, 5],
)
]

#question[
冯·诺依曼结构计算机中数据采用二进制编码表示，其主要原因是

Ⅰ．二进制的运算规则简单 \
Ⅱ．制造两个稳态的物理器件较容易 \
Ⅲ．便于用逻辑门电路实现算术运算

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ和Ⅲ])
]

#question[
假定带符号整数采用补码表示，若 int 型变量 $x$ 和 $y$ 的机器数分别是 FFFF FFDFH 和 0000 0041H，则 $x$、$y$ 的值以及 $x-y$ 的机器数分别是

#choices(
  [$x=-65$，$y=41$，$x-y$ 的机器数溢出],
  [$x=-33$，$y=65$，$x-y$ 的机器数为 FFFF FF9DH],
  [$x=-33$，$y=65$，$x-y$ 的机器数为 FFFF FF9EH],
  [$x=-65$，$y=41$，$x-y$ 的机器数为 FFFF FF96H],
)
]

#question[
IEEE 754 单精度浮点格式表示的数中，最小的规格化正数是

#choices([$1.0 times 2^(-126)$], [$1.0 times 2^(-127)$], [$1.0 times 2^(-128)$], [$1.0 times 2^(-149)$])
]

#question[
某32位计算机按字节编址，采用小端（Little Endian）方式。若语句“`int i = 0;`”对应指令的机器代码为“C7 45 FC 00 00 00 00”，则语句“`int i = -64;`”对应指令的机器代码是

#choices([C7 45 FC C0 FF FF FF], [C7 45 FC 0C FF FF FF], [C7 45 FC FF FF FF C0], [C7 45 FC FF FF FF 0C])
]

#question[
整数 $x$ 的机器数为1101 1000，分别对 $x$ 进行逻辑右移1位和算术右移1位操作，得到的机器数各是

#choices([1110 1100，1110 1100], [0110 1100，1110 1100], [1110 1100，0110 1100], [0110 1100，0110 1100])
]

#question[
假定 DRAM 芯片中存储阵列的行数为 $r$、列数为 $c$，对于一个 $2 "K" times 1$ 位的 DRAM 芯片，为保证其地址引脚数最少，并尽量减少刷新开销，则 $r$、$c$ 的取值分别是

#choices([2048，1], [64，32], [32，64], [1，2048])
]

#question[
按字节编址的计算机中，某 double 型数组 A 的首地址为2000H，使用变址寻址和循环结构访问数组 A，保存数组下标的变址寄存器初值为0，每次循环取一个数组元素，其偏移地址为变址值乘以 sizeof(double)，取完后变址寄存器内容自动加1。若某次循环所取元素的地址为2100H，则进入该次循环时变址寄存器的内容是

#choices([25], [32], [64], [100])
]

#question[
减法指令“`sub R1, R2, R3`”的功能为“（R1）-（R2）→R3”，该指令执行后将生成进位/借位标志 CF 和溢出标志 OF。若（R1）=FFFF FFFFH，（R2）=FFFF FFF0H，则该减法指令执行后，CF 与 OF 分别为

#choices([CF=0，OF=0], [CF=1，OF=0], [CF=0，OF=1], [CF=1，OF=1])
]

#question[
若某计算机最复杂指令的执行需要完成5个子功能，分别由功能部件 A～E 实现，各功能部件所需时间分别为80 ps、50 ps、50 ps、70 ps 和50 ps，采用流水线方式执行指令，流水段寄存器延时为20 ps，则 CPU 时钟周期至少为

#choices([60 ps], [70 ps], [80 ps], [100 ps])
]

#question[
下列选项中，可提高同步总线数据传输率的是

#statements(columns: (1fr, 1fr), [Ⅰ．增加总线宽度], [Ⅱ．提高总线工作频率],
  [Ⅲ．支持突发传输], [Ⅳ．采用地址/数据线复用],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ和Ⅳ])
]

#question[
下列关于外部 I/O 中断的叙述中，正确的是

#choices(
  [中断控制器按所接收中断请求的先后次序进行中断优先级排队],
  [CPU 响应中断时，通过执行中断隐指令完成通用寄存器的保护],
  [CPU 只有在处于中断允许状态时，才能响应外部设备的中断请求],
  [有中断请求时，CPU 立即暂停当前指令执行，转去执行中断服务程序],
)
]

#question[
下列关于多任务操作系统的叙述中，正确的是

Ⅰ．具有并发和并行的特点 \
Ⅱ．需要实现对共享资源的保护 \
Ⅲ．需要运行在多 CPU 的硬件平台上

#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ、Ⅲ])
]

#question[
某系统采用基于优先权的非抢占式进程调度策略，完成一次进程调度和进程切换的系统时间开销为1 μs。在 $T$ 时刻就绪队列中有3个进程 $P_1$、$P_2$ 和 $P_3$，其在就绪队列中的等待时间、需要的 CPU 时间和优先权如下表所示。

#table(
  columns: (0.7fr, 1fr, 1.2fr, 0.8fr), align: center + horizon,
  [进程], [等待时间], [需要的 CPU 时间], [优先权],
  [$P_1$], [30 μs], [12 μs], [10],
  [$P_2$], [15 μs], [24 μs], [30],
  [$P_3$], [18 μs], [36 μs], [20],
)

若优先权值大的进程优先获得 CPU，从 $T$ 时刻起系统开始进程调度，则系统的平均周转时间为

#choices([54 μs], [73 μs], [74 μs], [75 μs])
]

#question[
属于同一进程的两个线程 thread1 和 thread2 并发执行，共享初值为0的全局变量 $x$。thread1 和 thread2 实现对全局变量 $x$ 加1的机器级代码描述如下。

#table(
  columns: (1fr, 1fr), align: left + top,
  table.cell(align: center)[thread1], table.cell(align: center)[thread2],
  [```asm
mov R1, x    // (x)→R1
inc R1       // (R1)+1→R1
mov x, R1    // (R1)→x
```],
  [```asm
mov R2, x    // (x)→R2
inc R2       // (R2)+1→R2
mov x, R2    // (R2)→x
```],
)

在所有可能的指令执行序列中，使 $x$ 的值为2的序列个数是

#choices([1], [2], [3], [4])
]

#question[
假设系统中有4个同类资源，进程 $P_1$、$P_2$ 和 $P_3$ 需要的资源数分别为4、3和1，$P_1$、$P_2$ 和 $P_3$ 已申请到的资源数分别为2、1和0，则执行安全性检测算法的结果是

#choices(
  [不存在安全序列，系统处于不安全状态],
  [存在多个安全序列，系统处于安全状态],
  [存在唯一安全序列 $P_3$、$P_1$、$P_2$，系统处于安全状态],
  [存在唯一安全序列 $P_3$、$P_2$、$P_1$，系统处于安全状态],
)
]

#question[
下列选项中，可能导致当前进程 P 阻塞的事件是

Ⅰ．进程 P 申请临界资源 \
Ⅱ．进程 P 从磁盘读数据 \
Ⅲ．系统将 CPU 分配给高优先权的进程

#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ、Ⅲ])
]

#question[
若 $x$ 是管程内的条件变量，则当进程执行 x.wait() 时所做的工作是

#choices(
  [实现对变量 $x$ 的互斥访问],
  [唤醒一个在 $x$ 上阻塞的进程],
  [根据 $x$ 的值判断该进程是否进入阻塞状态],
  [阻塞该进程，并将之插入 $x$ 的阻塞队列中],
)
]

#question[
当定时器产生时钟中断后，由时钟中断服务程序更新的部分内容是

Ⅰ．内核中时钟变量的值 \
Ⅱ．当前进程占用 CPU 的时间 \
Ⅲ．当前进程在时间片内的剩余执行时间

#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]

#question[
系统总是访问磁盘的某个磁道而不响应对其他磁道的访问请求，这种现象称为磁臂黏着。下列磁盘调度算法中，不会导致磁臂黏着的是

#choices([先来先服务（FCFS）], [最短寻道时间优先（SSTF）], [扫描算法（SCAN）], [循环扫描算法（CSCAN）])
]

#question[
下列优化方法中，可以提高文件访问速度的是

#statements(columns: (1fr, 1fr), [Ⅰ．提前读], [Ⅱ．为文件分配连续的簇],
  [Ⅲ．延迟写], [Ⅳ．采用磁盘高速缓存],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]

#question[
在下列同步机制中，可以实现让权等待的是

#choices([Peterson 方法], [swap 指令], [信号量方法], [TestAndSet 指令])
]

#question[
下列 TCP/IP 应用层协议中，可以使用传输层无连接服务的是

#choices([FTP], [DNS], [SMTP], [HTTP])
]

#question[
下列选项中，不属于物理层接口规范定义范畴的是

#choices([接口形状], [引脚功能], [物理地址], [信号电平])
]

#question[
IEEE 802.11 无线局域网的 MAC 协议 CSMA/CA 进行信道预约的方法是

#choices([发送确认帧], [采用二进制指数退避], [使用多个 MAC 地址], [交换 RTS 与 CTS 帧])
]

#question[
主机甲采用停-等协议向主机乙发送数据，数据传输速率是3 kbps，单向传播延时是200 ms，忽略确认帧的传输延时。当信道利用率等于40%时，数据帧的长度为

#choices([240比特], [400比特], [480比特], [800比特])
]

#question[
路由器 R 通过以太网交换机 S1 和 S2 连接两个网络，R 的接口、主机 H1 和 H2 的 IP 地址与 MAC 地址如下图所示。若 H1 向 H2 发送1个 IP 分组 P，则 H1 发出的封装 P 的以太网帧的目的 MAC 地址、H2 收到的封装 P 的以太网帧的源 MAC 地址分别是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.06em)
  line((3, 6.5), (29, 6.5))
  line((3, 6.5), (3, 1.6))
  line((29, 6.5), (29, 1.6))
  let switch(x) = {
    line((x - 1.7, 6.7), (x, 5.7), (x, 4.65), (x - 1.7, 5.65), close: true, fill: luma(92%))
    line((x, 5.7), (x + 1.7, 6.7), (x + 1.7, 5.65), (x, 4.65), close: true, fill: luma(86%))
    line((x - 1.7, 6.7), (x, 7.65), (x + 1.7, 6.7), (x, 5.7), close: true, fill: white)
    for (a, b) in (((x - 1, 6.8), (x, 6.2)), ((x - 0.1, 7.2), (x + 1, 6.55)),
      ((x - 0.9, 6.2), (x + 0.1, 6.8)), ((x, 5.95), (x + 1.05, 6.55))) {
      line(a, b, stroke: 0.10em, mark: (end: ">", fill: black, scale: 0.7))
    }
  }
  switch(3)
  switch(29)
  merge-path({
    line((14.4, 6.7), (14.4, 5.2))
    bezier((14.4, 5.2), (17.6, 5.2), (14.4, 4.3), (17.6, 4.3))
    line((17.6, 5.2), (17.6, 6.7))
  }, close: true, fill: white)
  circle((16, 6.7), radius: (1.6, 0.9), fill: white)
  for (a, b) in (((15, 7.15), (16, 6.65)), ((16.1, 6.7), (17.1, 7.2)),
    ((17.1, 6.3), (16.1, 6.8)), ((16, 6.7), (15, 6.2))) {
    line(a, b, stroke: 0.13em, mark: (end: ">", fill: black, scale: 0.7))
  }
  content((16, 5.4), [R])
  for x in (3, 29) {
    rect((x - 1.05, 0.9), (x + 1.05, 2.65), fill: white)
    rect((x - 0.83, 1.15), (x + 0.83, 2.42))
    rect((x - 0.4, 0.55), (x + 0.4, 0.9), fill: white)
    line((x - 1.25, 0.55), (x + 1.25, 0.55), (x + 1.5, 0.05), (x - 1.5, 0.05), close: true, fill: luma(90%))
    for y in (0.17, 0.30, 0.43) { line((x - 1.1, y), (x + 1.1, y), stroke: 0.035em) }
  }
  content((0.5, 7.5), [S1])
  content((31.4, 7.5), [S2])
  content((0.75, 1.7), [H1])
  content((26.75, 1.7), [H2])
  content((14.05, 7.25), text(size: 0.85em)[192.168.3.1], anchor: "east")
  content((14.05, 5.8), text(size: 0.85em)[00-1a-2b-3c-4d-51], anchor: "east")
  content((17.95, 7.25), text(size: 0.85em)[192.168.4.1], anchor: "west")
  content((17.95, 5.8), text(size: 0.85em)[00-a1-b2-c3-d4-61], anchor: "west")
  content((3, -0.65), text(size: 0.85em)[192.168.3.2])
  content((3, -1.7), text(size: 0.85em)[00-1a-2b-3c-4d-52])
  content((29, -0.65), text(size: 0.85em)[192.168.4.2])
  content((29, -1.7), text(size: 0.85em)[00-a1-b2-c3-d4-62])
}))

#choices(
  [00-a1-b2-c3-d4-62，00-1a-2b-3c-4d-52],
  [00-a1-b2-c3-d4-62，00-a1-b2-c3-d4-61],
  [00-1a-2b-3c-4d-51，00-1a-2b-3c-4d-52],
  [00-1a-2b-3c-4d-51，00-a1-b2-c3-d4-61],
)
]

#question[
某路由表中有转发接口相同的4条路由表项，其目的网络地址分别为35.230.32.0/21、35.230.40.0/21、35.230.48.0/21和35.230.56.0/21，将该4条路由聚合后的目的网络地址为

#choices([35.230.0.0/19], [35.230.0.0/20], [35.230.32.0/19], [35.230.32.0/20])
]

#question[
UDP 协议实现分用（demultiplexing）时所依据的头部字段是

#choices([源端口号], [目的端口号], [长度], [校验和])
]

#question[
无须转换即可由 SMTP 协议直接传输的内容是

#choices([JPEG 图像], [MPEG 视频], [EXE 文件], [ASCII 文本])
]

= 二、综合应用题：41～47小题，共70分。

#question[
（13分）给定一个含 $n (n >= 1)$ 个整数的数组，请设计一个在时间上尽可能高效的算法，找出数组中未出现的最小正整数。例如，数组 $\{-5,3,2,3\}$ 中未出现的最小正整数是1；数组 $\{1,2,3\}$ 中未出现的最小正整数是4。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。
+ 说明你所设计算法的时间复杂度和空间复杂度。

]
]

#question[
（12分）拟建设一个光通信骨干网连接 BJ、CS、XA、QD、JN、NJ、TL 和 WH 等8个城市，题42图中无向边上的权值表示两个城市间备选光缆的铺设费用。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em, content: (wrap: body => box(text(size: 0.8em, top-edge: "bounds", bottom-edge: "bounds", body))))
    let positions = ((0, 10), (6, 10), (12, 10), (0, 5), (12, 5), (0, 0), (6, 0), (12, 0))
    for (a, b, w, p) in ((0, 1, 2, (3, 10.65)), (1, 2, 3, (9, 10.65)),
      (0, 3, 2, (-0.8, 7.5)), (2, 4, 2, (12.8, 7.5)), (3, 5, 4, (-0.8, 2.5)),
      (4, 7, 3, (12.8, 2.5)), (5, 6, 3, (3, -0.7)), (6, 7, 2, (9, -0.7)),
      (3, 1, 3, (3.25, 6.7)), (1, 4, 4, (8.3, 6.9)),
      (3, 6, 3, (2.2, 2.6)), (6, 4, 2, (9.3, 1.9))) {
      line(positions.at(a), positions.at(b))
      content(p, str(w))
    }
    for (i, body) in ([XA], [BJ], [TL], [WH], [JN], [CS], [QD], [NJ]).enumerate() {
      circle(positions.at(i), radius: (1.05, 0.8), fill: white)
      content(positions.at(i), body)
    }
  }),
  caption: [题42图], numbering: none,
)

请回答下列问题：

#subquestions[
+ 仅从铺设费用角度出发，给出所有可能的最经济的光缆铺设方案（用带权图表示），并计算相应方案的总费用。
+ 题42图可采用图的哪一种存储结构？给出求解问题（1）所使用的算法名称。
+ 假设每个城市采用一个路由器按（1）中得到的最经济方案组网，主机 H1 直接连接在 TL 的路由器上，主机 H2 直接连接在 BJ 的路由器上。若 H1 向 H2 发送一个 TTL=5 的 IP 分组，则 H2 是否可以收到该 IP 分组？

]
]

#question[
（8分）假定计算机的主频为500 MHz，CPI 为4。现有设备 A 和 B，其数据传输率分别为2 MB/s 和40 MB/s，对应 I/O 接口中各有一个32位数据缓冲寄存器。请回答下列问题，要求给出计算过程。

#subquestions[
+ 若设备 A 采用定时查询 I/O 方式，每次输入/输出都至少执行10条指令。设备 A 最多间隔多长时间查询一次才能不丢失数据？CPU 用于设备 A 输入/输出的时间占 CPU 总时间的百分比至少是多少？
+ 在中断 I/O 方式下，若每次中断响应和中断处理的总时钟周期数至少为400，则设备 B 能否采用中断 I/O 方式？为什么？
+ 若设备 B 采用 DMA 方式，每次 DMA 传送的数据块大小为1000 B，CPU 用于 DMA 预处理和后处理的总时钟周期数为500，则 CPU 用于设备 B 输入/输出的时间占 CPU 总时间的百分比最多是多少？

]
]

#question[
（15分）某计算机采用页式虚拟存储管理方式，按字节编址。CPU 进行存储访问的过程如题44图所示。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    let p(x, y) = ((x - 35) / 30, (1310 - y) / 30)
    let wire(..pts, arrow: true, both: false) = line(..pts.pos().map(q => p(..q)), stroke: 0.045em,
      mark: if arrow { (start: if both { "<" } else { none }, end: ">", fill: black, scale: 0.55) } else { none })
    let label(x, y, body) = content(p(x, y), text(size: 0.72em)[#body])
    let unit(x1, y1, x2, y2, body, fill: white) = {
      rect(p(x1, y1), p(x2, y2), fill: fill, stroke: 0.045em)
      label((x1 + x2) / 2, (y1 + y2) / 2, body)
    }
    rect(p(39, 781), p(468, 1027), stroke: (thickness: 0.07em, dash: "dashed"))
    rect(p(527, 637), p(1104, 1060), stroke: (thickness: 0.07em, dash: "dashed"))
    label(65, 806, [TLB])
    label(578, 704, [Cache])
    wire((220, 681), (220, 716))
    wire((98, 748), (98, 1067), (139, 1067), (139, 1093))
    wire((303, 748), (303, 764), (490, 764), (490, 1077))
    wire((398, 991), (398, 1077))
    wire((552, 1094), (655, 1094))
    wire((97, 1127), (97, 1218), (128, 1218))
    wire((191, 1127), (191, 1146), (336, 1146), (336, 1198), (369, 1198))
    wire((270, 1218), (320, 1218), (320, 1270), (369, 1270))
    wire((102, 1273), (128, 1273))
    wire((508, 1198), (548, 1198), (548, 1136), (398, 1136), (398, 1110))
    wire((720, 1077), (720, 1050), (545, 1050), (545, 866), (728, 866), (728, 822), (697, 822))
    wire((545, 866), (927, 866), (927, 822), (944, 822))
    wire((819, 1077), (819, 962), (793, 962))
    wire((819, 962), (846, 962))
    wire((681, 879), (681, 838))
    wire((960, 879), (960, 838))
    wire((617, 879), (617, 805), (665, 805), (665, 788))
    wire((1040, 879), (1040, 805), (975, 805), (975, 788))
    wire((681, 806), (681, 788))
    wire((960, 806), (960, 788))
    wire((675, 750), (675, 734), (768, 734))
    wire((968, 750), (968, 734), (883, 734))
    wire((757, 879), (757, 800), (800, 800), (800, 759))
    wire((880, 879), (880, 800), (850, 800), (850, 759))
    wire((823, 724), (823, 682))
    wire((866, 665), (1088, 665), (1088, 866), arrow: false)
    wire((778, 665), (287, 665))
    unit(154, 648, 287, 681, [CPU], fill: luma(90%))
    unit(39, 716, 253, 748, [虚页号（20位）])
    unit(253, 716, 468, 748, [页内地址（12位）])
    unit(39, 1093, 139, 1127, [10位])
    unit(139, 1093, 238, 1127, [10位])
    unit(302, 1077, 435, 1110, [实页号])
    unit(435, 1077, 552, 1110, [页内地址])
    unit(655, 1077, 786, 1110, [20位])
    unit(786, 1077, 852, 1110, [3位])
    unit(852, 1077, 918, 1110, [5位])
    unit(39, 1260, 102, 1287, [])
    label(74, 1243, [PDBR])
    label(158, 1052, [TLB缺失])
    label(140, 1011, [比较器])
    label(222, 801, [Tag])
    label(303, 801, [有效位])
    label(397, 801, [实页号])
    rect(p(179, 820), p(446, 991), stroke: 0.045em, fill: white)
    for x in (270, 336) { wire((x, 820), (x, 991), arrow: false) }
    for y in (855, 889, 923, 957) { wire((179, y), (446, y), arrow: false) }
    for (i, tag, valid, frame) in ((0, [00324H], [1], [F800H]), (1, [0008CH], [1], [0040H]),
      (2, [8C040H], [1], [0160H]), (3, [⋮], [⋮], [⋮]), (4, [04320H], [0], [0E80H])) {
      let y = 838 + 34 * i
      label(224, y, tag)
      label(303, y, valid)
      label(391, y, frame)
      if i != 3 {
        wire((98, y), (130, y), arrow: false)
        wire((160, y), (179, y), arrow: false)
        circle(p(145, y), radius: 0.45, fill: white, stroke: 0.045em)
        label(145, y, [=])
      } else { label(145, y, [⋮]) }
    }
    for (x, top, rows, col) in ((128, 1162, (1162, 1208, 1242, 1277), (128, 163, 229, 295)),
      (369, 1161, (1161, 1189, 1208, 1277), (369, 405, 473, 529))) {
      rect(p(col.first(), rows.at(1)), p(col.last(), rows.at(2)), fill: luma(86%), stroke: none)
      rect(p(col.first(), rows.first()), p(col.last(), rows.last()), stroke: 0.045em)
      for xx in col.slice(1, -1) { wire((xx, rows.first()), (xx, rows.last()), arrow: false) }
      for yy in rows.slice(1, -1) { wire((col.first(), yy), (col.last(), yy), arrow: false) }
    }
    label(211, 1300, [页目录])
    label(448, 1300, [页表])
    for (left, columns) in ((true, (582, 617, 706, 793)), (false, (846, 934, 1024, 1056))) {
      rect(p(columns.first(), 879), p(columns.last(), 1011), fill: white, stroke: 0.045em)
      for xx in columns.slice(1, -1) { wire((xx, 879), (xx, 1011), arrow: false) }
      for yy in (912, 945, 978) { wire((columns.first(), yy), (columns.last(), yy), arrow: false) }
      let tags = if left { ([F8000H], [008C0H], [00400H], [---]) } else { ([F2840H], [23000H], [01600H], [---]) }
      let valids = if left { ([1], [1], [0], []) } else { ([1], [0], [1], []) }
      for i in range(4) {
        let y = 895 + 33 * i
        label(if left { 600 } else { 1040 }, y, valids.at(i))
        label(if left { 661 } else { 979 }, y, tags.at(i))
        if left and i < 3 { label(570, y, str(i)) }
      }
    }
    for (x, body) in ((585, [有效位]), (661, [Tag]), (750, [Data]),
      (888, [Data]), (979, [Tag]), (1040, [有效位])) { label(x, 1030, body) }
    for (x, lx) in ((681, 629), (960, 1007)) {
      circle(p(x, 822), radius: 0.5, fill: white, stroke: 0.045em)
      label(x, 822, [=])
      label(lx, 841, [比较器])
      merge-path({
        line(p(x - 27, 788), p(x - 27, 769))
        bezier(p(x - 27, 769), p(x + 13, 769), p(x - 27, 743), p(x + 13, 743))
        line(p(x + 13, 769), p(x + 13, 788))
      }, close: true, fill: white, stroke: 0.045em)
    }
    line(p(744, 759), p(769, 724), p(875, 724), p(901, 759), close: true, fill: white, stroke: 0.045em)
    label(823, 744, [多路选择])
    unit(778, 648, 866, 681, [数据])
  }),
  caption: [题44图], numbering: none,
)

根据题44图回答下列问题。

#subquestions[
+ 主存物理地址占多少位？
+ TLB 采用什么映射方式？TLB 用 SRAM 还是 DRAM 实现？
+ Cache 采用什么映射方式？若 Cache 采用 LRU 替换算法和回写（Write Back）策略，则 Cache 每行中除数据（Data）、Tag 和有效位外，还应有哪些附加位？Cache 总容量是多少？Cache 中有效位的作用是什么？
+ 若 CPU 给出的虚拟地址为0008 C040H，则对应的物理地址是多少？是否在 Cache 中命中？说明理由。若 CPU 给出的虚拟地址为0007 C260H，则该地址所在主存块映射到的 Cache 组号是多少？

]
]

#question[
（8分）请根据题44图给出的虚拟存储管理方式，回答下列问题：

#subquestions[
+ 某虚拟地址对应的页目录号为6，在相应的页表中对应的页号为6，页内偏移量为8，该虚拟地址的十六进制表示是什么？
+ 寄存器 PDBR 用于保存当前进程的页目录起始地址，该地址是物理地址还是虚拟地址？进程切换时，PDBR 的内容是否会变化？说明理由。同一进程的线程切换时，PDBR 的内容是否会变化？说明理由。
+ 为了支持改进型 CLOCK 置换算法，需要在页表项中设置哪些字段？

]
]

#question[
（7分）某文件系统采用索引节点存放文件的属性和地址信息，簇大小为4 KB。每个文件索引节点占64 B，有11个地址项，其中直接地址项8个，一级、二级和三级间接地址项各1个，每个地址项长度为4 B。请回答下列问题：

#subquestions[
+ 该文件系统能支持的最大文件长度是多少？（给出计算表达式即可）
+ 文件系统用1M（$1 "M"=2^20$）个簇存放文件索引节点，用512M个簇存放文件数据。若一个图像文件的大小为5600 B，则该文件系统最多能存放多少个这样的图像文件？
+ 若文件 F1 的大小为6 KB，文件 F2 的大小为40 KB，则该文件系统获取 F1 和 F2 最后一个簇的簇号需要的时间是否相同？为什么？

]
]

#question[
（7分）某公司网络如题47图所示。IP 地址空间192.168.1.0/24被均分给销售部和技术部两个子网，并已分别为部分主机和路由器接口分配了 IP 地址，销售部子网的 MTU=1500 B，技术部子网的 MTU=800 B。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.06em)
    line((7, 4), (31, 4))
    circle((7, 4), radius: (6.6, 3.6), fill: luma(94%))
    circle((31, 4), radius: (6.6, 3.6), fill: luma(94%))
    merge-path({
      line((18, 4.5), (18, 3.5))
      bezier((18, 3.5), (20, 3.5), (18, 2.8), (20, 2.8))
      line((20, 3.5), (20, 4.5))
    }, close: true, fill: white)
    circle((19, 4.5), radius: (1, 0.55), fill: white)
    for (a, b) in (((18.3, 4.8), (19, 4.45)), ((19.05, 4.5), (19.7, 4.85)),
      ((19.7, 4.2), (19.05, 4.55)), ((19, 4.5), (18.3, 4.15))) {
      line(a, b, stroke: 0.11em, mark: (end: ">", fill: black, scale: 0.55))
    }
    content((7, 6.2), [销售部])
    content((31, 6.2), [技术部])
    for x in (5.4, 8.3, 29.4, 32.3) {
      rect((x - 0.5, 4.25), (x + 0.5, 5.55), fill: white)
      rect((x - 0.35, 4.5), (x + 0.35, 5.3))
      line((x - 0.7, 4.25), (x + 0.7, 4.25), (x + 0.55, 3.85), (x - 0.85, 3.85), close: true, fill: white)
    }
    content((7, 3.1), text(size: 0.88em)[已分配地址])
    content((7, 2.1), text(size: 0.8em)[192.168.1.1～192.168.1.20])
    content((31, 3.1), text(size: 0.88em)[已分配地址])
    content((31, 2.1), text(size: 0.8em)[192.168.1.129～192.168.1.208])
    content((19, 1.95), text(size: 0.88em)[路由器])
    content((15.9, 5.6), text(size: 0.82em)[192.168.1.126])
    content((22.1, 5.6), text(size: 0.82em)[192.168.1.254])
    content((17.55, 4.4), text(size: 0.82em)[F0], anchor: "east")
    content((20.45, 4.4), text(size: 0.82em)[F1], anchor: "west")
    content((15.9, 3.3), text(size: 0.82em)[MTU=1500B])
    content((22.1, 3.3), text(size: 0.82em)[MTU=800B])
  }),
  caption: [题47图], numbering: none,
)

请回答下列问题：

#subquestions[
+ 销售部子网的广播地址是什么？技术部子网的子网地址是什么？若每个主机仅分配一个 IP 地址，则技术部子网还可以连接多少台主机？
+ 假设主机192.168.1.1向主机192.168.1.208发送一个总长度为1500 B 的 IP 分组，IP 分组的头部长度为20 B，路由器在通过接口 F1 转发该 IP 分组时进行了分片。若分片时尽可能分为最大片，则一个最大 IP 分片封装数据的字节数是多少？至少需要分为几个分片？每个分片的片偏移量是多少？

]
]
