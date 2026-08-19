#set text(lang: "zh")
#import "@preview/taskize:0.2.8": tasks

= 2015年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题
== 一、单项选择题（第1\~40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项最符合试题要求）
#block(breakable: false)[\1. 已知程序如下：

```cpp
int S(int n)
{ return (n<=0)?0:s(n-1)+n; }
void main()
{ cout<< S(1); }
```

程序运行时使用栈来保存调用过程的信息，自栈底到栈顶保存的信息依次对应的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. main() $arrow.r$ S(1) $arrow.r$ S(0)
+ B. S(0) $arrow.r$ S(1) $arrow.r$ main()
+ C. main() $arrow.r$ S(0) $arrow.r$ S(1)
+ D. S(1) $arrow.r$ S(0) $arrow.r$ main()
]
]
#block(breakable: false)[\2. 先序序列为 a,b,c,d的不同二叉树的个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 13
+ B. 14
+ C. 15
+ D. 16
]
]
#block(breakable: false)[\3. 下列选项给出的是从根分别到达两个叶结点路径上的权值序列，能属于同一棵哈夫曼树的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 24,10,5和24,10,7
+ B. 24,10,5和24,12,7
+ C. 24,10,10和24,14,11
+ D. 24,10,5和24,14,6
]
]
#block(breakable: false)[\4. 现有一棵无重复关键字的平衡二叉树（AVL树），对其进行中序遍历可得到一个降序序列。下列关于该平衡二叉树的叙述中，正确的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 根结点的度一定为2
+ B. 树中最小元素一定是叶结点
+ C. 最后插入的元素一定是叶结点
+ D. 树中最大元素一定是无左子树
]
]
#block(breakable: false)[\5. 设有向图 G = (V, E)，顶点集 V = { $upright(v)_0 \, upright(v)_1 \, upright(v)_2 \, upright(v)_3$ }，边集 E = { $< upright(v)_0 \, upright(v)_1 >$ ， $< upright(v)_0 \, upright(v)_2 >$ ， $< upright(v)_0 \, upright(v)_3 >$ $< upright(v)_1 \, upright(v)_3 >$ }。若从顶点 $upright(V)_0$ 开始对图进行深度优先遍历，则可能得到的不同遍历序列个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 2
+ B. 3
+ C. 4
+ D. 5
]
]
#block(breakable: false)[\6. 求下面带权图的最小（代价）生成树时，可能是克鲁斯卡（Kruskal）算法第2次选中但不是普里姆（Prim）算法（从 $V_4$开始）第2次选中的边是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $\( V_1 \, V_3 \)$
+ B. $\( V_1 \, V_4 \)$
+ C. $\( V_2 \, V_3 \)$
+ D. $\( V_3 \, V_4 \)$
]

#image("images/img-1.jpg")
]
#block(breakable: false)[\7. 下列选项中，不能构成折半查找中关键字比较序列的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 500,200,450,180
+ B. 500,450,200,180
+ C. 180,500,200,450
+ D. 180,200,500,450
]
]
#block(breakable: false)[\8. 已知字符串 S为“abaabaabacacaabaabcc”，模式串 t为“abaabc”。采用KMP算法进行匹配，第一次出现“失配”（ $upright(s \[ i \] eq.not t \[ j \])$ ）时， $upright(i = j = 5)$ ，下次开始匹配时，i和j的值分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $upright(i = 1 \, j = 0)$
+ B. $upright(i = 5 \, j = 0)$
+ C. $upright(i = 5 \, j = 2)$
+ D. $upright(i = 6 \, j = 2)$
]
]
#block(breakable: false)[\9. 下列排序算法中，元素的移动次数与关键字的初始排列次序无关的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 直接插入排序
+ B. 起泡排序
+ C. 基数排序
+ D. 快速排序
]
]
#block(breakable: false)[\10. 已知小根堆为8,15,10,21,34,16,12，删除关键字8之后需重建堆，在此过程中，关键字之间的比较次数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.1
+ B.2
+ C.3
+ D.4
]
]
#block(breakable: false)[\11. 希尔排序的组内排序采用的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 直接插入排序
+ B. 折半插入排序
+ C. 快速排序
+ D. 归并排序
]
]
#block(breakable: false)[\12. 计算机硬件能够直接执行的是\_\_\_。

