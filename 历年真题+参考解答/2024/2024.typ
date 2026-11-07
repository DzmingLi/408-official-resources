// 来源：内容来源/2026年计算机考试大纲.pdf
// 书内第43～61页（PDF第48～66页），逐页人工录入；图表在题内重绘。
#import "../../template.typ": exam, choices, statements, subquestions, inline-node
#show: exam.with(year: 2024, subject: "计算机学科专业基础", code: "408")
#set document(title: "2024年全国硕士研究生招生考试计算机学科专业基础试题")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#import "@preview/cetz:0.5.2" as cetz
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)

= 一、单项选择题：第1～40小题，每小题2分，共80分。下列每小题给出的四个选项中，只有一个选项是最符合题目要求的。

#question[
已知带头结点的非空单链表 $L$ 的头指针为 $h$，结点结构为 #inline-node(columns: 2, [data], [next])，其中 next 是指向直接后继结点的指针。现有指针 $p$ 和 $q$，若 $p$ 指向 $L$ 中非首且非尾的任意一个结点，则执行语句序列“q=p->next; p->next=q->next; q->next=h->next; h->next=q;”的结果是

#choices([在 $p$ 所指结点后插入 $q$ 所指结点], [在 $q$ 所指结点后插入 $p$ 所指结点], [将 $p$ 所指结点移到 $L$ 的头结点之后], [将 $q$ 所指结点移到 $L$ 的头结点之后])
]

#question[
与表达式 $x+y*(z-u)\/v$ 等价的后缀表达式是

#choices([$x y z u - * v \/ +$], [$x y z u - v \/ * +$], [$+ x \/ * y - z u v$], [$+ x * y \/ - z u v$])
]

#question[
若 $p$、$q$ 和 $v$ 均为二叉树 $T$ 中的结点，$v$ 有两个孩子结点，$T$ 的中序遍历序列形如“$dots, p, v, q, dots$”，则下列叙述中，正确的是

#choices([$p$ 没有右孩子，$q$ 没有左孩子], [$p$ 没有右孩子，$q$ 有左孩子], [$p$ 有右孩子，$q$ 没有左孩子], [$p$ 有右孩子，$q$ 有左孩子])
]

#question[
若无向图 $G=(V,E)$ 的邻接多重表如题4图所示，则 $G$ 中顶点 $b$ 与 $d$ 的度分别是

#figure(align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 大纲 PDF 第 49 页；包括原图每个边结点最左侧的空白标记域。
  let p(x,y) = ((x - 271) / 35, (819 - y) / 35)
  set-style(stroke: 0.055em, content: (wrap: body => box(text(size: 0.8em, top-edge: "bounds", bottom-edge: "bounds", body))))
  rect(p(271,417),p(357,782)); line(p(321,417),p(321,782))
  for y in (491,563,636,708) { line(p(271,y),p(357,y)) }
  for (i,label,y) in ((0,[$a$],455),(1,[$b$],529),(2,[$c$],601),(3,[$d$],673),(4,[$e$],745)) {
    content(p(253,y),str(i)); content(p(296,y),label)
  }
  let cellrow(x,y,labels) = {
    rect(p(x,y),p(x+206,y+49))
    for dx in (36,86,122,171) { line(p(x+dx,y),p(x+dx,y+49)) }
    for (dx,label) in (18,61,104,146.5,188.5).zip(labels) { content(p(x+dx,y+24.5),label) }
  }
  for (x,y,labels) in (
    (477,433,([], [0], [], [1], [∧])),(477,505,([], [1], [], [3], [∧])),
    (477,577,([], [2], [], [0], [∧])),(477,648,([], [3], [], [2], [])),
    (477,722,([], [4], [], [2], [∧])),(735,434,([], [0], [], [3], [])),
    (734,724,([], [4], [∧], [3], [])),
  ) { cellrow(x,y,labels) }
  for y in (455,529,601,673,745) { line(p(337,y),p(477,y),mark: (end: ">",fill: black,scale: 0.6)) }
  // 先画边框再画指针，保留原图从指针域内部伸出的线段。
  for pts in (
    ((581,455),(581,395),(838,395),(838,434)),
    ((921,459),(921,531),(683,531)),
    ((581,529),(581,490),(711,490),(711,457),(683,457)),
    ((838,459),(838,603),(683,603)),
    ((580,603),(580,637),(714,637),(714,674),(683,674)),
    ((579,673),(579,709),(426,709),(426,819),(920,819),(920,773)),
    ((662,673),(662,722)),
    ((579,746),(579,795),(836,795),(836,773)),
    ((920,749),(965,749),(965,458),(941,458)),
  ) { line(..pts.map(q => p(..q)),mark: (end: ">",fill: black,scale: 0.6)) }
})), caption: [题4图], kind: image)

#choices([0，2], [2，4], [2，5], [3，4])
]

#question[
下列数据结构中，#emphasis[不适合]直接使用折半查找的是

#statements(columns: (1fr,1fr), [Ⅰ．有序链表], [Ⅱ．无序数组], [Ⅲ．有序静态链表], [Ⅳ．无序静态链表])

#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅳ], [仅Ⅰ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]

#question[
KMP 算法使用修正后的 next 数组进行模式匹配，模式串 $S=$“aabaab”，当主串中某字符与 $S$ 中某字符失配时，$S$ 将向右滑动的最长距离是

