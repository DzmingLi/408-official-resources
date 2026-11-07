// 官方来源：2018年计算机考试大纲.pdf，原书57—69页。
#import "../../template.typ": exam, choices, statements, subquestions, inline-node
#import "@preview/ezexam:0.3.1": question, mode-state, HANDOUTS, answer-state
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz
#show: exam.with(year: 2017)
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)

= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项符合题目要求。

#question[
下列函数的时间复杂度是
```c
int func(int n)
{
    int i=0, sum=0;
    while(sum<n) sum += ++i;
    return i;
}
```
#choices([$O(log n)$], [$O(n^(1\/2))$], [$O(n)$], [$O(n log n)$])
]
#question[
下列关于栈的叙述中，错误的是
#statements(columns: 1,
 [Ⅰ．采用非递归方式重写递归程序时必须使用栈],
 [Ⅱ．函数调用时，系统要用栈保存必要的信息],
 [Ⅲ．只要确定了入栈次序，即可确定出栈次序],
 [Ⅳ．栈是一种受限的线性表，允许在其两端进行操作])
#choices([仅Ⅰ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ], [仅Ⅱ、Ⅲ、Ⅳ])
]
#question[
适用于压缩存储稀疏矩阵的两种存储结构是
#choices([三元组表和十字链表], [三元组表和邻接矩阵], [十字链表和二叉链表], [邻接矩阵和十字链表])
]
#question[
要使一棵非空二叉树的先序序列与中序序列相同，其所有非叶结点须满足的条件是
#choices([只有左子树], [只有右子树], [结点的度均为1], [结点的度均为2])
]
#question[
已知一棵二叉树的树形如下图所示，其后序序列为 e，a，c，b，d，g，f，树中与结点 a 同层的结点是
#align(center, diagram(spacing: (1.8em, 1.5em), node-stroke: .6pt,
 node((1,0), [], name: <a>, shape: circle, radius: .35em),
 node((0,1), [], name: <b>, shape: circle, radius: .35em),
 node((2,1), [], name: <c>, shape: circle, radius: .35em),
 node((.65,2), [], name: <d>, shape: circle, radius: .35em),
 node((1.35,2), [], name: <e>, shape: circle, radius: .35em),
 node((0,3), [], name: <f>, shape: circle, radius: .35em),
 node((2,3), [], name: <g>, shape: circle, radius: .35em),
 edge(<a>,<b>), edge(<a>,<c>), edge(<b>,<d>), edge(<c>,<e>), edge(<d>,<f>), edge(<e>,<g>)))
