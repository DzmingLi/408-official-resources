// 来源：内容来源/2024年计算机考试大纲.pdf。
// 试题：书内第42～58页（PDF第47～63页）；新扫描逐页人工核对，补齐旧扫描跨页缺行。
#import "../../template.typ": exam, choices, subquestions, statements
#show: exam.with(year: 2022, subject: "计算机学科专业基础", code: "408")
#set document(title: "2022年全国硕士研究生招生考试计算机学科专业基础试题")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
#answer-state.update(false)

= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项是最符合题目要求的。

#question[
下列程序段的时间复杂度是

```c
int sum = 0;
for (int i = 1; i < n; i *= 2)
    for (int j = 0; j < i; j++)
        sum++;
```

#choices([$O(log n)$], [$O(n)$], [$O(n log n)$], [$O(n^2)$])
]

#question[
给定有限符号集 $S$，in 和 out 均为 $S$ 中所有元素的任意排列。对于初始为空的栈 ST，下列叙述中，正确的是

#choices(
  [若 in 是 ST 的入栈序列，则不能判断 out 是否为其可能的出栈序列],
  [若 out 是 ST 的出栈序列，则不能判断 in 是否为其可能的入栈序列],
  [若 in 是 ST 的入栈序列，out 是对应 in 的出栈序列，则 in 与 out 一定不同],
  [若 in 是 ST 的入栈序列，out 是对应 in 的出栈序列，则 in 与 out 可能互为倒序],
)
]

#question[
若结点 p 与 q 在二叉树 $T$ 的中序遍历序列中相邻，且 p 在 q 之前，则下列 p 与 q 的关系中，#emphasis[不可能]的是

#statements(columns: (1fr, 1fr), [Ⅰ．q 是 p 的双亲], [Ⅱ．q 是 p 的右孩子],
  [Ⅲ．q 是 p 的右兄弟], [Ⅳ．q 是 p 的双亲的双亲],
)

#choices([仅Ⅰ], [仅Ⅲ], [Ⅱ、Ⅲ], [Ⅱ、Ⅳ])
]

#question[
若三叉树 $T$ 中有244个结点（叶结点的高度为1），则 $T$ 的高度至少是

#choices([8], [7], [6], [5])
]

#question[
对任意给定的含 $n (n > 2)$ 个字符的有限集 $S$，用二叉树表示 $S$ 的哈夫曼编码集和定长编码集，分别得到二叉树 $T_1$ 和 $T_2$。下列叙述中，正确的是

#choices(
  [$T_1$ 与 $T_2$ 的结点数相同],
  [$T_1$ 的高度大于 $T_2$ 的高度],
  [出现频次不同的字符在 $T_1$ 中处于不同的层],
  [出现频次不同的字符在 $T_2$ 中处于相同的层],
)
]

#question[
对于无向图 $G = (V, E)$，下列选项中，正确的是

#choices(
  [当 $abs(V) > abs(E)$ 时，$G$ 一定是连通的],
  [当 $abs(V) < abs(E)$ 时，$G$ 一定是连通的],
  [当 $abs(V) = abs(E) - 1$ 时，$G$ 一定是不连通的],
  [当 $abs(V) > abs(E) + 1$ 时，$G$ 一定是不连通的],
)
]

#question[
下图是一个有10个活动的 AOE 网，时间余量最大的活动是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: 0.045em, mark: (end: "stealth", scale: 0.55))
  let ps = ((0, 0), (4, 2), (4, -2), (8, 2), (8, -2), (12, 0))
  for (a,b,label,pos) in (
    (0,1,[a=2],(1.4,1.25)), (0,2,[b=5],(1.4,-1.3)),
    (1,2,[c=3],(3.3,0)), (1,3,[d=3],(6,2.4)),
    (2,3,[e=3],(5.7,0.6)), (2,4,[f=3],(6,-2.5)),
    (2,5,[g=1],(9.3,-0.2)), (3,4,[h=1],(7.3,0)),
    (3,5,[i=4],(10.5,1.5)), (4,5,[j=1],(10.5,-1.5)),
  ) {
    let start = ps.at(a)
    let end = ps.at(b)
    let dx = end.at(0) - start.at(0)
    let dy = end.at(1) - start.at(1)
    let distance = calc.sqrt(dx*dx + dy*dy)
    let ux = dx / distance
    let uy = dy / distance
    line((start.at(0)+ux*0.7,start.at(1)+uy*0.7),
      (end.at(0)-ux*0.7,end.at(1)-uy*0.7), mark: (end: "stealth"))
    content(pos, text(size: 0.85em, label))
  }
  for (i,p) in ps.enumerate() {
    circle(p, radius: 0.7, fill: white, mark: none)
    content(p, text(size: 0.85em, top-edge: "ascender", bottom-edge: "descender", str(i+1)))
  }
}))

#choices([c], [g], [h], [j])
]

