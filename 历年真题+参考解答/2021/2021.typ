// 来源：内容来源/2022年计算机考试大纲.pdf
// 试题：书内第55～68页（PDF第59～72页），人工逐页录入，图表在题内重绘。
#import "../../template.typ": exam, choices, subquestions, statements, inline-node
#show: exam.with(year: 2021, subject: "计算机学科专业基础", code: "408")
#set document(title:"2021年全国硕士研究生招生考试计算机学科专业基础试题")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#import "@preview/fletcher:0.5.8": diagram,node,edge
#import "@preview/cetz:0.5.2" as cetz
#let emphasis = underline.with(stroke:(thickness:0.07em,dash:(array:(0pt,1em),phase:0.5em),cap:"round"),offset:0.16em)
#answer-state.update(false)

= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项是最符合题目要求的。

#question[
已知头指针 h 指向一个带头结点的非空单循环链表，结点结构为 #inline-node(columns:2,[data],[next])，其中 next 是指向直接后继结点的指针，p 是尾指针，q 是临时指针。现要删除该链表的第一个元素，正确的语句序列是

#choices(
  [`h->next = h->next->next; q = h->next; free(q);`],
  [`q = h->next; h->next = h->next->next; free(q);`],
  [`q = h->next; h->next = q->next; if(p != q)p = h; free(q);`],
  [`q = h->next; h->next = q->next; if(p == q)p = h; free(q);`],
)
]

#question[
已知初始为空的队列 Q 的一端仅能进行入队操作，另外一端既能进行入队操作又能进行出队操作。若 Q 的入队序列是1，2，3，4，5，则不能得到的出队序列是

#choices([5，4，3，1，2], [5，3，1，2，4], [4，2，1，3，5], [4，1，3，2，5])
]

#question[
已知二维数组 A 按行优先方式存储，每个元素占用1个存储单元。若元素 A[0][0] 的存储地址是100，A[3][3] 的存储地址是220，则元素 A[5][5] 的存储地址是

#choices([295], [300], [301], [306])
]

#question[
某森林 $F$ 对应的二叉树为 $T$，若 $T$ 的先序遍历序列是 a，b，d，c，e，g，f，中序遍历序列是 b，d，a，e，g，c，f，则 $F$ 中树的棵数是

#choices([1], [2], [3], [4])
]

#question[
若某二叉树有5个叶结点，其权值分别为10，12，16，21，30，则其最小的带权路径长度（WPL）是

#choices([89], [200], [208], [289])
]

#question[
给定平衡二叉树如下图所示，插入关键字23后，根中的关键字是

#align(center,diagram(node-stroke:0.055em,edge-stroke:0.055em,node-inset:0pt,
  // 大纲 PDF 第 60 页：结点直径约 1.45 个正文字，数字小于正文。
  node((1.7em,0em),text(size:0.85em)[20],radius:0.72em),
  node((0em,-2em),text(size:0.85em)[16],radius:0.72em),node((3.4em,-2em),text(size:0.85em)[30],radius:0.72em),
  node((1.7em,-4em),text(size:0.85em)[25],radius:0.72em),node((5.1em,-4em),text(size:0.85em)[40],radius:0.72em),
  edge((1.7em,0em),(0em,-2em)),edge((1.7em,0em),(3.4em,-2em)),
  edge((3.4em,-2em),(1.7em,-4em)),edge((3.4em,-2em),(5.1em,-4em)),
))

#choices([16], [20], [23], [25])
]

#question[
给定如下有向图，该图的拓扑有序序列的个数是

#align(center,diagram(node-stroke:0.055em,edge-stroke:0.055em,node-inset:0pt,
  node((3.2em,0em),text(size:0.85em)[A],radius:0.72em),
  node((0em,-1.7em),text(size:0.85em)[B],radius:0.72em),node((6.4em,-1.7em),text(size:0.85em)[F],radius:0.72em),
  node((0em,-4.5em),text(size:0.85em)[C],radius:0.72em),node((6.4em,-4.5em),text(size:0.85em)[E],radius:0.72em),
  node((3.2em,-6.2em),text(size:0.85em)[D],radius:0.72em),
  edge((3.2em,0em),(0em,-1.7em),"-|>"),edge((3.2em,0em),(6.4em,-1.7em),"-|>"),
  edge((0em,-1.7em),(6.4em,-1.7em),"-|>"),edge((0em,-1.7em),(0em,-4.5em),"-|>"),
  edge((0em,-1.7em),(3.2em,-6.2em),"-|>"),edge((0em,-4.5em),(3.2em,-6.2em),"-|>"),
  edge((3.2em,-6.2em),(6.4em,-1.7em),"-|>"),edge((3.2em,-6.2em),(6.4em,-4.5em),"-|>"),
  edge((6.4em,-4.5em),(6.4em,-1.7em),"-|>"),
))