#choices([c], [d], [f], [g])
]
#question[
已知字符集 ${"a","b","c","d","e","f","g","h"}$，若各字符的哈夫曼编码依次是0100，10，0000，0101，001，011，11，0001，则编码序列010011001001011110101的译码结果是
#choices([a c g a b f h], [a d b a g b b], [a f b e a g d], [a f e e f g d])
]
#question[
已知无向图 $G$ 含有16条边，其中度为4的顶点个数为3，度为3的顶点个数为4，其他顶点的度均小于3。图 $G$ 所含的顶点个数至少是
#choices([10], [11], [13], [15])
]
#question[
下列二叉树中，可能成为折半查找判定树（不含外部结点）的是
#choices(
 [#box(cetz.canvas(length: 1.7em, {
   import cetz.draw: *
   let p = ((2.4,3),(1.2,2),(3.6,2),(.45,1),(1.95,1),(2.85,1),(4.35,1),(-.3,0),(1.2,0),(2.1,0))
   for (a,b) in ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(3,7),(4,8),(5,9)) { line(p.at(a),p.at(b),stroke:.05em) }
   for v in p { circle(v,radius:.24,fill:white,stroke:.05em) }
 }))],
 [#box(cetz.canvas(length: 1.7em, {
   import cetz.draw: *
   let p = ((2.4,3),(1.2,2),(3.6,2),(.45,1),(1.95,1),(2.85,1),(4.35,1),(-.3,0),(1.2,0),(3.6,0),(5.1,0))
   for (a,b) in ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(3,7),(4,8),(5,9),(6,10)) { line(p.at(a),p.at(b),stroke:.05em) }
   for v in p { circle(v,radius:.24,fill:white,stroke:.05em) }
 }))],
 [#box(cetz.canvas(length: 1.7em, {
   import cetz.draw: *
   let p = ((2.4,3),(1.2,2),(3.6,2),(.45,1),(1.95,1),(2.85,1),(4.35,1),(1.2,0),(3.6,0))
   for (a,b) in ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(4,7),(5,8)) { line(p.at(a),p.at(b),stroke:.05em) }
   for v in p { circle(v,radius:.24,fill:white,stroke:.05em) }
 }))],
 [#box(cetz.canvas(length: 1.7em, {
   import cetz.draw: *
   let p = ((2.4,3),(1.2,2),(3.6,2),(.45,1),(1.95,1),(2.85,1),(4.35,1),(-.3,0),(2.1,0),(3.6,0))
   for (a,b) in ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(3,7),(5,8),(6,9)) { line(p.at(a),p.at(b),stroke:.05em) }
   for v in p { circle(v,radius:.24,fill:white,stroke:.05em) }
 }))])
]
#question[
下列应用中，适合使用 $B^+$ 树的是
#choices([编译器中的词法分析], [关系数据库系统中的索引], [网络中的路由表快速查找], [操作系统的磁盘空闲块管理])
]
#question[
在内部排序时，若选择了归并排序而没有选择插入排序，则可能的理由是
#statements(columns: 1, [Ⅰ．归并排序的程序代码更短], [Ⅱ．归并排序的占用空间更少], [Ⅲ．归并排序的运行效率更高])
#choices([仅Ⅱ], [仅Ⅲ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ])
]
#question[
下列排序方法中，若将顺序存储更换为链式存储，则算法的时间效率会降低的是
#statements(columns: 3, [Ⅰ．插入排序], [Ⅱ．选择排序], [Ⅲ．起泡排序], [Ⅳ．希尔排序], [Ⅴ．堆排序])
#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ], [仅Ⅲ、Ⅳ], [仅Ⅳ、Ⅴ])
]
#question[
假定计算机 M1 和 M2 具有相同的指令集体系结构（ISA），主频分别为1.5 GHz和1.2 GHz。在 M1 和 M2 上运行某基准程序 P，平均 CPI 分别为2和1，则程序 P 在 M1 和 M2 上的CPU执行时间的比值是
#choices([0.4], [0.625], [1.6], [2.5])
]
#question[
某计算机主存按字节编址，由4个 $64"M" times 8$ 位的 DRAM 芯片采用交叉编址方式构成，并与宽度为32位的存储器总线相连，主存每次最多读写32位数据。若 double 型变量 $x$ 的主存地址为804001AH，则读取 $x$ 需要的存储周期数是
#choices([1], [2], [3], [4])
]
#question[
某 C 语言程序段如下：
```c
for(i=0; i<=9; i++)
{
    temp=1;
    for(j=0; j<=i; j++) temp *= a[j];
    sum += temp;
}
```
下列关于数组 a 的访问局部性的描述中，正确的是
#choices([时间局部性和空间局部性皆有], [无时间局部性，有空间局部性], [有时间局部性，无空间局部性], [时间局部性和空间局部性皆无])
]
#question[
下列寻址方式中，最适合按下标顺序访问一维数组元素的是
#choices([相对寻址], [寄存器寻址], [直接寻址], [变址寻址])
]
#question[
某计算机按字节编址，指令字长固定且只有两种指令格式，其中三地址指令29条，二地址指令107条，每个地址字段为6位，则指令字长至少应该是
#choices([24位], [26位], [28位], [32位])
]
#question[
下列关于超标量流水线特性的叙述中，正确的是
#statements(columns: 1, [Ⅰ．能缩短流水线功能段的处理时间], [Ⅱ．能在一个时钟周期内同时发射多条指令], [Ⅲ．能结合动态调度技术提高指令执行并行性])
#choices([仅Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ和Ⅲ])
]
#question[
下列关于主存储器（MM）和控制存储器（CS）的叙述中，错误的是
#choices([MM 在 CPU 外，CS 在 CPU 内], [MM 按地址访问，CS 按内容访问], [MM 存储指令和数据，CS 存储微指令], [MM 用 RAM 和 ROM 实现，CS 用 ROM 实现])
]
#question[
下列关于指令流水线数据通路的叙述中，#emphasis[错误]的是
#choices([包含生成控制信号的控制部件], [包含算术逻辑运算部件（ALU）], [包含通用寄存器组和取指部件], [由组合逻辑电路和时序逻辑电路组合而成])
]
#question[
下列关于多总线结构的叙述中，#emphasis[错误]的是
#choices([靠近 CPU 的总线速度较快], [存储器总线可支持突发传送方式], [总线之间须通过桥接器相连], [PCI-Express×16采用并行传输方式])
]
#question[
I/O 指令实现的数据传送通常发生在
#choices([I/O 设备和 I/O 端口之间], [通用寄存器和 I/O 设备之间], [I/O 端口和 I/O 端口之间], [通用寄存器和 I/O 端口之间])
]
#question[
下列关于多重中断系统的叙述中，#emphasis[错误]的是
#choices([在一条指令执行结束时响应中断], [中断处理期间 CPU 处于关中断状态], [中断请求的产生与当前指令的执行无关], [CPU 通过采样中断请求信号检测中断请求])
]
#question[
假设4个作业到达系统的时刻和运行时间如下表所示。
#align(center, table(columns: (5em, 7em, 6em), align: center,
 [作业], [到达时刻 $t$], [运行时间], [J1], [0], [3], [J2], [1], [3], [J3], [1], [2], [J4], [3], [1]))