#question[
在下图所示的5阶 B 树 $T$ 中，删除关键字260之后需要进行必要的调整，得到新的 B 树 $T_1$。下列选项中，#emphasis[不可能]是 $T_1$ 根结点中关键字序列的是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: 0.045em)
  for (x,px) in ((0,-2.7),(4,-1.4),(8,0),(12,1.4),(16,2.7)) {
    line((8+px,2.5),(x,0.5))
  }
  content((8,2.5), std.rect(radius: 0.15em, stroke: 0.045em, inset: 0.3em)[60　90　260　350])
  for (x,label) in ((0,[30　50]),(4,[70　80　85]),(8,[100　110]),(12,[280　300]),(16,[400　500])) {
    content((x,0), std.rect(radius: 0.15em, stroke: 0.045em, inset: 0.3em, label))
  }
}))

#choices([60，90，280], [60，90，350], [60，85，110，350], [60，90，110，350])
]

#question[
下列因素中，影响散列（哈希）方法平均查找长度的是

#statements(columns: (1fr, 1fr), [Ⅰ．装填因子], [Ⅱ．散列函数], [Ⅲ．冲突解决策略],
)

#choices([Ⅰ、Ⅱ], [Ⅰ、Ⅲ], [Ⅱ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]

#question[
使用二路归并排序对含 $n$ 个元素的数组 M 进行排序时，二路归并操作的功能是

#choices(
  [将两个有序表合并为一个新的有序表],
  [将 M 划分为两部分，两部分的元素个数大致相等],
  [将 M 划分为 $n$ 个部分，每个部分中仅含有一个元素],
  [将 M 划分为两部分，一部分元素的值均小于另一部分元素的值],
)
]

#question[
对数据进行排序时，若采用直接插入排序而不采用快速排序，则可能的原因是

#statements(columns: (1fr, 1fr), [Ⅰ．大部分元素已有序], [Ⅱ．待排序元素数量很少],
  [Ⅲ．要求空间复杂度为 $O(1)$], [Ⅳ．要求排序算法是稳定的],
)

#choices([Ⅰ、Ⅱ], [Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]

#question[
某计算机主频为1 GHz，程序 P 运行过程中，共执行了10 000条指令，其中，80%的指令执行平均需1个时钟周期，20%的指令执行平均需10个时钟周期。程序 P 的平均 CPI 和 CPU 执行时间分别是

#choices([2.8，28 μs], [28，28 μs], [2.8，28 ms], [28，28 ms])
]

#question[
32位补码所能表示的整数范围是

#choices([$-2^32 ∼ 2^31 - 1$], [$-2^31 ∼ 2^31 - 1$], [$-2^32 ∼ 2^32 - 1$], [$-2^31 ∼ 2^32 - 1$])
]

#question[
$-0.4375$ 的 IEEE 754 单精度浮点数表示为

#choices([BEE0 0000H], [BF60 0000H], [BF70 0000H], [C0E0 0000H])
]

#question[
某计算机主存地址为24位，采用分页虚拟存储管理方式，虚拟地址空间大小为4 GB，页大小为4 KB，按字节编址。某进程的页表部分内容如下页表所示。

#align(center, table(columns: (4em, 9em, 5em), stroke: none, align: center,
  [虚页号], [实页号（页框号）], [存在位],
  [82], table.cell(stroke: 0.5pt)[024H], table.cell(stroke: 0.5pt)[0],
  [⋯], table.cell(stroke: 0.5pt)[⋯], table.cell(stroke: 0.5pt)[⋯],
  [129], table.cell(stroke: 0.5pt)[180H], table.cell(stroke: 0.5pt)[1],
  [130], table.cell(stroke: 0.5pt)[018H], table.cell(stroke: 0.5pt)[1],
))

当 CPU 访问虚拟地址0008 2840H时，虚实地址转换的结果是

#choices([得到主存地址02 4840H], [得到主存地址18 0840H], [得到主存地址01 8840H], [检测到缺页异常])
]

#question[
若计算机主存地址为32位，按字节编址，某 Cache 的数据区容量为32 KB，主存块大小为64 B，采用8路组相联映射方式，该 Cache 中比较器的个数和位数分别为

#choices([8，20], [8，23], [64，20], [64，23])
]

#question[
某内存条包含8个 $8192 times 8192 times 8$ 位的 DRAM 芯片，按字节编址，支持突发（burst）传送方式，对应存储器总线宽度为64位，每个 DRAM 芯片内有一个行缓冲区（row buffer）。下列关于该内存条的叙述中，#emphasis[不正确]的是

#choices([内存条的容量为512 MB], [采用多模块交叉编址方式], [芯片的地址引脚为26位], [芯片内行缓冲有 $8192 times 8$ 位])
]

#question[
下列选项中，属于指令集体系结构（ISA）规定的内容是

