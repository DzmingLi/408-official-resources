// 官方来源：内容来源/2018年计算机考试大纲.pdf
// 原书第37—49页，修复版PDF第43—55页；逐页人工录入。
#import "../../template.typ": exam, choices, statements, subquestions, inline-node
#import "@preview/ezexam:0.3.1": question, mode-state, HANDOUTS, answer-state
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz
#show: exam.with(year: 2016)
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)

= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项符合题目要求。

#question[
已知表头元素为 c 的单链表在内存中的存储状态如下表所示。

#align(center, table(columns: (4em, 3em, 6em), align: center, stroke: none,
  [地址], [元素], [链接地址],
  [1000H], table.cell(stroke: 0.5pt)[a], table.cell(stroke: 0.5pt)[1010H],
  [1004H], table.cell(stroke: 0.5pt)[b], table.cell(stroke: 0.5pt)[100CH],
  [1008H], table.cell(stroke: 0.5pt)[c], table.cell(stroke: 0.5pt)[1000H],
  [100CH], table.cell(stroke: 0.5pt)[d], table.cell(stroke: 0.5pt)[NULL],
  [1010H], table.cell(stroke: 0.5pt)[e], table.cell(stroke: 0.5pt)[1004H],
  [1014H], table.cell(stroke: 0.5pt)[], table.cell(stroke: 0.5pt)[],
))

现将 f 存放于1014H处并插入到单链表中，若 f 在逻辑上位于 a 和 e 之间，则 a，e，f 的“链接地址”依次是
#choices([1010H,1014H,1004H], [1010H,1004H,1014H], [1014H,1010H,1004H], [1014H,1004H,1010H])
]

#question[
已知一个带有表头结点的双向循环链表 $L$，结点结构为 #inline-node([prev], [data], [next])，其中，prev 和 next 分别是指向其直接前驱和直接后继结点的指针。现要删除指针 $p$ 所指的结点，正确的语句序列是
#choices(
  [`p->next->prev=p->prev; p->prev->next=p->prev; free(p);`],
  [`p->next->prev=p->next; p->prev->next=p->next; free(p);`],
  [`p->next->prev=p->next; p->prev->next=p->prev; free(p);`],
  [`p->next->prev=p->prev; p->prev->next=p->next; free(p);`],
)
]

#question[
设有如下图所示的火车车轨，入口到出口之间有 $n$ 条轨道，列车的行进方向均为从左至右，列车可驶入任意一条轨道。现有编号为1～9的9列列车，驶入的次序依次是8，4，2，5，3，9，1，6，7。若期望驶出的次序依次为1～9，则 $n$ 至少是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: .045em, content: (wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .8em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  for y in (-.12,.12) {
    line((0,y),(27,y))
    for sign in (-1,1) {
      bezier((5.8,y),(9,sign*2.2+y),(7.5,y),(7.1,sign*2.2+y))
      line((9,sign*2.2+y),(18,sign*2.2+y))
      bezier((18,sign*2.2+y),(21.2,y),(19.9,sign*2.2+y),(19.5,y))
    }
  }
  for x in range(55).map(i => i*.5) { line((x,-.35),(x,.35)) }
  for sign in (-1,1) {
    for x in range(19).map(i => 9+i*.5) { line((x,sign*2.2-.35),(x,sign*2.2+.35)) }
    for t in (.2,.4,.6,.8) {
      let u = 1-t
      let x = 5.8*u*u*u + 3*7.5*u*u*t + 3*7.1*u*t*t + 9*t*t*t
      let y = sign*2.2*(3*u*t*t + t*t*t)
      let dx = 3*(7.5-5.8)*u*u + 6*(7.1-7.5)*u*t + 3*(9-7.1)*t*t
      let dy = sign*13.2*u*t
      let norm = calc.sqrt(dx*dx+dy*dy)
      let nx = -.35*dy/norm
      let ny = .35*dx/norm
      line((x+nx,y+ny),(x - nx,y - ny))
      line((27-x+nx,y - ny),(27-x - nx,y+ny))
    }
  }
  content((13.5,1.1),[$dots.v$]); content((13.5,-1.1),[$dots.v$])
  for (i,n) in (7,6,1,9,3,5,2,4,8).enumerate() { content((.2+i*.5,.7),str(n)) }
  for (i,n) in (9,8,7,6,5,4,3,2,1).enumerate() { content((22.5+i*.5,.7),str(n)) }
  for (x,y,label) in ((1,-1,[入口]),(23.5,-1,[出口]),(13,-3.1,[轨道])) {
    line((x - .7,y),(x+1.5,y),mark:(end:">",fill:black)); content((x+.4,y - .6),label)
  }
}))
#choices([2], [3], [4], [5])
]

