#import "../../template.typ": exam, choices, subquestions, inline-node
#show: exam.with(year: 2012, subject: "计算机学科专业基础", code: "408")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz

#set document(title: "2012年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题")
= 一、单项选择题：第1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项是最符合题目要求的。
#question[
求整数 $n$（$n >= 0$）阶乘的算法如下，其时间复杂度是

```c
int fact(int n) {
    if (n <= 1) return 1;
    return n * fact(n - 1);
}
```

#choices(
  [$O \( log_2 n \)$],
  [O(n)],
  [$O \( n log_2 n \)$],
  [$O \( n^2 \)$],
)
]

#question[
已知操作符包括“+”、“-”、“\*”、“/”、“（”和“）”。将中缀表达式
$(a + b - a) ast ((c + d) \/ (e - f)) + g$转换为等价的后缀表达式
$a b + a c d + e \/ f - ast - g +$时，用栈来存放暂时还不能确定运算次序的操作符。若栈初始时为空，则转换过程中同时保存在栈中的操作符的最大个数是

#choices(
  [5],
  [7],
  [8],
  [11],
)
]

#question[
若一棵二叉树的前序遍历序列为
a,e,b,d,c，后序遍历序列为 b,c,d,e,a，则根结点的孩子结点

#choices(
  [只有e],
  [有e、b],
  [有e、c],
  [无法确定],
)
]

#question[
若平衡二叉树的高度为6，且所有非叶结点的平衡因子均为1，则该平衡二叉树的结点总数为

#choices(
  [12],
  [20],
  [32],
  [33],
)
]

#question[
对有
n个顶点、e条边且使用邻接表存储的有向图进行广度优先遍历，其算法的时间复杂度是

#choices(
  [O(n)],
  [O(e)],
  [O(n+e)],
  [O(n×e)],
)
]

#question[
若用邻接矩阵存储有向图，矩阵中主对角线以下的元素均为零，则关于该图拓扑序列的结论是

#choices(
  [存在，且唯一],
  [存在，且不唯一],
  [存在，可能不唯一],
  [无法确定是否存在],
)
]

#question[
对如下有向带权图，若采用迪杰斯特拉（Dijkstra）算法求从源点 a
到其他各顶点的最短路径，则得到的第一条最短路径的目标顶点是
b，第二条最短路径的目标顶点是
c，后续得到的其余各最短路径的目标顶点依次是

#align(center)[
  #cetz.canvas(length:1em,{
    import cetz.draw: *
    // 2013 大纲 PDF 第 46 页；边权固定在原图对应的一侧，避免自动避让改变含义。
    let p(x,y)=((x - 365) / 34,(837 - y) / 34)
    let ps=((365,747),(550,658),(550,837),(735,658),(735,837),(920,747)).map(q=>p(..q))
    set-style(stroke:0.055em,content:(wrap:body=>box(text(size:0.85em,top-edge:"bounds",bottom-edge:"bounds",body))))
    for (a,b,x,y,label) in ((0,1,448,681,[2]),(0,2,432,805,[5]),
      (1,2,532,747,[1]),(1,3,645,641,[3]),(2,3,620,744,[3]),
      (2,4,646,860,[4]),(3,4,718,747,[1]),(3,5,822,681,[4]),
      (2,5,794,756,[1]),(4,5,830,813,[1])) {
      let u=ps.at(a); let v=ps.at(b)
      let dx=v.at(0)-u.at(0); let dy=v.at(1)-u.at(1)
      let d=calc.sqrt(dx*dx+dy*dy)
      line((u.at(0)+0.64*dx/d,u.at(1)+0.64*dy/d),(v.at(0)-0.64*dx/d,v.at(1)-0.64*dy/d),mark:(end:">",fill:black,scale:0.65))
      content(p(x,y),label)
    }
    for (q,label) in ps.zip(([a],[b],[c],[d],[e],[f])) {
      circle(q,radius:0.64,fill:white)
      content(q,label)
    }
  })
]

#choices(
  [d,e,f],
  [e,d,f],
  [f,d,e],
  [f,e,d],
)
]

#question[
下列关于最小生成树的叙述中，正确的是

I. 最小生成树的代价唯一

Ⅱ. 权值最小的边一定会出现在所有的最小生成树中

Ⅲ. 使用普里姆（Prim）算法从不同顶点开始得到的最小生成树一定相同

Ⅳ. 使用普里姆算法和克鲁斯卡尔（Kruskal）算法得到的最小生成树总不相同

#choices(
  [仅Ⅰ],
  [仅Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅳ],
)
]