#statements(columns: (1fr, 1fr), [Ⅰ．指令字格式和指令类型], [Ⅱ．CPU 的时钟周期],
  [Ⅲ．通用寄存器个数和位数], [Ⅳ．加法器的进位方式],
)

#choices([Ⅰ、Ⅱ], [Ⅰ、Ⅲ], [Ⅱ、Ⅳ], [Ⅰ、Ⅲ、Ⅳ])
]

#question[
设计某指令系统时，假设采用16位定长指令字格式，操作码使用扩展编码方式，地址码为6位，包含零地址、一地址和二地址3种格式的指令。若二地址指令有12条，一地址指令有254条，则零地址指令的条数最多为

#choices([0], [2], [64], [128])
]

#question[
将高级语言源程序转换为可执行目标文件的主要过程是

#choices([预处理→编译→汇编→链接], [预处理→汇编→编译→链接], [预处理→编译→链接→汇编], [预处理→汇编→链接→编译])
]

#question[
下列关于中断 I/O 方式的叙述中，#emphasis[不正确]的是

#choices(
  [适用于键盘、针式打印机等字符型设备],
  [外设和主机之间的数据传送通过软件完成],
  [外设准备数据的时间应小于中断处理时间],
  [外设为某进程准备数据时 CPU 可运行其他进程],
)
]

#question[
下列关于并行处理技术的叙述中，#emphasis[不正确]的是

#choices([多核处理器属于 MIMD 结构], [向量处理器属于 SIMD 结构], [硬件多线程技术只可用于多核处理器], [SMP 中所有处理器共享单一物理地址空间])
]

#question[
下列关于多道程序系统的叙述中，#emphasis[不正确]的是

#choices([支持进程的并发执行], [不必支持虚拟存储管理], [需要实现对共享资源的管理], [进程数越多 CPU 利用率越高])
]

#question[
下列选项中，需要在操作系统进行初始化过程中创建的是

#choices([中断向量表], [文件系统的根目录], [硬盘分区表], [文件系统的索引节点表])
]

#question[
进程 P0、P1、P2 和 P3 进入就绪队列的时刻、优先级（值越小优先权越高）及 CPU 执行时间如下表所示。

#align(center, table(columns: (4em, 14em, 5em, 9em), align: center,
  [进程], [进入就绪队列的时刻], [优先级], [CPU执行时间],
  [P0], [0 ms], [15], [100 ms],
  [P1], [10 ms], [20], [60 ms],
  [P2], [10 ms], [10], [20 ms],
  [P3], [15 ms], [6], [10 ms],
))

若系统采用基于优先权的抢占式进程调度算法，则从0 ms时刻开始调度，到4个进程都运行结束为止，发生进程调度的总次数为

#choices([4], [5], [6], [7])
]

#question[
系统中有三个进程 P0、P1、P2 及三类资源 A、B、C。若某时刻系统分配资源的情况如下表所示，则此时系统中存在的安全序列的个数为

#align(center, table(columns: (4em,) + (3em,) * 9, align: center + horizon,
  table.cell(rowspan: 2)[进程],
  table.cell(colspan: 3)[已分配资源数], table.cell(colspan: 3)[尚需资源数], table.cell(colspan: 3)[可用资源数],
  [A], [B], [C], [A], [B], [C], [A], [B], [C],
  [P0], [2], [0], [1], [0], [2], [1],
  table.cell(rowspan: 3)[1], table.cell(rowspan: 3)[3], table.cell(rowspan: 3)[2],
  [P1], [0], [2], [0], [1], [2], [3],
  [P2], [1], [0], [1], [0], [1], [3],
))

#choices([1], [2], [3], [4])
]

#question[
下列关于 CPU 模式的叙述中，正确的是

#choices([CPU 处于用户态时只能执行特权指令], [CPU 处于内核态时只能执行特权指令], [CPU 处于用户态时只能执行非特权指令], [CPU 处于内核态时只能执行非特权指令])
]

#question[
下列事件或操作中，可能导致进程 P 由执行态变为阻塞态的是

#statements(columns: (1fr, 1.4fr), [Ⅰ．进程 P 读文件], [Ⅱ．进程 P 的时间片用完],
  [Ⅲ．进程 P 申请外设], [Ⅳ．进程 P 执行信号量的 wait() 操作],
)

#choices([Ⅰ、Ⅳ], [Ⅱ、Ⅲ], [Ⅲ、Ⅳ], [Ⅰ、Ⅲ、Ⅳ])
]

#question[
某进程访问的页 b 不在内存中，导致产生缺页异常，该缺页异常处理过程中#emphasis[不一定]包含的操作是

#choices([淘汰内存中的页], [建立页号与页框号的对应关系], [将页 b 从外存读入内存], [修改页表中页 b 对应的存在位])
]

#question[
下列选项中，#emphasis[不会]影响系统缺页率的是

#choices([页置换算法], [工作集的大小], [进程的数量], [页缓冲队列的长度])
]