#choices([1], [2], [3], [4])
]

#question[
使用 Dijkstra 算法求下图中从顶点1到其余各顶点的最短路径，将当前找到的从顶点1到顶点2、3、4、5的最短路径长度保存在数组 dist 中，求出第二条最短路径后，dist 中的内容更新为

#align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 2022 大纲第 56 页：数字按字面居中，边权不与斜边相交。
  set-style(stroke:0.055em,content:(wrap:body =>
    box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  let arrow(a,b) = {
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let d = calc.sqrt(dx*dx+dy*dy)
    line((a.at(0)+dx/d*0.62,a.at(1)+dy/d*0.62),
      (b.at(0) - dx/d*0.62,b.at(1) - dy/d*0.62),
      mark:(end:">",fill:black,scale:0.7))
  }
  for (a,b) in (((4.2,0),(0,-2.5)),((4.2,0),(8.4,-2.5)),((4.2,0),(6.8,-6.7)),
    ((0,-2.5),(8.4,-2.5)),((0,-2.5),(1.5,-6.7)),((0,-2.5),(6.8,-6.7)),
    ((1.5,-6.7),(8.4,-2.5)),((1.5,-6.7),(6.8,-6.7)),((6.8,-6.7),(8.4,-2.5))) {arrow(a,b)}
  for (x,y,label) in ((4.2,0,[1]),(0,-2.5,[5]),(8.4,-2.5,[2]),(1.5,-6.7,[4]),(6.8,-6.7,[3])) {
    circle((x,y),radius:0.62,fill:white);content((x,y),label)
  }
  for (x,y,label) in ((1.9,-0.6,[6]),(6.5,-0.6,[26]),(5.25,-1.75,[3]),
    (3.25,-1.8,[15]),(0.05,-4.5,[8]),(2.05,-4,[6]),(3.65,-5.8,[1]),
    (4.15,-7.4,[6]),(8.2,-4.9,[22])) {content((x,y),label)}
}))

#choices([26，3，14，6], [25，3，14，6], [21，3，14，6], [15，3，14，6])
]

#question[
在一棵高度为3的3阶 B 树中，根为第1层，若第2层中有4个关键字，则该树的结点个数最多是

#choices([11], [10], [9], [8])
]

#question[
设数组 S[] = {93，946，372，9，146，151，301，485，236，327，43，892}，采用最低位优先（LSD）基数排序将 S 排列成升序序列。第1趟分配、收集后，元素372之前、之后紧邻的元素分别是

#choices([43，892], [236，301], [301，892], [485，301])
]

#question[
将关键字6，9，1，5，8，4，7依次插入到初始为空的大根堆 H 中，得到的 H 是

#choices([9，8，7，6，5，4，1], [9，8，7，5，6，1，4], [9，8，7，5，6，4，1], [9，6，7，5，8，4，1])
]

#question[
2017年公布的全球超级计算机 TOP 500 排名中，我国“神威·太湖之光”超级计算机蝉联第一，其浮点运算速度为93.0146 PFLOPS，说明该计算机每秒钟内完成的浮点操作次数约为

#choices([$9.3 times 10^13$ 次], [$9.3 times 10^15$ 次], [9.3千万亿次], [9.3亿亿次])
]

#question[
已知带符号整数用补码表示，变量 $x$、$y$、$z$ 的机器数分别为 FFFDH、FFDFH、7FFCH，下列结论中，正确的是

#choices([若 $x$、$y$ 和 $z$ 为无符号整数，则 $z<x<y$], [若 $x$、$y$ 和 $z$ 为无符号整数，则 $x<y<z$], [若 $x$、$y$ 和 $z$ 为带符号整数，则 $x<y<z$], [若 $x$、$y$ 和 $z$ 为带符号整数，则 $y<x<z$])
]

#question[
下列数值中，不能用 IEEE 754 浮点格式精确表示的是