#question[
设有一棵3阶B树，如下图所示。删除关键字78得到一棵新B树，其最右叶结点所含的关键字是

#align(center)[
  #diagram(
    node-stroke: 0.055em,
    node-fill: white,
    edge-stroke: 0.055em,
    spacing: (0.35em, 1.15em),
    node((0, 0), text(size: 0.88em)[45], width: 2.2em, height: 1.30em, inset: 0pt),
    node((-2.55, 1.55), text(size: 0.88em)[17#h(0.35em)35], width: 3.2em, height: 1.30em, inset: 0pt),
    node((2.55, 1.55), text(size: 0.88em)[55#h(0.35em)65], width: 3.2em, height: 1.30em, inset: 0pt),
    node((-4.05, 3.10), text(size: 0.88em)[10], width: 2em, height: 1.30em, inset: 0pt),
    node((-2.55, 3.10), text(size: 0.88em)[21], width: 2em, height: 1.30em, inset: 0pt),
    node((-1.05, 3.10), text(size: 0.88em)[37], width: 2em, height: 1.30em, inset: 0pt),
    node((1.05, 3.10), text(size: 0.88em)[47], width: 2em, height: 1.30em, inset: 0pt),
    node((2.55, 3.10), text(size: 0.88em)[60#h(0.35em)62], width: 3.2em, height: 1.30em, inset: 0pt),
    node((4.05, 3.10), text(size: 0.88em)[78], width: 2em, height: 1.30em, inset: 0pt),
    edge((0, 0), (-2.55, 1.55)),
    edge((0, 0), (2.55, 1.55)),
    edge((-2.55, 1.55), (-4.05, 3.10)),
    edge((-2.55, 1.55), (-2.55, 3.10)),
    edge((-2.55, 1.55), (-1.05, 3.10)),
    edge((2.55, 1.55), (1.05, 3.10)),
    edge((2.55, 1.55), (2.55, 3.10)),
    edge((2.55, 1.55), (4.05, 3.10)),
  )
]

#choices(
  [60],
  [60,62],
  [62,65],
  [65],
)
]

#question[
排序过程中，对尚未确定最终位置的所有元素进行一遍处理称为一趟排序。下列排序方法中，每一趟排序结束时都至少能够确定一个元素最终位置的方法是

I. 简单选择排序 II. 希尔排序 III. 快速排序

IV. 堆排序 V. 二路归并排序

#choices(
  [仅Ⅰ、Ⅲ、Ⅳ],
  [仅Ⅰ、Ⅲ、V],
  [仅Ⅱ、Ⅲ、Ⅳ],
  [仅Ⅲ、Ⅳ、V],
)
]

#question[
对同一待排序列分别进行折半插入排序和直接插入排序，两者之间可能的不同之处是

#choices(
  [排序的总趟数],
  [元素的移动次数],
  [使用辅助空间的数量],
  [元素之间的比较次数],
)
]

#question[
假定基准程序
A在某计算机上的运行时间为100秒，其中90秒为CPU时间，其余为
I/O时间。若CPU速度提高 50% ，I/O速度不变，则运行基准程序 A所耗费的时间是

#choices(
  [55秒],
  [60秒],
  [65秒],
  [70秒],
)
]

#question[
假定编译器规定 int 和 short 类型长度分别为 32
位和 16 位，执行下列 C 语言语句：

```c
unsigned short x = 65530;
unsigned int y = x;
```

得到 y的机器数为

#choices(
  [0000 7FFAH],
  [0000 FFFAH],
  [FFFF 7FFAH],
  [FFFF FFFAH],
)
]

#question[
float类型（即IEEE754单精度浮点数格式）能表示的最大正整数是

#choices(
  [$2^(1 2 6) - 2^(1 0 3)$],
  [$2^(1 2 7) - 2^(1 0 4)$],
  [$2^(1 2 7) - 2^(1 0 3)$],
  [$2^(1 2 8) - 2^(1 0 4)$],
)
]

#question[
某计算机存储器按字节编址，采用小端方式存放数据。假定编译器规定 int 和
short
型长度分别为32位和16位，并且数据按边界对齐存储。某C语言程序段如下：

```c
struct {
    int a;
    char b;
    short c;
} record;
record.a = 273;
```

若 record 变量的首地址为 0xC008，则地址 0xC008 中内容及 record.c
的地址分别为

#choices(
  [0x00、0xC00D],
  [0x00、0xC00E],
  [0x11、0xC00D],
  [0x11、0xC00E],
)
]

#question[
下列关于闪存（Flash Memory）的叙述中，错误的是