#question[
执行系统调用时的过程涉及下列操作，其中由操作系统完成的是

#statements(columns: (1fr, 1fr), [Ⅰ．保存断点和程序状态字], [Ⅱ．保存通用寄存器的内容],
  [Ⅲ．执行系统调用服务例程], [Ⅳ．将 CPU 模式改为内核态],
)

#choices([Ⅰ、Ⅲ], [Ⅱ、Ⅲ], [Ⅱ、Ⅳ], [Ⅱ、Ⅲ、Ⅳ])
]

#question[
下列关于驱动程序的叙述中，#emphasis[不正确]的是

#choices([驱动程序与 I/O 控制方式无关], [初始化设备是由驱动程序控制完成的], [进程在执行驱动程序时可能进入阻塞态], [读/写设备的操作是由驱动程序控制完成的])
]

#question[
在 ISO/OSI 参考模型中，实现两个相邻结点间流量控制功能的是

#choices([物理层], [数据链路层], [网络层], [传输层])
]

#question[
在一条带宽为200 kHz的无噪声信道上，若采用4个幅值的 ASK 调制，则该信道的最大数据传输速率是

#choices([200 kb/s], [400 kb/s], [800 kb/s], [1 600 kb/s])
]

#question[
若某主机的 IP 地址是183.80.72.48，子网掩码是255.255.192.0，则该主机所在网络的网络地址是

#choices([183.80.0.0], [183.80.64.0], [183.80.72.0], [183.80.192.0])
]

#question[
下图所示网络中的主机 H 的子网掩码与默认网关分别是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: 0.045em)
  line((0,3),(15,3),(15,0),(21,0))
  content((0,3), std.rect(radius: 1em, fill: luma(90%), stroke: none, inset: 0.5em)[Internet])
  for x in (6,15) {
    rect((x - 0.9,2.3),(x + 0.9,3.3), fill: white)
    circle((x,3.3), radius: (0.9,0.3), fill: white)
    for (a,b) in (((x - 0.6,3.4),(x + 0.5,3.15)),((x - 0.5,3.1),(x + 0.6,3.4))) {
      line(a,b, mark: (end: "stealth", scale: 0.6))
    }
  }
  content((6,1.7), [路由器])
  content((10.4,3.7), text(size: 0.8em)[192.168.1.1/30])
  content((16.2,1.7), text(size: 0.8em)[192.168.1.62/27], anchor: "west")
  content((15,0), std.rect(fill: white, inset: 0.3em, stroke: 0.045em)[⇄])
  content((13,-0.1), [交换机], anchor: "east")
  content((21,0), image("../2012/assets/visio-2007-isometric-pc.png", width: 2.5em))
  content((23,0), text(size: 0.8em)[H\ 192.168.1.60], anchor: "west")
}))

#choices(
  [255.255.255.192，192.168.1.1],
  [255.255.255.192，192.168.1.62],
  [255.255.255.224，192.168.1.1],
  [255.255.255.224，192.168.1.62],
)
]

#question[
在 SDN 网络体系结构中，SDN 控制器向数据平面的 SDN 交换机下发流表时所使用的接口是

#choices([东向接口], [南向接口], [西向接口], [北向接口])
]

#question[
假设主机甲和主机乙已建立一个 TCP 连接，最大段长 MSS = 1 KB，甲一直有数据向乙发送，当甲的拥塞窗口为16 KB时，计时器发生了超时，则甲的拥塞窗口再次增长到16 KB所需要的时间至少是

#choices([4 RTT], [5 RTT], [11 RTT], [16 RTT])
]

#question[
假设客户 C 和服务器 S 已建立一个 TCP 连接，通信往返时间 RTT = 50 ms，最长报文段寿命 MSL = 800 ms，数据传输结束后，C 主动请求断开连接。若从 C 主动向 S 发出 FIN 段时刻算起，则 C 和 S 进入 CLOSED 状态所需的时间至少分别是

#choices([850 ms，50 ms], [1 650 ms，50 ms], [850 ms，75 ms], [1 650 ms，75 ms])
]

#question[
假设主机 H 通过 HTTP/1.1 请求浏览某 Web 服务器 S 上的 Web 页 news408.html，news408.html 引用了同目录下1个图像，news408.html 文件大小为1 MSS（最大段长），图像文件大小为3 MSS，H 访问 S 的往返时间 RTT = 10 ms，忽略 HTTP 响应报文的首部开销和 TCP 段传输时延。若 H 已完成域名解析，则从 H 请求与 S 建立 TCP 连接时刻起，到接收到全部内容止，所需的时间至少是

#choices([30 ms], [40 ms], [50 ms], [60 ms])
]

= 二、综合应用题：41～47小题，共70分。

#question[
（13分）已知非空二叉树 $T$ 的结点值均为正整数，采用顺序存储方式保存，数据结构定义如下：