系统在 $t=2$ 时开始作业调度。若分别采用先来先服务和短作业优先调度算法，则选中的作业分别是
#choices([J2、J3], [J1、J4], [J2、J4], [J1、J3])
]
#question[
执行系统调用的过程包括如下主要操作：
#statements(columns: 2, [① 返回用户态], [② 执行陷入（trap）指令], [③ 传递系统调用参数], [④ 执行相应的服务程序])
正确的执行顺序是
#choices([②→③→①→④], [②→④→③→①], [③→②→④→①], [③→④→②→①])
]
#question[
某计算机按字节编址，其动态分区内存管理采用最佳适应算法，每次分配和回收内存后都对空闲分区链重新排序。当前空闲分区信息如下表所示。
#align(center, table(columns: (7em, 4em, 4em, 4em, 4em), align: center,
 [分区起始地址], [20 K], [500 K], [1000 K], [200 K],
 [分区大小], [40 KB], [80 KB], [100 KB], [200 KB]))
回收起始地址为60 K、大小为140 KB的分区后，系统中空闲分区的数量、空闲分区链第一个分区的起始地址和大小分别是
#choices([3、20 K、380 KB], [3、500 K、80 KB], [4、20 K、180 KB], [4、500 K、80 KB])
]
#question[
某文件系统的簇和磁盘扇区大小分别为1 KB和512 B。若一个文件的大小为1026 B，则系统分配给该文件的磁盘空间大小是
#choices([1026 B], [1536 B], [1538 B], [2048 B])
]
#question[
下列有关基于时间片的进程调度的叙述中，#emphasis[错误]的是
#choices([时间片越短，进程切换的次数越多，系统开销越大], [当前进程的时间片用完后，该进程状态由执行态变为阻塞态], [时钟中断发生后，系统会修改当前进程在时间片内的剩余时间], [影响时间片大小的主要因素包括响应时间、系统开销和进程数量等])
]
#question[
与单道程序系统相比，多道程序系统的优点是
#statements(columns: 2, [Ⅰ．CPU 利用率高], [Ⅱ．系统开销小], [Ⅲ．系统吞吐量大], [Ⅳ．I/O 设备利用率高])
#choices([仅Ⅰ、Ⅲ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ])
]
#question[
下列选项中，磁盘逻辑格式化程序所做的工作是
#statements(columns: 1, [Ⅰ．对磁盘进行分区], [Ⅱ．建立文件系统的根目录], [Ⅲ．确定磁盘扇区校验码所占位数], [Ⅳ．对保存空闲磁盘块信息的数据结构进行初始化])
#choices([仅Ⅱ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ], [仅Ⅰ、Ⅱ、Ⅳ])
]
#question[
某文件系统中，针对每个文件，用户类别分为4类：安全管理员、文件主、文件主的伙伴、其他用户；访问权限分为5种：完全控制、执行、修改、读取、写入。若文件控制块中用二进制位串表示文件权限，为表示不同类别用户对一个文件的访问权限，则描述文件权限的位数至少应为
#choices([5], [9], [12], [20])
]
#question[
若文件 f1 的硬链接为 f2，两个进程分别打开 f1 和 f2，获得对应的文件描述符为 fd1 和 fd2，则下列叙述中，正确的是
#statements(columns: 1, [Ⅰ．f1 和 f2 的读写指针位置保持相同], [Ⅱ．f1 和 f2 共享同一个内存索引结点], [Ⅲ．fd1 和 fd2 分别指向各自的用户打开文件表中的一项])
#choices([仅Ⅲ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ和Ⅲ])
]
#question[
系统将数据从磁盘读到内存的过程包括以下操作：
#statements(columns: 1, [① DMA 控制器发出中断请求], [② 初始化 DMA 控制器并启动磁盘], [③ 从磁盘传输一块数据到内存缓冲区], [④ 执行“DMA 结束”中断服务程序])
正确的执行顺序是
#choices([③→①→②→④], [②→③→①→④], [②→①→③→④], [①→②→④→③])
]
#question[
假设 OSI 参考模型的应用层欲发送400 B的数据（无拆分），除物理层和应用层之外，其他各层在封装 PDU 时均引入20 B的额外开销，则应用层数据传输效率约为
#choices([80%], [83%], [87%], [91%])
]
#question[
若信道在无噪声情况下的极限数据传输速率不小于信噪比为30 dB条件下的极限数据传输速率，则信号状态数至少是
#choices([4], [8], [16], [32])
]
#question[
在下图所示的网络中，若主机 H 发送一个封装访问 Internet 的 IP 分组的 IEEE 802.11 数据帧 F，则帧 F 的地址1、地址2和地址3分别是
#align(center, cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(stroke:.05em,content:(wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .73em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  line((7,0),(18,0)); line((18,0),(23,0))
  line((1.8,0),(5.9,0),stroke:(dash:"dashed",thickness:.1em),mark:(end:">",fill:black))
  content((0,.3),image("../../assets/network/visio-2003-laptop.svg",width:3.6em))
  content((7,.8),image("../../assets/network/visio-2007-wireless-ap.svg",width:2.4em,height:4.4em,fit:"stretch"))
  content((7,-.15),[AP])
  content((17,0),image("../../assets/network/visio-2003-router.svg",width:2.6em)); content((17,-.6),[R])
  content((23,0),image("../../assets/network/cisco-cloud.svg",width:5.2em)); content((23,0),[Internet])
  content((-2,.4),[H]); content((3.6,.9),box(stroke:.05em,inset:(x:.65em,y:.1em))[F])
  content((0,-2.4),[00-12-34-56-78-9a]); content((7,-2.4),[00-12-34-56-78-9b])
  content((12,.7),[00-12-34-56-78-9c])
  for x in (1.5,1.8,2.1) {bezier((x,1.4),(x,2),(x+.2,1.6),(x+.2,1.8))}
}))
#choices(
 [00-12-34-56-78-9a，00-12-34-56-78-9b，00-12-34-56-78-9c],
 [00-12-34-56-78-9b，00-12-34-56-78-9a，00-12-34-56-78-9c],
 [00-12-34-56-78-9b，00-12-34-56-78-9c，00-12-34-56-78-9a],
 [00-12-34-56-78-9a，00-12-34-56-78-9c，00-12-34-56-78-9b])
]
#question[
下列 IP 地址中，只能作为 IP 分组的源 IP 地址但不能作为目的 IP 地址的是
#choices([0.0.0.0], [127.0.0.1], [200.10.10.3], [255.255.255.255])
]
#question[
直接封装 RIP、OSPF、BGP 报文的协议分别是
#choices([TCP、UDP、IP], [TCP、IP、UDP], [UDP、TCP、IP], [UDP、IP、TCP])
]
#question[
若将网络21.3.0.0/16划分为128个规模相同的子网，则每个子网可分配的最大 IP 地址个数是
#choices([254], [256], [510], [512])
]
#question[
若甲向乙发起一个 TCP 连接，最大段长 MSS=1 KB，RTT=5 ms，乙开辟的接收缓存为64 KB，则甲从连接建立成功至发送窗口达到32 KB，需经过的时间至少是
#choices([25 ms], [30 ms], [160 ms], [165 ms])
]
#question[
下列关于 FTP 协议的叙述中，#emphasis[错误]的是
#choices([数据连接在每次数据传输完毕后就关闭], [控制连接在整个会话期间保持打开状态], [服务器与客户端的 TCP 20端口建立数据连接], [客户端与服务器的 TCP 21端口建立控制连接])
]