#choices(
  [信息可读可写，并且读、写速度一样快],
  [存储元由MOS管组成，是一种半导体存储器],
  [掉电后信息不丢失，是一种非易失性存储器],
  [采用随机访问方式，可替代计算机外部存储器],
)
]

#question[
假设某计算机按字编址，Cache有4个行，Cache和主存之间交换的块大小为1个字。若
Cache的内容初始为空，采用2路组相联映射方式和LRU替换算法，当访问的主存地址依次为0,4,8,2,0,6,8,6,4,8时，命中Cache的次数是

#choices(
  [1],
  [2],
  [3],
  [4],
)
]

#question[
#strike[某计算机的控制器采用微程序控制方式，微指令中的操作控制字段采用字段直接编码法，共有33个微命令，构成5个互斥类，分别包含7、3、12、5和6个微命令，则操作控制字段至少有

#choices(
  [5位],
  [6位],
  [15位],
  [33位],
)
]
]

#question[
某同步总线的时钟频率为100
MHz，宽度为32位，地址/数据线复用，每传输一个地址或数据占用一个时钟周期。若该总线支持突发（猝发）传输方式，则一次“主存写”总线事务传输128位数据所需要的时间至少是

#choices(
  [20 ns],
  [40 ns],
  [50 ns],
  [80 ns],
)
]

#question[
下列关于USB总线特性的描述中，错误的是

#choices(
  [可实现外设的即插即用和热插拔],
  [可通过级联方式连接多台外设],
  [是一种通信总线，可连接不同外设],
  [同时可传输2位数据，数据传输率高],
)
]

#question[
下列选项中，在 I/O 总线的数据线上传输的信息包括

I. I/O接口中的命令字 II. I/O接口中的状态字 III.
中断类型号

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ、Ⅲ],
)
]

#question[
响应外部中断的过程中，中断隐指令完成的操作，除保护断点外，还包括

I. 关中断 II. 保存通用寄存器的内容

Ⅲ. 形成中断服务程序入口地址并送PC

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ、Ⅲ],
)
]

#question[
下列选项中，不可能在用户态发生的事件是

#choices(
  [系统调用],
  [外部中断],
  [进程切换],
  [缺页],
)
]

#question[
中断处理和子程序调用都需要压栈以保护现场，中断处理一定会保存而子程序调用不需要保存其内容的是

#choices(
  [程序计数器],
  [程序状态字寄存器],
  [通用数据寄存器],
  [通用地址寄存器],
)
]

#question[
下列关于虚拟存储的叙述中，正确的是

#choices(
  [虚拟存储只能基于连续分配技术],
  [虚拟存储只能基于非连续分配技术],
  [虚拟存储容量只受外存容量的限制],
  [虚拟存储容量只受内存容量的限制],
)
]

#question[
操作系统的 I/O
子系统通常由四个层次组成，每一层明确定义了与邻近层次的接口。其合理的层次组织排列顺序是

#choices(
  [用户级 I/O 软件、设备无关软件、设备驱动程序、中断处理程序],
  [用户级 I/O 软件、设备无关软件、中断处理程序、设备驱动程序],
  [用户级 I/O 软件、设备驱动程序、设备无关软件、中断处理程序],
  [用户级 I/O 软件、中断处理程序、设备无关软件、设备驱动程序],
)
]

#question[
假设5个进程P0、P1、P2、P3、P4共享三类资源R1、R2、R3，这些资源总数分别为18、6、
22。T0时刻的资源分配情况如下表所示，此时存在的一个安全序列是

#align(center)[
  #box(inset: 0pt)[#table(
    columns: (5em, 3em, 3em, 3em, 3em, 3em, 3em),
    align: center + horizon,
    stroke: 0.6pt,
    table.cell(rowspan: 2)[进程],
    table.cell(colspan: 3)[已分配资源],
    table.cell(colspan: 3)[资源最大需求],
    [R1], [R2], [R3], [R1], [R2], [R3],
    [P0], [3], [2], [3], [5], [5], [10],
    [P1], [4], [0], [3], [5], [3], [6],
    [P2], [4], [0], [5], [4], [0], [11],
    [P3], [2], [0], [4], [4], [2], [5],
    [P4], [3], [1], [4], [4], [2], [4],
  )]
]

#choices(
  [P0,P2,P4,P1,P3],
  [P1,P0,P3,P4,P2],
  [P2,P1,P0,P3,P4],
  [P3,P4,P2,P1,P0],
)
]

#question[
若一个用户进程通过 read
系统调用读取一个磁盘文件中的数据，则下列关于此过程的叙述中，正确的是