#question[
有一个100阶的三对角矩阵 $M$，其元素 $m_(i,j)$（$1 <= i <= 100, 1 <= j <= 100$）按行优先次序压缩存入下标从0开始的一维数组 $N$ 中。元素 $m_(30,30)$ 在 $N$ 中的下标是
#choices([86], [87], [88], [89])
]

#question[
若森林 $F$ 有15条边、25个结点，则 $F$ 包含树的个数是
#choices([8], [9], [10], [11])
]

#question[
下列选项中，不是下图深度优先搜索序列的是

#align(center, diagram(spacing: 2.15em, node-stroke: 0.055em, edge-stroke: 0.055em, node-fill: white,
  node((0.5,0), [$V_1$], radius: 0.75em),
  node((0,1), [$V_2$], radius: 0.75em), node((1,1), [$V_3$], radius: 0.75em),
  node((0,2.25), [$V_4$], radius: 0.75em), node((1,2.25), [$V_5$], radius: 0.75em),
  edge((0.5,0),(0,1),"-|>"), edge((0.5,0),(1,1),"-|>"), edge((0.5,0),(1,2.25),"-|>"),
  edge((1,1),(0,1),"-|>"), edge((0,1),(1,2.25),"-|>"), edge((1,2.25),(0,2.25),"-|>"), edge((0,2.25),(1,1),"-|>"),
))
#choices([$V_1,V_5,V_4,V_3,V_2$], [$V_1,V_3,V_2,V_5,V_4$], [$V_1,V_2,V_5,V_4,V_3$], [$V_1,V_2,V_3,V_4,V_5$])
]

#question[
若将 $n$ 个顶点 $e$ 条弧的有向图采用邻接表存储，则拓扑排序算法的时间复杂度是
#choices([$O(n)$], [$O(n+e)$], [$O(n^2)$], [$O(n times e)$])
]

#question[
使用迪杰斯特拉（Dijkstra）算法求下图中从顶点1到其他各顶点的最短路径，依次得到的各最短路径的目标顶点是

#align(center, diagram(spacing: (3.5em,2.5em), node-stroke: 0.055em, edge-stroke: 0.055em, node-fill: white,
  node((0,0),[1],radius:0.7em), node((2,0),[2],radius:0.7em), node((4,0),[3],radius:0.7em),
  node((0,1.8),[4],radius:0.7em), node((2,1.8),[5],radius:0.7em), node((4,1.8),[6],radius:0.7em),
  edge((0,0),(2,0),"-|>",label:[5]), edge((2,0),(4,0),"-|>",label:[2]),
  edge((0,1.8),(0,0),"-|>",label:[2]), edge((0,0),(2,1.8),"-|>",label:[4],label-pos:0.35),
  edge((2,0),(0,1.8),"-|>",label:[9],label-pos:0.65), edge((2,1.8),(2,0),"-|>",label:[6]),
  edge((4,0),(2,1.8),"-|>",label:[6]), edge((2,1.8),(0,1.8),"-|>",label:[7]),
  edge((2,1.8),(4,1.8),"-|>",label:[5]), edge((4,1.8),(4,0),"-|>",label:[2]),
))
#choices([5,2,3,4,6], [5,2,3,6,4], [5,2,4,3,6], [5,2,6,3,4])
]

#question[
在有 $n$（$n > 1000$）个元素的升序数组 A 中查找关键字 $x$，查找算法的伪代码如下所示。

```text
k = 0;
while(k<n 且 A[k]<x) k=k+3;
if(k<n 且 A[k]==x) 查找成功;
else if(k-1<n 且 A[k-1]==x) 查找成功;
     else if(k-2<n 且 A[k-2]==x) 查找成功;
          else 查找失败;
```

本算法与折半查找算法相比，有可能具有更少比较次数的情形是
#choices([当 $x$ 不在数组中], [当 $x$ 接近数组开始处], [当 $x$ 接近数组结尾处], [当 $x$ 位于数组中间位置])
]

#question[
$B^+$树不同于B树的特点之一是
#choices([能支持顺序查找], [结点中含有关键字], [根结点至少有两个分支], [所有叶结点都在同一层上])
]

