// 来源：内容来源/2026年计算机考试大纲.pdf
// 书内第68～84页（PDF第73～89页），逐页人工录入；保留官方的指令名 scov。
#import "../../template.typ": exam, choices, subquestions, statements
#show: exam.with(year: 2025, subject: "计算机学科专业基础", code: "408")
#set document(title: "2025年全国硕士研究生招生考试计算机学科专业基础试题")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#import "@preview/cetz:0.5.2" as cetz
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em,dash: (array: (0pt,1em),phase: 0.5em),cap: "round"),offset: 0.16em)

= 一、单项选择题：第1～40小题，每小题2分，共80分。下列每小题给出的四个选项中，只有一个选项是最符合题目要求的。

#question[
下列程序段的时间复杂度是

#block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```c
int count=0, i, j;
for(i=1; i*i<=n; i++)
    for(j=1; j<=i; j++)
        count++;
```
]

#choices([$O(log n)$],[$O(n)$],[$O(n log n)$],[$O(n^2)$])
]

#question[
已知算法 A 用于检查字符串中各类括号是否匹配，A 执行过程中使用初始为空的栈保存遇到的括号。若栈的容量是3，则下列选项中，A #emphasis[不能]处理的是

#choices([$(a + [b + (c+d)\/e] + f) + g-h$],[$[a*((b+c)\/(d-e)+f\/g)-h]$],[$[a*(b-(c-d)*e\/(f+g))-h]$],[$[a-(b+[c*(d+e)-f]+g+h)]$])
]

#question[
若二叉树的结点值均为正整数，采用顺序存储方式保存在数组 $R$ 中，用 $-1$ 表示结点不存在，则下列数组中，#emphasis[不能]表示一棵二叉树的是

#choices([$R[ ]={20,15,40,-1,-1,35}$],[$R[ ]={15,40,10,18,35,-1,-1}$],[$R[ ]={15,40,10,-1,-1,-1,12}$],[$R[ ]={17,20,35,-1,18,45,-1,-1,19,27}$])
]

#question[
下列关于二叉树及森林的叙述中，正确的是

#choices([完全二叉树中不存在度为1的结点],[任意一个森林都可以转换为一棵二叉树],[二叉树的分支结点个数比叶结点个数少],[表达式树的根中保存的是最先计算的运算符])
]

#question[
设字符集 S 包含7个字符，各字符出现的频次分别为2，3，4，6，8，10，11。现为 S 中的各字符构造哈夫曼编码，编码长度#emphasis[不小于]3的字符个数是

#choices([2],[3],[4],[5])
]

#question[
下列关于图的叙述中，正确的是

#choices([有向图必存在入度为0的顶点],[有向无环图的拓扑有序序列存在且唯一],[各顶点的度均大于等于2的无向图必有回路],[可用 BFS 算法求出带权图中每一对顶点间的最短路径])
]

#question[
已知查找表中有400个元素，查找每个元素的概率相同。采用分块查找法进行查找，且均匀分块。若采用顺序查找法确定元素所在的块，且块内也采用顺序查找法，为使查找效率最高，则每块包含的元素个数应为

#choices([8],[10],[20],[25])
]

#question[
给定7个不同的关键字，能够构造的不同4阶 B 树的个数最多是

#choices([7],[8],[9],[10])
]

#question[
下列关于散列方法处理冲突的叙述中，正确的是

#choices([只要散列表不满，线性探查再散列一定能找到一个空闲位置],[只要散列表不满，二次探查再散列一定能找到一个空闲位置],[线性探查再散列处理的冲突，一定是发生在同义词之间的冲突],[二次探查再散列处理的冲突，一定是发生在非同义词之间的冲突])
]

#question[
下列排序算法中，最坏情况下元素移动次数最少的是

#choices([起泡排序],[直接插入排序],[快速排序],[简单选择排序])
]

#question[
对含9个关键字的初始序列进行排序，若序列的变化情况如下所示，则下列排序算法中，采用的是

#table(columns: (11em,1fr),align: center,
  [初始序列],[5，25，40，30，10，20，45，15，35],
  [第1趟排序后的序列],[5，10，20，30，15，35，45，25，40],
  [第2趟排序后的序列],[5，10，15，25，20，30，40，35，45],
)

#choices([希尔排序],[基数排序],[归并排序],[折半插入排序])
]

#question[
在32位计算机上执行下列 C 语言代码段后，$u i$ 的值是

#block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```c
short si=-32767;
unsigned int ui=si;
```
]

#choices([$2^15-1$],[$2^15+1$],[$2^32-2^15-1$],[$2^32-2^15+1$])
]

#question[
已知 float 型变量用 IEEE 754 单精度浮点数格式表示。若 float 型变量 $x$ 的机器数为4730 0000H，则 $x$ 的值是

#choices([$0.375 times 2^14$],[$1.375 times 2^14$],[$0.375 times 2^15$],[$1.375 times 2^15$])
]

#question[
假设8位字长的计算机中，两个带符号整数 $x$ 和 $y$ 的补码表示分别为 $[x]_补=$ A3H、$[y]_补=$75H，则通过补码加减运算器得到的 $x-y$ 的值及 OF 标志分别为

#choices([24，0],[24，1],[46，0],[46，1])
]

#question[
某32位计算机按字节编址，采用小端方式存放数据，编译器按边界对齐方式为下列 C 语言结构型数组变量 $e m p l o y e e$ 分配存储空间。

#block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```c
struct record {
    int id;
    char name[10];
    int salary;
} employee[200];
```
]

若 $e m p l o y e e$ 的首地址为0000 A0B0H，employee[1].id 的机器数为1234 5678H，则该机器数中的56H所在存储单元的地址是

#choices([0000 A0C3H],[0000 A0C4H],[0000 A0C5H],[0000 A0C6H])
]

#question[
下列选项中，由指令集体系结构（ISA）规定的是

#choices([是否采用阵列乘法器],[是否采用定长指令字格式],[是否采用微程序控制器],[是否采用单总线数据通路])
]

#question[
下列关于 RISC 的叙述中，#emphasis[错误]的是

#choices([多采用硬连线方式实现控制器],[通常采用 Load/Store 型指令设计风格],[难以采用流水线数据通路实现微架构],[多采用寄存器传递过程调用时的参数])
]

#question[
下列关于 CPI 和 CPU 时钟周期的叙述中，#emphasis[错误]的是

#choices([不同类型指令的 CPI 可能不一样],[程序的 CPI 与 Cache 缺失率无关],[单周期 CPU 的时钟周期以最耗时指令所用时间为准],[流水线 CPU 的时钟周期以最长流水段所用时间为准])
]

#question[
下列关于 CPU 中的数据通路和控制器的叙述中，#emphasis[错误]的是

#choices([通用寄存器组中应该包含程序计数器],[控制器中一定包含指令操作码的译码电路],[单周期 CPU 中的控制器比多周期 CPU 中的更简单],[流水线 CPU 需解决数据相关和控制相关等冒险问题])
]

#question[
某处理器总线采用同步、并行传输方式，每个总线时钟周期传送4次数据（quadpumped 技术）。若该总线的工作频率为1333 MHz（实际单位是 MT/s，表示每秒传送1333 M次），总线宽度为64位，则总线带宽约为

#choices([10.66 GB/s],[42.66 GB/s],[85.31 GB/s],[341.25 GB/s])
]

#question[
下列设备中，适合采用 DMA 输入/输出方式的是

#statements(columns: (1fr,1fr,1fr,1fr),[Ⅰ．键盘],[Ⅱ．网卡],[Ⅲ．固态硬盘],[Ⅳ．针式打印机])

#choices([仅Ⅰ、Ⅱ],[仅Ⅱ、Ⅲ],[仅Ⅱ、Ⅳ],[仅Ⅲ、Ⅳ])
]

#question[
下列选项中，会触发外部中断请求的事件是

#choices([DMA 传送结束],[总线事务结束],[页故障处理结束],[执行断点指令])
]

#question[
在采用页式虚拟存储管理方式的系统中，当发生进程上下文切换时，下列寄存器中，操作系统#emphasis[不需要]更新的是

#choices([通用寄存器],[页表基址寄存器],[程序计数器],[内核中断向量表基址寄存器])
]

#question[
下列关于虚拟化技术的叙述中，#emphasis[错误]的是

#choices([操作系统可以运行在虚拟机上],[虚拟化技术支持在一台计算机上构建多个虚拟机],[虚拟机监控程序（VMM）与操作系统的特权级相同],[虚拟化技术支持在一台计算机上模拟不同的指令集体系结构])
]

#question[
某基于优先权的进程调度程序中，进程就绪队列采用优先权由高到低的有序单链表实现。若就绪队列长度为 $n$，则就绪队列的插入操作和从就绪队列中选出将要执行进程的操作的时间复杂度分别是

#choices([$O(1)$，$O(1)$],[$O(1)$，$O(n)$],[$O(n)$，$O(1)$],[$O(n)$，$O(n)$])
]

#question[
某页式虚拟存储管理系统采用固定分配局部置换的 LRU 算法。若系统为进程 P 分配了3个页框，P 从某时刻开始的页访问序列为0，1，2，0，5，1，4，3，0，2，3，2，0，且0，1，2三个页已在内存中，则完成上述页序列的访问时，系统执行缺页异常处理程序的次数为

#choices([5],[6],[7],[8])
]

#question[
在页式虚拟存储管理系统中，确定进程正常运行所需的最少页框数时，下列因素中需要考虑的是

#choices([代码段长度],[进程的虚拟地址空间大小],[物理内存大小],[指令系统支持的寻址方式])
]

#question[
下列关于虚拟文件系统（VFS）的叙述中，正确的是

#choices([VFS 是在虚拟内存中建立的文件系统],[VFS 能提高不同文件系统中文件的访问速度],[VFS 定义了可以访问不同文件系统的统一接口],[通过 VFS 只能访问本地文件，不能访问网络文件])
]

#question[
某文件系统采用目录和索引节点管理文件，当用户在目录中新建文件 F 时，下列操作中，文件系统#emphasis[不会]做的是

#choices([对 F 的索引节点进行初始化],[在目录文件中写入 F 的索引节点号],[在目录文件中写入 F 的访问权限信息],[在目录文件中增加一条 F 对应的目录项])
]

#question[
下列关于内存映射文件（memory-mapped files）机制的叙述中，正确的是

Ⅰ．可实现进程之间的通信\
Ⅱ．可实现页到磁盘块的映射\
Ⅲ．将文件映射到进程的虚拟地址空间\
Ⅳ．将文件映射到系统的物理地址空间

#choices([仅Ⅰ、Ⅲ],[仅Ⅰ、Ⅳ],[仅Ⅱ、Ⅲ],[仅Ⅰ、Ⅱ、Ⅲ])
]

#question[
下列选项中，文件系统可用于记录外存空间使用情况的是

#choices([目录],[系统打开文件表],[文件分配表（FAT）],[文件控制块（FCB）])
]

#question[
下列选项中，文件系统需要为温彻斯特硬盘和固态硬盘都提供的功能是

#choices([划分扇区],[确定盘块大小],[降低寻道时间],[实现均衡磨损])
]

#question[
某网络拓扑及各链路带宽如题33图所示。网络按电路交换方式运行时，主机 H1 与 H2 建立一条带宽为10 Mb/s的电路，建立电路时间为32 μs；按分组交换方式运行时，分组长度为400 B，忽略分组首部开销。现 H1 向 H2 发送一个2 MB（$1"M"=10^6$）的文件，分别采用电路交换、报文交换、分组交换方式时，H2 至少需要 $T_"CS"$、$T_"MS"$、$T_"PS"$ 时间才能接收到全部文件内容，则 $T_"CS"$、$T_"MS"$、$T_"PS"$ 满足的关系是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.045em)
  line((0,0),(18,0))
  for (x,label) in ((0,[H1]),(18,[H2])) {
    content((x,0),image("../../assets/network/visio-2007-isometric-pc.png",width: 2em))
    content((x,-1.3),label)
  }
  for (x,label) in ((6,[R1]),(12,[R2])) {
    content((x,0),image("../../assets/network/router-symbol.svg",width: 1.8em))
    content((x,-0.9),label)
  }
  for (x,label) in ((3,[10 Mb/s]),(9,[100 Mb/s]),(15,[1000 Mb/s])) { content((x,0.8),label) }
})),caption: [题33图],kind: image)

#choices([$T_"CS">T_"MS">T_"PS"$],[$T_"MS">T_"PS">T_"CS"$],[$T_"MS">T_"CS">T_"PS"$],[$T_"PS">T_"MS">T_"CS"$])
]

#question[
若某差错编码的编码集为{1001 1010，0101 1100，1111 0000，0000 1111}，则该差错编码的检错和纠错能力是

#choices([不超过2位错的100%检错、不超过1位错的纠错],[不超过2位错的100%检错、不超过2位错的纠错],[不超过3位错的100%检错、不超过1位错的纠错],[不超过3位错的100%检错、不超过2位错的纠错])
]

#question[
在某个10 BaseT以太网的冲突域内，若主机甲向主机乙发送数据帧时发生了连续11次冲突，则甲再次尝试发送该数据帧的最大间隔时间是

#choices([0.512 ms],[0.5632 ms],[52.3776 ms],[104.8064 ms])
]

#question[
一台新接入网络的主机 H 通过 DHCP 服务器动态请求 IP 地址过程中，与 DHCP 服务器交换 DHCP 报文的部分过程如题36图所示。封装 DHCPREQUEST 报文的 IP 数据报的目的 IP 地址和源 IP 地址分别是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 大纲 PDF 第 81 页。报文的省略行、地址行分别定位，不继承正文段落行距。
  let p(x,y)=((x - 348) / 35,(1425 - y) / 35)
  set-style(stroke:0.045em,content:(wrap:body=>box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  content(p(350,1133),image("../../assets/network/visio-2007-isometric-pc.png",width:3.2em))
  content(p(350,1054),[H])
  content(p(834,1138),image("../../assets/network/visio-2007-isometric-server.png",width:2.3em))
  content(p(845,1036),[DHCP服务器]); content(p(845,1064),[192.168.5.1])
  for x in (348,833) {line(p(x,1170),p(x,1425),mark:(end:">",fill:black,scale:0.7))}
  line(p(833,1202),p(348,1265),mark:(end:">",fill:black,scale:0.7))
  line(p(348,1312),p(833,1371),mark:(end:">",fill:black,scale:0.7))
  for (y,label) in ((1217,[DHCPOFFER]),(1369,[DHCPREQUEST])) {
    rect(p(481,y - 45),p(728,y+45),fill:white)
    content(p(604,y - 62),label)
    content(p(604,y - 31),[⋯])
    content(p(604,y),[yiaddr: 192.168.5.9])
    content(p(604,y+31),[⋯])
  }
  content(p(306,1408),[时间])
})),caption: [题36图],kind: image)

#choices([192.168.5.1，0.0.0.0],[192.168.5.1，192.168.5.9],[255.255.255.255，0.0.0.0],[255.255.255.255，192.168.5.9])
]

#question[
假设路由器实现 NAT 功能，内网中主机 H 的 IP 地址为192.168.1.5/24。若 H 运行某应用向 Internet 发送了一个 UDP 报文段，则路由器在转发封装该 UDP 报文段的 IP 数据报的过程中，UDP 报文段的首部字段会被修改的是

#statements(columns: (1fr,1fr,1fr,1fr),[Ⅰ．源端口号],[Ⅱ．目的端口号],[Ⅲ．总长度],[Ⅳ．校验和])

#choices([仅Ⅰ、Ⅲ],[仅Ⅰ、Ⅳ],[仅Ⅱ、Ⅲ],[仅Ⅱ、Ⅳ])
]

#question[
主机甲通过 TCP 向主机乙发送数据的部分过程如题38图所示，seq 为序号，ack_seq 为确认序号，rcvwnd 为接收窗口。甲在 $t_0$ 时刻的拥塞窗口和发送窗口均为2000 B，拥塞控制阈值为8000 B，MSS=1000 B，甲始终以 MSS 发送 TCP 段。若甲在 $t_1$ 时刻收到如图所示的确认段，则甲在未收到新的确认段之前，还可以继续向乙发送的 TCP 段数是

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 大纲 PDF 第 82 页，保留原图的斜率、两次发送的间距和标签离线距离。
  let p(x,y)=((x - 399) / 35,(1560 - y) / 35)
  set-style(stroke:0.045em,content:(wrap:body=>box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  content(p(400,1100),image("../../assets/network/visio-2007-isometric-pc.png",width:3.3em)); content(p(402,1027),[甲])
  content(p(978,1102),image("../../assets/network/visio-2007-isometric-server.png",width:2.3em)); content(p(983,1031),[乙])
  for x in (399,978) {line(p(x,1147),p(x,1560),mark:(end:">",fill:black,scale:0.7))}
  for (a,b) in (((399,1174),(978,1318)),((399,1222),(747,1308)),
    ((978,1318),(399,1484)),((399,1484),(496,1512))) {
    line(p(..a),p(..b),mark:(end:">",fill:black,scale:0.7))
  }
  content(p(567,1190),[seq=2001，1000 B数据],angle:-14deg)
  content(p(567,1237),[seq=3001，1000 B数据],angle:-14deg)
  content(p(674,1386),[seq=4001，ack_seq=3001，rcvwnd=4000 B],angle:16deg)
  for (y,label) in ((1174,[$t_0$]),(1484,[$t_1$])) {circle(p(399,y),radius:0.12,fill:black);content(p(368,y),label)}
  content(p(363,1547),[时间])
})),caption: [题38图],kind: image)

#choices([2],[3],[4],[5])
]

#question[
Time 是一个提供时间查询服务的 C/S 架构网络应用，支持客户通过 UDP 或 TCP 向 Time 服务器请求时间服务。若某客户与某 Time 服务器通信的往返时间 RTT=8 ms，则该客户分别通过 UDP 和 TCP 向该服务器请求服务，所需的最少时间分别是

#choices([8 ms，8 ms],[8 ms，16 ms],[16 ms，8 ms],[16 ms，16 ms])
]

#question[
下列关于 POP3 协议的叙述中，正确的是

Ⅰ．支持用户代理从邮件服务器读取邮件\
Ⅱ．支持用户代理向邮件服务器发送邮件\
Ⅲ．支持邮件服务器之间发送与接收邮件\
Ⅳ．支持通过一条 TCP 连接收取多封邮件

#choices([仅Ⅰ、Ⅳ],[仅Ⅱ、Ⅲ],[仅Ⅰ、Ⅱ、Ⅲ],[仅Ⅰ、Ⅲ、Ⅳ])
]

= 二、综合应用题：第41～47小题，共70分。

#question[
（本题13分）设有两个长度均为 $n$ 的一维整型数组 $A$ 和 $r e s$，对数组 $A$ 中的每个元素 $A[i]$，计算 $A[i]$ 与 $A[j]$（$0 ≤ i ≤ j ≤ n-1$）乘积的最大值，并将其保存到 $r e s[i]$ 中。例如，若 $A[ ]={1,4,-9,6}$，则得 $r e s[ ]={6,24,81,36}$。现给定数组 $A$，请设计一个时间和空间上尽可能高效的算法 calMulMax，求 $r e s$ 中各元素的值。函数原型为：void calMulMax(int A[], int res[], int n)。要求如下。

#subquestions[
+ 给出算法的基本设计思想。（4分）
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。（7分）
+ 说明你所设计算法的时间复杂度和空间复杂度。（2分）

]
]

#question[
（本题10分）某工程包含12个活动，使用题42图所示的 AOE 网描述，图中各边上标注了活动及其持续时间。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 2026 大纲 PDF 第 84 页，按原图结点、边权位置描点；33 px 为正文 1em。
  let p(x,y) = ((x - 360) / 33,(760 - y) / 33)
  set-style(stroke: 0.045em,content:(wrap:body =>
    box(text(size:0.85em,top-edge:"bounds",bottom-edge:"bounds",body))))
  let ps=((512,599),(831,600),(361,679),(675,681),(990,683),(510,759),(830,761)).map(q => p(..q))
  for (a,b,label,pos) in (
    (0,2,[a=2],(428,621)),(0,1,[b=5],(679,584)),(2,5,[c=1],(411,735)),
    (0,3,[d=3],(628,632)),(2,3,[e=3],(509,665)),(3,1,[f=4],(797,647)),
    (3,5,[g=1],(557,714)),(5,6,[h=1],(646,780)),(3,4,[j=1],(820,701)),
    (1,4,[k=2],(920,622)),(3,6,[m=4],(710,730)),(6,4,[n=3],(915,746)),
  ) {
    let u=ps.at(a); let v=ps.at(b)
    let dx=v.at(0)-u.at(0); let dy=v.at(1)-u.at(1)
    let d=calc.sqrt(dx*dx+dy*dy)
    let r=24 / 33
    line((u.at(0)+r*dx/d,u.at(1)+r*dy/d),(v.at(0)-r*dx/d,v.at(1)-r*dy/d),mark: (end: ">",fill:black,scale:0.55))
    content(p(..pos),label)
  }
  for (i,q) in ps.enumerate() { circle(q,radius:24 / 33,fill:white); content(q,[#(i+1)]) }
})),caption: [题42图],kind: image)

请回答下列问题（活动均用活动名表示）。

#subquestions[
+ 完成该工程的最短时间是多少？哪些活动是关键活动？（3分）
+ 若以最短时间完成工程，则与活动 e 同时进行的活动可能有哪些？（3分）
+ 时间余量最大的活动是哪个？其时间余量是多少？（2分）
+ 假设工程从时刻0启动，因某种原因，活动 b 在时刻6开始。为了保证工程不延期，在其他活动持续时间均不变的情况下，b 的持续时间最多是多少？若不改变 b 的持续时间，则压缩哪个活动的持续时间可以保证工程不延期？（2分）

]
]

#question[
（本题12分）现有 C 语言程序 P 的部分代码如题43图所示。假定运行程序 P 的计算机 M 字长为32位，按字节编址，数据 Cache 的数据区大小为32 KB，采用8路组相联映射方式，主存块大小为64 B，Cache 的命中时间为2个时钟周期，缺失损失为200个时钟周期；采用页式虚拟存储管理方式，页大小为4 KB。数组 $d$ 的起始虚拟地址 $"VA"_31 ∼ "VA"_0$ 为0180 0020H。

#figure(align(center,block(stroke: 0.045em,inset: 0.5em)[
```c
int x, d[2048], i;
...
for(i=0; i<2048; i++)
    d[i]=d[i]/x;