I. 若该文件的数据不在内存，则该进程进入睡眠等待状态

Ⅱ. 请求 read 系统调用会导致 CPU 从用户态切换到核心态

Ⅲ. read 系统调用的参数应包含文件的名称

#choices(
  [仅Ⅰ、Ⅱ],
  [仅Ⅰ、Ⅲ],
  [仅Ⅱ、Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]

#question[
一个多道批处理系统中仅有P1和P2两个作业，P2比P1晚5ms到达。它们的计算和
I/O操作顺序如下：

P1：计算60ms，I/O80ms，计算20ms

P2：计算120ms，I/O40ms，计算40ms

若不考虑调度和切换时间，则完成两个作业需要的时间最少是

#choices(
  [240ms],
  [260ms],
  [340ms],
  [360ms],
)
]

#question[
若某单处理器多进程系统中有多个就绪态进程，则下列关于处理机调度的叙述中，错误的是

#choices(
  [在进程结束时能进行处理机调度],
  [创建新进程后能进行处理机调度],
  [在进程处于临界区时不能进行处理机调度],
  [在系统调用完成并返回用户态时能进行处理机调度],
)
]

#question[
下列关于进程和线程的叙述中，正确的是

#choices(
  [不管系统是否支持线程，进程都是资源分配的基本单位],
  [线程是资源分配的基本单位，进程是调度的基本单位],
  [系统级线程和用户级线程的切换都需要内核的支持],
  [同一进程中的各个线程拥有各自不同的地址空间],
)
]

#question[
下列选项中，不能改善磁盘设备 I/O性能的是

#choices(
  [重排 I/O 请求次序],
  [在一个磁盘上设置多个分区],
  [预读和滞后写],
  [优化文件物理块的分布],
)
]

#question[
在 TCP/IP 体系结构中，直接为 ICMP
提供服务的协议是

#choices(
  [PPP],
  [IP],
  [UDP],
  [TCP],
)
]

#question[
在物理层接口特性中，用于描述完成每种功能的事件发生顺序的是

#choices(
  [机械特性],
  [功能特性],
  [过程特性],
  [电气特性],
)
]

#question[
以太网的MAC协议提供的是

#choices(
  [无连接不可靠服务],
  [无连接可靠服务],
  [有连接不可靠服务],
  [有连接可靠服务],
)
]

#question[
两台主机之间的数据链路层采用后退N帧协议（GBN）传输数据，数据传输速率为
16
kbps，单向传播时延为270ms，数据帧长度范围是128～512字节，接收方总是以与数据帧等长的帧进行确认。为使信道利用率达到最高，帧序号的比特数至少为

#choices(
  [5],
  [4],
  [3],
  [2],
)
]

#question[
下列关于 IP 路由器功能的描述中，正确的是

I. 运行路由协议，设置路由表

Ⅱ. 监测到拥塞时，合理丢弃 IP 分组

Ⅲ. 对收到的 IP 分组头进行差错校验，确保传输的 IP 分组不丢失

Ⅳ. 根据收到的 IP 分组的目的 IP 地址，将其转发到合适的输出线路上

#choices(
  [仅Ⅲ、Ⅳ],
  [仅Ⅰ、Ⅱ、Ⅲ],
  [仅Ⅰ、Ⅱ、Ⅳ],
  [I、Ⅱ、Ⅲ、Ⅳ],
)
]

#question[
ARP协议的功能是

#choices(
  [根据IP地址查询MAC地址],
  [根据MAC地址查询IP地址],
  [根据域名查询IP地址],
  [根据IP地址查询域名],
)
]

#question[
某主机的IP地址为180.80.77.55，子网掩码为255.255.252.0。若该主机向其所在子网发送广播分组，则目的地址可以是

#choices(
  [180.80.76.0],
  [180.80.76.255],
  [180.80.77.255],
  [180.80.79.255],
)
]

#question[
若用户1与用户2之间发送和接收电子邮件的过程如下图所示，则图中
①、②、③阶段分别使用的应用层协议可以是