= 二、综合应用题：41～47小题，共70分。

#question[
（15分）请设计一个算法，将给定的表达式树（二叉树）转换为等价的中缀表达式（通过括号反映操作符的计算次序）并输出。例如，当下列两棵表达式树作为算法的输入时：
#grid(columns: (1fr, 1fr), gutter: 1em,
 align(center, diagram(spacing: (1.5em, 1.5em), node-stroke: .6pt,
  node((2,0), [\*], name: <r>, shape: circle, radius: .6em),
  node((.7,1), [+], name: <p>, shape: circle, radius: .6em),
  node((3.3,1), [\*], name: <m>, shape: circle, radius: .6em),
  node((-.1,2), [a], name: <a>, shape: circle, radius: .6em),
  node((1.5,2), [b], name: <b>, shape: circle, radius: .6em),
  node((2.5,2), [c], name: <c>, shape: circle, radius: .6em),
  node((4.2,2), [−], name: <n>, shape: circle, radius: .6em),
  node((5,3), [d], name: <d>, shape: circle, radius: .6em),
  edge(<r>,<p>), edge(<r>,<m>), edge(<p>,<a>), edge(<p>,<b>), edge(<m>,<c>), edge(<m>,<n>), edge(<n>,<d>))),
 align(center, diagram(spacing: (1.5em, 1.5em), node-stroke: .6pt,
  node((2,0), [+], name: <r>, shape: circle, radius: .6em),
  node((.7,1), [\*], name: <m>, shape: circle, radius: .6em),
  node((3.3,1), [−], name: <n>, shape: circle, radius: .6em),
  node((-.1,2), [a], name: <a>, shape: circle, radius: .6em),
  node((1.5,2), [b], name: <b>, shape: circle, radius: .6em),
  node((4.2,2), [−], name: <p>, shape: circle, radius: .6em),
  node((3.4,3), [c], name: <c>, shape: circle, radius: .6em),
  node((5,3), [d], name: <d>, shape: circle, radius: .6em),
  edge(<r>,<m>), edge(<r>,<n>), edge(<m>,<a>), edge(<m>,<b>), edge(<n>,<p>), edge(<p>,<c>), edge(<p>,<d>))))