```c
typedef struct {                  // MAX_SIZE为已定义常量
    int SqBiTNode[MAX_SIZE];       // 保存二叉树结点值的数组
    int ElemNum;                  // 实际占用的数组元素个数
} SqBiTree;
```

$T$ 中不存在的结点在数组 SqBiTNode 中用−1表示。例如，对于下图所示的两棵非空二叉树 $T_1$ 和 $T_2$，$T_1$ 的存储结果如下：

#grid(columns: (1fr, 1fr), column-gutter: 2em,
  align(center, figure(diagram(
    node-stroke: 0.045em, node-outset: 0.15em, edge-stroke: 0.045em,
    node((0,0), [40], name: <a>, radius: 0.55em),
    node((-1.6,1.5), [25], name: <b>, radius: 0.55em),
    node((1.6,1.5), [60], name: <c>, radius: 0.55em),
    node((0,3), [30], name: <d>, radius: 0.55em),
    node((3.2,3), [80], name: <e>, radius: 0.55em),
    node((-1.6,4.5), [27], name: <f>, radius: 0.55em),
    edge(<a>,<b>), edge(<a>,<c>), edge(<b>,<d>), edge(<c>,<e>), edge(<d>,<f>),
    spacing: 1em,
  ), caption: [二叉树 $T_1$], numbering: none)),
  align(center, figure(diagram(
    node-stroke: 0.045em, node-outset: 0.15em, edge-stroke: 0.045em,
    node((0,0), [40], name: <a>, radius: 0.55em),
    node((-1.6,1.5), [50], name: <b>, radius: 0.55em),
    node((1.6,1.5), [60], name: <c>, radius: 0.55em),
    node((0,3), [30], name: <d>, radius: 0.55em),
    node((1.6,4.5), [35], name: <e>, radius: 0.55em),
    edge(<a>,<b>), edge(<a>,<c>), edge(<b>,<d>), edge(<d>,<e>),
    spacing: 1em,
  ), caption: [二叉树 $T_2$], numbering: none)),
)

#align(center, table(columns: (9em,) + (2em,) * 12, align: center, stroke: none,
  [T1.SqBiTNode], ..(40,25,60,-1,30,-1,80,-1,-1,27,"","").map(v => table.cell(stroke: 0.5pt)[#v]),
  table.cell(colspan: 13, align: left)[T1.ElemNum = 10],
))

$T_2$ 的存储结果如下：

#align(center, table(columns: (9em,) + (2em,) * 12, align: center, stroke: none,
  [T2.SqBiTNode], ..(40,50,60,-1,30,-1,-1,-1,-1,-1,35,"").map(v => table.cell(stroke: 0.5pt)[#v]),
  table.cell(colspan: 13, align: left)[T2.ElemNum = 11],
))

请设计一个尽可能高效的算法，判定一棵采用这种方式存储的二叉树是否为二叉搜索树，若是，则返回 true，否则，返回 false。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++语言描述算法，关键之处给出注释。

]
]

#question[
（10分）现有 $n (n > 100000)$ 个数保存在一维数组 M 中，需要查找 M 中最小的10个数。请回答下列问题。

#subquestions[
+ 设计一个完成上述查找任务的算法，要求平均情况下的比较次数尽可能少，简述其算法思想（不需要程序实现）。
+ 说明你所设计的算法平均情况下的时间复杂度和空间复杂度。

]
]

#question[
（15分）某 CPU 中部分数据通路如题43图所示，其中，GPRs 为通用寄存器组，FR 为标志寄存器，用于存放 ALU 产生的标志信息；带箭头虚线表示控制信号，如控制信号 Read、Write 分别表示主存读、主存写，MDRin 表示内部总线上数据写入 MDR，MDRout 表示 MDR 的内容读到内部总线。