...
```
]),caption: [题43图],kind: image)

请回答下列问题。

#subquestions[
+ 主存地址中 Cache 组号字段和块内地址字段分别占几位？虚拟地址中哪些位可作为 Cache 索引？（3分）
+ $d[100]$ 的虚拟地址为多少？$d[100]$ 所在主存块对应的 Cache 组号是多少？（2分）
+ 假定执行 for 语句时对应代码已在 Cache，变量 $i$ 和 $x$ 装入寄存器，数组 $d$ 已调入主存但不在 Cache，则 $d[0]$ 在其所在主存块内的偏移量是多少（用十六进制表示）？for 语句执行过程中，访问数组 $d$ 的 Cache 缺失率和数组元素的平均访问时间分别是多少（Cache 缺失率的计算结果要求用百分比表示，保留两位小数）？（5分）
+ 数组 $d$ 分布在几个页中？若执行 for 语句时对应代码已在主存，但数组 $d$ 还未调入主存，则执行 for 语句过程中，访问数组 $d$ 所引起的缺页次数是多少？（2分）

]
]

#question[
（本题11分）对于题43中计算机 M 和程序 P，假定 P 的部分机器级代码如题44图（a）所示，其中，R0～R4 为通用寄存器，SEXT 表示按符号扩展；M 中补码除法器逻辑结构如题44图（b）所示。

#figure(align(center,block(stroke: 0.045em,inset: 0.5em)[
```asm
...
// x在R2中，i在R4中
// 数组d的首地址在R3中
mov  R1, (R3+R4*4)    // R1←d[i]
scov R1              // {R0,R1}←SEXT(R1)
idiv R1, R2          // R1←{R0,R1}/R2
...
```
]),caption: [题44图（a）],kind: image)

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 大纲 PDF 第 86 页：寄存器、ALU 及控制线按原图坐标定位。
  let p(x,y) = ((x - 335) / 35, (989 - y) / 35)
  set-style(stroke: 0.04em, content: (wrap: body => box(text(size: 0.8em, top-edge: "bounds", bottom-edge: "bounds", body))))
  let arr(..pts) = line(..pts.pos().map(q => p(..q)),mark: (end: ">",fill: black,scale: 0.45))
  rect(p(439,661),p(621,701)); content(p(530,682),[除数寄存器Y])
  line(..((351,757),(433,757),(458,777),(483,757),(571,757),(521,830),(395,830)).map(q => p(..q)),close: true)
  content(p(460,804),[32位ALU])
  arr((532,701),(532,757)); arr((459,830),(459,892))
  rect(p(362,892),p(751,932))
  line(p(537,892),p(537,932),stroke: (dash: "dotted",thickness: 0.04em))
  content(p(449,912),[余数寄存器R]); content(p(644,912),[余数/商寄存器Q])
  content(p(652,955),[32位])
  arr((459,932),(459,989),(335,989),(335,701),(387,701),(387,757))
  rect(p(857,882),p(1009,946),radius: 32 / 35); content(p(933,916),[控制逻辑])
  for (pts,label,pos) in (
    (((935,882),(935,790),(550,790)),[ALUop],(619,775)),
    (((857,905),(751,905)),[左移],(808,886)),
    (((857,920),(751,920)),[写使能],(808,944)),
  ) {
    line(..pts.map(q => p(..q)),stroke: (dash: "dotted",thickness: 0.04em),mark: (end: ">",fill: black,scale: 0.45))
    content(p(..pos),label)
  }
  arr((459,989),(919,989),(919,946)); arr((941,989),(941,946)); content(p(977,983),[时钟])
  for (a,b,pos) in (((372,710),(398,736),(411,716)),((518,716),(544,742),(557,728)),
    ((445,841),(471,867),(483,854)),((445,945),(471,971),(483,956))) {
    line(p(..a),p(..b)); content(p(..pos),[32])
  }
})),caption: [题44图（b）],kind: image)

请回答下列问题。

#subquestions[
+ 若执行题44图（a）中 idiv 指令的除法运算时，$d[i]=$0x87654321、$x=$0xff，则补码除法器中寄存器 R、Q 和 Y 的初始内容分别是什么（用十六进制表示）？题44图（b）中哪个部件包含计数器？在补码除法器执行过程中，由 ALUop 所控制的 ALU 运算有哪几种？（6分）
+ 假设 idiv 指令执行过程中会检测并触发除法异常，则执行 idiv 指令时，哪些情况下会发生除法异常（要求给出此时 $d[i]$ 和 $x$ 的十六进制表示机器数）？发生除法异常时，在异常响应过程中 CPU 需要完成哪些操作？（5分）

]
]

#question[
（本题7分）甲、乙、丙三人一起植树，甲负责挖树坑，乙负责将树苗放入树坑中并填土，丙负责为新种的树苗浇水。植树的步骤依次为：挖树坑、放树苗、填土和浇水。现有铁锹和水桶各1个，铁锹用于挖树坑和填土，水桶用于浇水。当树坑的数量小于3时，甲才可以挖树坑。假设初始时树坑的数量为0，铁锹和水桶均可用。请定义尽可能少的信号量，用 wait()、signal() 操作描述植树过程中三人之间的同步或互斥关系，并说明所用信号量的作用及其初值。
]

#question[
（本题8分）某系统中进程的虚拟地址空间包括内核区、用户栈、运行时堆、可读写数据段、只读代码段等区域，其布局如题46图所示，图中阴影部分表示未占用区域。现有 C 语言程序的部分代码如下。

#grid(columns: (1fr,9em),gutter: 1.5em,
  block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```c