输出的等价中缀表达式分别为 `(a+b)*(c*(-d))` 和 `(a*b)+(-(c-d))`。

二叉树结点定义如下：
```c
typedef struct node
{
    char data[10];       // 存储操作数或操作符
    struct node *left, *right;
} BTree;
```
要求：
#subquestions[
 + 给出算法的基本设计思想。
 + 根据设计思想，采用 C 或 C++语言描述算法，关键之处给出注释。
]
]
#question[
（8分）使用 Prim（普里姆）算法求带权连通图的最小（代价）生成树（MST）。请回答下列问题。
#subquestions[
 + 对下列图 $G$，从顶点 A 开始求 $G$ 的 MST，依次给出按算法选出的边。
 + 图 $G$ 的 MST 是唯一的吗？
 + 对任意的带权连通图，满足什么条件时，其 MST 是唯一的？
]
#align(center, diagram(spacing: (2em, 2em), node-stroke: .6pt,
 node((1,0), [A], name: <a>, shape: circle, radius: .6em),
 node((-.4,1), [B], name: <b>, shape: circle, radius: .6em),
 node((2.4,1), [E], name: <e>, shape: circle, radius: .6em),
 node((.1,2.6), [C], name: <c>, shape: circle, radius: .6em),
 node((1.9,2.6), [D], name: <d>, shape: circle, radius: .6em),
 edge(<a>,<b>, [6]), edge(<a>,<e>, [5]), edge(<a>,<d>, [4]),
 edge(<b>,<c>, [4]), edge(<c>,<d>, [6]), edge(<e>,<d>, [4]), edge(<c>,<e>, [5])))
]
#question[
（13分）已知 $f(n)=sum_(i=0)^n 2^i=2^(n+1)-1=overbrace(11 dots.c 1, n+1"位")"B"$，计算 $f(n)$ 的 C 语言函数 f1 如下：
```
1  int f1(unsigned n)
2  {    int sum=1, power=1;
3       for(unsigned i=0; i<=n-1; i++)
4       {    power *= 2;
5            sum += power;
6       }
7       return sum;
8  }
```
将 f1 中的 int 都改为 float，可得到计算 $f(n)$ 的另一个函数 f2。假设 unsigned 和 int 型数据都占32位，float 采用 IEEE 754 单精度标准。请回答下列问题。
#subquestions[
 + 当 $n=0$ 时，f1 会出现死循环，为什么？若将 f1 中的变量 $i$ 和 $n$ 都定义为 int 型，则 f1 是否还会出现死循环？为什么？
 + f1(23)和 f2(23)的返回值是否相等？机器数各是什么（用十六进制表示）？
 + f1(24)和 f2(24)的返回值分别为33554431和33554432.0，为什么不相等？
 + $f(31)=2^32-1$，而 f1(31)的返回值却为−1，为什么？若使 f1($n$)的返回值与 $f(n)$ 相等，则最大的 $n$ 是多少？
 + f2(127)的机器数为7F80 0000H，对应的值是什么？若使 f2($n$)的结果不溢出，则最大的 $n$ 是多少？若使 f2($n$)的结果精确（无舍入），则最大的 $n$ 是多少？
]
]
#question[
（10分）在按字节编址的计算机 M 上，题43中 f1 的部分源程序（阴影部分）与对应的机器级代码（包括指令的虚拟地址）如下：
#align(center, table(columns: (2em, 6em, 5em, 16em), stroke: none,
 table.cell(colspan: 4, fill: luma(92%))[`int f1(unsigned n)`],
 [1], [00401020], [55], [`push ebp`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`for(unsigned i=0; i<=n-1; i++)`],
 [], [……], [……], [……],
 [20], [0040105E], [39 4D F4], [`cmp dword ptr [ebp-0Ch], ecx`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`{    power *= 2;`],
 [], [……], [……], [……],
 [23], [00401066], [D1 E2], [`shl edx, 1`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`return sum;`],
 [], [……], [……], [……],
 [35], [0040107F], [C3], [`ret`]))