#question[
对10 TB的数据文件进行排序，应使用的方法是
#choices([希尔排序], [堆排序], [快速排序], [归并排序])
]

#question[
将高级语言源程序转换为机器级目标代码文件的程序是
#choices([汇编程序], [链接程序], [编译程序], [解释程序])
]

#question[
有如下C语言程序段：
```c
short si=-32767;
unsigned short usi=si;
```
执行上述两条语句后，usi 的值为
#choices([-32767], [32767], [32768], [32769])
]

#question[
某计算机字长为32位，按字节编址，采用小端（Little Endian）方式存放数据。假定有一个 double 型变量，其机器数表示为1122 3344 5566 7788H，存放在0000 8040H开始的连续存储单元中，则存储单元0000 8046H中存放的是
#choices([22H], [33H], [66H], [77H])
]

#question[
有如下C语言程序段：
```c
for(k=0;k<1000;k++)
    a[k]=a[k]+32;
```
若数组 a 及变量 k 均为 int 型，int 型数据占4 B，数据 Cache 采用直接映射方式、数据区大小为1 KB、块大小为16 B，该程序段执行前 Cache 为空，则该程序段执行过程中访问数组 a 的 Cache 缺失率约为
#choices([1.25%], [2.5%], [12.5%], [25%])
]

#question[
某存储器容量为64 KB，按字节编址，地址4000H～5FFFH为ROM区，其余为RAM区。若采用 $8 "K" times 4$ 位的SRAM芯片进行设计，则需要该芯片的数量是
#choices([7], [8], [14], [16])
]

#question[
某指令格式如下所示。

#align(center, table(columns:(4em,3em,3em,5em), align:center, [OP],[M],[I],[D]))

其中 M 为寻址方式，I 为变址寄存器编号，D 为形式地址。若采用先变址后间址的寻址方式，则操作数的有效地址是
#choices([I+D], [(I)+D], [((I)+D)], [((I))+D])
]

#question[
某计算机主存空间为4 GB，字长为32位，按字节编址，采用32位定长指令字格式。若指令按字边界对齐存放，则程序计数器（PC）和指令寄存器（IR）的位数至少分别是
#choices([30,30], [30,32], [32,30], [32,32])
]

#question[
在无转发机制的五段基本流水线（取指、译码/读寄存器、运算、访存、写回寄存器）中，下列指令序列存在数据冒险的指令对是

```text
I1: add R1, R2, R3 ; (R2)+(R3)→R1
I2: add R5, R2, R4 ; (R2)+(R4)→R5
I3: add R4, R5, R3 ; (R5)+(R3)→R4
I4: add R5, R2, R6 ; (R2)+(R6)→R5
```
#choices([I1和I2], [I2和I3], [I2和I4], [I3和I4])
]

#question[
单周期处理器中所有指令的指令周期为一个时钟周期。下列关于单周期处理器的叙述中，#emphasis[错误]的是
#choices([可以采用单总线结构数据通路], [处理器时钟频率较低], [在指令执行过程中控制信号不变], [每条指令的CPI为1])
]

#question[
下列关于总线设计的叙述中，#emphasis[错误]的是
#choices([并行总线传输比串行总线传输速度快], [采用信号线复用技术可减少信号线数量], [采用突发传输方式可提高总线数据传输率], [采用分离事务通信方式可提高总线利用率])
]

#question[
异常是指令执行过程中在处理器内部发生的特殊事件，中断是来自处理器外部的请求事件。下列关于中断或异常情况的叙述中，#emphasis[错误]的是
#choices([“访存时缺页”属于中断], [“整数除以0”属于异常], [“DMA传送结束”属于中断], [“存储保护错”属于异常])
]

#question[
下列关于批处理系统的叙述中，正确的是
#statements(columns:1,
 [Ⅰ. 批处理系统允许多个用户与计算机直接交互],
 [Ⅱ. 批处理系统分为单道批处理系统和多道批处理系统],
 [Ⅲ. 中断技术使得多道批处理系统的I/O设备可与CPU并行工作],
)
#choices([仅Ⅱ、Ⅲ], [仅Ⅱ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ])
]

#question[
某单CPU系统中有输入和输出设备各1台，现有3个并发执行的作业，每个作业的输入、计算和输出时间均分别为2 ms、3 ms和4 ms，且都按输入、计算和输出的顺序执行，则执行完3个作业需要的时间最少是
#choices([15 ms], [17 ms], [22 ms], [27 ms])
]