I. 机器语言程序 II. 汇编语言程序 III. 硬件描述语言程序

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅 I
+ B. 仅 I、II
+ C. 仅 I、III
+ D. I、II、III
]
]
#block(breakable: false)[\13. 由3个“1”和5个“0”组成的8位二进制补码，能表示的最小整数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. -126
+ B. -125
+ C. -32
+ D. -3
]
]
#block(breakable: false)[\14. 下列有关浮点数加减运算的叙述中，正确的是\_\_\_。

I. 对阶操作不会引起阶码上溢或下溢

II. 右规和尾数舍入都可能引起阶码上溢

III. 左规时可能引起阶码下溢

IV. 尾数溢出时，结果不一定溢出

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅Ⅱ、Ⅲ
+ B. 仅Ⅰ、Ⅱ、Ⅳ
+ C. 仅Ⅰ、Ⅲ、Ⅳ
+ D. I、Ⅱ、Ⅲ、Ⅳ
]
]
#block(breakable: false)[\15. 假定主存地址为32位，按字节编址，主存和 Cache之间采用直接映射方式，主存块大小为4个字，每字32位，采用回写（Write Back）方式，则能存放4K字数据的Cache的总容量的位数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 146k
+ B. 147K
+ C. 148K
+ D. 158K
]
]
#block(breakable: false)[\16. 假定编译器将赋值语句“ $upright(x) = upright(x) + 3 ;$ ”转换为指令“add xaddr,3”，其中 xaddr是 x对应的存储单元地址。若执行该指令的计算机采用页式虚拟存储管理方式，并配有相应的 TLB，且 Cache使用直写（Write Through）方式，则完成该指令功能需要访问主存的次数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.0
+ B.1
+ C.2
+ D.3
]
]
#block(breakable: false)[\17. 下列存储器中，在工作期间需要周期性刷新的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. SRAM
+ B. SDRAM
+ C. ROM
+ D. FLASH
]
]
#block(breakable: false)[\18. 某计算机使用4体交叉编址存储器，假定在存储器总线上出现的主存地址（十进制）序列为8005，8006，8007，8008，8001，8002，8003，8004，8000，则可能发生访存冲突的地址对是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 8004和8008
+ B. 8002和8007
+ C. 8001和8008
+ D. 8000和8004
]
]
#block(breakable: false)[\19. 下列有关总线定时的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 异步通信方式中，全互锁协议最慢
+ B. 异步通信方式中，非互锁协议的可靠性最差
+ C. 同步通信方式中，同步时钟信号可由各设备提供
+ D. 半同步通信方式中，握手信号的采样由同步时钟控制
]
]
#block(breakable: false)[\20. 若磁盘转速为 7200rpm，平均寻道时间为 8ms，每个磁道包含 1000 个扇区，则访问一个扇区的平均存取时间大约是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 8.1ms
+ B. 12.2ms
+ C. 16.3ms
+ D. 20.5ms
]
]
#block(breakable: false)[\21. 在采用中断 I/O方式控制打印输出的情况下，CPU和打印控制接口中的I/O端口之间交换的信息不可能是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 打印字符
+ B. 主存地址
+ C. 设备状态
+ D. 控制命令
]
]
#block(breakable: false)[\22. 内部异常（内中断）可分为故障（fault）、陷阱（trap）和终止（abort）三类。下列有关内部异常的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 内部异常的产生与当前执行指令相关
+ B. 内部异常的检测由 CPU 内部逻辑实现
+ C. 内部异常的响应发生在指令执行过程中
+ D. 内部异常处理后返回到发生异常的指令继续执行
]
]
#block(breakable: false)[\23. 处理外部中断时，应该由操作系统保存的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 程序计数器（PC）的内容
+ B. 通用寄存器的内容
+ C. 块表（TLB）中的内容
+ D. Cache中的内容
]
]
#block(breakable: false)[\24. 假定下列指令已装入指令寄存器，则执行时不可能导致CPU从用户态变为内核态（系统态）的是\_\_\_。

A. DIV R0, R1 ; (R0)/(R1) $arrow.r$ R0
B. INT n ; 产生软中断
C. NOT R0 ; 寄存器R0的内容取非
D. MOV R0, addr ; 把地址 addr 处的内存数据放入寄存器R0中
]
#block(breakable: false)[\25. 下列选项中，会导致进程从执行态变为就绪态的事件是。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 执行 P(wait)操作
+ B. 申请内存失败
+ C. 启动 I/O 设备
+ D. 被高优先级进程抢占
]
]
#block(breakable: false)[\26. 若系统 S1 采用死锁避免方法，S2 采用死锁检测方法。下列叙述中，正确的是\_\_\_。