#choices([1.2], [1.25], [2.0], [2.5])
]

#question[
某计算机的存储器总线中有24位地址线和32位数据线，按字节编址，字长为32位。若00 0000H～3F FFFFH为 RAM 区，则需要 $512"K" times 8$ 位的 RAM 芯片数为

#choices([8], [16], [32], [64])
]

#question[
若计算机主存地址为32位，按字节编址，Cache 数据区大小为32 KB，主存块大小为32 B，采用直接映射方式和回写（Write Back）策略，则 Cache 行的位数至少是

#choices([275], [274], [258], [257])
]

#question[
下列寄存器中，汇编语言程序员可见的是

#statements(columns:(1fr,1fr),[Ⅰ．指令寄存器], [Ⅱ．微指令寄存器], [Ⅲ．基址寄存器], [Ⅳ．标志/状态寄存器],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ])
]

#question[
下列关于数据通路的叙述中，#emphasis[错误]的是

#choices([数据通路包含 ALU 等组合逻辑（操作）元件], [数据通路包含寄存器等时序逻辑（状态）元件], [数据通路不包含用于异常事件检测及响应的电路], [数据通路中的数据流动路径由控制信号进行控制])
]

#question[
下列关于总线的叙述中，#emphasis[错误]的是

#choices([总线是在两个或多个部件之间进行数据交换的传输介质], [同步总线由时钟信号定时，时钟频率不一定等于工作频率], [异步总线由握手信号定时，一次握手过程完成一位数据交换], [突发（Burst）传送总线事务可以在总线上连续传送多个数据])
]

#question[
下列选项中，不属于 I/O 接口的是

#choices([磁盘驱动器], [打印机适配器], [网络控制器], [可编程中断控制器])
]

#question[
异常事件在当前指令执行过程中进行检测，中断请求则在当前指令执行后进行检测。下列事件中，相应处理程序执行后，必须回到当前指令重新执行的是

#choices([系统调用], [页缺失], [DMA 传送结束], [打印机缺纸])
]

#question[
下列是关于多重中断系统中 CPU 响应中断的叙述，其中#emphasis[错误]的是

#choices([仅在用户态（执行用户程序）下，CPU 才能检测和响应中断], [CPU 只有在检测到中断请求信号后，才会进入中断响应周期], [进入中断响应周期时，CPU 一定处于中断允许（开中断）状态], [若 CPU 检测到中断请求信号，则一定存在未被屏蔽的中断源请求信号])
]

#question[
下列指令中，只能在内核态执行的是

#choices([trap 指令], [I/O 指令], [数据传送指令], [设置断点指令])
]

#question[
下列操作中，操作系统在创建新进程时，必须完成的是

#statements(columns:(1fr,1fr),[Ⅰ．申请空白的进程控制块], [Ⅱ．初始化进程控制块], [Ⅲ．设置进程状态为执行态],
)

#choices([仅Ⅰ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ])
]

#question[
下列内核的数据结构或程序中，分时系统实现时间片轮转调度需要使用的是

#statements(columns:(1fr,1fr),[Ⅰ．进程控制块], [Ⅱ．时钟中断处理程序], [Ⅲ．进程就绪队列], [Ⅳ．进程阻塞队列],
)

#choices([仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅳ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅰ、Ⅱ、Ⅳ])
]

#question[
某系统中磁盘的磁道数为200（0～199），磁头当前在184号磁道上。用户进程提出的磁盘访问请求对应的磁道号依次为184、187、176、182、199。若采用最短寻道时间优先调度算法（SSTF）完成磁盘访问，则磁头移动的距离（磁道数）是

#choices([37], [38], [41], [42])
]

#question[
下列事件中，可能引起进程调度程序执行的是

#statements(columns:(1fr,1fr),[Ⅰ．中断处理结束], [Ⅱ．进程阻塞], [Ⅲ．进程执行结束], [Ⅳ．进程的时间片用完],
)

#choices([仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ和Ⅳ])
]

#question[
某请求分页存储系统的页大小为4 KB，按字节编址。系统给进程 P 分配2个固定的页框，并采用改进型 Clock 置换算法，进程 P 页表的部分内容如下表所示。

