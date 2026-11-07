// 官方来源：2027年全国硕士研究生招生考试计算机学科专业基础考试大纲，原书67—85页。
#import "../../template.typ": exam, choices, statements, subquestions, inline-node
#import "@preview/ezexam:0.3.1": question, mode-state, HANDOUTS, answer-state
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz
#show: exam.with(year: 2026)
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)

= 一、单项选择题：第1～40小题，每小题2分，共80分。下列每小题给出的四个选项中，只有一个选项是最符合题目要求的。

#question[
线性表 $L$ 含有 $n(n>=3)$ 个元素，采用顺序存储方式保存。在 $L$ 中原有元素相对次序保持不变且仍有空闲存储空间的情况下，下列操作中，一定会移动多个元素的是
#statements(columns: 2, [Ⅰ．在表头插入一个元素], [Ⅱ．在表头删除一个元素], [Ⅲ．在表尾插入一个元素], [Ⅳ．在表尾删除一个元素])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ])
]
#question[
已知带头结点的双向链表 $L$ 含有 $n(n>=3)$ 个元素，结点结构为 #inline-node([p2], [d], [p1])，其中，p2 和 p1 分别是指向其直接前驱和直接后继结点的指针，指针 head 指向头结点，指针 cu = head。现要将 $L$ 各结点中的 p2 指针修改为指向 p1 所指结点的直接后继结点。当指针指向的结点不存在时，相应的指针值为 NULL。下列选项中，可以完成修改功能的是
#choices(
 [`while(cu!=NULL){cu->p2=cu->p1->p1; cu=cu->p1;}`],
 [`while(cu!=NULL&&cu->p2!=NULL){cu->p2=cu->p1->p1; cu=cu->p1;}`],
 [`while(cu!=NULL){if(cu->p1!=NULL){cu->p2=cu->p1->p1; cu=cu->p1;}}`],
 [`while(cu!=NULL){if(cu->p1!=NULL) cu->p2=cu->p1->p1; else cu->p2=NULL; cu=cu->p1;}`])
]
#question[
若二叉树 $T$ 的中序遍历序列是 $b,e,d,f,c,a,g$，层序遍历序列是 $a,b,g,c,d,e,f$，则 $T$ 的后序遍历序列是
#choices([$c,e,d,f,b,g,a$], [$c,e,f,d,b,g,a$], [$e,f,d,c,b,g,a$], [$e,g,f,d,b,c,a$])
]
#question[
已知由5棵树组成的森林 $F$ 中各棵树所含的结点个数分别是2，3，4，5，7。若 $F$ 中各棵树的排列次序任意，则与 $F$ 对应的二叉树的高度至少是
#choices([5], [6], [8], [10])
]
#question[
已知二叉树 $T$ 中7个叶结点 $a,b,c,d,e,f,g$ 的权值分别是1，2，4，5，8，10，12，当 $T$ 的带权路径长度最小时，与结点 $e$ 深度相同的叶结点仅有
#choices([$d$], [$g$], [$d,f$], [$f,g$])
]
#question[
若用邻接表保存有向图 $G=(V,E)$，则计算 $G$ 中某顶点入度的时间复杂度是
#choices([$O(abs(V))$], [$O(min(abs(V),abs(E)))$], [$O(abs(E))$], [$O(max(abs(V),abs(E)))$])
]
#question[
有向图 $G=(V,E)$ 的顶点个数为 $n(n>=2)$，指定一个顶点为初始点，指定若干个顶点（非初始点）为标记点，且每个顶点都在从初始点到标记点的有向路径上（一条有向路径上允许含有多个标记点）。每条有向边上均有一个字符，从初始点到任一标记点的有向路径上的所有字符组成一个字符串，所有这样的字符串构成字符串集 $S$。下列关于 $S$ 的叙述中，#emphasis[错误]的是
#choices([若 $G$ 无环，则 $S$ 是有穷集], [若 $G$ 无环，则 $S$ 中存在长度等于 $n$ 的字符串], [若 $G$ 有环，则 $S$ 中存在长度大于 $n$ 的字符串], [若 $G$ 有环，则 $S$ 中存在长度小于 $2n$ 的字符串])
]
#question[
高度为4的平衡二叉树中，根结点左、右子树的结点个数相差最多是
#choices([1], [2], [3], [5])
]
#question[
使用直接插入排序算法分别对下列数据进行升序排序，元素之间比较次数最少的是
#choices([30，27，56，41，80，95，69], [31，43，26，55，63，99，77], [61，84，51，23，34，91，40], [93，32，48，81，50，21，72])
]
#question[
某考试考查了课程 C1 和 C2，C1、C2 成绩及总成绩（C1、C2 成绩之和）均保存在数组 $M$ 中。现需根据考生的总成绩从高到低进行排名，总成绩相同者的排名由 C1 成绩从高到低决定，C1 成绩也相同者的排名由初始相对次序决定。假设先按 C1 成绩对 $M$ 排序，再按总成绩对 $M$ 排序，能得到正确的排名结果，则下列算法中，采用的是
#choices([基数排序], [快速排序], [希尔排序], [选择排序])
]
#question[
采用 $k$-路归并对外存中保存的数据进行排序，排序的趟数记为 $d$。下列叙述中，正确的是
#statements(columns: 1, [Ⅰ．增大 $k$ 的值可能减小 $d$ 的值], [Ⅱ．初始归并段的个数不影响 $d$ 的值], [Ⅲ．可用内存大小限制了初始归并段的最大长度])
#choices([仅Ⅰ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ])
]
#question[
下列关于计算机系统层次结构的叙述中，#emphasis[错误]的是
#choices([最上层是应用软件层，最下层是器件及物理封装层], [指令集体系结构是软件和硬件之间的接口，且必不可少], [计算机组成（即微架构）属于指令集体系结构的物理实现层], [操作系统可通过指令集体系结构进行相应抽象，向上层软件提供服务])
]
#question[
对机器数1010 0110B先算术右移3位，再算术左移2位，最终结果是
#choices([1101 0000B], [1101 0011B], [0101 0000B], [0101 0011B])
]
#question[
已知 float 型变量用 IEEE 754 单精度浮点数格式表示，采用就近舍入（中间值取偶数）方式。若 float 型变量 $x$ 值为12.1（提示：0.1 = 0.000 1100 1100 1100 1100 1100…B），则 $x$ 的机器数是
#choices([4141 9999H], [4141 999AH], [41E0 CCCCH], [41E0 CCCDH])
]
#question[
若用8个 $64"M" times 8$ 位的 DRAM 芯片按交叉编址方式构成主存储器，并与一个宽度为64位的存储器总线相连，主存每次最多读写64位，且按字节编址，则下列地址中，与主存地址0018 001DH位于同一芯片中的是
#choices([0000 01D5H], [000F A020H], [0018 001EH], [0F02 0014H])
]
#question[
对于下列选项中给出的相关内容，#emphasis[不是]由指令集体系结构规定的是
#choices([指令集中是否包含输入和输出指令], [采用向量中断还是非向量中断方式], [采用段式还是页式虚拟存储管理方式], [指令流水线是否采用超级流水线技术])
]
#question[
下列指令中，执行后有可能按存放顺序执行其下一条指令的是
#statements(columns: 2, [Ⅰ．条件跳转指令], [Ⅱ．过程调用指令], [Ⅲ．陷阱（Trap）指令], [Ⅳ．过程返回指令])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅲ、Ⅳ])
]
#question[
某计算机按字节编址，数据 Cache 共有1024行，采用4路组相联映射方式，主存块大小为32 B。若需要访问主存地址为1028的4字节数据，则该数据所在主存块对应的 Cache 组号是
#choices([4], [16], [32], [64])
]
#question[
某计算机按字节编址，虚拟地址为16位，页大小为256 B，页表项中包含装入位（P）、页框号（PPN）等字段，TLB 采用4路组相联映射方式，共有16个 TLB 表项，TLB 表项中包含标记（Tag）、有效位（V）等字段。在 TLB 表项与主存页表同步后，若主存页表中页号22对应的页表项中 P=0、PPN=2AH，则下列选项中，#emphasis[不可能]出现在组号为2的 TLB 表项中的是
#choices([Tag = 05H、V = 1、PPN = 1CH], [Tag = 06H、V = 1、PPN = 2AH], [Tag = 16H、V = 0、PPN = 2AH], [Tag = 1AH、V = 0、PPN = 1CH])
]
#question[
在不考虑异常/中断处理和访存额外开销的前提下，下列关于数据通路结构与 CPI 之间关系的叙述中，正确的是
#statements(columns: 1, [Ⅰ．单周期数据通路计算机的 CPI 等于1], [Ⅱ．多周期数据通路计算机的 CPI 大于1], [Ⅲ．流水线数据通路计算机的 CPI 等于1])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]
#question[
I/O 子系统中，由驱动程序和中断服务程序直接控制外设与主机之间的输入/输出操作，其中需要用到一些特权指令。下列指令中，#emphasis[不属于]特权指令的是
#choices([I/O 指令], [关中断指令], [中断返回指令], [系统调用指令])
]
#question[
中断控制 I/O 方式下，实现 I/O 需要硬件和软件协同完成。中断响应及处理过程所包含的下列工作中，必须由硬件完成的是
#choices([开中断], [中断判优], [保存断点], [保存通用寄存器])
]
#question[
下列程序中，在内核模式执行的是
#choices([编译程序], [链接程序], [装入程序], [命令解释程序])
]
#question[
下列是支持虚拟存储管理的系统中指令执行过程的相关叙述，其中正确的是
#choices([虚实地址转换由操作系统完成], [存储访问权限由操作系统检测], [指令的合法性由操作系统验证], [CPU 产生的异常由操作系统处理])
]
#question[
下列关于线程的叙述中，正确的是
#choices([用户级线程和内核级线程均由操作系统创建], [多个内核级线程可以映射到同一个用户级线程], [同一进程的不同内核级线程共用该进程的内核栈], [同一进程的不同线程共享该进程虚拟地址空间中的堆])
]
#question[
某系统中有8个进程均会执行如下图所示的代码片段，其中信号量 S 的初值为5。若某时刻 S 的值为−2，已执行到代码 Q 中的进程有 $m$ 个，因执行 wait(S)而被阻塞的进程有 $n$ 个，则 $m$ 和 $n$ 的值分别是
#align(center, block(stroke: .5pt, inset: .45em)[
```
wait(S);
代码Q;
signal(S);
```
])
#choices([5、2], [5、3], [6、2], [7、1])
]
#question[
若进程 P 读、写数据的集合分别记为 $R("P")$ 和 $W("P")$，进程 Q 读、写数据的集合分别记为 $R("Q")$ 和 $W("Q")$，则进程 P 和 Q 并发执行时#emphasis[不会]发生并发错误的充要条件是
#statements(columns: 2, [Ⅰ．$W("P") ∩ W("Q")=emptyset$], [Ⅱ．$R("P") ∩ W("Q")=emptyset$], [Ⅲ．$W("P") ∩ R("Q")=emptyset$], [Ⅳ．$R("P") ∩ R("Q")=emptyset$])
#choices([Ⅰ、Ⅳ同时成立], [Ⅱ、Ⅲ同时成立], [Ⅰ、Ⅱ、Ⅲ同时成立], [Ⅰ、Ⅱ、Ⅲ、Ⅳ同时成立])
]
#question[
某64位系统采用三级页式存储管理方式，虚拟地址结构如下图所示。
#align(center)[
#set text(size: .8em)
#table(columns: 5, align: center,
 [保留（25位）], [一级页号（9位）], [二级页号（9位）], [三级页号（9位）], [页内偏移（12位）])
]
若各级页表项均占8字节，则进程的第三级页表占用的页框数最多是
#choices([512], [32 K], [256 K], [128 M])
]
#question[
下列页式虚拟存储管理系统的技术中，可用于降低系统平均访存时间的是
#statements(columns: 4, [Ⅰ．TLB], [Ⅱ．多级页表], [Ⅲ．工作集模型], [Ⅳ．页缓冲队列])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ])
]
#question[
假设两个进程共享一个页 S，其页表分别为 PT1 和 PT2，S 在两个进程虚拟地址空间中的起始地址分别为 VA1 和 VA2，则下列叙述中，正确的是
#choices([VA1 和 VA2 相同], [VA1 和 VA2 映射到的物理地址相同], [S 在 PT1 和 PT2 中的页表项内容相同], [S 在 PT1 和 PT2 中的页表项虚拟地址相同])
]
#question[
下列关于驱动程序的叙述中，#emphasis[错误]的是
#choices([驱动程序中包含启动设备的代码], [驱动程序中包含一组读/写设备的代码], [驱动程序与内核之间需要定义统一的接口], [块设备和字符设备驱动程序采用相同的 I/O 控制方式])
]
#question[
下列操作中，由鼠标中断处理程序完成的是
#choices([将当前进程的状态由执行态改为阻塞态], [将 CPU 运行模式由用户模式改为内核模式], [将接收到的输入数据存放到设备接口的数据寄存器中], [将输入数据从设备接口的数据寄存器传送到内核数据区])
]
#question[
下列关于分层网络体系结构的叙述中，#emphasis[错误]的是
#choices([有利于标准化], [层次越多效率越高], [有利于各层技术独立演化], [降低网络系统设计与实现的复杂度])
]
#question[
若在带宽为200 kHz、信噪比 $S\/N=1023$ 的信道上发送一个长度为1500 B的分组，则发送该分组的传输时延至少是
#choices([0.375 ms], [0.75 ms], [3 ms], [6 ms])
]
#question[
假设某采用 CSMA/CA 的 IEEE 802.11 无线局域网，数据传输速率为300 Mbps，DIFS=128 μs，SIFS=28 μs，忽略除数据帧外的其他帧的传输时延以及信号传播时延。若主机 H 发送一个总长度为1500 B的数据帧，则 H 从开始发送数据帧时刻起，到确认接收方接收到该帧为止，所需的时间至少是
#choices([40 μs], [68 μs], [168 μs], [196 μs])
]
#question[
支持 VLAN 划分的以太网交换机，已按端口划分了2个 VLAN。VLAN 划分结果及部分端口连接主机的 MAC 地址如下图所示。
#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  let p(x,y) = (x/48,(590-y)/48)
  set-style(stroke:.045em,content:(wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .67em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  let label(x,y,body) = content(p(x,y),body)
  rect(p(218,105),p(1143,290))
  for (x1,x2,name,x) in ((230,746,[VLAN1],425),(758,1124,[VLAN2],945)) {
    rect(p(x1,94),p(x2,303),stroke:(dash:"dashed",thickness:.045em))
    label(x,23,name); line(p(x,42),p(x+20,94))
  }
  label(1225,73,[交换机]); line(p(1194,90),p(1143,193))
  let used = (2,5,8,9,12,13)
  for index in range(24) {
    let row = calc.floor(index/12)
    let column = calc.rem(index,12)
    let number = if row==0 { column+13 } else { column+1 }
    let x = 262+75.3*column
    let y = 167+52*row
    line(p(x - 21,y - 11),p(x+21,y - 11),p(x+21,y+10),p(x+6,y+10),p(x+6,y+23),p(x - 6,y+23),p(x - 6,y+10),p(x - 21,y+10),close:true,fill:if number in used { luma(55%) } else { white })
    label(x,y+(if row==0 {-36} else {52}),str(number))
  }
  for (a,b) in (((262,177),(115,177)),((337,237),(217,479)),((563,237),(480,397)),
    ((789,237),(731,482)),((864,237),(970,397)),((1090,237),(1211,237))) { line(p(..a),p(..b)) }
  for (x,y,n) in ((115,167,1),(217,489,2),(480,402,3),(731,492,4),(970,403,5),(1211,244,6)) {
    let file = if n==3 { "laptop" } else { "pc" }
    content(p(x,y),image("../../assets/network/visio-2003-"+file+".svg",width:2.2em,height:2.2em,fit:"contain"))
    label(x,y+(if n==1 {-65} else {67}),[H#n])
    let mac = [00-1A-2B-3C-4D-0#n]
    label(x+(if n==1 {70} else {0}),y+(if n==1 {-100} else {109}),mac)
  }
}))
下列具有不同目的 MAC 地址（DA）和源 MAC 地址（SA）的以太网帧 F1～F4 中，H3 会接收到的是
#statements(columns: 1,
 [F1：DA = 00-1A-2B-3C-4D-03，SA = 00-1A-2B-3C-4D-01],
 [F2：DA = 00-1A-2B-3C-4D-03，SA = 00-1A-2B-3C-4D-05],
 [F3：DA = FF-FF-FF-FF-FF-FF，SA = 00-1A-2B-3C-4D-02],
 [F4：DA = FF-FF-FF-FF-FF-FF，SA = 00-1A-2B-3C-4D-06])
#choices([仅 F1、F2], [仅 F1、F3], [仅 F2、F4], [仅 F3、F4])
]
#question[
某网络在 $t_0$ 时刻的网络拓扑以及 R1 的路由表如下图所示，R1～R4 为路由器，基于链路状态路由算法计算路由，S0～S4 为 R1 的接口，链路上的数值为链路费用。若 $t_1(t_1>t_0)$ 时刻 R1 检测到连接 R1 和 R2 的链路断开，则 R1 经过重新计算路由并进行充分路由聚合后的路由表中路由项（入口）的数量是
#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke:.05em,content:(wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .73em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  for (a,b) in (((0,5),(5.5,5)),((5.5,5),(14.5,5)),((14.5,5),(22,5)),
    ((0,-1.5),(5.5,-1.5)),((5.5,-1.5),(14.5,-1.5)),((14.5,-1.5),(22,-1.5)),
    ((5.5,5),(5.5,-1.5)),((14.5,5),(14.5,-5.7)),((5.5,-1.5),(14.5,5)),((5.5,-1.5),(5.5,-6))) { line(a,b) }
  for (x,y,name) in ((0,5,[199.10.20.0/27]),(22,5,[199.10.20.32/27]),
    (22,-1.5,[199.10.20.64/26]),(14.5,-5.7,[199.10.20.128/25])) {
    circle((x,y),radius:(3.2,1),fill:white); content((x,y),name)
  }
  content((-.3,-1.5),image("../../assets/network/cisco-cloud.svg",width:5.4em,height:3em,fit:"stretch"))
  content((-.3,-1.5),[Internet])
  for (x,y,n) in ((5.5,-1.5,1),(5.5,5,2),(14.5,5,3),(14.5,-1.5,4)) {
    content((x,y),image("../../assets/network/visio-2003-router.svg",width:2.65em,height:2.4em,fit:"contain"))
    content((x,y - .4),[R#n])
  }
  content((5.5,-6),image("../../assets/network/visio-2007-web-server.svg",width:1.8em))
  for (x,y,label) in ((10,5,[5]),(5.5,1.8,[2]),(10,-1.5,[3]),(14.5,1.8,[4]),(9.9,2.3,[6])) {
    content((x,y),box(fill:white,inset:.15em,label))
  }
  content((7,2.4),[$t_1 arrow.r oo$])
  for (x,y,name) in ((2.7,-.9,[S0]),(4.5,.2,[S1]),(7,.3,[S2]),(7.6,-1.9,[S3]),(4.6,-3.3,[S4])) {content((x,y),name)}
}))
#figure(table(columns: (11em, 4em), align: center,
 [目的网络], [接口], [199.10.20.0/27], [S1], [199.10.20.32/27], [S2],
 [199.10.20.64/26], [S3], [199.10.20.128/25], [S3], [199.10.21.125/32], [S4], [0.0.0.0/0], [S0]), kind: table, caption: [R1路由表])