#figure(align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: 0.045em)
  rect((3,-6),(27,4.5))
  line((0,5.5),(27,5.5), mark: (start: "stealth", end: "stealth", scale: 0.7))
  line((3.3,1),(26.7,1), stroke: 0.3em, mark: (start: "stealth", end: "stealth", scale: 0.5))
  content((6.8,1.7), text(size: 0.85em)[内部总线])
  rect((0,-1),(2,3.4))
  content((1,1.2), [主\ 存\ 储\ 器])
  line((1,3.4),(1,5.5), stroke: 0.15em, mark: (start: "stealth", end: "stealth", scale: 0.5))
  for (x,label) in ((4.6,[MAR]),(10.2,[MDR]),(16,[PC])) {
    rect((x - 1.1,2.8),(x + 1.1,3.8), fill: white)
    content((x,3.3), label)
    line((x,1),(x,2.8), mark: (end: "stealth", scale: 0.65))
  }
  line((4.6,3.8),(4.6,5.5), mark: (end: "stealth", scale: 0.65))
  line((10.2,3.8),(10.2,5.5), mark: (start: "stealth", end: "stealth", scale: 0.65))
  line((10.5,2.8),(10.5,1), mark: (end: "stealth", scale: 0.65))
  line((16.3,2.8),(16.3,1), mark: (end: "stealth", scale: 0.65))
  rect((20,2),(22.2,3), fill: white)
  content((21.1,2.5), [IR])
  line((21.1,1),(21.1,2), mark: (end: "stealth", scale: 0.65))
  line((20.7,3),(20.7,3.8), mark: (end: "stealth", scale: 0.65))
  line((21.5,3),(21.5,3.8), mark: (end: "stealth", scale: 0.65))
  content((21.1,4.1), text(size: 0.75em)[送CU等部件])
  for (a,b,label,pos) in (
    ((7.2,3.3),(5.7,3.3),[MARin],(7,3.8)),
    ((12.8,3.3),(11.3,3.3),[MDRin],(12.6,3.8)),
    ((12.8,1.8),(10.5,1.8),[MDRout],(12.6,2.3)),
    ((18.4,3.3),(17.1,3.3),[PCin],(18.2,3.8)),
    ((18.4,1.8),(16.3,1.8),[PCout],(18.2,2.3)),
    ((24,2.5),(22.2,2.5),[IRin],(23.7,3)),
    ((25,3.5),(25,5.5),[Read],(24.2,3.3)),
    ((26,2.7),(26,5.5),[Write],(26,2.3)),
  ) {
    line(a,b, stroke: (dash: "dashed"), mark: (end: "stealth", scale: 0.55))
    content(pos, text(size: 0.75em, label))
  }
  rect((4,-1.3),(6.2,-0.3), fill: white)
  content((5.1,-0.8), [Y])
  line((5.1,1),(5.1,-0.3), mark: (end: "stealth", scale: 0.6))
  line((5.1,-1.3),(5.1,-2),(9,-2),(9,-0.2),(11,-0.2),(11,-1.1), mark: (end: "stealth", scale: 0.6))
  line((13.5,1),(13.5,-1.1), mark: (end: "stealth", scale: 0.6))
  line((10.2,-1.1),(14.4,-1.1),(13.5,-2.5),(11.2,-2.5),close: true,fill:white)
  content((12.3,-1.7), [ALU])
  content((11.3,-0.6), text(size: 0.8em)[A])
  content((14,-0.6), text(size: 0.8em)[B])
  content((10.3,0.3), text(size: 0.75em)[16])
  content((13.2,0.3), text(size: 0.75em)[16])
  line((12.3,-2.5),(12.3,-3.8), mark: (end: "stealth", scale: 0.6))
  content((13,-3), text(size: 0.8em)[F])
  content((11.8,-3), text(size: 0.75em)[16], anchor: "east")
  rect((11.2,-4.8),(13.4,-3.8), fill: white)
  content((12.3,-4.3), [Z])
  line((12.3,-4.8),(12.3,-5.6),(16.5,-5.6),(16.5,1), mark: (end: "stealth", scale: 0.6))
  rect((7.5,-4.8),(10.5,-3.8), fill: white)
  content((9,-4.3), text(size: 0.8em)[SF OF ⋯])
  content((7.3,-4.3), [FR], anchor: "east")
  line((12.3,-3.1),(9,-3.1),(9,-3.8), mark: (end: "stealth", scale: 0.6))
  rect((20,-3),(23,-0.6), fill: white)
  content((21.5,-1.8), [GPRs])
  line((20.8,1),(20.8,-0.6), mark: (end: "stealth", scale: 0.6))
  line((23,-1.3),(24,-1.3),(24,1), mark: (end: "stealth", scale: 0.6))
  for (a,b,label,pos) in (
    ((7.5,-0.8),(6.2,-0.8),[Yin],(7.2,-0.3)),
    ((15.5,-1.7),(14,-1.7),[ALUop],(15.7,-2.2)),
    ((18.8,-4.6),(16.5,-4.6),[Zout],(18.6,-4.1)),
    ((25.8,-0.3),(24,-0.3),[GPRout],(25.2,-0.9)),
    ((21.5,-4.5),(21.5,-3),[GPRin],(21.5,-5)),
  ) {
    line(a,b, stroke: (dash: "dashed"), mark: (end: "stealth", scale: 0.55))
    content(pos, text(size: 0.75em, label))
  }
  line((18.7,-2.3),(20,-2.3), mark: (end:"stealth", scale:0.6))
  line((24.3,-2.3),(23,-2.3), mark: (end:"stealth", scale:0.6))
  content((18.3,-2.3), text(size:0.8em)[rd], anchor:"east")
  content((24.6,-2.3), text(size:0.8em)[rs], anchor:"west")
  content((19.2,-1.9), text(size:0.7em)[4])
  content((23.8,-1.9), text(size:0.7em)[4])
})), caption: [题43图], numbering: none)

请回答下列问题。