char *ptr;
void main()
{
    int length;
    ptr=(char *)malloc(100);
    scanf("%s", ptr);
    length=strlen(ptr);
    printf("length=%d\n", length);
    free(ptr);
}
```
  ],
  figure(table(columns: 1,rows: (2.7em,1.8em,1.8em,1.8em,1.8em,1.8em,0.9em),align: center+horizon,
    [内核区],[用户栈],table.cell(fill: luma(80%))[],[运行时堆],[可读写数据段],[只读代码段],table.cell(fill: luma(80%))[],
  ),caption: [题46图],kind: image),
)

请回答下列问题。

#subquestions[
+ 上述程序执行时，其进程控制块位于哪个区域？执行 scanf() 等待键盘输入时，该进程处于什么状态？（2分）
+ main() 函数的代码位于哪个区域？其直接调用的哪些函数的功能需要通过执行驱动程序实现？（3分）
+ 变量 $p t r$ 被分配在哪个区域？若变量 $l e n g t h$ 没有被分配在寄存器中，则会被分配在哪个区域？$p t r$ 指向的字符串位于哪个区域？（3分）

]
]

#question[
（本题9分）某公司在承建国家重大工程项目时，工程部需要较长时间驻扎在偏远山区，工程部网络需要连接公司总部网络。假设综合考虑方案的技术可行性、安全性与经济成本等因素后，决定租用我国自主建设的天通一号卫星通信链路，连接工程部网络的路由器 R1 和公司总部网络的路由器 R2，如题47图所示。S1 和 S2 为千兆以太网交换机；TR1 和 TR2 是卫星信号地面收发设备，实现全双工调制解调。天通一号卫星轨道高度是36 000 km，电磁波信号传播速度为300 000 km/s。租用的卫星链路为 R1 和 R2 之间提供对称全双工信道，每个方向的数据传输速率为200 kb/s。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.045em)
  // 大纲 PDF 第 88 页：按原图像素坐标和正文 35 px 的字号比例重画。
  let p(x,y)=((x - 197) / 35,(1530 - y) / 35)
  let label(x,y,body)=content(p(x,y),text(size:0.62em,body))
  let icon(x,y,w,h,name)=content(p(x,y),image("../../assets/network/visio-2003-"+name+".svg",width:w / 35 * 1em,height:h / 35 * 1em,fit:"stretch"))
  rect(p(197,1263),p(748,1528)); rect(p(819,1351),p(1131,1530))
  circle(p(403,1395),radius:(188 / 35,76 / 35))
  circle(p(619,1314),radius:(71 / 35,34 / 35))
  circle(p(619,1476),radius:(71 / 35,34 / 35))
  for (a,b) in (((363,1393),(683,1393)),((619,1348),(619,1442)),
    ((884,1396),(1007,1396)),((950,1317),(950,1480)),((950,1480),(1041,1480)),
    ((977,1377),(994,1366)),((977,1414),(999,1424)),((474,1343),(474,1437))) {
    line(p(..a),p(..b))
  }
  // 原图无线链路为细长折线闪电，不能用普通直线替代。
  for pts in (((694,1379),(741,1330),(741,1343),(778,1305),(736,1357),(735,1342),(694,1379)),
    ((806,1305),(843,1341),(844,1329),(878,1370),(846,1349),(847,1362),(806,1305))) {
    line(..pts.map(a => p(..a)),close:true,fill:luma(85%))
  }
  icon(363,1391.5,63,58,"pc"); icon(474.5,1392.5,63,55,"switch")
  icon(619.5,1393.5,63,62,"router"); label(619.5,1409,[R1])
  // 原始 Visio 模具的矢量图元：TR1 水平镜像，TR2 保留原朝向。
  content(p(684,1393), std.scale(x: -100%, image("../../assets/network/visio-satellite-dish.svg", width: 56 / 35 * 1em)))
  content(p(885.5,1393.5), image("../../assets/network/visio-satellite-dish.svg", width: 57 / 35 * 1em))
  icon(950.5,1394,65,62,"router"); label(950.5,1409,[R2])
  icon(950,1480,63,55,"switch"); icon(1040,1480,50,60,"server")
  icon(949,1293.5,98,54,"cloud")
  content(p(949,1293.5),text(size:0.62em,fill:white,[Internet]))
  content(p(792,1292), image("../../assets/network/visio-satellite.svg", width: 72 / 35 * 1em))
  for (x,y,body) in ((272,1280,[工程部网络]),(277,1395,[管理区子网]),
    (619,1316,[作业区子网]),(619,1477,[生活区子网]),(365,1432,[H]),
    (376,1451,[10.10.10.33/26]),(450,1366,[S1]),(729,1386,[TR1]),(846,1388,[TR2]),
    (1080,1367,[公司总部]),(1080,1390,[网络]),(923,1453,[S2]),
    (1095,1468,[总部]),(1095,1493,[服务器]),(861,1273,[天通一号])) {label(x,y,body)}
})),caption: [题47图],kind: image)

请回答下列问题。

#subquestions[
+ 若忽略卫星信号中继以及 TR1 和 TR2 调制解调的时间开销，则 R1 到 R2 之间卫星链路的单向传播时延是多少？主机 H 向总部服务器传输数据时可以达到的最大吞吐量是多少？若忽略各层协议数据包的首部开销以及以太网内的传播时延，则主机 H 向总部服务器上传一个4000 B大小的工程进度报告文件，至少需要多长时间？（3分）
+ 现需要基于 GBN 滑动窗口协议为卫星链路设计单向可靠的数据链路层协议 SLP，支持 R1 向 R2 发送数据，SLP 数据帧长为1500 B，忽略 ACK 帧长度。若要求 SLP 的单向信道利用率不低于80%，则 SLP 的发送窗口至少为多少？SLP 帧的序号字段至少需要多少位？（3分）
+ 若公司总部为工程部网络分配的 IP 地址空间是10.10.10.0/24，工程部进一步将该 IP 地址空间分配给3个子网，其中生活区子网可分配 IP 地址数不少于120个，作业区子网和管理区子网可分配 IP 地址数均不少于60个，且主机 H 已正确配置了 IP 地址，则作业区子网、管理区子网和生活区子网的子网地址分别是什么（给出 CIDR 地址形式）？（3分）

]
]
