#set text(lang: "zh")
#import "@preview/taskize:0.2.8": tasks

= 2025年全国硕士研究生招生考试
= 计算机学科专业基础
（科目代码：408）

== 考生注意事项
#block(breakable: false)[\1. 答题前，考生须在答题卡指定位置上填写考生编号和考生姓名；在答题卡指定位置上填写报考单位、考生姓名和考生编号，并涂写考生编号信息点。
]
#block(breakable: false)[\2. 选择题的答案必须涂写在答题卡相应题号的选项上，非选择题的答案必须书写在答题卡指定位置的边框区域内。超出答题区域书写的答案无效；在草稿纸、试题册上答题无效。
]
#block(breakable: false)[\3. 填（书）写部分必须使用黑色字迹签字笔书写，字迹工整、笔记清楚；涂写部分必须使用2B铅笔填涂。
]
#block(breakable: false)[\4. 考试结束，将答题卡和试题册按规定交回。

（以下信息考生必须认真填写）

考生编号
考生姓名]
== 一、单项选择题：第1\~40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项是符合题目要求的。
#block(breakable: false)[\1. 下列程序段的时间复杂度是

```c
int count = 0; i, j;

for( i=l; i*i<= n; i++ )

for( j=l; j=<i; j++ )

count++;
```

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. O(logn)
+ B. O(n)
+ C. O(nlogn)
+ D. O(n²)
]
]
#block(breakable: false)[\2. 已知算法 A 用于检查字符串中各类括号是否匹配，A执行过程中使用初始为空的栈保存遇到的括号。若栈的容量是3，则下列选项中，A不能处理的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $lr((a + lr([b + \( c + d \))) \/ e]) + f \) + 9 - h$
+ B. $[\( upright(a)^(\*) \( upright(b) + upright(c) \) \/ \( upright(d) - upright(e) \) + \/ upright(g) - upright(h)]$
+ C. $lr((a^(\*) lr([b - \( upright(c) - upright(d) \)^(\*) upright(e) \/ \( upright(f) + upright(g) \))) - upright(h)])$
+ D. $lr([a - \( upright(b) + \[ upright(c)^(\*) \( upright(d) + upright(e) \) - upright(f) \] + upright(g) + upright(h)))$
]
]
#block(breakable: false)[\3. 若二叉树的节点值均为正数，采用顺序存储方式保存在数组 R中，用-1表示节点不存在，则下列数组中，不能表示一棵二叉树的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. {20,15,40,-1,-1,35}
+ B. {15,40,10,18,35,-1,-1,12}
+ C. {15,40,10,-1,-1,-1,12}
+ D. {17,20,35,-1,18,45,-1,-1,19,2}
]
]
#block(breakable: false)[\4. 下列关于二叉树及森林的叙述中，正确的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 完全二叉树中不存在度为1的节点
+ B. 任意一个森林都可以转换为一棵二叉树
+ C. 二叉树的分支节点个数比叶节点个数少
+ D. 链式树的根中保存的是最先计算的运算符
]
]
#block(breakable: false)[\5. 设字符集 S包含7个字符，各字符的出现的频次分别为2,3,4,6,10,11。为S中的各字符构造哈曼编码，编码长度不小于3的字符个数是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.2
+ B.3
+ C.4
+ D.5
]
]
#block(breakable: false)[\6. 下列关于图的叙述中，正确的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 有向图必存在入度为0的顶点
+ B. 有向无环图的拓扑有序序列存在且唯一
+ C. 各顶点的度均大于等于2的无向图必有回路
+ D. 可用BFS算法求出带权图中每一对顶点间的最短路径
]
]
#block(breakable: false)[\7. 已知查找表中有400个元素，查找元素概率相同。采用分块查找法找且均匀分块。若采用顺序查找法确定元素所在块，且块内也用顺序查找法，为效率最高，每块包含元素应为

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.8
+ B.10
+ C.20
+ D.25
]
]
#block(breakable: false)[\8. 给7个不同的关键字，能够构成的不同4阶B树的个数是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.7
+ B.8
+ C.9
+ D.10
]
]
#block(breakable: false)[\9. 下列关于散列法处理冲突的叙述中，正确的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 只要散列表不满，线性探查再散列一定能找到一个空闲位置
+ B. 只要散列表不满，二次探查再散列一定能找到一个空闲位置
+ C. 线性探查再散列处理的冲突，一定是发生在同义词之间
+ D. 二次探查再散列处理的冲突，一定是发生在非同义词之间
]
]
#block(breakable: false)[\10. 下列排序算法中，最坏情况下元素移动最少的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 起泡排序
+ B. 直接插入排序
+ C. 快速排序
+ D. 简单选择排序
]
]
#block(breakable: false)[\11. 对含9个关键字的初始序列进行排序，若序列的变化情况如下表所示，则下列排序算法中，采用的是

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    [初始序列], [5,25,40,30,10,20,45,15,35],
    [第1趟排序后的序列], [5,10,20,30,15,35,45,25,40],
    [第2趟排序后的序列], [5,10,15,25,20,30,40,35,45],
  )]
  , kind: table
  )

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 希尔排序
+ B. 基数排序
+ C. 归井排序
+ D. 折半插入排序
]
]
#block(breakable: false)[\12. 在32位计算机上执行下列C语言代码，则ui的真值为