#align(center,table(columns:(auto,auto,auto,auto,auto),align:center,
  stroke:(x,y)=>if x == 0 {none} else {0.5pt},
  [页号],[页框号],[存在位\ 1：存在，0：不存在],[访问位\ 1：访问，0：未访问],[修改位\ 1：修改，0：未修改],
  […],[…],[…],[…],[…],
  [2],[20H],[0],[0],[0],
  [3],[60H],[1],[1],[0],
  [4],[80H],[1],[1],[1],
  […],[…],[…],[…],[…],
))

若 P 访问虚拟地址为02A01H的存储单元，则经地址转换后得到的物理地址是

#choices([00A01H], [20A01H], [60A01H], [80A01H])
]

#question[
在采用二级页表的分页系统中，CPU 页表基址寄存器中的内容是

#choices([当前进程的一级页表的起始虚拟地址], [当前进程的一级页表的起始物理地址], [当前进程的二级页表的起始虚拟地址], [当前进程的二级页表的起始物理地址])
]

#question[
若目录 dir 下有文件 file1，则为删除该文件内核#emphasis[不必]完成的工作是

#choices([删除 file1 的快捷方式], [释放 file1 的文件控制块], [释放 file1 占用的磁盘空间], [删除目录 dir 中与 file1 对应的目录项])
]

#question[
若系统中有 $n$（$n>=2$）个进程，每个进程均需要使用某类临界资源2个，则系统不会发生死锁所需的该类资源总数至少是

#choices([2], [$n$], [$n+1$], [$2n$])
]

#question[
下列选项中，通过系统调用完成的操作是

#choices([页置换], [进程调度], [创建新进程], [生成随机整数])
]

#question[
在 TCP/IP 参考模型中，由传输层相邻的下一层实现的主要功能是

#choices([对话管理], [路由选择], [端到端报文段传输], [结点到结点流量控制])
]

#question[
若下图为一段差分曼彻斯特编码信号波形，则其编码的二进制位串是

#align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  for x in range(9) {line((x*2.1,0.8),(x*2.1,-3.8),stroke:(paint:black,thickness:0.06em,dash:"dashed"))}
  line((0,0),(1.05,0),(1.05,-3),(2.1,-3),(2.1,0),(3.15,0),(3.15,-3),(5.25,-3),(5.25,0),(7.35,0),(7.35,-3),(9.45,-3),(9.45,0),(10.5,0),(10.5,-3),(11.55,-3),(11.55,0),(12.6,0),(12.6,-3),(13.65,-3),(13.65,0),(15.75,0),(15.75,-3),(16.8,-3),stroke:0.075em)
}))

#choices([1011 1001], [1101 0001], [0010 1110], [1011 0110])
]

#question[
现将一个 IP 网络划分为3个子网，若其中一个子网是192.168.9.128/26，则下列网络中，不可能是另外两个子网之一的是

#choices([192.168.9.0/25], [192.168.9.0/26], [192.168.9.192/26], [192.168.9.192/27])
]

#question[
若路由器向 MTU = 800 B 的链路转发一个总长度为1580 B的 IP 数据报（首部长度为20 B）时，进行了分片，且每个分片尽可能大，则第2个分片的总长度字段和 MF 标志位的值分别是

#choices([796，0], [796，1], [800，0], [800，1])
]

#question[
某网络中的所有路由器均采用距离向量路由算法计算路由。若路由器 E 与邻居路由器 A、B、C 和 D 之间的直接链路距离分别是8、10、12和6，且 E 收到邻居路由器的距离向量如下表所示，则路由器 E 更新后的到达目的网络 Net1～Net4 的距离分别是

#align(center,table(columns:(auto,auto,auto,auto,auto),align:center,
  stroke:(x,y)=>if x == 0 or y == 0 {none} else {0.5pt},
  [目的网络],[A 的距离向量],[B 的距离向量],[C 的距离向量],[D 的距离向量],
  [Net1],[1],[23],[20],[22],
  [Net2],[12],[35],[30],[28],
  [Net3],[24],[18],[16],[36],
  [Net4],[36],[30],[8],[24],
))

#choices([9，10，12，6], [9，10，28，20], [9，20，12，20], [9，20，28，20])
]

#question[
若客户首先向服务器发送 FIN 段请求断开 TCP 连接，则当客户收到服务器发送的 FIN 段并向服务器发送了 ACK 段后，客户的 TCP 状态转换为

#choices([CLOSE_WAIT], [TIME_WAIT], [FIN_WAIT_1], [FIN_WAIT_2])
]