#question[
系统中有3个不同的临界资源R1、R2和R3，被4个进程p1、p2、p3及p4共享。各进程对资源的需求为：p1申请R1和R2，p2申请R2和R3，p3申请R1和R3，p4申请R2。若系统出现死锁，则处于死锁状态的进程数至少是
#choices([1], [2], [3], [4])
]

#question[
某系统采用改进型CLOCK置换算法，页表项中字段A为访问位，M为修改位。A=0表示页最近没有被访问，A=1表示页最近被访问过。M=0表示页没有被修改过，M=1表示页被修改过。按（A，M）所有可能的取值，将页分为四类：（0，0）、（1，0）、（0，1）和（1，1），则该算法淘汰页的次序为
#choices([(0,0),(0,1),(1,0),(1,1)], [(0,0),(1,0),(0,1),(1,1)], [(0,0),(0,1),(1,1),(1,0)], [(0,0),(1,1),(0,1),(1,0)])
]

#question[
使用TSL（Test and Set Lock）指令实现进程互斥的伪代码如下所示。
```text
do {
    ……
    while(TSL(&lock));
    critical section;
    lock=FALSE;
    ……
} while(TRUE);
```
下列与该实现机制相关的叙述中，正确的是
#choices([退出临界区的进程负责唤醒阻塞态进程], [等待进入临界区的进程不会主动放弃CPU], [上述伪代码满足“让权等待”的同步准则], [`while(TSL(&lock))`语句应在关中断状态下执行])
]

#question[
某进程的段表内容如下所示。

#align(center, table(columns:(3em,3em,7em,4em,5em),align:center,stroke:none,
 [段号],table.cell(stroke:0.5pt)[段长],table.cell(stroke:0.5pt)[内存起始地址],table.cell(stroke:0.5pt)[权限],table.cell(stroke:0.5pt)[状态],
 [0],table.cell(stroke:0.5pt)[100],table.cell(stroke:0.5pt)[6000],table.cell(stroke:0.5pt)[只读],table.cell(stroke:0.5pt)[在内存],
 [1],table.cell(stroke:0.5pt)[200],table.cell(stroke:0.5pt)[—],table.cell(stroke:0.5pt)[读写],table.cell(stroke:0.5pt)[不在内存],
 [2],table.cell(stroke:0.5pt)[300],table.cell(stroke:0.5pt)[4000],table.cell(stroke:0.5pt)[读写],table.cell(stroke:0.5pt)[在内存],
))

当访问段号为2、段内地址为400的逻辑地址时，进行地址转换的结果是
#choices([段缺失异常], [得到内存地址4400], [越权异常], [越界异常])
]

#question[
某进程访问页面的序列如下所示。

#align(center,cetz.canvas(length:1em,{
 import cetz.draw: *
 set-style(stroke:0.045em, content:(wrap: body => box(text(size:.85em,body))))
 let sequence = ([⋯],[1],[3],[4],[5],[6],[0],[3],[2],[3],[2],[0],[4],[0],[3],[2],[9],[2],[1],[⋯])
 for (i,label) in sequence.enumerate() {
   content((i*1.15,.8),label)
   if i < 19 { content((i*1.15+.5,.8),[,]) }
 }
 line((-.4,0),(23,0),mark:(end:">",fill:black))
 line((12.075,-.8),(12.075,.55),mark:(end:">",fill:black))
 content((12.075,-1.3),[$t$]); content((21,-.8),[时间])
}))

若工作集的窗口大小为6，则在 $t$ 时刻的工作集为
#choices([$\{6,0,3,2\}$], [$\{2,3,0,4\}$], [$\{0,4,3,2,9\}$], [$\{4,5,6,0,3,2\}$])
]

#question[
进程P1和P2均包含并发执行的线程，部分伪代码描述如下所示。

#align(center,table(columns:2,inset:0.45em,align:left,
 [```text
//进程 P1
int x=0;
Thread1()
{   int a;
    a=1; x+=1;
}
Thread2()
{   int a;
    a=2; x+=2;
}
```],
 [```text
//进程 P2
int x=0;
Thread3()
{   int a;
    a=x; x+=3;
}
Thread4()
{   int b;
    b=x; x+=4;
}
```],
))

下列选项中，需要互斥执行的操作是
#choices([`a=1`与`a=2`], [`a=x`与`b=x`], [`x+=1`与`x+=2`], [`x+=1`与`x+=3`])
]