```c
short si = -32767;

unsigned int ui = si;
```

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $2^(1 3) - 1$
+ B. $2^(1 5) + 1$
+ C. $2^(3 2) - 2^(1 5) - 1$
+ D. $2^(3 2) - 2^(1 5) + 1$
]
]
#block(breakable: false)[\13. 已知 float 型变量用 IEEE754 单精度浮点数格式表示。若 float 型变量 x 的机器数为 4730 0000H；则 x 的值为

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $0 . 3 7 5 times 2^(1 4)$
+ B. $1 . 3 7 5 times 2^(1 4)$
+ C. $0 . 3 7 5 times 2^(1 5)$
+ D. $1 . 3 7 5 times 2^(1 5)$
]
]
#block(breakable: false)[\14. 假设8位字长的计算机中，两个带符号整数 x和 y的补码表示分别为 $\[ upright(x) \]_(upright(补)) = upright(A) 3 upright(H) \,$ $\[ upright(y) \]_(upright(补)) = 75 upright(H)$ ，则通过补码加减运算器得到的 x-y的值及 OF标志分别为

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 24,0
+ B. 24,1
+ C. 46,0
+ D. 46,1
]
]
#block(breakable: false)[\15. 某32计算机按字节编制，采用小端方式存放数据，编译器按边界对齐方式为下列C语言结构型数组变量 employee 分配储存空间。数组 employee 的起始地址为 0000A0B0H，employee\[1\]。id 的机器数为12345678H，则56H的地址是

```c
struct record

{

    int id;

    char name[10];

    int salary;

}employee[200];
```

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0000 A0C3H
+ B. 0000 A0C4H
+ C. 00000 A0C5H
+ D. 0000 A0C6H
]
]
#block(breakable: false)[\16. 下列选项中，由指令集体系结构（ISA）规定的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 是否采用阵列乘法器
+ B. 是否采用定长指令字格式
+ C. 是否采用微程序控制器
+ D. 是否采用单总线数据通路
]
]
#block(breakable: false)[\17. 下列关于RISC的叙述中，错误的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 多采用硬连线方式实现控制器
+ B. 通常采用 Load/Store 型指令设计风格
+ C. 难以采用流水线数据通路实现微架构
+ D. 多采用寄存器传递过程调用时的参数
]
]
#block(breakable: false)[\18. 下列关于CPI和CPU时钟周期的叙述中，错误的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 不同类型指令的CPI可能不一样
+ B. 程序的CPI Cache缺失率无关
+ C. 单周期CPU的时钟周期以最耗时指令所用的时间为准
+ D. 流水线CPU的时钟周期以最长流水段所用时间为准
]
]
#block(breakable: false)[\19. 下列关于CPU中的数据通路和控制器的叙述中，错误的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 通用寄存器组中应该包含程序计数器
+ B. 控制器中一定包含指令操作码的译码电路
+ C. 单周期CPU中的控制器比多周期CPU中的更简单
+ D. 流水线CPU需解决数据相关和控制相关等冒险问题
]
]
#block(breakable: false)[\20. 某处理器总线采用同步，并行传输方式，每个总线时钟周期传送4次数据（quadpumped技术），若该总线的工作频率为1333MHz（实际单位是MT/s，表示每秒传送1333M/次），总线宽度为64位，则总线带宽约为

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 10.66GB/s
+ B. 42.66GB/s
+ C. 85.31GB/s
+ D. 341.25 GB/s
]
]
#block(breakable: false)[\21. 下列设备中，适合采用DMA输入输出的设备是

