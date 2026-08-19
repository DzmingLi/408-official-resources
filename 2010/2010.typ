#set text(lang: "zh")
#import "@preview/taskize:0.2.8": tasks

= 2010年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题
== 一、单项选择题（第1\~40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项最符合试题要求）
#block(breakable: false)[\1. 若元素 a,b,c,d,e,f依次进栈，允许进栈、退栈操作交替进行，但不允许连续三次进行退栈操作，则不可能得到的出栈序列是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. dcebfa
+ B. cbdaef
+ C. bcaefd
+ D. afedcb
]
]
#block(breakable: false)[\2. 某队列允许在其两端进行入队操作，但仅允许在一端进行出队操作。若元素 a, b, c, d, e依次入此队列后再进行出队操作，则不可能得到的出队序列是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. bacde
+ B. dbace
+ C. dbcae
+ D. ecbad
]
]
#block(breakable: false)[\3. 下列线索二叉树中（用虚线表示线索），符合后序线索树定义的是\_\_\_。

#figure(image("images/img-1.jpg"),
  caption: [A.]
)

#figure(image("images/img-2.jpg"),
  caption: [B.]
)

#figure(image("images/img-3.jpg"),
  caption: [C.]
)

#figure(image("images/img-4.jpg"),
  caption: [D.]
)
]
#block(breakable: false)[\4. 在右图所示的平衡二叉树中，插入关键字48后得到一棵新平衡二叉树。在新平衡二叉树中，关键字37所在结点的左、右子结点中保存的关键字分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 13,48
+ B. 24,48
+ C. 24,53
+ D. 24,90
]

#image("images/img-5.jpg")
]
#block(breakable: false)[\5. 在一棵度为4的树T中，若有20个度为4的结点，10个度为3的结点，1个度为2的结点，10个度为1的结点，则树T的叶结点个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 41
+ B. 82
+ C. 113
+ D. 122
]
]
#block(breakable: false)[\6. 对 n（n≥2）个权值均不相同的字符构造成哈夫曼树。下列关于该哈夫曼树的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 该树一定是一棵完全二叉树
+ B. 树中一定没有度为1的结点
+ C. 树中两个权值最小的结点一定是兄弟结点
+ D. 树中任一非叶结点的权值一定不小于下一层任一结点的权值
]
]
#block(breakable: false)[\7. 若无向图 G = (V, E)中含有7个顶点，要保证图 G在任何情况下都是连通的，则需要的边数最少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 6
+ B. 15
+ C. 16
+ D. 21
]
]
#block(breakable: false)[\8. 对右图进行拓扑排序，可以得到不同的拓扑序列的个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 4
+ B. 3
+ C. 2
+ D. 1
]

#image("images/img-6.jpg")
]
#block(breakable: false)[\9. 已知一个长度为16的顺序表L，其元素按关键字有序排列。若采用折半查找法查找一个 L中不存在的元素，则关键字的比较次数最多的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.4
+ B.5
+ C.6
+ D.7
]
]
#block(breakable: false)[\10. 采用递归方式对顺序表进行快速排序。下列关于递归次数的叙述中，正确的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 递归次数与初始数据的排列次序无关
+ B. 每次划分后，先处理较长的分区可以减少递归次数
+ C. 每次划分后，先处理较短的分区可以减少递归次数
+ D. 递归次数与每次划分后得到的分区的处理顺序无关
]
]
#block(breakable: false)[\11. 对一组数据（2，12，16，88，5，10）进行排序，若前三趟排序结果如下：

第一趟排序结果：2，12，16，5，10，88

第二趟排序结果：2，12，5，10，16，88

第三趟排序结果：2，5，10，12，16，88

则采用的排序方法可能是\_\_\_。
]
#block(breakable: false)[\12. 下列选项中，能缩短程序执行时间的措施是\_\_\_。

I. 提高CPU时钟频率 II. 优化数据通路结构