#question[
下列关于SPOOLing技术的叙述中，#emphasis[错误]的是
#choices([需要外存的支持], [需要多道程序设计技术的支持], [可以让多个作业共享一台独占设备], [由用户作业控制设备与输入/输出井之间的数据传送])
]

#question[
下列关于管程的叙述中，#emphasis[错误]的是
#choices([管程只能用于实现进程的互斥], [管程是由编程语言支持的进程同步机制], [任何时候只能有一个进程在管程中执行], [管程中定义的变量只能被管程内的过程访问])
]

*题33～41均依据题33～41图回答。*

#question[
#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  let p(x,y) = (x/47,(800-y)/47)
  set-style(stroke:.045em,content:(wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .72em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  let label(x,y,body) = content(p(x,y),body)
  let cloud(x,y,w,h,body) = {
    content(p(x,y),image("../../assets/network/cisco-cloud.svg",width:w/47*1em,height:h/47*1em,fit:"stretch"))
    label(x,y,body)
  }
  for (a,b) in (((300,124),(847,124)),((517,124),(517,551)),((847,124),(847,354)),
    ((188,355),(847,355)),((188,355),(188,551)),((517,551),(1031,551)),
    ((517,551),(388,705)),((517,551),(655,705)),((829,551),(1031,705))) {line(p(..a),p(..b))}
  cloud(209,153,380,220,[Internet\ 130.18.10.1\ Web服务器S])
  cloud(188,355,295,155,[201.1.1.0/24]); cloud(1075,355,260,155,[201.1.2.0/25])
  for (x,y,n) in ((517,120,1),(517,354,2),(847,350,3)) {
    content(p(x,y),image("../../assets/network/visio-2003-router.svg",width:2.2em,height:2.2em,fit:"contain"))
    label(x,y+22,[R#n])
  }
  content(p(188,550),image("official-images/dns-server.png",height:2.1em))
  label(188,638,[DNS服务器]); label(188,676,[201.1.1.1])
  content(p(517,550),image("../../assets/network/visio-2003-switch.svg",width:2.6em))
  content(p(829,550),image("../../assets/network/visio-2003-hub.svg",width:2.6em))
  label(449,491,[Switch]); label(777,491,[Hub])
  for (x,y,n) in ((388,705,1),(655,705,2),(1031,705,3),(1031,551,4)) {
    content(p(x,y),image("official-images/desktop.png",width:1.8em))
    label(x+(if n<=2 {66} else {0}),y+(if n<=2 {0} else {-55}),[H#n])
  }
  for (x,y,body) in ((388,776,[192.168.3.2]),(655,776,[192.168.3.3]),
    (1172,560,[192.168.3.252]),(1172,718,[192.168.3.251]),
    (604,193,[201.1.3.9]),(732,329,[201.1.3.1]),(636,428,[192.168.3.254]),
    (463,285,[NAT]),(545,285,[L0]),(443,333,[E0]),(591,333,[L1]),(493,431,[E1])) {label(x,y,body)}
  content(p(1078,165),box(stroke:.045em,inset:.4em,text(size:.65em)[
    图中：\ R1～R3为路由器；\ Switch为100Base-T交换机；\ Hub为100Base-T集线器；\
    主机H1～H4的默认域名服务\ 器均配置为201.1.1.1。
  ]))
})),caption:[题33～41图],kind:image)
// 题33～41共用图结束

在OSI参考模型中，R1、Switch、Hub实现的最高功能层分别是
#choices([2,2,1], [2,2,2], [3,2,1], [3,2,2])
]

#question[
若连接R2和R3链路的频率带宽为8 kHz，信噪比为30 dB，该链路实际数据传输速率约为理论最大数据传输速率的50%，则该链路的实际数据传输速率约是
#choices([8 kbps], [20 kbps], [40 kbps], [80 kbps])
]

#question[
若主机H2向主机H4发送1个数据帧，主机H4向主机H2立即发送一个确认帧，则除H4外，从物理层上能够收到该确认帧的主机还有
#choices([仅H2], [仅H3], [仅H1、H2], [仅H2、H3])
]

#question[
若Hub再生比特流过程中，会产生1.535 μs延时，信号传播速率为200 m/μs，不考虑以太网帧的前导码，则H3与H4之间理论上可以相距的最远距离是
#choices([200 m], [205 m], [359 m], [512 m])
]