#choices([5], [4], [3], [2])
]

#question[
一棵二叉搜索树如题7图所示，k1、k2、k3 分别是对应结点中保存的关键字。子树 $T$ 的任一结点中保存的关键字 $x$ 满足的是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 2026 大纲 PDF 第 50 页：以正文汉字字距 33 px 为 1em 描点。
  // 文字以实际字面包围盒居中，不让字体的 cap-height 把标记压向圆底。
  let p(x,y) = ((x - 570) / 33, (495 - y) / 33)
  set-style(stroke: 0.045em, content: (wrap: body =>
    box(text(size: 0.9em, top-edge: "bounds", bottom-edge: "bounds", body))))
  for (a,b) in (((647,258),(592,302)),((647,258),(723,318)),
    ((723,318),(657,386)),((723,318),(775,367)),
    ((657,386),(598,429)),((657,386),(715,430))) { line(p(..a),p(..b)) }
  for (x,y,label) in ((647,258,[k1]),(723,318,[k2]),(657,386,[k3])) {
    circle(p(x,y),radius: 23.5 / 33,fill: white)
    content(p(x,y),label)
  }
  for (a,b,c) in (((592,302),(570,365),(611,365)),
    ((775,367),(755,432),(796,432)),((598,429),(577,493),(619,493)),
    ((715,430),(693,495),(735,495))) { line(p(..a),p(..b),p(..c),close: true) }
  content(p(715,477),$T$)
})),caption: [题7图],kind: image)

#choices([$x < "k1"$], [$x > "k2"$], [$"k1" < x < "k3"$], [$"k3" < x < "k2"$])
]

#question[
使用快速排序算法对含 $n (n ≥ 3)$ 个元素的数组 $M$ 进行排序，若第一趟排序将 $M$ 中除枢轴外的 $n-1$ 个元素划分为均不为空的 $P$ 和 $Q$ 两块，则下列叙述中，正确的是

#choices([$P$ 与 $Q$ 块间有序], [$P$ 与 $Q$ 均块内有序], [$P$ 和 $Q$ 的元素个数大致相等], [$P$ 和 $Q$ 中均不存在相等的元素])
]

#question[
已知关键字序列28，22，20，19，8，12，15，5是大根堆（最大堆），对该堆进行两次删除操作后，得到的新堆是

#choices([20，19，15，12，8，5], [20，19，15，5，8，12], [20，19，12，15，8，5], [20，19，8，12，15，5])
]

#question[
现有由关键字组成的3个有序序列（3，5）、（7，9）和（6），若按照从左至右的次序选择有序序列进行二路归并排序，则关键字之间的总比较次数是

#choices([3], [4], [5], [6])
]

#question[
在外排序中，利用败者树对初始为升序的归并段进行多路归并，败者树中记录“冠军”的结点保存的是

#choices([最大关键字], [最小关键字], [最大关键字所在的归并段号], [最小关键字所在的归并段号])
]

#question[
C 语言代码段如下。

#block(stroke: (dash: "dotted", thickness: 0.045em), inset: 0.5em)[
```c
int i=32777;
short si=i;
int j=si;
```
]

执行上述代码段后，$j$ 的值是

#choices([$-32 thin 777$], [$-32 thin 759$], [32 759], [32 777])
]

#question[
通常情况下，将汇编语言程序中实现特定功能的指令序列定义成一条伪指令（pseudoinstruction）。下列选项中，CPU 能理解并直接执行的是

#statements(columns: (1fr,1fr,1fr,1fr), [Ⅰ．伪指令], [Ⅱ．微指令], [Ⅲ．机器指令], [Ⅳ．汇编指令])

#choices([仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅲ、Ⅳ], [仅Ⅰ、Ⅲ、Ⅳ])
]

#question[
某科学实验中，需要使用大量的整型参数，为了在保证表达精度的基础上提高运算速度，需要选择合理的数据表示方法。若整型参数 $α$、$β$ 的取值范围分别为 $-2^20 ∼ 2^20$、$-2^40 ∼ 2^40$，则下列选项中，$α$、$β$ 最适宜采用的数据表示方法分别是

#choices([32位整数、32位整数], [单精度浮点数、单精度浮点数], [32位整数、双精度浮点数], [单精度浮点数、双精度浮点数])
]

#question[
下列关于整数乘法运算的叙述中，#emphasis[错误]的是

#choices([用阵列乘法器实现的乘运算可以在一个时钟周期内完成], [用 ALU 和移位器实现的乘运算无法在一个时钟周期内完成], [变量与常数的乘运算可编译优化为若干条移位及加/减运算指令], [两个变量的乘运算无法编译转换为移位及加法等指令的循环实现])
]

#question[
对于页式虚拟存储管理系统，下列关于存储器层次结构的叙述中，#emphasis[错误]的是

#choices([Cache–主存层次的交换单位为主存块，主存–外存层次的交换单位为页], [Cache–主存层次替换算法由硬件实现，主存–外存层次替换算法由软件实现], [Cache–主存层次可采用回写法写策略，主存–外存层次通常采用回写法写策略], [Cache–主存层次可采用直接映射方式，主存–外存层次通常采用直接映射方式])
]

#question[
某计算机按字节编址，采用页式虚拟存储管理方式，虚拟地址为32位，主存地址为30位，页大小为1 KB。若 TLB 共有32个表项，采用4路组相联映射方式，则 TLB 表项中标记字段的位数至少是