#choices([3], [4], [5], [6])
]
#question[
下列路由协议中，可以将一个自治系统划分为多个区域（Area）的内部网关协议是
#statements(columns: 3, [Ⅰ．OSPF], [Ⅱ．RIP], [Ⅲ．BGP])
#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ])
]
#question[
若将 IP 网络123.4.4.0/22划分为规模均等的32个子网，则 IP 地址123.4.5.211所在的子网是
#choices([123.4.4.192/27], [123.4.4.192/28], [123.4.5.192/27], [123.4.5.192/28])
]
#question[
电子商务类 Web 应用通常采用 Cookie 技术解决 HTTP 协议无状态的问题。下列叙述中，#emphasis[不属于] Cookie 技术典型用途的是
#choices([用户跟踪], [个性化推荐], [构建虚拟购物车], [缩短 Web 对象响应时间])
]

= 二、综合应用题：第41～47小题，共70分。

#question[
（本题13分）已知二叉搜索树采用二叉链表存储，类型定义如下：
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```c
typedef struct BSTNode                 //二叉搜索树结点
{
    int data;                         //保存结点的关键字值
    struct BSTNode *left, *right;      //指向左孩子、右孩子的指针
} BinTNode;
typedef BinTNode *BTree;               //二叉搜索树
```
]
对于给定的非空二叉搜索树 $T$（root 为指向 $T$ 的根结点的指针）和整数 $k$，请设计尽可能高效的查找算法：`void searchX(BTree root, int k)`，查找 $T$ 中其关键字值与 $k$ 之差的绝对值最小的所有结点，输出差值的绝对值和结点中的关键字值。要求：
#subquestions[
 + 给出算法的基本设计思想。（4分）
 + 根据设计思想，采用 C 或 C++语言描述算法，关键之处给出注释。（9分）
]
]
#question[
（本题10分）一个栈的入栈序列是 $1,2,dots.c,n(n>=3)$。请回答下列问题。
#subquestions[
 + 当 $n=9$ 时，是否能得到出栈序列2，3，1，6，4，7，5，9，8？是否能得到出栈序列2，3，1，5，6，7，4，9，8？（2分）
 + 对于由 $1,2,dots.c,n$ 组成的任意序列 $P_1,P_2,dots.c,P_n$ 中的元素 $P_i,P_j,P_k(i<j<k)$，当 $P_i,P_j,P_k$ 的大小满足什么关系时，序列 $P_1,P_2,dots.c,P_n$ 不是可以得到的出栈序列？（2分）
 + 当 $n=4$ 时，可以得到的以2开头的出栈序列的个数是多少？（2分）
 + 若当 $n=k-1$ 时可以得到的出栈序列个数为 $M$，则当 $n=k$ 时可以得到的以1开头的出栈序列的个数是多少？可以得到的以2开头的出栈序列的个数是多少？可以得到的所有出栈序列的个数是多少？（4分）
]
]
#question[
（本题10分）某16位计算机 C 按字节编址，通用寄存器 R0～R15 的编号为0～15，存储器地址为16位，采用定长指令字，指令格式有 R、I 和 M 型，如下所示。
#text(size: .9em)[
#table(columns: (3em, 3.2em, 3.2em, 4.2em, 3.2em, 1fr), stroke: none, align: center,
 [格式], [4位], [4位], [4位], [4位], [功能说明],
 [R型], table.cell(stroke: .5pt)[0000], table.cell(stroke: .5pt)[rt], table.cell(stroke: .5pt)[rs/num], table.cell(stroke: .5pt)[op1], [R\[rt\]←R\[rt\] op1 R\[rs\]，R\[rt\]←R\[rt\] op1 num],
 [I型], table.cell(stroke: .5pt)[op2], table.cell(stroke: .5pt)[rt], table.cell(colspan: 2, stroke: .5pt)[imm8], [R\[rt\]←R\[rt\] op2 imm8],
 [M型], table.cell(stroke: .5pt)[op3], table.cell(colspan: 3, stroke: .5pt)[offset], [R\[0\]←M\[R\[15\]+offset\]，M\[R\[15\]+offset\]←R\[0\]])
]
其中，op1 为0001、0010分别表示加、左移指令，op2 为0100表示加立即数指令，op3 为1110、1111分别表示取数、存数指令，R\[r\]表示寄存器 r 中的内容，num 为移位位数，M\[addr\]表示存储器地址 addr 中的内容。请回答下列问题。
#subquestions[
 + 主存单元和通用寄存器的宽度各是多少位？（2分）
 + op1 和 op2 的编码是否可以相同？op2 和 op3 的编码是否可以相同？（2分）
 + 若 R\[2\]=ABCDH，R\[9\]=F001H，则指令0000 0010 1001 0001执行后，R2 和 R9 中内容分别是多少（用十六进制表示）？（2分）
 + 若变量 $x,y$ 均为16位带符号整数，在存储器中依次从低地址向高地址连续存放，$x$ 的地址在 R15 中，实现“`y=16*x - 5;`”的4条指令 I1～I4 如题43表所示，写出①～④处的内容。（4分）
]
#figure(block(stroke: .5pt, inset: .45em)[
 #table(columns: (2em, 3em, 3em, 3em, 3em), stroke: none, align: center,
 [I1：], [#underline[①]], [0000], [0000], [0000],
 [I2：], [0000], table.cell(colspan: 2)[#underline[　②　]], [0010],
 [I3：], [0100], [0000], table.cell(colspan: 2)[#underline[　③　]],
 [I4：], [1111], table.cell(colspan: 3)[#underline[　　④　　]])
], kind: table, caption: [题43表])
]
#question[
（本题13分）假定题43中计算机 C 的部分数据通路如题44图所示。
#figure(cetz.canvas(length: 1em, {
  import cetz.draw: *
  let p(x,y) = (x/48,(1030-y)/48)
  set-style(stroke:.045em,content:(wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .68em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  let label(x,y,body) = content(p(x,y),body)
  let arrow(..points) = line(..points.pos().map(point => p(..point)),mark:(end:">",fill:black,scale:.65))
  let control(..points) = line(..points.pos().map(point => p(..point)),stroke:(dash:"dashed",thickness:.04em),mark:(end:">",fill:black,scale:.65))
  let cell(x1,y1,x2,y2,body) = {
    rect(p(x1,y1),p(x2,y2),fill:white); label((x1+x2)/2,(y1+y2)/2,body)
  }
  // Data paths and taps follow the original question; numbered boxes stay blank.
  for points in (
    ((299,63),(299,160)), ((352,63),(352,160)), ((437,63),(437,160)), ((489,63),(489,160)),
    ((326,223),(326,373)), ((463,223),(463,373)),
    ((83,446),(128,446)), ((95,521),(128,521)), ((207,483),(281,483)),
    ((508,428),(620,428)), ((508,537),(620,537)),
    ((699,392),(756,392)), ((699,573),(756,573)), ((556,580),(620,580)),
    ((215,748),(328,748)), ((463,748),(579,748),(579,611),(620,611)),
    ((730,182),(573,182),(573,358),(620,358)),
    ((704,182),(704,113),(896,113),(896,423),(929,423)),
    ((844,490),(929,490)), ((874,490),(874,182),(841,182)),
    ((874,490),(874,815),(589,815)), ((1009,456),(1093,456)),
    ((1205,456),(1320,456)), ((540,537),(540,705),(1093,705)),
    ((1149,734),(1149,794),(1034,794),(1034,213)),
    ((1034,794),(1034,895),(589,895)), ((508,856),(103,856),(103,578),(281,578)),
    ((1061,183),(1104,183)), ((1192,160),(1320,160)), ((1320,195),(1192,195)),
    ((1260,704),(1205,704)), ((1260,704),(1320,704)), ((981,148),(981,63)),
  ) { arrow(..points) }
  for (x,y) in ((704,182),(874,490),(540,537),(1034,794)) { circle(p(x,y),radius:.055,fill:black) }
  cell(280,160,371,223,[①]); cell(416,160,509,223,[②])
  cell(730,148,841,212,[PC]); cell(949,148,1061,213,[IR])
  cell(1104,128,1192,232,[控制\ 单元])
  cell(281,373,508,600,[])
  for (x,y,body) in ((325,397,[ra]),(464,397,[rb]),(314,462,[rw]),(397,469,[GPRs]),(395,532,[通用寄存器组])) {label(x,y,body)}
  cell(1093,423,1205,485,[MAR]); cell(1093,674,1205,734,[MDR])
  cell(328,717,463,782,[扩展器])
  rect(p(1320,115),p(1370,784),fill:white); label(1345,450,[主\ 存\ 储\ 器])
  for (x,y,inputs,reversed) in ((128,401,2,false),(620,310,2,false),(620,489,3,false),(929,373,2,false),(508,771,2,true)) {
    let left-top = if reversed { y+42 } else { y }
    let left-bottom = if reversed { y+126 } else { y+166 }
    let right-top = if reversed { y } else { y+40 }
    let right-bottom = if reversed { y+166 } else { y+126 }
    line(p(x,left-top),p(x+79,right-top),p(x+79,right-bottom),p(x,left-bottom),close:true,fill:white)
    content(p(x+48,y+83),std.rotate(-90deg,[MUX]))
    for i in range(inputs) {
      let number = if reversed { 1-i } else { i }
      let input-y = y+45+i*(if inputs==3 {36} else {76})
      label(x+24,input-y,str(number))
    }
  }
  line(p(756,340),p(844,384),p(844,579),p(756,625),p(756,537),p(778,483),p(756,455),close:true,fill:white)
  content(p(805,481),std.rotate(-90deg,[ALU])); label(782,394,[A]); label(782,573,[B])
  for points in (
    ((223,63),(223,425),(281,425)), ((166,367),(166,422)),
    ((242,123),(242,191),(280,191)),
    ((546,123),(546,190),(509,190)), ((667,63),(667,333)), ((786,63),(786,148)),
    ((1029,63),(1029,148)), ((969,600),(969,522)), ((1147,369),(1147,423)),
    ((1147,616),(1147,674)), ((395,987),(395,782)), ((549,987),(549,918)),
    ((660,987),(660,637)), ((801,987),(801,604)),
    ((1120,128),(1120,63)), ((1180,128),(1180,63)),
  ) { control(..points) }
  line(p(1225,20),p(1225,810),stroke:(dash:"dashed",thickness:.04em))
  for (x,y,body) in ((208,41,[RegWr]),(299,41,[IR.rt]),(352,41,[15]),(437,41,[IR.rs]),(489,41,[0]),
    (667,41,[ALUAsrc]),(786,41,[PCin]),(1140,41,[控制信号]),(1151,98,[$dots.h$]),
    (166,338,[RegDst]),(65,446,[0]),(57,521,[IR.rt]),(550,411,[busA]),(550,520,[busB]),(556,580,[2]),
    (175,602,[busW]),(213,722,[$"IR"_(11 tilde 0)$]),(287,719,[12]),(508,719,[16]),
    (969,594,[MARsrc]),(1266,139,[CBus]),(1268,437,[ABus]),(1268,681,[DBus]),
    (395,1011,[ExtOp]),(535,1011,[RegWsrc]),(675,1011,[ALUBsrc]),(801,1011,[ALUctr])) {label(x,y,body)}
  for (x,y) in ((287,748),(508,748)) {line(p(x - 12,y - 14),p(x+12,y+14))}
  content(p(894,962),[注：busA=R\[ra\]，busB=R\[rb\]，\ R\[rw\]=busW，RegWr=1表示\ GPRs可写入信息],anchor:"west")
}), caption: [题44图])
图中带箭头虚线表示控制信号，IR.rt、IR.rs 分别表示 IR 中的 rt、rs 字段，$"IR"_(11 tilde 0)$ 为 IR 中低12位。要求取指令周期内完成 PC 增量操作。请回答下列问题。
#subquestions[
 + 题44图中①和②是同一类部件，其名称是什么？（1分）
 + 已知 I 型指令中 imm8 可以是带符号整数或无符号整数，M 型指令中 offset 是带符号整数，控制信号 ExtOp 至少有几位？为什么？（2分）
 + 取指周期中，MARsrc、ALUAsrc、ALUBsrc、RegWr 的取值各是什么？（4分）
 + 左移指令执行周期中，ALUBsrc、RegWsrc、RegDst、RegWr 的取值各是什么？ExtOp 是否可以与 M 型指令的 ExtOp 取值相同？为什么？（6分）
]
]
#question[
（本题7分）某系统采用基于抢占式优先权（优先权值越大优先权越高）和时间片轮转的 CPU 调度算法，仅在时钟中断发生时才能抢占 CPU，时钟中断间隔时间为10 ms。每当进程进入就绪队列时，其时间片大小均设置为50 ms。进程因时间片用完而再次进入就绪队列时，若其优先权值大于0，则优先权值减1。进程因优先权低被抢占 CPU 而再次进入就绪队列时，其优先权值不变。优先权相同时，先进入就绪队列的进程先执行。假设系统中有4个进程 P1～P4，各进程的到达时刻、初始优先权值、所需的 CPU 执行时间如题45表所示。
#figure(table(columns: (1fr, 1.5fr, 1.5fr, 1.6fr), align: center,
 [进程], [到达时刻], [初始优先权值], [CPU 执行时间],
 [P1], [10 ms], [3], [95 ms], [P2], [10 ms], [4], [20 ms],
 [P3], [12 ms], [2], [40 ms], [P4], [14 ms], [5], [60 ms]), kind: table, caption: [题45表])