#subquestions[
+ 设 ALU 的输入端 A、B 及输出端 F 的最高位分别为 $A_15$、$B_15$ 及 $F_15$，FR 中的符号标志和溢出标志分别为 SF 和 OF，则 SF 的逻辑表达式是什么？A 加 B、A 减 B 时 OF 的逻辑表达式分别是什么？要求逻辑表达式的输入变量为 $A_15$、$B_15$ 及 $F_15$。
+ 为什么要设置暂存器 Y 和 Z？
+ 若 GPRs 的输入端 rs、rd 分别为所读、写的通用寄存器的编号，则 GPRs 中最多有多少个通用寄存器？rs 和 rd 来自图中的哪个寄存器？已知 GPRs 内部有一个地址译码器和一个多路选择器，rd 应连接地址译码器还是多路选择器？
+ 取指令阶段（不考虑 PC 增量操作）的控制信号序列是什么？若从发出主存读命令到主存读出数据并传送到 MDR 共需5个时钟周期，则取指令阶段至少需要几个时钟周期？
+ 图中控制信号由什么部件产生？图中哪些寄存器的输出信号会连到该部件的输入端？

]
]

#question[
（8分）假设某磁盘驱动器中有4个双面盘片，每个盘面有20 000个磁道，每个磁道有500个扇区，每个扇区可记录512字节的数据，盘片转速为7 200 r/m（转/分），平均寻道时间为5 ms。请回答下列问题。

#subquestions[
+ 每个扇区包含数据及其地址信息，地址信息分为3个字段。这3个字段的名称各是什么？对于该磁盘，各字段至少占多少位？
+ 一个扇区的平均访问时间约为多少？
+ 若采用周期挪用 DMA 方式进行磁盘与主机之间的数据传送，磁盘控制器中的数据缓冲区大小为64位，则在一个扇区读写过程中，DMA 控制器向 CPU 发送了多少次总线请求？若 CPU 检测到 DMA 控制器的总线请求信号时也需要访问主存，则 DMA 控制器是否可以获得总线使用权？为什么？

]
]

#question[
（7分）某文件系统的磁盘块大小为4 KB，目录项由文件名和索引节点号构成，每个索引节点占256字节，其中包含直接地址项10个，一级、二级和三级间接地址项各1个，每个地址项占4字节。该文件系统中子目录 stu 的结构如题45（a）图所示，stu 包含子目录 course 和文件 doc，course 子目录包含文件 course1 和 course2。各文件的文件名、索引节点号、占用磁盘块的块号如题45（b）图所示。

#grid(columns: (1fr, 1.2fr), column-gutter: 2em,
  figure(align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(stroke: 0.045em)
    line((0,4),(0,-3),(2,-3))
    line((0,2),(2,2),(2,-1.5),(4,-1.5))
    line((2,0),(4,0))
    for (x,y,label,folder) in ((0,4,[stu],true),(2,2,[course],true),(4,0,[course1],false),(4,-1.5,[course2],false),(2,-3,[doc],false)) {
      if folder {
        line((x - 0.4,y - 0.35),(x - 0.4,y + 0.35),(x,y + 0.35),(x + 0.15,y + 0.15),(x + 0.6,y + 0.15),(x + 0.6,y - 0.35),close:true, fill:luma(90%))
      } else {
        rect((x - 0.3,y - 0.45),(x + 0.4,y + 0.45),fill:white)
        for dy in (-0.25,-0.05,0.15) {line((x - 0.15,y + dy),(x + 0.25,y + dy))}
      }
      content((x + 0.8,y), text(size:0.85em,label),anchor:"west")
    }
  })), caption: [题45（a）图], numbering: none),
  figure(table(columns: (6em,7em,6em), align: center,
    [文件名], [索引节点号], [磁盘块号],
    [stu], [1], [10],
    [course], [2], [20],
    [course1], [10], [30],
    [course2], [100], [40],
    [doc], [10], [$x$],
  ), caption: [题45（b）图], numbering: none),
)

请回答下列问题。

#subquestions[
+ 目录文件 stu 中每个目录项的内容是什么？
+ 文件 doc 占用的磁盘块的块号 $x$ 的值是多少？
+ 若目录文件 course 的内容已在内存，则打开文件 course1 并将其读入内存，需要读几个磁盘块？说明理由。
+ 若文件 course2 的大小增长到6 MB，则为了存取 course2 需要使用该文件索引节点的哪几级间接地址项？说明理由。

]
]

#question[
（8分）某进程的两个线程 T1 和 T2 并发执行 A、B、C、D、E 和 F 共6个操作，其中 T1 执行 A、E 和 F，T2 执行 B、C 和 D。题46图表示上述6个操作的执行顺序所必须满足的约束：C 在 A 和 B 完成后执行，D 和 E 在 C 完成后执行，F 在 E 完成后执行。请使用信号量的 wait()、signal() 操作描述 T1 和 T2 之间的同步关系，并说明所用信号量的作用及其初值。