#choices([17], [18], [19], [20])
]

#question[
下列事件中，#emphasis[不是]在 MMU 地址转换过程中检测的是

#choices([访问越权], [Cache 缺失], [页面缺失], [TLB 缺失])
]

#question[
对于采用“取指、译码/取数、执行、访存、写回”5段流水线的 RISC 数据通路，下列关于指令流水线数据冒险处理的叙述中，#emphasis[错误]的是

#choices([相邻两条指令中的操作数相关可能引起数据冒险], [在数据相关的指令间插入“气泡”能避免数据冒险], [所有数据冒险都可以通过加入转发（旁路）电路解决], [所有数据冒险都能通过调整指令顺序和插入 nop 指令解决])
]

#question[
某存储器总线的时钟频率为420 MHz，总线宽度为64位，每个时钟周期传送2次数据；其总线事务支持突发传送方式，最多传送8次数据，第1个时钟周期传送地址和读/写命令，从第4个至第7个时钟周期连续传送8次数据。该总线的总线带宽（最大数据传输率）为

#choices([3.84 GB/s], [6.72 GB/s], [30.72 GB/s], [53.76 GB/s])
]

#question[
下列关于中断 I/O 方式的叙述中，#emphasis[错误]的是

#choices([中断屏蔽字用于确定中断响应的优先级], [保存断点和程序状态字在中断响应阶段完成], [保存通用寄存器和设置新中断屏蔽字由软件实现], [单重中断方式下中断处理时 CPU 处于关中断状态])
]

#question[
DMA 控制 I/O 方式下，设备的输入/输出由 DMA 控制器控制完成，此时，DMA 控制器控制的数据传输通路位于

#choices([CPU 和主存之间], [CPU 和 DMA 控制器之间], [设备接口和主存之间], [设备接口和 DMA 控制器之间])
]

#question[
下列关于中断、异常和系统调用的叙述中，#emphasis[错误]的是

#choices([中断或异常发生时，CPU 处于内核态], [每个系统调用都有对应的内核服务例程], [中断处理程序开始执行时，CPU 处于内核态], [系统添加新类型设备时，需注册相应的中断服务例程])
]

#question[
下列选项中，操作系统在终止进程时#emphasis[不一定]执行的是

#choices([终止子进程], [回收进程占用的设备], [释放进程控制块], [回收为进程分配的内存])
]

#question[
在支持页式存储管理的系统中，进程切换时操作系统需要执行的操作是

#statements(columns: (1fr,1fr), [Ⅰ．更新程序计数器的值], [Ⅱ．更新栈基址寄存器的值], [Ⅲ．更新页表基地址寄存器的值])

#choices([仅Ⅲ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]

#question[
文件系统需占用部分外存空间记录空闲块位置。下列方法中，占用外存空间的大小与当前空闲块数量无关的是

#choices([位图法], [空闲表法], [成组链接法], [空闲链表法])
]

#question[
下列算法中，每次回收分区时仅合并大小相等的空闲分区的是

#choices([伙伴算法], [最佳适应算法], [最坏适应算法], [首次适应算法])
]

#question[
若进程 P 中的线程 T 先打开文件，得到文件描述符 fd，再创建两个线程 Ta 和 Tb，则下列资源中，Ta 与 Tb 可共享的是

#statements(columns: (1fr,1fr), [Ⅰ．进程 P 的地址空间], [Ⅱ．线程 T 的栈], [Ⅲ．文件描述符 fd])

#choices([仅Ⅰ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]

#question[
下列系统调用的实现中，包含文件按名查找功能的是

#choices([open()], [read()], [write()], [close()])
]

#question[
假设某系统使用时间片轮转调度算法进行 CPU 调度，时间片大小为5 ms，系统共有10个进程，初始时均处于就绪队列，执行结束前仅处于执行态或就绪态。某队尾的进程 P 所需 CPU 时间最短，时间为25 ms，在不考虑系统开销的情况下，则进程 P 的周转时间为

#choices([200 ms], [205 ms], [250 ms], [295 ms])
]

#question[
键盘中断服务例程执行结束时，所输入数据的存放位置是

#choices([用户缓冲区], [CPU 中的通用寄存器], [内核缓冲区], [键盘控制器的数据寄存器])
]

#question[
某磁盘的磁道数为400（磁道号为0～399），采用循环扫描算法（CSCAN）进行磁盘调度，完成对200号磁道的请求后，磁头向磁道号减小的方向移动。若还有7个磁盘请求，对应的磁道号分别为300，120，110，0，160，210，399，则完成上述磁盘访问请求后磁头移动的距离是

#choices([599], [619], [788], [799])
]

#question[
若某分组交换网络及每段链路的带宽如题33图所示，则 H1 到 H2 的最大吞吐量约为