#align(center)[
  #cetz.canvas(length: 0.61cm, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    // 同源图标：Microsoft Visio 2007 的等距投影模板。
    // PC: https://www.graffletopia.com/stencils/529
    // Server: https://www.graffletopia.com/stencils/523
    let pc(x) = content(
      (x, 1.36),
      image("../../assets/network/visio-2007-isometric-pc.svg", width: 0.88cm),
    )

    let server(x) = content(
      (x, 1.36),
      image("../../assets/network/visio-2007-isometric-server.svg", width: 0.88cm),
    )

    let numbered-arrow(x1, x2, n) = {
      line(
        (x1, 1.38), (x2, 1.38),
        stroke: 0.62pt,
        mark: (end: ">", fill: black, scale: 0.72),
      )
      circle(((x1 + x2) / 2, 1.38), radius: 0.27, fill: white, stroke: 0.58pt)
      content(((x1 + x2) / 2, 1.38), text(size: 0.72em)[#n])
    }

    hide(rect((-0.15, 0.25), (14.15, 3.55), stroke: none), bounds: true)
    numbered-arrow(1.78, 3.70, [1])
    numbered-arrow(5.25, 8.14, [2])
    numbered-arrow(9.70, 12.24, [3])
    pc(0.90)
    server(4.48)
    server(8.92)
    pc(13.10)
    content((0.90, 2.72), text(size: 0.72em)[用户1])
    content((4.48, 3.05), text(size: 0.72em)[#stack(dir: ttb, spacing: 0.25em, [用户1的], [邮件服务器])])
    content((8.92, 3.05), text(size: 0.72em)[#stack(dir: ttb, spacing: 0.25em, [用户2的], [邮件服务器])])
    content((13.10, 2.72), text(size: 0.72em)[用户2])
  })
]

#choices(
  [SMTP、SMTP、SMTP],
  [POP3、SMTP、POP3],
  [POP3、SMTP、SMTP],
  [SMTP、SMTP、POP3],
)
]

= 二、综合应用题：第41～47小题，共70分。
#question[
（10分）设有6个有序表A、B、C、D、E、F，分别含有10、35、40、50、60和200个数据元素，各表中元素按升序排列。要求通过5次两两合并，将6个表最终合并成1个升序表，并在最坏情况下比较的总次数达到最小。请回答下列问题。

#subquestions[
+ 
  给出完整的合并过程，并求出最坏情况下比较的总次数。
  \
+ 根据你的合并过程，描述 n （ $n gt.eq 2$
  ）个不等长升序表的合并策略，并说明理由。
  
    
]
]

#question[
（13分）假定采用带头结点的单链表保存单词，当两个单词有相同的后缀时，则可共享相同的后缀存储空间。例如，“loading”和“being”的存储映像如下图所示。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "ascender", bottom-edge: "descender", body))))
  set-style(stroke: 0.045em)
  let node(x,y,label,head: false,last: false) = {
    rect((x,y),(x+1.6,y+1),fill: white)
    if head { rect((x,y),(x+1.1,y+1),fill: luma(75%)) }
    line((x+1.1,y),(x+1.1,y+1))
    if not head { content((x+0.55,y+0.5),label) }
    // 空指针记号按格内尺寸绘制，避免字体字形撑满窄指针格。
    if last { line((x+1.21,y+0.24),(x+1.35,y+0.76),(x+1.49,y+0.24)) }
  }
  for (x,y,label) in ((0,3,[]),(2.5,3,[l]),(5,3,[o]),(7.5,3,[a]),(10,3,[d]),(0,0,[]),(2.5,0,[b]),(5,0,[e]),(12.5,1.5,[i]),(15,1.5,[n]),(17.5,1.5,[g])) {
    node(x,y,label,head: label==[],last: label==[g])
  }
  for (x,y) in ((0,3),(2.5,3),(5,3),(7.5,3),(0,0),(2.5,0),(12.5,1.5),(15,1.5)) {
    line((x+1.35,y+0.5),(x+2.5,y+0.5),mark: (end: ">",scale: 0.55))
  }
  line((11.35,3.5),(12.7,3.5),(12.7,2.5),mark: (end: ">",scale: 0.55))
  line((6.35,0.5),(12.7,0.5),(12.7,1.5),mark: (end: ">",scale: 0.55))
  line((-0.8,4.5),(0.55,4),mark: (end: ">",scale: 0.55)); content((-1.2,4.7),[str1])
  line((-0.8,1.5),(0.55,1),mark: (end: ">",scale: 0.55)); content((-1.2,1.7),[str2])
  line((14.2,0),(13.3,1.5),mark: (end: ">",scale: 0.55)); content((14.6,-0.1),[$p$])
})),caption: [题42图],kind: image)


设 str1和 str2分别指向两个单词所在单链表的头结点，链表结点结构为：#inline-node([data], [next])，请设计一个时间上尽可能高效的算法，找出由 str1和
str2所指的两个链表共同后缀的起始位置（如图中字符 i所在结点的位置
p）。要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 
  根据设计思想，采用C或C++或Java语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度。
  
    
]
]