I. S1 会限制用户申请资源的顺序，而 S2 不会

II. S1 需要进程运行所需资源总量信息，而 S2 不需要

III. S1 不会给可能导致死锁的进程分配资源，而 S2 会

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅 I、II
+ B. 仅 II、III
+ C. 仅 I、III
+ D. I、II、III
]
]
#block(breakable: false)[\27. 系统为某进程分配了4个页框，该进程已访问的页号序列为2，0，2，9，3，4，2，8，2，4，8，

4,5。若进程要访问的下一页的页号为7，依据LRU算法，应淘汰页的页号是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.2
+ B.3
+ C.4
+ D.8
]
]
#block(breakable: false)[\28. 在系统内存中设置磁盘缓冲区的主要目的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 减少磁盘 I/O 次数
+ B. 减少平均寻道时间
+ C. 提高磁盘数据可靠性
+ D. 实现设备无关性
]
]
#block(breakable: false)[\29. 在文件的索引结点中存放直接索引指针10个，一级和二级索引指针各1个。磁盘块大小为1KB，每个索引指针占4字节。若某文件的索引结点已在内存中，则把该文件偏移量（按

字节编址）为1234和307400处所在的磁盘块读入内存，需访问的磁盘块个数分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1,2
+ B. 1,3
+ C. 2,3
+ D. 2,4
]
]
#block(breakable: false)[\30. 在请求分页系统中，页面分配策略与页面置换策略不能组合使用的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 可变分配，全局置换
+ B. 可变分配，局部置换
+ C. 固定分配，全局置换
+ D. 固定分配，局部置换
]
]
#block(breakable: false)[\31. 文件系统用位图法表示磁盘空间的分配情况，位图存于磁盘的 32\~127号块中，每个盘块占1024字节，盘块和块内字节均从0开始编号。假设要释放的盘块号为409612，则位图中要修改的位所在的盘块号和块内字节序号分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 81、1
+ B. 81、2
+ C. 82、1
+ D. 82、2
]
]
#block(breakable: false)[\32. 某硬盘有200个磁道（最外侧磁道号为0），磁道访问请求序列为130,42,180,15,199，当前磁头位于第58号磁道并从外侧向内侧移动。按照SCAN调度方法处理完上述请求后，磁头移过的磁道数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 208
+ B. 287
+ C. 325
+ D. 382
]
]
#block(breakable: false)[\33. 通过POP3协议接收邮件时，使用的传输层服务类型是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 无连接不可靠的数据传输服务
+ B. 无连接可靠的数据传输服务
+ C. 有连接不可靠的数据传输服务
+ D. 有连接可靠的数据传输服务
]
]
#block(breakable: false)[\34. 使用两种编码方案对比特流 01100111 进行编码的结果如下图所示，编码 1 和编码 2 分别是\_\_\_。

#image("images/img-2.jpg")

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. NRZ和曼彻斯特编码
+ B. NRZ和差分曼彻斯特编码
+ C. NRZI和曼彻斯特编码
+ D. NRZI和差分曼彻斯特编码
]
]
#block(breakable: false)[\35. 主机甲通过128kbps卫星链路，采用滑动窗口协议向主机乙发送数据，链路单向传播延迟为250ms，帧长为1000字节。不考虑确认帧的开销，为使链路利用率不小于 80%，帧序号的比特数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 3
+ B. 4
+ C. 7
+ D. 8
]
]
#block(breakable: false)[\36. 下列关于 CSMA/CD 协议的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 边发送数据帧，边检测是否发生冲突
+ B. 适用于无线网络，以实现无线链路共享
+ C. 需要根据网络跨距和数据传输速率限定最小帧长
+ D. 当信号传播延迟趋近0时，信道利用率趋近 100%
]
]
#block(breakable: false)[\37. 下列关于交换机的叙述中，正确的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 以太网交换机本质上是一种多端口网桥
+ B. 通过交换机互连的一组工作站构成一个冲突域
+ C. 交换机每个端口所连网络构成一个独立的广播域
+ D. 以太网交换机可实现采用不同网络层协议的网络互联
]
]
#block(breakable: false)[\38. 某路由器的路由表如下表所示。

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [目的网络], [下一跳], [接口],
    [169.96.40.0/23], [176.1.1.1], [S1],
    [169.96.40.0/25], [176.2.2.2], [S2],
    [169.96.40.0/27], [176.3.3.3], [E3],
    [0.0.0.0/0], [176.4.4.4], [E4],
  )]
  , kind: table
  )