// 图标采用已有的黑底白箭头圆柱；连线和标签仍为题内矢量内容。
#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.045em)
  let ps=((-8,0),(-4,0),(1,3),(6,0),(1,-3),(10,0))
  for (a,b,label,pos) in ((0,1,[10 Mb/s],(-6,0.5)),(1,2,[1000 Mb/s],(-1.7,2)),(2,3,[1000 Mb/s],(3.7,2)),(1,3,[1 Mb/s],(1,0.5)),(1,4,[100 Mb/s],(-1.7,-2)),(4,3,[100 Mb/s],(3.7,-2)),(3,5,[10 Mb/s],(8,0.5))) {
    line(ps.at(a),ps.at(b))
    content(pos,text(size: 0.65em,label), angle: if a==1 and b==2 {31deg} else if a==2 and b==3 {-31deg} else if a==1 and b==4 {-31deg} else if a==4 and b==3 {31deg} else {0deg})
  }
  for i in (1,2,3,4) {
    content(ps.at(i),image("../../assets/network/cisco-router.svg",width: 1.3em))
    content((ps.at(i).at(0),ps.at(i).at(1)-1.05),text(size: 0.65em)[路由器])
  }
  for (i,label) in ((0,[H1]),(5,[H2])) {
    let (x,y)=ps.at(i)
    line((x - 0.8,y),(x - 0.5,y+0.8),(x+0.6,y+0.8),(x+0.3,y),close: true,fill: luma(75%))
    line((x - 0.8,y),(x - 1,y - 0.35),(x+0.4,y - 0.35),(x+0.3,y),fill: white,close: true)
    content((x,y - 0.9),label)
  }
})),caption: [题33图],kind: image)

#choices([1 Mb/s], [10 Mb/s], [100 Mb/s], [1000 Mb/s])
]

#question[
在下列二进制数字调制方法中，需要2个不同频率载波的是

#choices([ASK], [PSK], [FSK], [DPSK])
]

#question[
如题35图所示的支持 VLAN 划分的交换机，已按端口划分了3个 VLAN，部分端口连接主机的 IP 地址和 MAC 地址如图中所示，ARP 表结构为〈IP 地址，MAC 地址，TTL〉。下列选项中，#emphasis[不会]出现在 H4 的 ARP 表中的是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.04em)
  rect((0,0),(18.18,3.12),fill: white)
  // 扫描图中的三组端口数是 5 / 3 / 4，并非三个等宽 VLAN。
  for (x1,x2,label) in ((0.1,7.62,[VLAN1]),(7.62,12.12,[VLAN2]),(12.12,18.08,[VLAN3])) {
    rect((x1,0.1),(x2,3.22),stroke: (dash: "dashed", thickness: 0.04em))
    content(((x1+x2)/2,4.15),text(size: 0.7em,label))
    line(((x1+x2)/2 - 0.9,3.9),((x1+x2)/2+0.5,3.22))
  }
  for i in range(12) {
    let x=i*1.476+1.02
    for (y,num) in ((1.1,i+1),(2.0,i+13)) {
      let filled=num in (1,2,5,8,9,12,13)
      line((x - 0.38,y+0.2),(x+0.38,y+0.2),(x+0.38,y - 0.1),(x+0.15,y - 0.1),(x+0.15,y - 0.3),(x - 0.15,y - 0.3),(x - 0.15,y - 0.1),(x - 0.38,y - 0.1),close: true,fill: if filled {black} else {white})
      content((x,if num <= 12 {y - 0.7} else {y+0.7}),text(size: 0.65em)[#num])
    }
  }
  for (x,y,px,py,tx,ty,label,ip,mac) in (
    (-2.2,4.35,1.02,2.0,-3.75,3.8,[H1],[192.168.3.91],[00-3E-C2-39-12-B5]),
    (-2.2,1.35,1.02,1.1,-3.75,1.0,[H2],[192.168.3.81],[00-18-A2-3B-36-21]),
    (-2.2,-1.6,2.496,1.1,-3.2,-2.65,[H3],[192.168.3.125],[00-E5-78-4A-09-B2]),
    (3.7,-1.6,6.924,1.1,3.1,-2.65,[H4],[192.168.3.12],[00-35-6A-B1-4C-92]),
    (9.8,-1.6,11.352,1.1,9.4,-2.65,[H5],[192.168.3.251],[00-1A-39-B5-E4-45]),
    (15.6,-1.6,12.828,1.1,15.7,-2.65,[H6],[192.168.3.129],[00-08-6E-05-A7-82]),
    (22,-1.6,17.256,1.1,22,-2.65,[H7],[192.168.3.190],[00-51-48-39-63-A3]),
  ) {
    line((px,py),(x,y+0.35))
    if label==[H4] {
      line((x - 0.7,y),(x - 0.35,y+0.7),(x+0.6,y+0.7),(x+0.25,y),close: true,fill: luma(75%))
      line((x - 0.7,y),(x - 0.9,y - 0.3),(x+0.35,y - 0.3),(x+0.25,y),close: true,fill: white)
    } else { content((x,y),image("../../assets/network/visio-2007-isometric-pc.svg",width: 1.5em)) }
    content((tx,ty),text(size: 0.65em,label))
    content((tx,ty - 0.7),text(size: 0.63em,ip))
    content((tx,ty - 1.4),text(size: 0.63em,mac))
  }
  content((20.4,3.3),text(size: 0.75em)[交换机]); line((20.1,2.9),(18.18,2))
})),caption: [题35图],kind: image)

#choices([192.168.3.81，00-18-A2-3B-36-21，14:32:00], [192.168.3.91，00-3E-C2-39-12-B5，14:37:00], [192.168.3.125，00-E5-78-4A-09-B2，14:45:00], [192.168.3.129，00-08-6E-05-A7-82，14:52:00])
]