#question[
若大小为12 B的应用层数据分别通过1个 UDP 数据报和1个 TCP 段传输，则该 UDP 数据报和 TCP 段实现的有效载荷（应用层数据）最大传输效率分别是

#choices([37.5%，16.7%], [37.5%，37.5%], [60.0%，16.7%], [60.0%，37.5%])
]

#question[
假设主机甲通过 TCP 向主机乙发送数据，部分过程如下图所示。甲在 $t_0$ 时刻发送了一个序号 seq = 501、封装200 B数据的段，在 $t_1$ 时刻收到乙发送的序号 seq = 601、确认序号 ack_seq = 501、接收窗口 rcwnd = 500 B的段，则甲在未收到新的确认段之前可以继续向乙发送的数据序号范围是

#align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  content((0,1.7),image("../2012/assets/visio-2003-pc.svg",width:2.1em))
  content((13,1.7),image("../2012/assets/visio-2003-server.svg",width:1.5em))
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

= 二、综合应用题：41～47小题，共70分。

#question[
（15分）已知无向连通图 $G$ 由顶点集 $V$ 和边集 $E$ 组成，$abs(E)>0$，当 $G$ 中度为奇数的顶点个数为不大于2的偶数时，$G$ 存在包含所有边且长度为 $abs(E)$ 的路径（称为 EL 路径）。设图 $G$ 采用邻接矩阵存储，类型定义如下：

```c
typedef struct {                  // 图的定义
    int numVertices, numEdges;    // 图中实际的顶点数和边数
    char VerticesList[MAXV];      // 顶点表。MAXV为已定义常量
    int Edge[MAXV][MAXV];         // 邻接矩阵
} MGraph;
```

请设计算法：int IsExistEL(MGraph G)，判断 $G$ 是否存在 EL 路径，若存在，则返回1，否则，返回0。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。
+ 说明你所设计算法的时间复杂度和空间复杂度。

]
]

#question[
（8分）已知某排序算法如下：

```c
void cmpCountSort(int a[], int b[], int n)
{
    int i, j, *count;
    count = (int *)malloc(sizeof(int) * n);
                                  // C++语言：count = new int[n];
    for (i = 0; i < n; i++) count[i] = 0;
    for (i = 0; i < n-1; i++)
        for (j = i+1; j < n; j++)
            if (a[i] < a[j]) count[j]++;
            else            count[i]++;
    for (i = 0; i < n; i++) b[count[i]] = a[i];
    free(count);                  // C++语言：delete count;
}
```

请回答下列问题。

#subquestions[
+ 若有 int a[] = {25，−10，25，10，11，19}，b[6]；，则调用 cmpCountSort(a，b，6) 后数组 b 中的内容是什么？
+ 若 a 中含有 $n$ 个元素，则算法执行过程中，元素之间的比较次数是多少？
+ 该算法是稳定的吗？若是，则阐述理由；否则，修改为稳定排序算法。

]
]

#question[
（15分）假定计算机 M 字长为16位，按字节编址，连接 CPU 和主存的系统总线中地址线为20位、数据线为8位，采用16位定长指令字，指令格式及其说明如下：

#align(center,context {
  set text(size:0.85em)
  table(columns:(auto,6em,3em,3em,3em,4em,1fr),align:center,
    stroke:(x,y)=>if x == 0 or x == 6 or y == 0 {none} else {0.5pt},
    [格式],[6位],[2位],[2位],[2位],[4位],[指令功能或指令类型说明],
    [R 型],[000000],[rs],[rt],[rd],[op1],align(left)[R[rd] ← R[rs] op1 R[rt]],
    [I 型],[op2],[rs],[rt],table.cell(colspan:2)[imm],align(left)[含 ALU 运算、条件转移和访存操作3类指令],
    [J 型],[op3],table.cell(colspan:4)[target],align(left)[PC 的低10位 ← target],
  )
})

其中，op1～op3 为操作码，rs、rt 和 rd 为通用寄存器编号，R[r] 表示寄存器 r 的内容，imm 为立即数，target 为转移目标的形式地址。请回答下列问题。