I. 键盘 II. 网卡 III. 固态硬盘 IV. 针式打印机

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. I、II
+ B. II、III
+ C. II、IV
+ D. III、IV
]
]
#block(breakable: false)[\22. 下列选项中，会触发外部中断请求的事件是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. DMA传送结束
+ B. 总线事务结束
+ C. 页故障的处理结束
+ D. 执行断点指令
]
]
#block(breakable: false)[\23. 在采用页式虚拟存储管理方式的系统中，当发生上下文切换时，下列寄存器中操作系统不需要更新的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 通用寄存器
+ B. 页表基址寄存器
+ C. 程序寄存器
+ D. 内核中断向量表基址寄存器
]
]
#block(breakable: false)[\24. 关于虚拟机技术，下列说法错误的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 操作系统可以在虚拟机上运行
+ B. 一台主机可以支持多个虚拟机
+ C. VMM与操作系统特权级相同
+ D. 通过虚拟机技术，可以用一台主机上模拟多种ISA
]
]
#block(breakable: false)[\25. 某进程采用优先权调度，采用单链表保存进程就绪队列，高优先级进程在队头。就绪队列长度为 n，则插入进程、选出进程的时间复杂度分别是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. O(1), O(1)
+ B. O(1), O(n)
+ C. O(n), O(1)
+ D. O(n), O(n)
]
]
#block(breakable: false)[\26. 现有一LRU算法，固定分配局部置换，已为进程分配3个页框，页面访问序列为 {0,1,2,0,5,1,4,3,0,2,3,2,0}，其中0,1,2已调入内存。则缺页次数是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.5
+ B.6
+ C.7
+ D.8
]
]
#block(breakable: false)[\27. 确定进程运行所需的最少页框数时，要考虑的指标是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 代码段长
+ B. 虚拟地址空间大小
+ C. 物理地址空间大小
+ D. 指令系统支持的寻址方式
]
]
#block(breakable: false)[\28. 关于虚拟文件系统，下列说法正确的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 虚拟文件系统是运行在虚拟内存的文件系统
+ B. VFS可以加快文件系统的访问速度
+ C. VFS定义了可访问不同文件系统的统一接口
+ D. VFS只能访问本地文件系统，不能访问网络文件系统
]
]
#block(breakable: false)[\29. 某文件系统采用索引节点方式。用户在目录中新建文件F时，文件系统不会做的是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 初始化文件F的索引节点
+ B. 在目录文件中写入F的索引节点号
+ C. 在目录文件中写入F的访问权限信息
+ D. 在目录文件中增加一条文件F对应的目录项
]
]
#block(breakable: false)[\30. 关于内存映射文件，下列说法正确的是

I. 可实现进程间通信

II. 实现了页面到磁盘块的映射

III. 将文件映射到进程的虚拟地址空间