#question[
在采用 CSMA/CA 的802.11无线局域网中，DIFS=128 μs，SIFS=28 μs，RTS、CTS 和 ACK 帧的传输时延分别是3 μs、2 μs和2 μs，忽略信号传播时延。若主机 A 欲向 AP 发送一个总长度为1998 B的数据帧，无线链路带宽为54 Mb/s，则隐藏站 B 收到 AP 发送的 CTS 帧时，设置的网络分配向量 NAV 的值是

#choices([326 μs], [354 μs], [385 μs], [513 μs])
]

#question[
主机甲通过选择重传（SR）滑动窗口协议向主机乙发送帧的部分过程如题37图所示，Fx 为数据帧，ACKx 为确认帧，$x$ 是位数为3比特的序号。乙只对正确接收的数据帧进行独立确认，发送窗口与接收窗口大小相同且均为最大值。甲在 $t_1$ 时刻和 $t_2$ 时刻发送的数据帧分别是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 2026 年大纲 PDF 第 58 页：按正文约 35 px/em 换算扫描坐标。
  let p(x,y) = ((x - 494) / 35, (867 - y) / 35)
  set-style(stroke: 0.06em, content: (wrap: body => box(text(size: 0.75em, top-edge: "bounds", bottom-edge: "bounds", body))))
  content(p(492,296),[甲]); content(p(941,296),[乙])
  content(p(492.5,365.5),image("../../assets/network/visio-2003-pc.svg",width: (93 / 35) * 1em,height: (79 / 35) * 1em,fit:"contain"))
  content(p(938,365.5),image("../../assets/network/visio-2003-pc.svg",width: (93 / 35) * 1em,height: (79 / 35) * 1em,fit:"contain"))
  for x in (494,943) { line(p(x,407),p(x,867),mark: (end: ">",fill: black,scale: 0.8)) }
  for (a,b,label,pos,angle) in (
    ((494,417),(943,529),[F0],(569,416),-14deg),
    ((494,479),(661,522),[F1],(569,472),-14deg),
    ((494,530),(943,642),[F2],(569,534),-14deg),
    ((494,594),(943,705),[F3],(569,586),-14deg),
    ((943,543),(494,650),[ACK0],(775,556),14deg),
    ((494,668),(644,707),[?],(566,676),-14deg),
    ((943,658),(494,771),[ACK2],(705,698),14deg),
    ((943,718),(747,771),[ACK3],(823,729),15deg),
    ((494,807),(644,845),[?],(566,811),-14deg),
  ) {
    line(p(..a),p(..b),mark: (end: ">",fill: black,scale: 0.8))
    content(p(..pos),label,angle: angle)
  }
  content(p(697,521),[丢失]); content(p(714,773),[丢失])
  for (y,label) in ((668,[$t_1$]),(807,[$t_2$])) {
    circle(p(494,y),radius: 0.09,fill: black)
    content(p(469,y+1),label)
  }
  line(p(429,791),p(486,791),p(494,807))
  content(p(379,791),[F1超时]); content(p(437,851),[时间])
})),caption: [题37图],kind: image)

#choices([F1，F3], [F1，F4], [F3，F1], [F4，F1])
]

#question[
假设主机 H 通过 TCP 向服务器发送长度为3000 B的报文，往返时间 RTT=10 ms，最长报文段寿命 MSL=30 s，最大报文段长度 MSS=1000 B，忽略 TCP 段的传输时延，报文传输结束后 H 首先请求断开连接，则从 H 请求建立 TCP 连接时刻起，到 H 进入 CLOSED 状态为止，所需的时间至少是

#choices([30.03 s], [30.04 s], [60.03 s], [60.04 s])
]

#question[
若 UDP 协议在计算校验和过程中，计算得到中间结果为1011 1001 1011 0110时，还需要加上最后一个16位数0110 0101 1100 0101，则最终计算得到的校验和是

#choices([0001 1111 0111 1011], [0001 1111 0111 1100], [1110 0000 1000 0011], [1110 0000 1000 0100])
]

#question[
若浏览器不支持并行 TCP 连接，使用非持久的 HTTP/1.0 协议请求浏览1个 Web 页。该页中引用同一网站上7个小图像文件，则从浏览器为传输 Web 页请求建立 TCP 连接开始，到接收完所有内容为止，所需要的往返时间 RTT 数至少是

#choices([4], [9], [14], [16])
]

= 二、综合应用题：第41～47小题，共70分。

#question[
（本题13分）2023年10月26日，神舟十七号载人飞船发射取得圆满成功，再次彰显了中国航天事业的辉煌成就。载人航天工程是包含众多子工程的复杂系统工程，为了保证工程的有序开展，需要明确各子工程的前导子工程，以协调各子工程的实施。该问题可以简化、抽象为有向图的拓扑序列问题。已知有向图 $G$ 采用邻接矩阵存储，类型定义如下。