#subquestions[
+ ALU 的宽度是多少位？可寻址主存空间大小为多少字节？指令寄存器、主存地址寄存器（MAR）和主存数据寄存器（MDR）分别应有多少位？
+ R 型格式最多可定义多少种操作？I 型和 J 型格式总共最多可定义多少种操作？通用寄存器最多有多少个？
+ 假定 op1 为0010和0011时，分别表示带符号整数减法和带符号整数乘法指令，则指令01B2H的功能是什么（参考上述指令功能说明的格式进行描述）？若1、2、3号通用寄存器当前内容分别为 B052H、0008H、0020H，则分别执行指令01B2H和01B3H后，3号通用寄存器内容各是什么？各自结果是否溢出？
+ 若采用 I 型格式的访存指令中 imm（偏移量）为带符号整数，则地址计算时应对 imm 进行零扩展还是符号扩展？
+ 无条件转移指令可以采用上述哪种指令格式？

]
]

#question[
（8分）假设计算机 M 的主存地址为24位，按字节编址，采用分页存储管理方式，虚拟地址为30位，页大小为4 KB；TLB 采用2路组相联方式和 LRU 替换策略，共8组。请回答下列问题。

#subquestions[
+ 虚拟地址中哪几位表示虚页号？哪几位表示页内地址？
+ 已知访问 TLB 时虚页号高位部分用作 TLB 标记，低位部分用作 TLB 组号，M 的虚拟地址中哪几位是 TLB 标记？哪几位是 TLB 组号？
+ 假设 TLB 初始时为空，访问的虚页号依次为10、12、16、7、26、4、12和20，在此过程中，哪一个虚页号对应的 TLB 表项被替换？说明理由。
+ 若将 M 中的虚拟地址位数增加到32位，则 TLB 表项的位数增加几位？

]
]

#question[
（7分）下表给出了整型信号量 S 的 wait() 和 signal() 操作的功能描述，以及采用开/关中断指令实现信号量操作互斥的两种方法。

#table(columns:(1fr,1fr,1fr),align:top,
  align(center)[功能描述],align(center)[方法1],align(center)[方法2],
  [
```text
Semaphore S;
wait(S) {
    while(S <= 0);
    S = S-1;
}
```
  ],[
```text
Semaphore S;
wait(S) {
    关中断;
    while(S <= 0);
    S = S-1;
    开中断;
}
```
  ],[
```text
Semaphore S;
wait(S) {
    关中断;
    while(S <= 0) {
        开中断;
        关中断;
    }
    S = S-1;
    开中断;
}
```
  ],
  table.hline(stroke:none),
  [
```text
signal(S) {
    S = S+1;
}
```
  ],[
```text
signal(S) {
    关中断;
    S = S+1;
    开中断;
}
```
  ],[
```text
signal(S) {
    关中断;
    S = S+1;
    开中断;
}
```
  ],
)

请回答下列问题。

#subquestions[
+ 为什么在 wait() 和 signal() 操作中对信号量 S 的访问必须互斥执行？
+ 分别说明方法1和方法2是否正确。若不正确，请说明理由。
+ 用户程序能否使用开/关中断指令实现临界区互斥？为什么？

]
]

#question[
（8分）某计算机用硬盘作为启动盘，硬盘第一个扇区存放主引导记录，其中包含磁盘引导程序和分区表。磁盘引导程序用于选择要引导哪个分区的操作系统，分区表记录硬盘上各分区的位置等描述信息。硬盘被划分成若干个分区，每个分区的第一个扇区存放分区引导程序，用于引导该分区中的操作系统。系统采用多阶段引导方式，除了执行磁盘引导程序和分区引导程序外，还需要执行 ROM 中的引导程序。请回答下列问题。

#subquestions[
+ 系统启动过程中操作系统的初始化程序、分区引导程序、ROM 中的引导程序、磁盘引导程序的执行顺序是什么？
+ 把硬盘制作为启动盘时，需要完成操作系统的安装、磁盘的物理格式化、逻辑格式化、对磁盘进行分区，执行这4个操作的正确顺序是什么？
+ 磁盘扇区的划分和文件系统根目录的建立分别是在第（2）问的哪个操作中完成的？

]
]

#question[
（9分）某网络拓扑如题47图所示，以太网交换机 S 通过路由器 R 与 Internet 互联。路由器部分接口、本地域名服务器、H1、H2 的 IP 地址和 MAC 地址如图中所示。在 $t_0$ 时刻 H1 的 ARP 表和 S 的交换表均为空，H1 在此刻利用浏览器通过域名 www.abc.com 请求访问 Web 服务器，在 $t_1$ 时刻（$t_1>t_0$）S 第一次收到了封装 HTTP 请求报文的以太网帧，假设从 $t_0$ 到 $t_1$ 期间网络未发生任何与此次 Web 访问无关的网络通信。