III. 对程序进行编译优化

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I和II
+ B. 仅I和III
+ C. 仅II和III
+ D. I、II和III
]
]
#block(breakable: false)[\13. 假定有4个整数用8位补码分别表示 $upright(r) 1 = upright(F E H) \,$ $upright(r) 2 = upright(F) 2 upright(H) \,$ $upright(r) 3 = 9 0 upright(H) \,$ $upright(r) 4 = upright(F) 8 upright(H)$ ，若将运算结果存放在一个8位寄存器中，则下列运算中会发生溢出的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $upright(r) 1 times upright(r) 2$
+ B. $upright(r) 2 times upright(r) 3$
+ C. $upright(r) 1 times upright(r) 4$
+ D. $upright(r) 2 times upright(r) 4$
]
]
#block(breakable: false)[\14. 假定变量i、f和d的数据类型分别为int、float和double（int用补码表示，float和double分别用IEEE754单精度和双精度浮点数格式表示），已知 $upright(i) = 7 8 5 \, upright(f) = 1 . 5 6 7 8 upright(e) 3 \, upright(d) = 1 . 5 upright(e) 1 0 0$ 。若在32位机器中执行下列关系表达式，则结果为“真”的是\_\_\_。

I. $upright(i) = \( upright(i n t) \) \( upright(f l o a t) \) upright(i)$ II. $upright(f) = \( upright(f l o a t) \) \( upright(i n t) \) upright(f)$

III. $upright(f) = \( upright(f l o a t) \) \( upright(d o u b l e) \) upright(f)$ IV. $\( upright(d) + upright(f) \) - upright(d) = upright(f)$

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I和Ⅱ
+ B. 仅I和Ⅲ
+ C. 仅II和Ⅲ
+ D. 仅III和IV
]
]
#block(breakable: false)[\15. 假定用若干 $2 upright(K) times 4$位的芯片组成一个 $8 upright(K) times 8$位的存储器，则地址0B1FH所在芯片的最小地址是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0000H
+ B. 0600H
+ C. 0700H
+ D. 0800H
]
]
#block(breakable: false)[\16. 下列有关 RAM 和 ROM的叙述中，正确的是\_\_\_。

I. RAM是易失性存储器，ROM是非易失性存储器

II. RAM和 ROM都采用随机存取方式进行信息访问

III. RAM和ROM都可用作 Cache

IV. RAM和ROM都需要进行刷新

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I和II
+ B. 仅II和III
+ C. 仅I、II和IV
+ D. 仅II、III和IV
]
]
#block(breakable: false)[\17. 下列命中组合情况中，一次访存过程中不可能发生的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. TLB 未命中，Cache 未命中，Page 未命中
+ B. TLB 未命中，Cache 命中，Page 命中
+ C. TLB 命中，Cache 未命中，Page 命中
+ D. TLB 命中，Cache 命中，Page 未命中
]
]
#block(breakable: false)[\18. 下列寄存器中，汇编语言程序员可见的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 存储器地址寄存器（MAR）
+ B. 程序计数器（PC）
+ C. 存储器数据寄存器（MDR）
+ D. 指令寄存器（IR）
]
]
#block(breakable: false)[\19. 下列选项中，不会引起指令流水线阻塞的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 数据旁路（转发）
+ B. 数据相关
+ C. 条件转移
+ D. 资源冲突
]
]
#block(breakable: false)[\20. 下列选项中的英文缩写均为总线标准的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. PCI、CRT、USB、EISA
+ B. ISA、CPI、VESA、EISA
+ C. ISA、SCSI、RAM、MIPS
+ D. ISA、EISA、PCI、PCI-Express
]
]
#block(breakable: false)[\21. 单级中断系统中，中断服务程序内的执行顺序是\_\_\_。

I. 保护现场 II. 开中断 III. 关中断 IV. 保存断