IV. 将文件映射到系统的物理地址空间

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. I、III
+ B. I、IV
+ C. II、III
+ D. I、II、III
]
]
#block(breakable: false)[\31. 下列选项中，文件系统能够知道外存空闲空间的使用情况是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 目录
+ B. 系统文件打开表
+ C. 文件分配表（FAT）
+ D. 文件控制块（FCB）
]
]
#block(breakable: false)[\32. 下列选项中，文件系统能为温彻斯特硬盘和固态硬盘提供的功能是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 划分扇区
+ B. 确定盘块大小
+ C. 降低寻道时间
+ D. 实现均衡磨损
]
]
#block(breakable: false)[\33. 如下图所示，主机H1向H2发送一个2MB （ $1 upright(M) = 1 0^6 upright(B)$ ）文件有三种方式， $①$电路交换，建立时间为32us，速度为10Mbps； $②$分组交换，文件长度为400B，忽略首部； $③$报文交换。电路交换的时间为 $upright(T_(c s))$ ，报文交换的时间为 $upright(T_(m s))$ ，分组交换的时间为 $upright(T_(p s))$ ，则三者的大小关系是

#image("images/img-1.jpg")

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $upright(T_(c s)) > upright(T_(m s)) > upright(T_(p s))$
+ B. $upright(T_(m s)) > upright(T_(p s)) > upright(T_(c s))$
+ C. $upright(T_(m s)) > upright(T_(c s)) > upright(T_(p s))$
+ D. $upright(T_(p s)) > upright(T_(m s)) > upright(T_(c s))$
]
]
#block(breakable: false)[\34. 有如下编码集 {10011010,01011100,11110000,00001111}，它的检错和纠错能力是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 不超过2位数错误 100%检错，不超过1位数纠错
+ B. 不超过2位数错误 100%检错，不超过2位数纠错
+ C. 不超过3位数错误 100%检错，不超过1位数纠错
+ D. 不超过3位数错误 100%检错，不超过2位数纠错
]
]
#block(breakable: false)[\35. 现有一 BaseT 以太网，主机甲、乙同属一个冲突域，连续发生11次冲突，甲再次发送的最大时间间隔为

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0.512ms
+ B. 0.5632ms
+ C. 52.3776ms
+ D. 104.8064ms
]
]
#block(breakable: false)[\36. 一台新接入网络的主机H通过DHCP服务器动态请求IP地址过程中，与DHCP服务器交换DHCP报文过程如下图所示。封装DHCP的REQUEST报文的IP数据报的目的IP地址和源IP地址分别是

#image("images/img-2.jpg")

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 192.168.5.1,0.0.0.0
+ B. 192.168.5.1,192.168.5.9
+ C. 255.255.255.255,0.0.0.0
+ D. 255.255.255.255,192.168.5.9
]
]
#block(breakable: false)[\37. 假设路由器实现NAT功能，内网中主机H的IP地址为192.168.1.5/24。若H运行某应用向internet发送一个UDP报文段，则路由器在转发封装该UDP报文段的IP数据报的过程中，UDP报文的首部字段会被修改的是

I. 源端口号 II. 目的端口号 III. 总长度 IV. 校验和

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、III
+ B.仅I、IV
+ C. 仅II、III
+ D. 仅II、IV
]
]
#block(breakable: false)[\38. 主机甲通过TCP向主机乙发送数据的部分过程如下图，seq为序号，ack-seq为确认序号，rcwnd为接收窗口。甲在 $t_0$时刻的拥塞窗口和发送窗口均为2000B，拥塞控制阈值为8000B，MSS=1000B。甲始终以MSS发送TCP段。若甲在 $t_1$时刻收到如图所示的确认段，则甲在未收到新的确认段之前，还可以继续向乙发送的TCP段数是

#image("images/img-3.jpg")

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.2
+ B.3
+ C.4
+ D.5
]
]
#block(breakable: false)[\39. Time是一个提供时间查询服务的C/S架构网络应用，支持客户通过UDP和TCP向Time服务器请求时间。若某客户与Time服务器通信往返时间为8ms，则该客户分别通过UDP和TCP向该服务器请求服务，所需的最少时间分别是

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 8ms,8ms
+ B. 8ms,16ms
+ C. 16ms,8ms
+ D. 16ms,16ms
]
]
#block(breakable: false)[\40. 下列关于 POP3 协议的叙述，正确的是