#question[
假设R1、R2、R3采用RIP协议交换路由信息，且均已收敛。若R3检测到网络201.1.2.0/25不可达，并向R2通告一次新的距离向量，则R2更新后，其到达该网络的距离是
#choices([2], [3], [16], [17])
]

#question[
假设连接R1、R2和R3之间的点对点链路使用201.1.3.x/30地址，当H3访问Web服务器S时，R2转发出去的封装HTTP请求报文的IP分组的源IP地址和目的IP地址分别是
#choices([192.168.3.251,130.18.10.1], [192.168.3.251,201.1.3.9], [201.1.3.8,130.18.10.1], [201.1.3.10,130.18.10.1])
]

#question[
假设H1与H2的默认网关和子网掩码均分别配置为192.168.3.1和255.255.255.128，H3与H4的默认网关和子网掩码均分别配置为192.168.3.254和255.255.255.128，则下列现象中可能发生的是
#choices([H1不能与H2进行正常IP通信], [H2与H4均不能访问Internet], [H1不能与H3进行正常IP通信], [H3不能与H4进行正常IP通信])
]

#question[
假设所有域名服务器均采用迭代查询方式进行域名解析。当H4访问规范域名为www.abc.xyz.com的网站时，域名服务器201.1.1.1在完成该域名解析过程中，可能发出DNS查询的最少和最多次数分别是
#choices([0,3], [1,3], [0,4], [1,4])
]

= 二、综合应用题：41～47小题，共70分。

#question[
（9分）假设题33～41图中的H3访问Web服务器S时，S为新建的TCP连接分配了20 KB（K=1024）的接收缓存，最大段长MSS=1 KB，平均往返时间RTT=200 ms。H3建立连接时的初始序号为100，且持续以MSS大小的段向S发送数据，拥塞窗口初始阈值为32 KB；S对收到的每个段进行确认，并通告新的接收窗口。假定TCP连接建立完成后，S端的TCP接收缓存仅有数据存入而无数据取出。请回答下列问题。
#subquestions[
+ 在TCP连接建立过程中，H3收到的S发送过来的第二次握手TCP段的SYN和ACK标志位的值分别是多少？确认序号是多少？
+ H3收到的第8个确认段所通告的接收窗口是多少？此时H3的拥塞窗口变为多少？H3的发送窗口变为多少？
+ 当H3的发送窗口等于0时，下一个待发送的数据段序号是多少？H3从发送第1个数据段到发送窗口等于0时刻为止，平均数据传输速率是多少（忽略段的传输延时）？
+ 若H3与S之间通信已经结束，在 $t$ 时刻H3请求断开该连接，则从 $t$ 时刻起，S释放该连接的最短时间是多少？
]
]

#question[
（8分）如果一棵非空 $k$（$k >= 2$）叉树 $T$ 中每个非叶结点都有 $k$ 个孩子，则称 $T$ 为正则 $k$ 叉树。请回答下列问题并给出推导过程。
#subquestions[
+ 若 $T$ 有 $m$ 个非叶结点，则 $T$ 中的叶结点有多少个？
+ 若 $T$ 的高度为 $h$（单结点的树 $h=1$），则 $T$ 的结点数最多为多少个？最少为多少个？
]
]

#question[
（15分）已知由 $n$（$n >= 2$）个正整数构成的集合 $A=\{a_k | 0 <= k < n\}$，将其划分为两个不相交的子集 $A_1$ 和 $A_2$，元素个数分别是 $n_1$ 和 $n_2$，$A_1$ 和 $A_2$ 中元素之和分别为 $S_1$ 和 $S_2$。设计一个尽可能高效的划分算法，满足 $abs(n_1-n_2)$ 最小且 $abs(S_1-S_2)$ 最大。要求：
#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。
+ 说明你所设计算法的平均时间复杂度和空间复杂度。
]
]