V. 中断事件处理 VI. 恢复现场 VII. 中断返回

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $upright(I) arrow.r upright(V) arrow.r upright(V I) arrow.r upright(I I) arrow.r upright(V I I)$
+ B. $upright(I) upright(I I I) arrow.r upright(I) arrow.r upright(V) arrow.r upright(V I I)$
+ C. $upright(I) upright(I I I) arrow.r upright(I) upright(I V) arrow.r upright(V) arrow.r upright(V I) arrow.r upright(V I I)$
+ D. $upright(I V) arrow.r upright(I) arrow.r upright(V) arrow.r upright(V I) arrow.r upright(V I I)$
]
]
#block(breakable: false)[\22. 假定一台计算机的显示存储器用 DRAM 芯片实现，若要求显示分辨率为 $1 6 0 0 times 1 2 0 0$ ，颜色深度为24位，帧频为85Hz，显存总带宽的 50%用来刷新屏幕，则需要的显存总带宽至少约为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 245Mbps
+ B. 979Mbps
+ C. 1958Mbps
+ D. 7834Mbps
]
]
#block(breakable: false)[\23.下列选项中，操作系统提供给应用程序的接口是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 系统调用
+ B. 中断
+ C. 库函数
+ D. 原语
]
]
#block(breakable: false)[\24. 下列选项中，导致创建新进程的操作是\_\_\_。

I. 用户登录成功 II. 设备分配 III. 启动程序执行

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I和II
+ B. 仅II和III
+ C. 仅I和III
+ D. I、II和III
]
]
#block(breakable: false)[\25. 设与某资源关联的信号量初值为3，当前值为1。若 M表示该资源的可用个数，N表示等待该资源的进程数，则 M、N分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0、1
+ B. 1、0
+ C. 1、2
+ D. 2、0
]
]
#block(breakable: false)[\26. 下列选项中，降低进程优先级的合理时机是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 进程的时间片用完
+ B. 进程刚完成 I/O，进入就绪列队
+ C. 进程长期处于就绪列队中
+ D. 进程从就绪状态转为运行状态
]
]
#block(breakable: false)[\27. 进程 $upright(P)_0$和 $upright(P)_1$的共享变量定义及其初值为： boolean flag\[2\];

int turn=0;

flag\[0\]=FALSE；flag\[1\]=FALSE；

若进程 $upright(P)_0$和 $upright(P)_1$访问临界资源的类C伪代码实现如

若进程 $upright(P)_0$和 $upright(P)_1$访问临界资源的类C伪代码实现如下：

```cpp

void P0()    //进程 P0

{

while(TRUE)

{

    flag[0]=TRUE; turn=1;

    while(flag[1]&&(turn==1));

    临界区;

    flag[0]=FALSE;

}

}
```

```cpp

void P1()    //进程 P1

{

while(TRUE)

{

    flag[1]=TRUE; turn=0;

    while(flag[0]&&(turn==0));

    临界区;

    flag[1]=FALSE;

}

}
```

则并发执行进程 $upright(P)_0$和 $upright(P)_1$时产生的情形是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 不能保证进程互斥进入临界区，会出现“饥饿”现象
+ B. 不能保证进程互斥进入临界区，不会出现“饥饿”现象
+ C. 能保证进程互斥进入临界区，会出现“饥饿”现象
+ D. 能保证进程互斥进入临界区，不会出现“饥饿”现象
]
]
#block(breakable: false)[\28. 某基于动态分区存储管理的计算机，其主存容量为 55MB（初始为空闲），采用最佳适配（Best Fit）算法，分配和释放的顺序为：分配15MB，分配30MB，释放15MB，分配8MB，分配 6MB，此时主存中最大空闲分区的大小是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 7MB
+ B. 9MB
+ C. 10MB
+ D. 15MB
]
]
#block(breakable: false)[\29. 某计算机采用二级页表的分页存储管理方式，按字节编址，页大小为 $2^(1 0) upright(B)$，页表项大小为2B，逻辑地址结构为