I. 支持用户代理从邮件服务读取邮件

II. 支持用户代理从邮件服务发送邮件

III. 支持邮件服务器之间发送和接收邮件

IV. 支持通过一条 TCP 连接收取多封邮件

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. I、III
+ B. I、IV
+ C. II、III
+ D. I、II、III
]
]
== 二、综合应用题：第41\~47小题，共70分。
#block(breakable: false)[\41. （本题13分）

设有两个长度均为 n的一维整型数组 A 和 res，对数组 A 中的每个元素 A\[i\]，计算 A\[i\]与 A\[j\]（ $0 < = i < = j < = n - 1$ ）乘积的最大值，并将其保存到 res\[i\]中。例如，若 A\[\] = {1,4,-9,6}，则得到 res\[\] = {6,24,81,36}。现给定数组 A，请设计一个时间和空间上尽可能高效的算法 calMulMax，求 res 中各元素的值。函数原型为：void calMulMax(intA\[\]，int res\[\]，int n)，要求：

\\(1) 给出算法的基本设计思想；（4分）

\\(2) 根据设计思想，采用C或C++语言描述算法，关键之处给出注释；（7分）

\\(3) 说明你所设计算法的时间复杂度和空间复杂度。（2分）
]
#block(breakable: false)[\42. （本题10分）
某工程包含12活动，使用题42图所示的AOE网描述，图中各边上标注了活动及其持续时间。

#figure(image("images/img-4.jpg"),
  caption: [题42图 AOE网络图]
)

请回答下列问题（活动均用活动名表示）：

\\(1) 完成该工程的最短时间是多少？哪些活动是关键活动？（3分）

\\(2) 若按照最短时间完成工程，则与活动e同时进行的活动可能有哪些？（3分）

\\(3) 时间余量最大的活动是哪个？其时间余量是多少？（2分）

\\(4) 假设工程从时刻0启动，因某种原因，活动b在时刻6开始，为保证工程不延期，在其他活动持续时间不变的情况下，b的持续时间最多是多少？若不改变b的持续时间，则压缩哪个活动的持续时间也能保证工程不延期？（2分）

]
#block(breakable: false)[\43. （本题12分）
现有C语言程序P的部分代码如题43图所示，假定运行程序P的计算机M字长为32位，按字节编址，数据Cache的数据区大小为32KB，采用8路组相联映射方式，主存块大小为64B，Cache命中时间为2个时钟周期，缺失损失为200个时钟周期：采用页式虚拟存储管理方式，页大小为4kB，数组d的起始虚拟地址为01800020H （VA31-VA0）。

#figure(image("images/img-5.jpg"),
  caption: [题43图程序P的部分代码]
)

请回答下列问题：

\\(1) 主存地址中cache组号字段和块内地址字段分别占几位？虚拟地址中哪些位可作为cache索引？（2分）

\\(2) d\[100\]的虚拟地址为多少？d\[100\]所在主存块对应的 cache 组号是多少？ （3分）

\\(3) 假设执行 for语句时对应代码已在cache，变量i和x已装入寄存器，数组d已调入主存但不在cache，则d\[0\]在其所在主存块内的偏移量是多少（用十六进制），for语句执行过程中，访问数组d的cache缺失率和数组元素的平均访问时长是多少？（缺失率百分比保留两位）（4分）

\\(4) 数组 d分布在几个页中？若执行 for语句时对应代码已经在主存，但数组 d还未调入主存，则执行 for语句过程中，访问数组 d所引起的缺页次数是多少？（3分）

]
#block(breakable: false)[\44. （本题9分）
对于题43中计算机M和程序P，假定P的部分机器级代码如题44（a）图所示，其中，R0\~R4为通用寄存器，SEXT表示按符号扩展；M中补码除法器逻辑结构如题 44（b）图所示。