请回答下列问题。
#subquestions[
 + 在忽略时钟中断处理及 CPU 调度时间开销的情况下，若将10 ms时刻发生的时钟中断记为第一次时钟中断，且从此时开始进行 CPU 调度，则从10 ms时刻开始到4个进程都运行结束为止，时钟中断和 CPU 调度各发生了多少次？第一次执行 P1、P3、P4 的时刻分别是什么？（5分）
 + 若时间片由50 ms改为100 ms，则 CPU 调度次数增加、不变还是减少？若时钟中断间隔时间由10 ms改为1 ms，则系统开销增加、不变还是减少？（2分）
]
]
#question[
（本题8分）某基于索引节点（inode）的文件系统的目录项由文件名和索引节点号构成。磁盘中存放了索引节点表、位图、目录等元数据以及文件数据，盘块大小为4 KB，盘块号占4 B。索引节点表包含了所有文件的索引节点，位于从100号盘块开始的4096个连续盘块中，索引节点号是索引节点在该表中的序号，从0开始编号。每个索引节点占128 B，包含直接地址项5个，一次间接地址项、二次间接地址项、三次间接地址项各1个。磁盘块位图和索引节点位图分别用于描述磁盘块和索引节点占用情况，0表示未占用，1表示已占用。某子目录树如题46图所示，其中各文件的文件名和索引节点号如题46表所示，file 大小为30 KB。
#grid(columns: (1fr, 1fr), gutter: 2em,
 figure(cetz.canvas(length: 1em, {
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
  line((2.7,3.5),(2.7,1),(4.55,1))
  folder(0,6,[dir]); folder(2.7,4,[dir1])
  file(5,1,[file])
}), caption: [题46图]),
 figure(table(columns: (5em, 7em), align: center,
 [文件名], [索引节点号], [dir], [100], [dir1], [201], [file], [1000]), kind: table, caption: [题46表]))