逻辑地址空间大小为 $2^(1 6)$页，则表示整个逻辑地址空间的页目录表中包含表项的个数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 64
+ B. 128
+ C. 256
+ D. 512
]
]
#block(breakable: false)[\30. 设文件索引结点中有7个地址项，其中4个地址项是直接地址索引，2个地址项是一级间接地址索引，1个地址项是二级间接地址索引，每个地址项大小为4B。若磁盘索引块和磁盘数据块大小均为256B，则可表示的单个文件最大长度是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 33KB
+ B. 519KB
+ C. 1057KB
+ D. 16513KB
]
]
#block(breakable: false)[\31. 设置当前工作目录的主要目的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 节省外存空间
+ B. 节省内存空间
+ C. 加快文件的检索速度
+ D. 加快文件的读/写速度
]
]
#block(breakable: false)[\32. 本地用户通过键盘登录系统时，首先获得键盘输入信息的程序是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 命令解释程序
+ B. 中断处理程序
+ C. 系统调用服务程序
+ D. 用户登录程序
]
]
#block(breakable: false)[\33. 下列选项中，不属于网络体系结构所描述的内容是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 网络的层次
+ B. 每层使用的协议
+ C. 协议的内部实现细节
+ D. 每层必须完成的功能
]
]
#block(breakable: false)[\34. 在右图所示的采用“存储-转发”方式的分组交换网络中，所有链路的数据传输速率为100Mbps，分组大小为 1000B，其中分组头大小为20B。若主机H1向主机H2发送一个大小为980000B的文件，则在不考虑分组拆装时间和传

#image("images/img-7.jpg")

播延迟的情况下，从H1发送开始到H2接收完为止，需要的时间至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 80ms
+ B. 80.08ms
+ C. 80.16ms
+ D. 80.24ms
]
]
#block(breakable: false)[\35. 某自治系统内采用 RIP 协议，若该自治系统内的路由器 R1 收到其邻居路由器 R2的距离矢量，距离矢量中包含信息 \<net1,16\>，则能得出的结论是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. R2 可以经过 R1 到达 net1，跳数为 17
+ B. R2 可以到达 net1，跳数为 16
+ C. R1 可以经过 R2 到达 net1，跳数为 17
+ D. R1 不能经过 R2 到达 net1
]
]
#block(breakable: false)[\36. 若路由器R因为拥塞丢弃IP分组，则此时R可向发出该IP分组的源主机发送的ICMP报文类型是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 路由重定向
+ B. 目的不可达
+ C. 源点抑制
+ D. 超时
]
]
#block(breakable: false)[\37. 某网络的IP地址空间为192.168.5.0/24，采用定长子网划分，子网掩码为255.255.255.248，则该网络中的最大子网个数、每个子网内的最大可分配地址个数分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 32,8
+ B. 32,6
+ C. 8,32
+ D. 8,30
]
]
#block(breakable: false)[\38. 下列网络设备中，能够抑制广播风暴的是\_\_\_。

I. 中继器 II. 集线器 III. 网桥 IV. 路由器

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I和II
+ B. 仅III
+ C. 仅III和IV
+ D. 仅IV
]
]
#block(breakable: false)[\39. 主机甲和主机乙之间已建立了一个TCP连接，TCP最大段长度为1000B。若主机甲的当前拥塞窗口为4000B，在主机甲向主机乙连续发送两个最大段后，成功收到主机乙发送的第一个段的确认段，确认段中通告的接收窗口大小为2000B，则此时主机甲还可以向主机乙发送的最大字节数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1000
+ B. 2000
+ C. 3000
+ D. 4000
]
]
#block(breakable: false)[\40. 如果本地域名服务器无缓存，当采用递归方法解析另一网络某主机域名时，用户主机、本地域名服务器发送的域名请求消息数分别为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 一条、一条
+ B. 一条、多条
+ C. 多条、一条
+ D. 多条、多条
]
]
== 二、综合应用题（第41\~47题，共70分）
#block(breakable: false)[\41. （10分）将关键字序列（7，8，30，11，18，9，14）散列存储到散列表中。散列表的存储空间是一个下标从0开始的一维数组，散列函数为 $upright(H) \( upright(k e y) \) = \( upright(k e y) times 3 \) upright(m o d) 7$ ，处理冲突采用线性探测再散列法，要求装填（载）因子为0.7。