#block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```c
typedef struct                       // 图的类型定义
{
    int numVertices, numEdges;        // 图的顶点数和有向边数
    char VerticesList[MAXV];          // 顶点表，MAXV为已定义常量
    int Edge[MAXV][MAXV];             // 邻接矩阵
} MGraph;
```
]

请设计算法：int uniquely(MGraph G)，判定 $G$ 是否存在唯一的拓扑序列，若是，则返回1，否则返回0。要求如下。

#subquestions[
+ 给出算法的基本设计思想。（4分）
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。（9分）
]
]

#question[
（本题10分）将关键字序列20，3，11，18，9，14，7依次存储到初始为空、长度为11的散列表 $H T$ 中，散列函数 $H("key")=("key" times 3) % 11$。$H("key")$ 计算出的初始散列地址为 $H_0$，发生冲突时探查地址序列是 $H_1,H_2,H_3,dots$，其中，$H_k=(H_0+k^2)%11$，$k=1,2,3,dots$。

请回答下列问题。

#subquestions[
+ 画出所构造的 $H T$，并计算 $H T$ 的装填因子。（6分）
+ 给出在 $H T$ 中查找关键字14的关键字比较序列。（2分）
+ 在 $H T$ 中查找关键字8，确认查找失败时的散列地址是多少？（2分）
]
]

#question[
（本题13分）假定计算机 M 字长为32位，按字节编址，采用32位定长指令字，指令 add、slli 和 lw 的格式、编码和功能说明如题43图（a）所示。

#figure(align(center)[
  #set text(size: 0.8em)
  #table(columns: (3em,7fr,5fr,5fr,3fr,5fr,7fr,14em),stroke: none,align: center,
    [指令], [31#h(1fr)25], [24#h(1fr)20], [19#h(1fr)15], [14#h(1fr)12], [11#h(1fr)7], [6#h(1fr)0], [指令功能说明],
    [add], ..([0000000],[rs2],[rs1],[000],[rd],[0110011]).map(x=>table.cell(stroke: 0.045em,x)), [R[rd] ← R[rs1]+R[rs2]],
    [slli], ..([0000000],[shamt],[rs1],[010],[rd],[0010011]).map(x=>table.cell(stroke: 0.045em,x)), [R[rd] ← R[rs1]\<\<shamt],
    [lw], table.cell(colspan: 2,stroke: 0.045em)[imm], ..([rs1],[010],[rd],[0000011]).map(x=>table.cell(stroke: 0.045em,x)), [R[rd] ← M[R[rs1]+imm]],
  )
],caption: [题43图（a）],kind: image)

其中，R[$x$] 表示通用寄存器 $x$ 的内容，M[$x$] 表示地址为 $x$ 的存储单元内容，shamt 为移位位数，imm 为补码表示的偏移量。题43图（b）给出了计算机 M 的部分数据通路及其控制信号（用带箭头虚线表示），其中，A 和 B 分别表示从通用寄存器 rs1 和 rs2 中读出的内容；IR[31:20] 表示指令寄存器中的高12位；控制信号 Ext 为0、1时扩展器分别实现零扩展、符号扩展，ALUctr 为000、001、010时 ALU 分别实现加、减、逻辑左移运算。

#figure(align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  // 2026 大纲 PDF 第 61 页；包括 ALUctr 的 3 位标记。
  set-style(stroke:0.045em,content:(wrap:body=>box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  let p(x,y)=((x - 153) / 35,(966 - y) / 35)
  let label(x,y,body)=content(p(x,y),body)
  let arrow(a,b)=line(p(..a),p(..b),mark:(end:">",fill:black,scale:0.65))
  rect(p(371,819),p(519,873)); label(445,846,[扩展器])
  line(..((607,736),(674,770),(674,844),(607,879)).map(q=>p(..q)),close:true)
  label(619,768,[0]); label(619,852,[1])
  content(p(650,804),[MUX],angle:-90deg)
  line(..((754,648),(843,694),(843,807),(754,854),(754,768),(773,750),(754,733)).map(q=>p(..q)),close:true)
  content(p(803,750),[ALU],angle:-90deg)
  for (a,b) in (((283,849),(371,849)),((519,851),(607,851)),((674,811),(754,811)),
    ((520,692),(754,692)),((520,769),(607,769)),((843,754),(1031,754))) {arrow(a,b)}
  label(502,692,[A]);label(502,769,[B]);label(217,847,[IR[31:20]]);label(1050,754,[F])
  for (x,y,n) in ((314,849,[12]),(550,851,[32]),(689,811,[32]),(550,769,[32]),(550,692,[32]),(972,754,[32])) {
    line(p(x - 7,y - 7),p(x+7,y+7));label(x+15,y - 19,n)
  }
  for (y,body) in ((703,[OF]),(731,[SF]),(777,[ZF]),(805,[CF])) {
    arrow((843,y),(897,y));label(923,y,body)
  }
  for (x,y,body) in ((445,875,[Ext]),(642,861,[ALUBsrc]),(802,832,[ALUctr])) {
    line(p(x,915),p(x,y),stroke:(thickness:0.045em,dash:"dashed"),mark:(end:">",fill:black,scale:0.65))
    label(x,928,body)
  }
  line(p(795,871),p(809,885));label(818,864,[3])
  for (x,y,body) in ((259,895,[0：零扩展]),(269,936,[1：符号扩展]),
    (938,852,[000：加]),(938,887,[001：减]),(978,924,[010：逻辑左移]),(898,958,[⋯])) {label(x,y,body)}
})),caption:[题43图（b）],kind:image)

请回答下列问题。

#subquestions[
+ 计算机 M 最多有多少个通用寄存器？为什么 shamt 字段占5位？（2分）
+ 执行 add 指令时，控制信号 ALUBsrc 的取值应是什么？若 rs1 和 rs2 寄存器内容分别是8765 4321H和9876 5432H，则 add 指令执行后，ALU 输出端 F、OF 和 CF 的结果分别是什么？若该 add 指令处理的是无符号整数，则应根据哪个标志判断是否溢出？（5分）
+ 执行 slli 指令时，控制信号 Ext 的取值可以是0也可以是1，为什么？（2分）
+ 执行 lw 指令时，控制信号 Ext、ALUctr 的取值分别是什么？（2分）
+ 若一条指令的机器码是 A040 A103H，则该指令一定是 lw 指令，为什么？若执行该指令时，R[01H]=FFFF A2D0H，则所读取数据的存储地址是什么？（2分）
]
]

#question[
（本题10分）对于题43中的计算机 M，C 语言程序 P 包含语句“sum+=a[i];”，在 M 中对应的指令序列 S 如下。

#align(center,block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```asm
slli r4, r2, 2     // R[r4]←R[r2]<<2
add  r4, r3, r4    // R[r4]←R[r3]+R[r4]
lw   r5, 0(r4)     // R[r5]←M[R[r4]+0]
add  r1, r1, r5    // R[r1]←R[r1]+R[r5]
```
])

已知变量 $i$、$s u m$ 和数组 $a$ 都为 int 型，通用寄存器 r1～r5 的编号为01H～05H。

请回答下列问题。

#subquestions[
+ 根据指令序列 S 中每条指令的功能，写出存放数组 $a$ 的首地址、变量 $i$ 和 $s u m$ 的通用寄存器编号。（3分）
+ 已知 M 为小端方式计算机，采用页式存储管理方式，页大小为4 KB。若执行到指令序列 S 中第1条指令时，$i=5$ 且 r1 和 r3 的内容分别为0000 1332H和0013 DFF0H，从地址0013 DFF0H开始的存储单元内容如题44图所示，则执行“sum+=a[i];”语句后，$a[i]$ 的地址、$a[i]$ 和 $s u m$ 的机器数分别是什么（用十六进制表示）？$a[i]$ 所在页的页号是多少？此次执行中，数组 $a$ 至少存放在几页中？（5分）
]

#figure(align(center,table(columns: (7em,auto,auto,auto,auto,auto,auto,auto,auto),align: center,stroke: none,
  [地址], [0], [1], [2], [3], [4], [5], [6], [7],
  [0013 DFF0], ..([FF],[FF],[FF],[7C],[70],[FE],[FF],[FF]).map(x=>table.cell(stroke: (top: 0.05em,bottom: 0.05em),x)),
  [0013 DFF8], ..([00],[00],[00],[0C],[3C],[02],[01],[FF]).map(x=>table.cell(stroke: (bottom: 0.05em),x)),
  [0013 E000], ..([F0],[F1],[00],[00],[DC],[EC],[FF],[FF]).map(x=>table.cell(stroke: (bottom: 0.05em),x)),
  [0013 E008], ..([FF],[FF],[01],[02],[00],[00],[01],[02]).map(x=>table.cell(stroke: (bottom: 0.05em),x)),
  table.vline(x: 1, start: 1, stroke: 0.05em),table.vline(x: 9,start: 1,stroke: 0.05em),
)),caption: [题44图],kind: image)

#subquestions(start: 3)[
+ 指令“slli r4, r2, 2”的机器码是什么（用十六进制表示）？若数组 $a$ 改为 short 类型，则指令序列 S 中 slli 指令的汇编形式应是什么？（2分）
]
]

#question[
（本题7分）某计算机按字节编址，采用页式虚拟存储管理方式，虚拟地址和物理地址的长度均为32位，页表项的大小为4字节，页大小为4 MB，虚拟地址结构如下。

#align(center,table(columns: (10fr,22fr),align: center,[页号（10位）],[页内偏移量（22位）]))

进程 P 的页表起始虚拟地址为 B8C0 0000H，被装载到从物理地址6540 0000H开始的连续主存空间中。

请回答下列问题，要求答案用十六进制表示。

#subquestions[
+ 若 CPU 在执行进程 P 的过程中，访问虚拟地址1234 5678H时发生了缺页异常，经过缺页异常处理和 MMU 地址转换后得到的物理地址是 BAB4 5678H，在此次缺页异常处理过程中，需要为所缺页分配页框并更新相应的页表项，则该页表项的虚拟地址和物理地址分别是什么？该页表项中的页框号更新后的值是什么？（3分）
+ 进程 P 的页表所在页的页号是什么？该页对应的页表项的虚拟地址是什么？该页表项中的页框号是什么？（4分）
]
]

#question[
（本题8分）计算机系统中的进程之间往往需要相互协作以完成一个任务。在某网络系统中，缓冲区 B 用于存放一个数据分组，对 B 的操作有 C1、C2 和 C3。C1 将一个数据分组写入 B 中，C2 从 B 中读出一个数据分组，C3 对 B 中的数据分组进行修改。要求 B 为空时才能执行 C1，B 非空时才能执行 C2 和 C3。

请回答下列问题。

#subquestions[
+ 假设进程 P1 和 P2 均需要执行 C1，实现 C1 的代码是否为临界区？为什么？（2分）
+ 假设 B 初始为空，进程 P1 执行 C1 一次，进程 P2 执行 C2 一次。请定义尽可能少的信号量，并用 wait()、signal() 操作描述进程 P1 和 P2 之间的同步或互斥关系，说明所用信号量的作用及其初值。（3分）
+ 假设 B 初始不为空，进程 P1 和 P2 各执行 C3 一次。请定义尽可能少的信号量，并用 wait()、signal() 操作描述进程 P1 和 P2 之间的同步或互斥关系，说明所用信号量的作用及其初值。（3分）
]
]

#question[
（本题9分）网络空间是继陆海空天之后的“第五疆域”，网络技术是网络疆域建设与治理的基础。路由算法与协议是网络核心技术之一，对其准确认知、合理选择与应用，对于网络建设十分重要。假设现有互联网中的4个自治系统互连拓扑示意图如题47图所示。其中，AS1 运行内部网关协议 RIP；AS3 规模较小，自治系统内任意两个主机间通信，经过路由器数量不超过15个；AS4 规模较大，自治系统内任意两个主机间通信，经过路由器数量可能超过20个。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.055em)
  circle((0,0),radius: (10,3.4)); circle((-9,5),radius: (3.2,2)); circle((0,6.5),radius: (3.2,2)); circle((9,5),radius: (3.2,2))
  let ps=((-3.3,1.3),(0,1.3),(3.3,1.3),(-3.3,-1.3),(0,-1.3),(3.3,-1.3),(-8,4.8),(0,5.8),(8,4.8))
  for (a,b) in ((0,1),(1,2),(0,3),(3,4),(4,5),(2,5),(2,4),(0,6),(1,7),(2,8)) { line(ps.at(a),ps.at(b)) }
  line((-6.5,-1.3),ps.at(3)); line(ps.at(5),(6.5,-1.3))
  for (a,b) in (((-8,4.8),(-10.5,4.8)),((-8,4.8),(-10,6.2)),((-8,4.8),(-8,6.6)),((0,5.8),(-1.3,7.1)),((0,5.8),(1.3,7.1)),((8,4.8),(8,6.6)),((8,4.8),(10.2,6)),((8,4.8),(10.7,4.8))) { line(a,b) }
  for (i,p) in ps.enumerate() {
    content(p,image("../../assets/network/cisco-router.svg",width: 1.4em))
    let label=[#("R"+str(if i < 6 {11+i} else {(22,33,44).at(i - 6)}))]
    content(if i==0 {(p.at(0) - 1.35,p.at(1))} else if i==2 {(p.at(0)+1.35,p.at(1))} else if i==7 {(p.at(0) - 1.4,p.at(1))} else {(p.at(0),p.at(1) - 1.05)},text(size: 0.8em,label))
  }
  for (x,y,label) in ((-7.6,1,[AS1]),(-11,5.5,[AS2]),(0,7.9,[AS3]),(10.4,5.5,[AS4])) { content((x,y),strong(label)) }
  content((0,-4.2),text(size: 0.8em)[内部网关协议：RIP])
  content((-7.2,-1.3),std.ellipse(fill: luma(95%),stroke: none,inset: 0.2em)[#text(size: 0.8em)[210.2.3.0/24]])
  content((7.2,-1.3),std.ellipse(fill: luma(95%),stroke: none,inset: 0.2em)[#text(size: 0.8em)[210.2.4.0/24]])
  for p in ((-9,7),(0,8.5),(9,7)) { line((0,10.4),p,stroke: (dash: "dashed",thickness: 0.055em)) }
  content((0,10.4),std.ellipse(fill: white,stroke: none,inset: 0.3em)[136.5.16.0/20])
})),caption: [题47图],kind: image)

请回答下列问题。

#subquestions[
+ 若仅有 RIP 和 OSPF 内部网关协议供选择，则 AS4 应该选择哪个协议？（1分）
+ 若 AS3 中的某主机向本自治系统内另一主机发送1个 IP 分组，为确保该 IP 分组能够被正常接收，则 IP 分组的初始 TTL 值应该至少设置为多少？（1分）
+ 假设 AS1 中的路由器同一时刻启动，启动后立即构建并交换初始距离向量，之后每隔30 s交换一次最新的距离向量，则从交换初始距离向量时刻算起，R11～R16 路由器均获得到达网络210.2.3.0/24的正确路由，至少需要多长时间？均获得到达网络210.2.4.0/24的正确路由，至少需要多长时间？（2分）
+ R44 向 R13 通告到达网络136.5.16.0/20路由时，由 BGP 协议哪类会话完成？通过哪个 BGP 报文通告？R13 通过 BGP 协议的哪类会话将该网络可达性信息通告给 R14 和 R15？（3分）
+ 若 R14 和 R15 均收到分别由 R11、R12、R13 通告的到达网络136.5.16.0/20的可达性信息如下。

  目的网络：136.5.16.0/20，AS 路径：AS2 AS8 AS19，下一跳：R11\
  目的网络：136.5.16.0/20，AS 路径：AS3 AS7 AS11 AS19，下一跳：R12\
  目的网络：136.5.16.0/20，AS 路径：AS4 AS10 AS19，下一跳：R13

  则在无策略约束情况下，R14 和 R15 更新路由表后，各自路由表中到达网络136.5.16.0/20路由的下一跳分别是什么（用路由器名称表示）？（2分）
]
]