#question[
（11分）假定某计算机的CPU主频为80MHz，CPI为4，并且平均每条指令访存1.5次，主存与Cache之间交换的块大小为16B，Cache的命中率为
99% ，存储器总线宽度为32位。请回答下列问题。

#subquestions[
+ 
  该计算机的MIPS数是多少？平均每秒Cache缺失的次数是多少？在不考虑DMA传送的情况下，主存带宽至少达到多少才能满足CPU的访存要求？
  \
+ 假定在 Cache 缺失的情况下访问主存时，存在 0.000
  5%的缺页率，则 CPU
  平均每秒产生多少次缺页异常？若页面大小为4KB，每次缺页都需要访问磁盘，访问磁盘时
  DMA 传送采用周期挪用公式，磁盘 I/O 接口的数据缓冲寄存器为32位，则磁盘
  I/O 接口平均每秒发出的 DMA 请求次数至少是多少？
  \
+ 
  CPU和DMA控制器同时要求使用存储器总线时，哪个优先级更高？为什么？
  \
+ 
  为了提高性能，主存采用4体交叉存储模式，工作时每1/4个存储周期启动一个体。若每个体的存储周期为
  50 ns，则该主存能提供的最大带宽是多少？
  
    
]
]

#question[
（12分）某16位计算机中，带符号整数用补码表示，数据Cache和指令Cache分离。题44表给出了指令系统中部分指令格式，其中Rs和Rd表示寄存器，mem表示存储单元地址，（x）表示寄存器x或存储单元x的内容。

#{
  set figure.caption(position: top)
  figure(
    align(center)[#table(
      columns: 3,
      align: (auto, auto, auto),
      [名称], [指令的汇编格式], [指令功能],
      [加法指令], [ADD Rs,Rd], [(Rs)+(Rd)→Rd],
      [算术/逻辑左移], [SHL Rd], [2\*(Rd)→Rd],
      [算术右移], [SHR Rd], [(Rd)/2→Rd],
      [取数指令], [LOAD Rd,mem], [(mem)→Rd],
      [存数指令], [STORE Rs,mem], [(Rs)→mem],
    )],
    kind: table,
    caption: [题44表　指令系统中部分指令格式],
    numbering: none,
  )
}

该计算机采用5段流水方式执行指令，各流水段分别是取指（IF）、译码/读寄存器（ID）、执行/计算有效地址（EX）、访问存储器（M）和结果写回寄存器（WB），流水线采用“按序发射，按序完成”方式，没有采用转发技术处理数据相关，并且同一个寄存器的读和写操作不能在同一个时钟周期内进行。请回答下列问题。

#subquestions[
+ 若 int 型变量 x 的值为-513，存放在寄存器 R1
  中，则执行指令“SHR R1”后，R1的内容是多少？（用十六进制表示）
  \
+ 
  若某个时间段中，有连续的4条指令进入流水线，在其执行过程中没有发生任何阻塞，则执行这4条指令所需的时钟周期数为多少？
  \
+ 若高级语言程序中某赋值语句为 $x = a + b$
  ，x、a和b均为int型变量，它们的存储单元地址分别表示为 $[x]$、$[a]$ 和 $[b]$。该语句对应的指令序列及其在指令流水线中的执行过程如题44图所示。
  
  #align(center)[
    #grid(
      columns: (2.2em, auto),
      column-gutter: 0.45em,
      row-gutter: 0.18em,
      align: left + horizon,
      [$I_1$], [`LOAD R1, [a]`],
      [$I_2$], [`LOAD R2, [b]`],
      [$I_3$], [`ADD R1, R2`],
      [$I_4$], [`STORE R2, [x]`],
    )
  ]
  
  #figure(
    align(center)[#text(size: 0.82em)[#table(
      columns: (4.8em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em, 2.2em),
      align: center + horizon,
      stroke: 0.6pt,
      [], table.cell(colspan: 14)[时间单元],
      [指令], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14],
      [$I_1$], [IF], [ID], [EX], [M], [WB], [], [], [], [], [], [], [], [], [],
      [$I_2$], [], [IF], [ID], [EX], [M], [WB], [], [], [], [], [], [], [], [],
      [$I_3$], [], [], [IF], [], [], [], [ID], [EX], [M], [WB], [], [], [], [],
      [$I_4$], [], [], [], [], [], [], [IF], [], [], [], [ID], [EX], [M], [WB],
    )]],
    kind: table,
    caption: [题44图　指令序列及其执行过程示意图],
    numbering: none,
  )
  
  则这4条指令执行过程中，$I_3$ 的ID段和
  $I_4$ 的IF段被阻塞的原因各是什么？
  \