```asm
// X 在 R2 中，i 在 R4 中

//数组 d 的首地址在 R3 中

mov R1, (R3 + R4*4) // R1 <- d [ i ]

scov R1 // {RO, R1 }<- SEXT(R1)

idiv R1,R3 //R1 <- ({RO, R1}/R2)
```

#block[
题44（a）图 程序代码

]
#figure(image("images/img-6.jpg"),
  caption: [题44（b）图补码除法器逻辑结构]
)

请回答下列问题，并说明理由。

\\(1) 若执行题44（a）图中idiv指令的除运算时， $upright(d \[ i \] = 0 x 87654321 \, x = 0 x f f)$ ，则补码除法器中寄存器R、Q和Y的初始内容分别是什么（用十六进制表示）？题44（b）图中哪个部件包含计数器？在补码除法器执行过程中，由ALUop所控制的ALU运算有哪几种？（4分）

\\(2) 假设idiv指令执行过程中会检测并触发除法异常，则执行idiv指令时，哪些情况下会发生除法异常（要求给出此时d用和x的十六进制表示机器数）？发生除法异常时，在异常响应过程中CPU需要完成哪些操作？（5分）

]
#block(breakable: false)[\45. （本题8分）
三个人一起植树，甲挖坑，乙放树苗入坑并填土，丙负责为新种树苗浇水。步骤依次为：挖树坑，放树苗，填土和浇水。现在有铁锹和水桶各一个，铁锹用于挖树坑，填土。水桶用于浇水。当树坑数量小于3时，甲才可以挖树坑。设初始坑=0，铁锹水桶均可用，定义尽可能少的信号量，用wait()和signal()。操作描述植树过程中三人的同步互斥关系，并说明所用信号量的作用及其初值。

]
#block(breakable: false)[\46. （本题9分）
某进程的虚拟地址空间如下图所示，阴影部分为未占用区域。

内核区

用户栈

运行时堆

可读写数据区

只读代码区

#block[
题46图

]
另现有 C 程序代码：

```c
char *ptr;

void main()

{

    int length;

    ptr = (char*)malloc(size of(char));

    scanf("%s", ptr);

    length = strlen(ptr);

    printf("length=%d\n", length);

    free(ptr);

}
```

请回答下列问题，并说明理由。

\\(1) 上述程序执行时，PCB位于哪个区域，执行 scanf()等待键盘输入时，该进程处于什么状态？（3分）

\\(2) main( )函数的代码位于哪个区域？其直接调用的哪些函数的功能需要通过执行驱动程序实现？（3分）

\\(3) 变量 ptr 被分配在哪个区域？若变量 length 没有被分配在寄存器中，则会被分配在哪个区域？ptr 指向的字符串位于哪个区域？（3分）

]
#block(breakable: false)[\47. （本题9分）
如题47图所示，卫星天通一号的轨道高度是 36000km，电磁波传播速度为 300000km/s。TR1和TR2用于收发卫星信号，采用全双工调制解调，其收发速率为 200Kbps。

#figure(image("images/img-7.jpg"),
  caption: [题47图]
)

请回答下列问题，并说明理由。

\\(1) 忽略卫星信号中继，TR1，TR2调制解调开销，则R1到R2之间的卫星链路单向传播时延是多少？主机H向总部服务器传输数据时可达到的最大吞吐量是多少？若忽略各层协议首部开销，以及以太网的传播时延，则 $upright(H) arrow.r upright(s e v e r)$上传一个4000B的文件，至少需要多长时间？（3分）

\\(2) 基于GBN为卫星链路设计单向可靠的链路层协议SLP，支持R1 $arrow.r$ R2发送数据。SLP数据帧长1500B，忽略ACK帧长度，要求SLP单向信道利用率不低于 80%则发送窗口至少为多少？SLP帧序号至少为多少？（3分）

\\(3) 总部给工程部分配IP地址空间10.10.10.0/24，再划分为3个子网，生活区子网不少于120个，作业子网，管理区子网IP均不少于60个，H已正确配置IP。问作业区子网，管理区子网，生活区子网地址各是多少？（3分）
]