若路由器收到一个目的地址为169.96.40.5的IP分组，则转发该IP分组的接口是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. S1
+ B. S2
+ C. S3
+ D. S4
]
]
#block(breakable: false)[\39. 主机甲和主机乙新建一个TCP连接，甲的拥塞控制初始阈值为32KB，甲向乙始终以 MSS=1KB大小的段发送数据，并一直有数据发送；乙为该连接分配16KB接收缓存，并对每个数据段进行确认，忽略段传输延迟。若乙收到的数据全部存入缓存，不被取走，则甲从连接建立成功时刻起，未发送超时的情况下，经过4个RTT后，甲的发送窗口是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1KB
+ B. 8KB
+ C. 16KB
+ D. 32KB
]
]
#block(breakable: false)[\40. 某浏览器发出的 HTTP 请求报文如下：

#image("images/img-3.jpg")

下列叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 该浏览器请求浏览 index.html
+ B. Index.html存放在 www.test.edu.cn 上
+ C. 该浏览器请求使用持续连接
+ D. 该浏览器曾经浏览过 www.test.edu.cn
]
]
== 二、综合应用题（第41\~47小题，共70分）
#block(breakable: false)[\41. （15分）用单链表保存 m个整数，结点的结构为\[data\]\[link\]，且 $\| upright(d a t a) \| lt.eq n$ （n为正整数）。现要求设计一个时间复杂度尽可能高效的算法，对于链表中 data的绝对值相等的结点，仅保留第一次出现的结点而删除其余绝对值相等的结点。例如，若给定的单链表 HEAD如下：

#image("images/img-4.jpg")

则删除结点后的 HEAD 为

#image("images/img-5.jpg")

要求：

#block[
#set enum(numbering: "1)", start: 1)
+ 给出算法的基本设计思想。

+ 使用 C 或 C++语言，给出单链表结点的数据类型定义。

+ 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。

+ 说明你所设计算法的时间复杂度和空间复杂度。
]
]
#block(breakable: false)[\42. （8分）已知含有5个顶点的图G如下图所示。

#image("images/img-6.jpg")

请回答下列问题：

#block[
#set enum(numbering: "1)", start: 1)
+ 写出图 G的邻接矩阵 A（行、列下标从0开始）。

+ 求 $A^2$ ，矩阵 $A^2$中位于0行3列元素值的含义是什么？

+ 若已知具有 n（ $n gt.eq 2$ ）个顶点的图的邻接矩阵为 B，则 $B^m$ （ $2 lt.eq m lt.eq n$ ）中非零元素的含义是什么？
]
]
#block(breakable: false)[\43. （13分）某16位计算机的主存按字节编码，存取单位为16位；采用16位定长指令字格式；CPU采用单总线结构，主要部分如下图所示。图中R0～R3为通用寄存器；T为暂存器；SR为移位寄存器，可实现直送（mov）、左移一位（left）和右移一位（right）3种操作，控制信号为SRop，SR的输出由信号SRout控制；ALU可实现直送A（mova）、A加B（add）、A减B（sub）、A与B（and）、A或B（or）、非A（not）和A加1（inc）7种操作，控制信号为ALUop。

#image("images/img-7.jpg")

请回答下列问题。

#block[
#set enum(numbering: "1)", start: 1)
+ 图中哪些寄存器是程序员可见的？为何要设置暂存器 T？

+ 控制信号 ALUop和 SRop的位数至少各是多少？

+ 控制信号 SRout所控制部件的名称或作用是什么？

+ 端点 $① tilde.op ⑨$中，哪些端点须连接到控制部件的输出端？

+ 为完善单总线数据通路，需要在端点 $① tilde.op ⑨$中相应的端点之间添加必要的连线。写出连线的起点和终点，以正确表示数据的流动方向。

+ 为什么二路选择器MUX的一个输入端是2？
]
]
#block(breakable: false)[\44. （10分）题43中描述的计算机，其部分指令执行过程的控制信号如题44图a所示。

#figure(image("images/img-8.jpg"),
  caption: [题44图a部分指令控制信号]
)