+ 若高级语言程序中某赋值语句为
  $x = 2 ast x + a$，x和a均为unsigned
  int类型变量，它们的存储单元地址分别表示为 $[x]$、$[a]$，则执行这条语句至少需要多少个时钟周期？要求模仿题44图画出这条语句对应的指令序列及其在流水线中的执行过程示意图。
  
    
]
]

#question[
（7分）某请求分页系统的局部页面置换策略如下：

系统从0时刻开始扫描，每隔5个时间单位扫描一轮驻留集（扫描时间忽略不计），本轮没有被访问过的页框将被系统回收，并放入到空闲页框链尾，其中内容在下一次被分配之前不被清空。当发生缺页时，如果该页曾被使用过且还在空闲页框链表中，则重

新放回进程的驻留集中；否则，从空闲页框链表头部取出一个页框。

假设不考虑其他进程的影响和系统开销，初始时进程驻留集为空。目前系统空闲页框链表中页框号依次为32、15、21、41。进程P依次访问的
〈虚拟页号，访问时刻〉是：
〈1，1〉、〈3，2〉、〈0，4〉、〈0，6〉、〈1，11〉、〈0，13〉、〈2，14〉。请回答下列问题。

#subquestions[
+ 访问〈0，4〉时，对应的页框号是什么？
  \
+ 访问〈1，11〉时，对应的页框号是什么？说明理由。
  \
+ 访问〈2，14〉时，对应的页框号是什么？说明理由。
  \
+ 该策略是否适合于时间局部性好的程序？说明理由。
  
    
]
]

#question[
（8分）某文件系统空间的最大容量为
$4 "TB" space (1 "T" = 2^40)$
，以磁盘块为基本分配单位，磁盘块大小为1KB。文件控制块（FCB）包含一个512B的索引表区。请回答下列问题。

#subquestions[
+ 
  假设索引表区仅采用直接索引结构，索引表区存放文件占用的磁盘块号。索引表项中块号最少占多少字节？可支持的单个文件最大长度是多少字节？
  \
+ 假设索引表区采用如下结构：第0～7字节采用
  〈起始块号，块数〉格式表示文件创建时预分配的连续存储空间，其中起始块号占6B，块数占2B；剩余504字节采用直接索引结构，一个索引项占6B，则可支持的单个文件最大长度是多少字节？为了使单个文件的长度达到最大，请指出起始块号和块数分别所占字节数的合理值并说明理由。
  
    
]
]

#question[
（9分）主机H通过快速以太网连接Internet，IP地址为192.168.0.8，服务器S的IP地址为211.68.71.80。H与S使用TCP通信时，在H上捕获的其中5个IP分组如题47-a表所示。

#{
  let packet-row(words) = text(size: 0.68em)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      row-gutter: 0.14em,
      align: center,
      ..words,
    )
  ]
  set figure.caption(position: top)
  figure(
    table(
      columns: (3.2em, 1fr),
      align: center + horizon,
      [编号], [IP分组的前40字节内容（十六进制）],
      [1], packet-row((
        [45 00 00 30], [01 9b 40 00], [80 06 1d e8], [c0 a8 00 08], [d3 44 47 50],
        [0b d9 13 88], [84 6b 41 c5], [00 00 00 00], [70 02 43 80], [5d b0 00 00],
      )),
      [2], packet-row((
        [45 00 00 30], [00 00 40 00], [31 06 6e 83], [d3 44 47 50], [c0 a8 00 08],
        [13 88 0b d9], [e0 59 9f ef], [84 6b 41 c6], [70 12 16 d0], [37 e1 00 00],
      )),
      [3], packet-row((
        [45 00 00 28], [01 9c 40 00], [80 06 1d ef], [c0 a8 00 08], [d3 44 47 50],
        [0b d9 13 88], [84 6b 41 c6], [e0 59 9f f0], [50 10 43 80], [2b 32 00 00],
      )),
      [4], packet-row((
        [45 00 00 38], [01 9d 40 00], [80 06 1d de], [c0 a8 00 08], [d3 44 47 50],
        [0b d9 13 88], [84 6b 41 c6], [e0 59 9f f0], [50 18 43 80], [c6 55 00 00],
      )),
      [5], packet-row((
        [45 00 00 28], [68 11 40 00], [31 06 06 7a], [d3 44 47 50], [c0 a8 00 08],
        [13 88 0b d9], [e0 59 9f f0], [84 6b 41 d6], [50 10 16 d0], [57 d2 00 00],
      )),
    ),
    kind: table,
    caption: [题47-a表],
    numbering: none,
  )
}
请回答下列问题。