#question[
（9分）假定CPU主频为50 MHz，CPI为4。设备D采用异步串行通信方式向主机传送7位ASCII字符，通信规程中有1位奇校验位和1位停止位，从D接收启动命令到字符送入I/O端口需要0.5 ms。请回答下列问题，要求说明理由。
#subquestions[
+ 每传送一个字符，在异步串行通信线上共需传输多少位？在设备D持续工作过程中，每秒钟最多可向I/O端口送入多少个字符？
+ 设备D采用中断方式进行输入/输出，示意图如下：

  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    // 对照原考纲书内第47页：后两次启动发生在中断服务期间。
    let pen = 0.045em
    let dashed = (thickness: pen, dash: "dashed")
    let arrow = (end: ">", fill: black, scale: 0.7)
    let label(x, y, body) = content((x, y), {
      set par(leading: 0.2em, spacing: 0pt)
      show par: it => it
      box(text(top-edge: "bounds", bottom-edge: "bounds", body))
    }, anchor: "center")
    let device-y = 4.4
    let service-y = 2.4
    let starts = (1.3, 10.1, 18.9)
    let work = 5.4
    let response-delay = 0.75
    let service = 3.4

    label(-2, device-y, [外设D])
    label(-2, 0.8, [CPU])
    for (i, start) in starts.enumerate() {
      let request = start + work
      let response = request + response-delay
      let returned = response + service
      let previous-return = if i == 0 { 0 } else {
        starts.at(i - 1) + work + response-delay + service
      }
      // 设备启动和工作完成用虚线；完成时向CPU提出中断请求。
      line((start, if i == 0 { 0 } else { service-y }),
        (start, device-y), stroke: dashed)
      line((start, device-y), (request, device-y), stroke: pen)
      line((request, device-y), (request, 0), stroke: dashed, mark: arrow)
      label(start + work / 2, device-y + 0.9, [工作])
      label(request + 0.8, device-y + 0.05, [完\ 成])

      // CPU响应后进入中断服务，随后返回原程序。
      line((previous-return, 0), (response, 0), stroke: pen)
      line((response, 0), (response, service-y), stroke: pen, mark: arrow)
      line((response, service-y), (returned, service-y), stroke: pen)
      line((returned, service-y), (returned, 0), stroke: dashed, mark: arrow)
      label(request - 0.3, -1.35, [请\ 求])
      label(response + 0.4, -1.35, [响\ 应])
      if i == 0 { label(start, -1.35, [启\ 动]) }
      if i < starts.len() - 1 {
        label(starts.at(i + 1), service-y / 2, [启\ 动])
        label(returned + 0.05, -1.35, [返\ 回])
      } else {
        line((returned, 0), (returned + 0.65, 0), stroke: pen)
      }
    }
  }))

  I/O端口每收到一个字符申请一次中断，中断响应需10个时钟周期，中断服务程序共有20条指令，其中第15条指令启动D工作。若CPU需从D读取1000个字符，则完成这一任务所需时间大约是多少个时钟周期？CPU用于完成这任务的时间大约是多少个时钟周期？在中断响应阶段CPU进行了哪些操作？
]
]

#question[
（14分）某计算机采用页式虚拟存储管理方式，按字节编址，虚拟地址为32位，物理地址为24位，页大小为8 KB；TLB采用全相联映射；Cache数据区大小为64 KB，按2路组相联方式组织，主存块大小为64 B。存储访问过程的示意图如下。

#align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  let p(x,y) = (x/50,(650-y)/50)
  set-style(stroke: .045em, content: (wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .73em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  let label(x,y,body) = content(p(x,y),body)
  let arrow(..points) = line(..points.pos().map(point => p(..point)),mark:(end:">",fill:black,scale:.7))
  let cell(x1,y1,x2,y2,body) = {
    rect(p(x1,y1),p(x2,y2)); label((x1+x2)/2,(y1+y2)/2,body)
  }
  label(90,68,[虚拟地址]); cell(165,48,336,88,[A]); cell(336,48,451,88,[])
  label(718,71,[物理地址]); cell(793,53,970,93,[C]); cell(970,53,1078,93,[D])
  arrow((394,48),(394,18),(1022,18),(1022,53))
  line(p(936,103),p(936,132),stroke:.14em)
  line(p(924,132),p(936,150),p(948,132))
  for (x1,x2,body) in ((793,888,[E]),(888,994,[F]),(994,1078,[G])) {cell(x1,163,x2,203,body)}
  label(285,177,[标记]); label(397,177,[页框号])
  rect(p(240,199),p(468,320))
  for y in (240,280) { line(p(240,y),p(468,y)) }
  line(p(335,199),p(335,320)); label(285,300,[B]); label(517,260,[TLB])
  for y in (219,299) {
    cell(78,y - 20,193,y+20,[比较器]); arrow((30,y),(78,y))
    arrow((255,y),(193,y)); circle(p(255,y),radius:.055,fill:black)
  }
  label(134,259,[$dots.v$]); arrow((250,88),(250,117),(30,117),(30,501),(238,501))
  label(285,380,[存在位]); label(395,380,[页框号])
  rect(p(239,401),p(466,561)); line(p(325,401),p(325,561))
  for y in (441,481,521) { line(p(239,y),p(466,y)) }
  label(516,453,[页表])
  circle(p(452,300),radius:.055,fill:black); arrow((452,300),(582,300))
  circle(p(452,503),radius:.055,fill:black); arrow((452,503),(582,503))
  arrow((582,503),(582,122),(879,122),(879,93))
  for (x,label-body) in ((782,[标记]),(895,[数据]),(1008,[标记]),(1120,[数据])) { label(x,291,label-body) }
  rect(p(733,315),p(1191,477))
  for x in (830,963,1059) { line(p(x,315),p(x,477)) }
  for y in (355,395,435) { line(p(733,y),p(1191,y)) }
  label(783,416,[H]); label(1254,389,[Cache])
  arrow((940,203),(940,244),(697,244),(697,418),(733,418))
  for (x,tag-x) in ((781,840),(1009,840)) {
    cell(x - 57,516,x+58,555,[比较器]); arrow((x,477),(x,516))
    arrow((tag-x,203),(tag-x - 181,203),(tag-x - 181,596),(x,596),(x,555))
  }
}))