该机指令格式如题44图b所示，支持寄存器直接和寄存器间接两种寻址方式，寻址方式位分别为0和1，通用寄存器 R0～R3的编号分别为0、1、2和3。

#figure(image("images/img-9.jpg"),
  caption: [题44图b指令格式]
)

请回答下列问题。

#block[
#set enum(numbering: "1)", start: 1)
+ 该机的指令系统最多可定义多少条指令？

+ 若 inc、shl和 sub指令的操作码分别为01H、02H和03H，则以下指令对应的机器代码各是什么？
]

```text
inc R1 ; R1 + 1 -> R1
shl R2, R1 ; (R1) << 1 -> R2
sub R3, (R1), R2 ; ((R1)) - (R2) -> R3
```

#block[
#set enum(numbering: "1)", start: 3)
+ 假设寄存器 X的输入和输出控制信号分别为Xin和Xout，其值为1表示有效，为0表示无效（如 PCout=1表示PC内容送总线）；存储器控制信号为MEMop，用于控制存储器的读（read）和写（write）操作。写出题图 a 中标号 $① tilde.op ⑧$处的控制信号或控制信号的取值。

+ 指令“sub R1，R3，(R2)”和“inc R1”的执行阶段至少各需要多少个时钟周期？
]
]
#block(breakable: false)[\45. （9分）有A、B两人通过信箱进行辩论，每个人都从自己的信箱中取得对方的问题。将答案和向对方提出的新问题组成一个邮件放入对方的邮箱中。假设A的信箱最多放M个邮件，B的信箱最多放N个邮件。初始时A的信箱中有x个邮件（ $0 < x < M$ ），B的信箱中有y个（ $0 < y < N$ ）辩论者每取出一个邮件，邮件数减1。A和B两人的操作过程描述如下：

#figure(
  align(center)[#table(
    columns: (50%, 50%),
    align: (auto,auto,),
    [A{ while(TRUE){ 从A的信箱中取出一个邮件; 回答问题并提出一个新问题; 将新邮件放入B的信箱; }], [B{ while(TRUE){ 从B的信箱中取出一个邮件; 回答问题并提出一个新问题; 将新邮件放入A的信箱; }],
  )]
  , kind: table
  )

CoEnd

当信箱不为空时，辩论者才能从信箱中取邮件，否则需要等待。当信箱不满时，辩论者才能将新邮件放入信箱，否则需要等待。请添加必要的信号量和P、V（或wait、signal）操作，以实现上述过程的同步。要求写出完整过程，并说明信号量的含义和初值。
]
#block(breakable: false)[\46. （6分）某计算机系统按字节编址，采用二级页表的分页存储管理方式，虚拟地址格式如下所示：

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [10位], [10位], [12位],
    [页目录号], [页表索引], [页内偏移量],
  )]
  , kind: table
  )

请回答下列问题。

#block[
#set enum(numbering: "1)", start: 1)
+ 页和页框的大小各为多少字节？进程的虚拟地址空间大小为多少页？

+ 假定页目录项和页表项均占4字节，则进程的页目录和页表共占多少页？要求写出计算过程。

+ 若某指令周期内访问的虚拟地址为01000000H和01112048H，则进行地址转换时共访问多少个二级页表？要求说明理由。
]
]
#block(breakable: false)[\47. （9分）某网络拓扑如下图所示，其中路由器内网接口、DHCP服务器、WWW服务器与主机1均采用静态IP地址配置，相关地址信息见图中标注；主机2～主机N通过DHCP服务器动态获取IP地址等配置信息。

#image("images/img-10.jpg")

请回答下列问题。

#block[
#set enum(numbering: "1)", start: 1)
+ DHCP服务器可为主机2～主机 $N$ 动态分配IP地址的最大范围是什么？主机2使用 DHCP协议获取IP地址的过程中，发送的封装DHCPDiscover报文的IP分组的源IP地址和目
]

的IP地址分别是什么？

#block[
#set enum(numbering: "1)", start: 2)
+ 若主机2的ARP表为空，则该主机访问Internet时，发出的第一个以太网帧的目的MAC地址是什么？封装主机2发往Internet的IP分组的以太网帧的目的MAC地址是什么？

+ 若主机1的子网掩码和默认网关分别配置为255.255.255.0和111.123.15.2，则该主机是否能访问WWW服务器？是否能访问Internet？请说明理由。
]]