#figure(align(center, diagram(
  spacing: 1em, node-stroke: 0.045em, edge-stroke: 0.045em,
  node((0,0),text(size:0.85em)[A],name:<a>,radius:0.7em),
  node((0,3),text(size:0.85em)[B],name:<b>,radius:0.7em),
  node((3,1.5),text(size:0.85em)[C],name:<c>,radius:0.7em),
  node((6,0),text(size:0.85em)[D],name:<d>,radius:0.7em),
  node((6,3),text(size:0.85em)[E],name:<e>,radius:0.7em),
  node((9,1.5),text(size:0.85em)[F],name:<f>,radius:0.7em),
  edge(<a>,<c>,"->"),edge(<b>,<c>,"->"),edge(<c>,<d>,"->"),edge(<c>,<e>,"->"),edge(<e>,<f>,"->"),
)), caption: [题46图], numbering: none)
]

#question[
（9分）某网络拓扑如题47图所示，R 为路由器，S 为以太网交换机，AP 是802.11接入点，路由器的 E0 接口和 DHCP 服务器的 IP 地址配置如图中所示；H1 与 H2 属于同一个广播域，但不属于同一个冲突域；H2 和 H3 属于同一个冲突域；H4 和 H5 已经接入网络，并通过 DHCP 动态获取了 IP 地址。现有路由器、100BaseT 以太网交换机和100BaseT 集线器（Hub）三类设备各若干台。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.045em)
  // 大纲 PDF 第 45 页；设备采用原始 Visio 矢量，文字和连接线独立重画。
  let p(x,y)=((x - 195) / 35,(1380 - y) / 35)
  let label(x,y,body)=content(p(x,y),text(size:0.72em,body))
  let icon(x,y,w,name)=content(p(x,y),image("official-images/network-"+name+".png",width:w / 35 * 1em))
  let vector(x,y,w,h,name)=content(p(x,y),image("../2012/assets/visio-2003-"+name+".svg",width:w / 35 * 1em,height:h / 35 * 1em,fit:"stretch"))
  for (a,b) in (((345,1075),(916,1075)),((456,1075),(456,1318)),
    ((285,1198),(456,1198)),((285,1318),(606,1318)),((760,1075),(760,1198))) {line(p(..a),p(..b))}
  vector(275,1078,160,77,"cloud")
  content(p(275,1078),text(size:0.72em,fill:white,[Internet]))
  vector(459,1076,80,73,"router"); label(459,1094,[R])
  vector(760,1081,77,65,"switch"); vector(911,1071,65,85,"server")
  label(572,1000,[192.168.0.1/25]); label(589,1025,[00-11-11-11-11-A1])
  label(513,1061,[E0]); label(734,1038,[S])
  for (y,body) in ((1136,[DHCP服务器]),(1162,[192.168.0.2/25]),(1188,[00-11-11-11-11-B1])) {label(915,y,body)}
  for (x,y,name) in ((275,1192,[H1]),(275,1314,[H2]),(605,1314,[H3])) {
    vector(x,y,88,80,"pc"); label(x+6,y+51,name)
  }
  for (y,name) in ((1198,[设备1]),(1318,[设备2])) {
    rect(p(419,y - 31),p(491,y+31),fill:white); label(455,y,name)
  }
  icon(769,1192,52,"ap"); label(719,1186,[AP]); label(613,1209,[00-11-11-11-11-C1])
  for (x,y,name,ip,mac) in ((754,1301,[H4],[192.168.0.3/25],[00-11-11-11-11-D1]),
    (922,1240,[H5],[192.168.0.4/25],[00-11-11-11-11-E1])) {
    vector(x,y+5,63,46,"laptop"); label(x - 50,y+3,name)
    // 无线波纹属于题图标记，不属于笔记本设备图标。
    for dx in (0,6,12) {
      bezier(p(x+12+dx,y - 21),p(x+13+dx,y - 35),p(x+17+dx,y - 25),p(x+17+dx,y - 32))
    }
    label(x,y+47,ip); label(x,y+78,mac)
  }
})),caption: [题47图],kind: image)


#subquestions[
+ 设备1和设备2应该分别选择哪类设备？
+ 若信号传播速率为 $2 times 10^8$ m/s，以太网最小帧长为64 B，信号通过设备2时会产生额外的1.51 μs的时间延迟，则 H2 与 H3 之间可以相距的最远距离是多少？
+ 在 H4 通过 DHCP 动态获取 IP 地址过程中，H4 首先发送了 DHCP 报文 M，M 是哪种 DHCP 报文？路由器 E0 接口能否收到封装 M 的以太网帧？S 向 DHCP 服务器转发的封装 M 的以太网帧的目的 MAC 地址是什么？
+ 若 H4 向 H5 发送一个 IP 分组 P，则 H5 收到的封装 P 的802.11帧的地址1、地址2和地址3分别是什么？

]
]