#block[
#set enum(numbering: "1)", start: 1)
+ 请画出所构造的散列表。

+ 分别计算等概率情况下查找成功和查找不成功的平均查找长度。
]
]
#block(breakable: false)[\42. （13分）设将 $n \( n > 1 \)$个整数存放到一维数组R中。试设计一个在时间和空间两方面都尽可能高效的算法。将R中保存的序列循环左移 $p \( 0 < p < n \)$个位置，即将R中的数据由 $(upright(X)_0 \, upright(X)_1 \, dots.h \, upright(X)_(n - 1))$变换为 $(upright(X)_p \, upright(X)_(p + 1) \, dots.h \, upright(X)_(n - 1) \, upright(X)_0 \, upright(X)_1 \, dots.h \, upright(X)_(p - 1))$。要求：

#block[
#set enum(numbering: "1)", start: 1)
+ 给出算法的基本设计思想。

+ 根据设计思想，采用C、C++或Java语言描述算法，关键之处给出注释。

+ 说明你所设计算法的时间复杂度和空间复杂度。
]
]
#block(breakable: false)[\43. （11分）某计算机字长为16位，主存地址空间大小为128KB，按字编址。采用单字长指令格式，指令各字段定义如下图所示。

OP
Ms
Rs
Md
Rd
源操作数 目的操作数
#block[
转移指令采用相对寻址方式，相对偏移量用补码表示，寻址方式定义见下表。

]
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [Ms/Md], [寻址方式], [助记符], [含义],
    [000B], [寄存器直接], [Rn], [操作数=(Rn)],
    [001B], [寄存器间接], [(Rn)], [操作数=((Rn))],
    [010B], [寄存器间接、自增], [(Rn)+], [操作数=((Rn))，(Rn)+1→Rn],
    [011B], [相对], [D(Rn)], [转移目标地址=(PC)+(Rn)],
  )]
  , kind: table
  )

注：(X)表示存储器地址X或寄存器X的内容。

请回答下列问题：

#block[
#set enum(numbering: "1)", start: 1)
+ 该指令系统最多可有多少条指令？该计算机最多有多少个通用寄存器？存储器地址寄存器（MAR）和存储器数据寄存器（MDR）至少各需要多少位？

+ 转移指令的目标地址范围是多少？

+ 若操作码0010B表示加法操作（助记符为add），寄存器R4和R5的编号分别为100B和 101B，R4的内容为1234H，R5的内容为5678H，地址1234H中的内容为5678H，地址5678H中的内容为1234H，则汇编语言为“add（R4），（R5）+”（逗号前为源操作数，逗号后为目的操作数）对应的机器码是什么（用十六进制表示）？该指令执行后，哪些寄存器和存储单元中的内容会改变？改变后的内容是什么？
]
]
#block(breakable: false)[\44. （12分）某计算机的主存地址空间大小为256MB，按字节编址。指令Cache和数据Cache分离，均有8个Cache行，每个Cache行大小为64B，数据Cache采用直接映射方式。现有两个功能相同的程序A和B，其伪代码如下：

程序 A:

```c

int a[256][256]

...

int sum_array1()

{

int i,j,sum=0;

for(i=0;i<256;i++)

    for(j=0;j<256;j++)

        sum+=a[i][j];

    return sum;

}
```

程序 B:

```c

int a[256][256]

...

int sum_array2()

{

int i,j,sum=0;

for(j=0;j<256;j++)

    for(i=0;i<256;i++)

        sum+=a[i][j];

    return sum;

}
```