请回答下列问题。
#subquestions[
 + file 的索引节点存放在磁盘的几号盘块中？若 file 的索引节点已读入内存，则访问 file 中偏移地址为21460的一个字节数据，最多需要访问几个磁盘块？该文件系统在空间足够大的磁盘中最多能创建多少个文件？（3分）
 + 若要删除目录 dir1，则文件系统需要对哪些元数据执行哪些操作？（5分）
]
]
#question[
（本题9分）人工智能（AI）是引领未来的战略性技术，其发展高度依赖强大的算力供给，通过网络互联分散的算力中心，可以充分聚合算力资源，满足人工智能对大规模算力的需求，支撑人工智能国家发展战略。某算力调度交易平台聚合各地的算力中心的算力，向用户提供算力服务的示意场景如题47图所示。算力用户 C 向平台申请算力服务，平台通过优化调度各算力中心算力，向 C 授权使用算力中心 $i$ 的算力，$S_i$ 为算力中心 $i$ 的负载均衡服务器，用于接收算力用户的计算任务描述数据文件，并向算力中心 $i$ 内部分派计算任务。为确保可靠传输，假设 C 建立一条 TCP 连接向服务器 $S_i$ 上传一个总长度为2000 B的计算任务描述数据文件，拥塞窗口初始阈值为8 MSS，MSS=500 B，$S_i$ 对收到的每个 TCP 段进行确认，且确认段不封装数据，接收窗口 rwnd 始终为1000 B，RTT=5 ms。C 建立连接时选择的初始序号为1000，$S_i$ 选择的初始序号为2000，SYN、ACK、FIN 为标志位，seq 为序号，ack\_seq 为确认序号。在整个文件传输过程中未出现任何重传或报文段丢失。
#figure(cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke:.055em,content:(wrap: body => {
      set par(justify: false, leading: .15em, spacing: 0pt)
      text(size: .8em, top-edge: "bounds", bottom-edge: "bounds", body)
    }))
  // A cloud encloses the original grouping of centres, platform and user.
  content((0,0),image("../../assets/network/cisco-cloud.svg",width:25em,height:17em,fit:"stretch"))
  content((5.5,4.8),[Internet])
  for (a,b) in (((-7,2.3),(0,4.5)),((0,4.5),(7,2.3)),((-7,2.3),(0,-1)),((7,2.3),(0,-1)),((0,4.5),(0,-1))) {
    line(a,b,stroke:(dash:"dotted",thickness:.055em))
  }
  circle((0,-1),radius:(5.5,5.3),stroke:(dash:"dashed",thickness:.05em))
  for (x,y,name,server) in ((-7,2.3,[算力中心1],[$S_1$]),(0,4.5,[算力中心$i$],[$S_i$]),(7,2.3,[算力中心$n$],[$S_n$])) {
    circle((x,y),radius:(3.2,1.8),fill:white)
    content((x,y+.9),name)
    content((x - .5,y - .4),image("../../assets/network/visio-2007-web-server.svg",width:1.15em))
    content((x+.7,y - .5),server)
  }
  content((-3.6,3.8),[$dots.h$]); content((3.6,3.8),[$dots.h$])
  rect((-4.7,-1.7),(4.7,.9),fill:white)
  for x in (-1.8,1.8) {content((x,.05),image("../../assets/network/visio-2007-web-server.svg",width:1.3em))}
  content((0,-1.1),[算力调度交易平台])
  circle((0,-5),radius:(3.8,1.7),fill:white)
  content((-.6,-4.5),image("../../assets/network/visio-2007-web-server.svg",width:1.25em))
  content((.8,-4.5),[C]); content((0,-5.8),[算力用户])
}), caption: [题47图])
请回答下列问题。
#subquestions[
 + C 与 $S_i$ 建立 TCP 连接过程需要几次握手？C 收到的 SYN=1、ACK=1的 TCP 段的确认序号（ack\_seq）是多少？（2分）
 + 当 C 接收到 $S_i$ 发送的“ACK=1，seq=2001，ack\_seq=2001，rwnd=1000”确认段后，C 的拥塞窗口增加到多少？C 的发送窗口设置为多少？（2分）
 + C 与 $S_i$ 释放 TCP 连接过程需要几次挥手？C 收到的最后一个 TCP 报文段的序号（seq）、确认序号（ack\_seq）、FIN 的值分别是多少？（4分）
 + 若忽略报文段传输时延，且时间从 C 请求建立 TCP 连接时刻算起，则 C 确认 $S_i$ 已成功接收到文件的时间是多少？（1分）
]
]