#figure(cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  let label(x,y,body,anchor:"center") = content((x,y),text(size:0.85em)[#body],anchor:anchor)
  merge-path({
    bezier((-1,6),(-1,9),(-3,6),(-3,9))
    bezier((-1,9),(4,9),(0,10),(3,10))
    bezier((4,9),(5,6),(6,9),(7,6))
    bezier((5,6),(-1,6),(4,4.5),(-0.5,4.5))
  },close:true,fill:luma(90%))
  line((5.5,7.5),(9,7.5));line((9,7.5),(9,0))
  line((0,1.2),(16,1.2));line((9,1.2),(9,-3))
  content((1,8.3),image("../2012/assets/visio-2007-isometric-server.png",width:1.5em))
  label(1,6.75,[Web服务器]);label(1,5.8,[www.abc.com]);label(3.8,8.7,[Internet])
  merge-path({
    line((8.1,7.8),(8.1,7.1))
    bezier((8.1,7.1),(9.9,7.1),(8.1,6.6),(9.9,6.6))
    line((9.9,7.1),(9.9,7.8))
  },close:true,fill:white)
  circle((9,7.8),radius:(0.9,0.35),fill:luma(94%))
  line((8.5,7.9),(9.1,7.73),mark:(end:">",fill:black,scale:0.5))
  line((9.55,7.92),(9.1,7.8),mark:(end:">",fill:black,scale:0.5))
  line((8.8,7.6),(8.6,7.82),mark:(end:">",fill:black,scale:0.5))
  line((9.25,7.77),(9.5,7.58),mark:(end:">",fill:black,scale:0.5))
  label(9,8.6,[R]);label(9.8,6.6,[192.168.1.1/25],anchor:"west")
  label(9.8,5.5,[00-11-22-33-44-aa],anchor:"west")
  content((0,1.2),image("../2012/assets/visio-2007-isometric-server.png",width:1.5em))
  label(0,2.8,[本地域名服务器]);label(0,-0.6,[192.168.1.126/25])
  label(0,-1.7,[00-11-22-33-44-bb])
  merge-path({line((8,1.5),(8,0.9),(9,0.4),(10,0.9),(10,1.5))},close:true,fill:luma(90%))
  merge-path({line((8,1.5),(9,2),(10,1.5),(9,1))},close:true,fill:luma(94%))
  line((9,1),(9,0.4))
  line((8.4,1.6),(9.4,1.3),mark:(end:">",scale:0.6))
  line((9.6,1.8),(8.6,1.5),mark:(end:">",scale:0.6))
  label(8.4,2.3,[S]);label(7.7,1.6,[1]);label(9.4,2.6,[2]);label(10.4,1.6,[3]);label(9.5,0.1,[4])
  merge-path({line((15.2,1.8),(16.7,2),(16.8,0.8),(15.3,0.6))},close:true,fill:luma(92%))
  merge-path({line((15.3,0.6),(16.8,0.8),(17.3,0.2),(15.8,0))},close:true,fill:white)
  label(17.5,1.5,[H2]);label(16,-0.6,[192.168.1.3/25])
  label(16,-1.7,[00-11-22-33-44-dd])
  content((9,-3.2),image("../2012/assets/visio-2007-isometric-pc.png",width:2em))
  label(7.6,-3,[H1]);label(9,-4.7,[192.168.1.2/25])
  label(9,-5.8,[00-11-22-33-44-cc])
}),caption:[题47图],numbering:none)

请回答下列问题。

#subquestions[
+ 从 $t_0$ 到 $t_1$ 期间，H1 除了 HTTP 之外还运行了哪个应用层协议？从应用层到数据链路层，该应用层协议报文是通过哪些协议进行逐层封装的？
+ 若 S 的交换表结构为：〈MAC 地址，端口〉，则 $t_1$ 时刻 S 交换表的内容是什么？
+ 从 $t_0$ 到 $t_1$ 期间，H2 至少会接收到几个与此次 Web 访问相关的帧？接收到的是什么帧？帧的目的 MAC 地址是什么？

]
]