请回答下列问题。
#subquestions[
+ 图中字段A～G的位数各是多少？TLB标记字段B中存放的是什么信息？
+ 将块号为4099的主存块装入到Cache中时，所映射的Cache组号是多少？对应的H字段内容是什么？
+ Cache缺失处理的时间开销大还是缺页处理的时间开销大？为什么？
+ 为什么Cache可以采用直写（Write Through）策略，而修改页面内容时总是采用回写（Write Back）策略？
]
]

#question[
（6分）某进程调度程序采用基于优先数（priority）的调度策略，即选择优先数最小的进程运行，进程创建时由用户指定一个 nice 作为静态优先数。为了动态调整优先数，引入运行时间 cpuTime 和等待时间 waitTime，初值均为0。进程处于执行态时，cpuTime 定时加1，且 waitTime 置0；进程处于就绪态时，cpuTime 置0，waitTime 定时加1。请回答下列问题。
#subquestions[
+ 若调度程序只将 nice 的值作为进程的优先数，即 priority=nice，则可能会出现饥饿现象，为什么？
+ 使用 nice、cpuTime 和 waitTime 设计一种动态优先数计算方法，以避免产生饥饿现象，并说明 waitTime 的作用。
]
]

#question[
（9分）某磁盘文件系统使用链接分配方式组织文件，簇大小为4 KB。目录文件的每个目录项包括文件名和文件的第一个簇号，其他簇号存放在文件分配表FAT中。
#subquestions[
+ 假定目录树如下图所示，各文件占用的簇号及顺序如下表所示，其中 dir、dir1 是目录，file1、file2 是用户文件。请给出所有目录文件的内容。

  #align(center,grid(columns:(10em,auto),gutter:2em,
    cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: .05em, content: (wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .85em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  let folder(x,y,name) = {
    content((x,y),image("../../assets/file-system/visio-2007-open-folder.svg",width:1.5em,height:1em,fit:"stretch"))
    content((x+.9,y),name,anchor:"west")
  }
  let file(x,y,name) = {
    content((x,y),image("../../assets/file-system/visio-2007-document.svg",width:.8em,height:1.2em,fit:"stretch"))
    content((x+.65,y),name,anchor:"west")
  }
  line((.2,5.6),(.2,4),(2.15,4))
  line((2.7,3.5),(2.7,2),(4.55,2))
  line((2.7,3.5),(2.7,0),(4.55,0))
  folder(0,6,[dir]); folder(2.7,4,[dir1])
  file(5,2,[file1])
  file(5,0,[file2])
}),
    table(columns:(4em,9em),align:center,[文件名],[簇号],[dir],[1],[dir1],[48],[file1],[100,106,108],[file2],[200,201,202]),
  ))
+ 若FAT的每个表项仅存放簇号，占2个字节，则FAT的最大长度为多少字节？该文件系统支持的文件长度最大是多少？
+ 系统通过目录文件和FAT实现对文件的按名存取，说明 file1 的106、108两个簇号分别存放在FAT的哪个表项中。
+ 假设仅FAT和dir目录文件已读入内存，若需将文件dir/dir1/file1的第5000个字节读入内存，则要访问哪几个簇？
]
]