其中，机器级代码行包括行号、虚拟地址、机器指令和汇编指令。请回答下列问题。
#subquestions[
 + 计算机 M 是 RISC 还是 CISC？为什么？
 + f1 的机器指令代码共占多少字节？要求给出计算过程。
 + 第20条指令 cmp 通过 $i$ 减 $n-1$ 实现对 $i$ 和 $n-1$ 的比较。执行 f1(0)过程中，当 $i=0$ 时，cmp 指令执行后，进/借位标志 CF 的内容是什么？要求给出计算过程。
 + 第23条指令 shl 通过左移操作实现了 power\*2运算，在 f2 中能否也用 shl 指令实现 power\*2？为什么？
]
]
#question[
（7分）假定题44给出的计算机 M 采用二级分页虚拟存储管理方式，虚拟地址格式如下：
#align(center, table(columns: (10fr, 10fr, 12fr), align: center,
 [页目录号（10位）], [页表索引（10位）], [页内偏移量（12位）]))
请针对题43的函数 f1 和题44中的机器指令代码，回答下列问题。
#subquestions[
 + 函数 f1 的机器指令代码占多少页？
 + 取第1条指令（push ebp）时，若在进行地址转换的过程中需要访问内存中的页目录和页表，则会分别访问它们各自的第几个表项（编号从0开始）？
 + M 的 I/O 采用中断控制方式。若进程 P 在调用 f1 之前通过 scanf()获取 $n$ 的值，则在执行 scanf()的过程中，进程 P 的状态会如何变化？CPU 是否会进入内核态？
]
]
#question[
（8分）某进程中有3个并发执行的线程 thread1、thread2 和 thread3，其伪代码如下所示。
#table(columns: (1.55fr, 1fr, 1fr),
 [```c
//复数的结构类型定义
typedef struct
{
    float a;
    float b;
} cnum;
cnum x, y, z; // 全局变量

//计算两个复数之和
cnum add(cnum p, cnum q)
{
    cnum s;
    s.a=p.a+q.a;
    s.b=p.b+q.b;
    return s;
}
```],
 [```
thread1
{
    cnum w;
    w=add(x,y);
    ……
}

thread2
{
    cnum w;
    w=add(y,z);
    ……
}
```],
 [```
thread3
{
    cnum w;
    w.a=1;
    w.b=1;
    z=add(z,w);
    y=add(y,w);
    ……
}
```])
请添加必要的信号量和 P、V（或 wait()、signal()）操作，要求确保线程互斥访问临界资源，并且最大程度地并发执行。
]
#question[
（9分）甲乙双方均采用后退 N 帧协议（GBN）进行持续的双向数据传输，且双方始终采用捎带确认，帧长均为1000 B。$S x,y$ 和 $R x,y$ 分别表示甲方和乙方发送的数据帧，其中：$x$ 是发送序号；$y$ 是确认序号（表示希望接收对方的下一帧序号）；数据帧的发送序号和确认序号字段均为3比特。信道传输速率为100 Mbps，RTT=0.96 ms。下图给出了甲方发送数据帧和接收数据帧的两种场景，其中 $t_0$ 为初始时刻，此时甲方的发送和确认序号均为0，$t_1$ 时刻甲方有足够多的数据待发送。
#align(center)[
#set text(size: .85em)
#cetz.canvas(length: .9em, {
 import cetz.draw: *
 set-style(stroke: .05em)
 for (offset, entries, t1, label) in (
  (0, ((true,21,20.1,[S0,0]),(true,19.5,18.6,[S1,0]),(true,18,17.1,[S2,0]),(true,16.5,15.6,[S3,0]),(false,14.9,13.2,[R0,1]),(true,12.2,11.3,[S4,1]),(false,10.3,8.6,[R1,3]),(false,8.6,6.9,[R3,3])), 5, [（a）]),
  (15, ((true,21,20.1,[S0,0]),(true,19.5,18.6,[S1,0]),(true,18,17.1,[S2,0]),(false,16.5,14.8,[R0,1]),(false,14.9,13.2,[R1,2]),(true,12.4,11.5,[S3,2]),(true,10.8,9.9,[S4,2]),(false,9.2,7.5,[R2,2])), 6, [（b）]),
 ) {
  content((offset,23.5),[甲方])
  line((offset,22.6),(offset,0),mark:(end:">"))
  circle((offset,22),radius:.15,fill:black)
  content((offset - .8,22.3),[$t_0$])
  for (outgoing,y1,y2,text) in entries {
   let x1 = if outgoing { offset } else { offset+9 }
   let x2 = if outgoing { offset+9 } else { offset }
   line((x1,y1),(x2,y2),mark:(end:">"))
   content((offset+4.4,(y1+y2)/2+.65),text)
  }
  circle((offset,t1),radius:.15,fill:black)
  content((offset - .8,t1+.3),[$t_1$])
  if offset == 15 {
   line((offset+.2,t1),(offset+2.5,t1+.5),stroke:.035em)
   circle((offset+5.3,t1+.65),radius:(3.05,.825),fill:luma(90%))
   content((offset+5.3,t1+.65),[S2,0超时])
  }
  let y = if offset == 0 { t1 } else { t1 - 1.6 }
  line((offset,y),(offset+9,y - .9),mark:(end:">"))
  content((offset+4.4,y+.25),[?])
  content((offset+4.5,y - 1.65),[……])
  line((offset,y - 3),(offset+9,y - 3.9),mark:(end:">"))
  content((offset+4.4,y - 2.6),[?])
  content((offset,-1),[时间]); content((offset+4.4,-2.2),label)
 }
})
]
请回答下列问题。
#subquestions[
 + 对于图（a），$t_0$ 时刻到 $t_1$ 时刻期间，甲方可以断定乙方已正确接收的数据帧数是多少？正确接收的是哪几个帧（请用 $S x,y$ 形式给出）？
 + 对于图（a），从 $t_1$ 时刻起，甲方在不出现超时且未收到乙方新的数据帧之前，最多还可以发送多少个数据帧？其中第一个帧和最后一个帧分别是哪个（请用 $S x,y$ 形式给出）？
 + 对于图（b），从 $t_1$ 时刻起，甲方在不出现新的超时且未收到乙方新的数据帧之前，需要重发多少个数据帧？重发的第一个帧是哪个（请用 $S x,y$ 形式给出）？
 + 甲方可以达到的最大信道利用率是多少？
]
]