假定int类型数据用32位补码表示，程序编译时i、j、sum分配在寄存器中，数组a按行优先方式存放，其首地址为320（十进制数）。请回答下列问题，要求说明理由或给出计算过程。

#block[
#set enum(numbering: "1)", start: 1)
+ 若不考虑用于 Cache一致性维护和替换算法的控制位，则数据 Cache的总容量为多少？

+ 数组元素 a\[0\]\[31\]和 a\[1\]\[1\]各自所在的主存块对应的 Cache 行号分别是多少（Cache 行号从0开始）？

+ 程序A和B的数据访问命中率各是多少？哪个程序的执行时间更短？
]
]
#block(breakable: false)[\45. （7分）假设计算机系统采用CSCAN（循环扫描）磁盘调度策略，使用2KB的内存空间记录16384个磁盘块的空闲状态。

#block[
#set enum(numbering: "1)", start: 1)
+ 请说明在上述条件下如何进行磁盘块空闲状态的管理。

+ 设某单面磁盘旋转速度为6000rpm，每个磁道有100个扇区，相邻磁道间的平均移动时间为1ms。若在某时刻，磁头位于100号磁道处，并沿着磁道号增大的方向移动（见下图），磁道号请求队列为50,90,30,120，对请求队列中的每个磁道需读取1个随机分布的扇区，则读完这4个扇区点共需要多少时间？要求给出计算过程。

+ 如果将磁盘替换为随机访问的Flash半导体存储器（如U盘、SSD等），是否有比CSCAN更高效的磁盘调度策略？若有，给出磁盘调度策略的名称并说明理由；若无，说明理由。
]

#image("images/img-8.jpg")
]
#block(breakable: false)[\46. （8分）设某计算机的逻辑地址空间和物理地址空间均为64KB，按字节编址。若某进程最多需要6页（Page）数据存储空间，页的大小为1KB，操作系统采用固定分配局部置换策略为此进程分配4个页框（Page Frame）。在时刻260前的该进程访问情况见下表（访问位即使用位）。

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [页号], [页框号], [装入时刻], [访问位],
    [0], [7], [130], [1],
    [1], [4], [230], [1],
    [2], [2], [200], [1],
    [3], [9], [260], [1],
  )]
  , kind: table
  )

当该进程执行到时刻260时，要访问逻辑地址为17CAH的数据。请回答下列问题：

#block[
#set enum(numbering: "1)", start: 1)
+ 该逻辑地址对应的页号是多少？

+ 若采用先进先出（FIFO）置换算法，该逻辑地址对应的物理地址是多少？要求给出计算过程。

+ 若采用时钟（CLOCK）置换算法，该逻辑地址对应的物理地址是多少？要求给出计算过程（设搜索下一页的指针沿顺时针方向移动，且当前指向2号页框，示意图见下图）。
]

#image("images/img-9.jpg")
]
#block(breakable: false)[\47. （9分）某局域网采用CSMA/CD协议实现介质访问控制，数据传输速率为10Mbps，主机甲和主机乙之间的距离为2km，信号传播速度为200000km/s。请回答下列问题，要求说明理由或写出计算过程。

#block[
#set enum(numbering: "1)", start: 1)
+ 若主机甲和主机乙发送数据时发生冲突，则从开始发送数据时刻起，到两台主机均检测到冲突时刻止，最短需经过多长时间？最长需经过多长时间（假设主机甲和主机乙发送数据过程中，其他主机不发送数据）？

+ 若网络不存在任何冲突与差错，主机甲总是以标准的最长以太网数据帧（1518B）向主机乙发送数据，主机乙每成功收到一个数据帧后立即向主机甲发送一个64B的确认帧，主机甲收到确认帧后方可发送下一个数据帧。此时主机甲的有效数据传输速率是多少（不考虑以太网的前导码）？
]]