#subquestions[
+ 
  题47-a表中的IP分组中，哪几个是由H发送的？哪几个完成了TCP连接建立过程？哪几个在通过快速以太网传输时进行了填充？
  \
+ 
  根据题47-a表中的IP分组，分析S已经收到的应用层数据字节数是多少？
  \
+ 
  若题47-a表中的某个IP分组在S发出时的前40字节如题47-b表所示，则该IP分组到达H时经过了多少个路由器？
  
  #{
    set figure.caption(position: top)
    figure(
      align(center)[#table(
        columns: 6,
        align: (auto, auto, auto, auto, auto, auto),
        [S发出的], [45000028], [68114000], [4006ecad], [d3444750], [ca760106],
        [IP分组], [1388a108], [e0599ff0], [846b41d6], [501016d0], [b7d60000],
      )],
      kind: table,
      caption: [题47-b表],
      numbering: none,
    )
  }
  
  注：IP分组头和TCP段头结构分别如题47-a图、题47-b图所示。
  
  #figure(align(center,cetz.canvas(length:1em,{
    import cetz.draw: *
    set-style(stroke:0.055em,content:(wrap:body=>box(text(size:0.75em,top-edge:"bounds",bottom-edge:"bounds",body))))
    // 2013 大纲 PDF 第 57 页；位域宽度及各行高度按扫描图描点。
    let p(x,y)=((x - 288) / 32,(1140 - y) / 32)
    rect(p(288,881),p(849,1140))
    for y in (943,984,1056,1097) {line(p(288,y),p(849,y))}
    for x in (359,430,569) {line(p(x,881),p(x,943))}
    for x in (569,622) {line(p(x,943),p(x,984))}
    for x in (430,569) {line(p(x,984),p(x,1056))}
    for (x,y,body) in ((323,910,[版本]),(394,898,[头部]),(394,926,[长度]),
      (500,913,[服务类型]),(710,913,[总长度]),(428,965,[标识]),(596,965,[标志]),
      (735,965,[片偏移]),(359,1008,[生存时间]),(359,1035,[(TTL)]),(500,1021,[协议]),
      (710,1021,[头部校验和]),(568,1078,[源地址]),(568,1120,[目的地址])) {content(p(x,y),body)}
    line(p(288,876),p(849,876))
    for i in range(33) {
      let x=288+i*561/32
      line(p(x,876),p(x,if calc.rem(i,8)==0 or i==32 {856} else {867}))
    }
    for (x,body) in ((254,[比特]),(288,[0]),(430,[8]),(570,[16]),(710,[24]),(849,[31])) {content(p(x,842),body)}
  })),kind:image,caption:[题47-a图　IP分组头结构],numbering:none)
  
  #figure(align(center,cetz.canvas(length:1em,{
    import cetz.draw: *
    set-style(stroke:0.055em,content:(wrap:body=>box(text(size:0.75em,top-edge:"bounds",bottom-edge:"bounds",body))))
    let p(x,y)=((x - 288) / 32,(1540 - y) / 32)
    rect(p(288,1298),p(849,1540))
    for y in (1342,1383,1433,1498) {line(p(288,y),p(849,y))}
    line(p(570,1298),p(570,1342)); line(p(570,1498),p(570,1540))
    // 原图的窄标志位按可辨识宽度绘制，并非机械的等宽 32 列。
    for x in (344,414,439,465,492,516,542,570) {line(p(x,1433),p(x,1498))}
    for (x,y,body) in ((430,1320,[源端口]),(710,1320,[目的端口]),(570,1364,[序号（seq）]),
      (570,1408,[确认号（ack）]),(316,1453,[头部]),(316,1480,[长度]),(379,1468,[保留]),
      (710,1468,[窗口]),(430,1520,[校验和]),(710,1520,[紧急指针])) {content(p(x,y),body)}
    for (x,letters) in ((426.5,"URG"),(452,"ACK"),(478.5,"PSH"),(504,"RST"),(529,"SYN"),(556,"FIN")) {
      for (i,c) in letters.clusters().enumerate() {content(p(x,1446+20*i),text(size:0.67em,c))}
    }
    line(p(288,1293),p(849,1293))
    for i in range(33) {
      let x=288+i*561/32
      line(p(x,1293),p(x,if calc.rem(i,8)==0 or i==32 {1273} else {1284}))
    }
    for (x,body) in ((254,[比特]),(288,[0]),(430,[8]),(570,[16]),(710,[24]),(849,[31])) {content(p(x,1261),body)}
  })),kind:image,caption:[题47-b图　TCP段头结构],numbering:none)
    
]
]
