#set text(lang: "zh")
#import "@preview/taskize:0.2.8": tasks

= 2017年全国硕士研究生入学统一考试
= 计算机科学与技术学科联考计算机学科专业基础综合试题
== 一、单项选择题（第1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项最符合试题要求）
#block(breakable: false)[\1. 下列函数的时间复杂度是\_\_\_。

```c

int func(int n){

    int i=0, sum=0;

    while(sum < n) sum += ++i;

    return i;

}
```

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. O(logn)
+ B. O(n $""^(1 \/ 2)$ )
+ C. O(n)
+ D. O(nlogn)
]
]
#block(breakable: false)[\2. 下列关于栈的叙述中，错误的是\_\_\_。

I. 采用非递归方式重写递归程序时必须使用栈

II. 函数调用时，系统要用栈保存必要的信息

III. 只要确定了入栈次序，就可确定出栈次序

IV. 栈是一种受限的线性表，允许在其两端进行操作

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅 I
+ B. 仅I、II、III
+ C. 仅I、III、IV
+ D. 仅II、III、IV
]
]
#block(breakable: false)[\3. 适用于压缩存储稀疏矩阵的两种存储结构是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 三元组表和十字链表
+ B. 三元组表和邻接矩阵
+ C. 十字链表和二叉链表
+ D. 邻接矩阵和十字链表
]
]
#block(breakable: false)[\4. 要使一棵非空二叉树的先序序列与中序序列相同，其所有非叶结点须满足的条件是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 只有左子树
+ B. 只有右子树
+ C. 结点的度均为1
+ D. 结点的度均为2
]
]
#block(breakable: false)[\5. 已知一棵二叉树的树形如右图所示，其后序序列为 e, a, c, b, d, g, f，树中与结点 a 同层的结点是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. c
+ B. d
+ C. f
+ D. g
]

#image("images/img-1.jpg")
]
#block(breakable: false)[\6. 已知字符集{a, b, c, d, e, f, g, h}，若各字符的哈夫曼编码依次是0100，10， $circle.stroked$ 0000，0101，001，011，11，0001，则编码序列0100011001001011110101的译码结果是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. acgabfh
+ B. adbagbb
+ C. afbeagd
+ D. afeefgd
]
]
#block(breakable: false)[\7. 已知无向图 G含有16条边，其中度为4的顶点个数为3，度为3的顶点个数为4，其他顶点的度均小于3。图G所含的顶点个数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.10
+ B.11
+ C.13
+ D.15
]
]
#block(breakable: false)[\8. 下列二叉树中，可能成为折半查找判定树（不含外部结点）的是\_\_\_。

#block[
#block[
#set enum(numbering: "A.", start: 1)
+
]

]
#figure(image("images/img-2.jpg"),
  caption: [B.]
)

#figure(image("images/img-3.jpg"),
  caption: [C.]
)

#figure(image("images/img-4.jpg"),
  caption: [D.]
)

#image("images/img-5.jpg")
]
#block(breakable: false)[\9. 下列应用中，适合使用 B+树的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 编译器中的词法分析
+ B. 关系数据库系统中的索引
+ C. 网络中的路由表快速查找
+ D. 操作系统的磁盘空闲块管理
]
]
#block(breakable: false)[\10. 在内部排序时，若选择了归并排序而没有选择插入排序，则可能的理由是\_\_\_。

I. 归并排序的程序代码更短

II. 归并排序的占用空间更少

III. 归并排序的运行效率更高

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅Ⅱ
+ B. 仅Ⅲ
+ C. 仅I、Ⅱ
+ D. 仅I、Ⅲ
]
]
#block(breakable: false)[\11. 下列排序方法中，若将顺序存储更换为链式存储，则算法的时间效率会降低的是\_\_\_。

I. 插入排序 I. 选择排序 III. 起泡排序 IV. 希尔排序 V. 堆排序

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅II、III
+ C. 仅III、IV
+ D. 仅IV、V
]
]
#block(breakable: false)[\12. 假定计算机 M1和M2具有相同的指令集体系结构（ISA），主频分别为 1.5GHz和 1.2GHz。在M1和M2上运行某基准程序P，若平均CPI分别为2和1，则程序P在M1和M2上运行时间的比值是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0.4
+ B. 0.625
+ C. 1.6
+ D. 2.5
]
]
#block(breakable: false)[\13. 某计算机主存按字节编址，由4个 $6 4 upright(M) times 8$位的DRAM芯片采用交叉编址方式构成，并与宽度为32位的存储器总线相连，主存每次最多读写32位数据。若double型变量x的主存地址为804001AH，则读取x需要的存储周期数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.1
+ B.2
+ C.3
+ D.4
]
]
#block(breakable: false)[\14. 某C语言程序段如下：

```c

for(i=0;i<=9;i++){

    temp = 1;

    for(j=0;j<=i;j++) temp *= a[j];

    sum += temp;

}
```

下列关于数组 a的访问局部性的描述中，正确的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 时间局部性和空间局部性皆有
+ B. 无时间局部性，有空间局部性
+ C. 有时间局部性，无空间局部性
+ D. 时间局部性和空间局部性皆无
]
]
#block(breakable: false)[\15. 下列寻址方式中，最适合按下标顺序访问一维数组元素的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 相对寻址
+ B. 寄存器寻址
+ C. 直接寻址
+ D. 变址寻址
]
]
#block(breakable: false)[\16. 某计算机按字节编址，指令字长固定且只有两种指令格式，其中三地址指令29条，二地址指令107条，每个地址字段为6位，则指令字长至少应该是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 24位
+ B. 26位
+ C. 28位
+ D. 32位
]
]
#block(breakable: false)[\17. 下列关于超标量流水线特性的叙述中，正确的是\_\_\_。

I. 能缩短流水线功能段的处理时间

II. 能在一个时钟周期内同时发射多条指令

III. 能结合动态调度技术提高指令执行并行性

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅Ⅱ
+ B. 仅I、III
+ C. 仅Ⅱ、Ⅲ
+ D. I、II和Ⅲ
]
]
#block(breakable: false)[\18. 下列关于主存储器（MM）和控制存储器（CS）的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. MM在CPU外，CS在CPU内
+ B. MM按地址访问，CS按内容访问
+ C. MM存储指令和数据，CS存储微指令
+ D. MM用RAM和ROM实现，CS用ROM实现
]
]
#block(breakable: false)[\19. 下列关于指令流水线数据通路的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 包含生成控制信号的控制部件
+ B. 包含算术逻辑运算部件（ALU）
+ C. 包含通用寄存器组和取指部件
+ D. 由组合逻辑电路和时序逻辑电路组合而成
]
]
#block(breakable: false)[\20. 下列关于多总线结构的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 靠近 CPU的总线速度较快
+ B. 存储器总线可支持突发传送方式
+ C. 总线之间须通过桥接器相连
+ D. PC I-Express $times 1 6$采用并行传输方式
]
]
#block(breakable: false)[\21. I/O 指令实现的数据传送通常发生在\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. I/O 设备和 I/O 端口之间
+ B. 通用寄存器和 I/O 设备之间
+ C. I/O 端口和 I/O 端口之间
+ D. 通用寄存器和 I/O 端口之间
]
]
#block(breakable: false)[\22. 下列关于多重中断系统的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 在一条指令执行结束时响应中断
+ B. 中断处理期间 CPU 处于关中断状态
+ C. 中断请求的产生与当前指令的执行无关
+ D. CPU 通过采样中断请求信号检测中断请求
]
]
#block(breakable: false)[\23. 假设4个作业到达系统的时刻和运行时间如下表所示。

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [作业], [到达时刻t], [运行时间],
    [\$J\_{1}\$], [0], [3],
    [\$J\_{2}\$], [1], [3],
    [\$J\_{3}\$], [1], [2],
    [\$J\_{4}\$], [3], [1],
  )]
  , kind: table
  )

系统在 t=2时开始作业调度。若分别采用先来先服务和短作业优先调度算法，则选中的作业分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. J2、J3
+ B. J1、J4
+ C. J2、J4
+ D. J1、J3
]
]
#block(breakable: false)[\24. 执行系统调用的过程包括如下主要操作：

$①$返回用户态 $②$执行陷入（trap）指令

$③$传递系统调用参数 $④$执行相应的服务程序

正确的执行顺序是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $② arrow.r ③ arrow.r ① arrow.r ④$
+ B. $② arrow.r ④ arrow.r ③ arrow.r ①$
+ C. $③ arrow.r ② arrow.r ④ arrow.r ①$
+ D. $③ arrow.r ④ arrow.r ② arrow.r ①$
]
]
#block(breakable: false)[\25. 某计算机按字节编址，其动态分区内存管理采用最佳适应算法，每次分配和回收内存后都对空闲分区链重新排序。当前空闲分区信息如下表所示。

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    [分区起始地址], [20K], [500K], [1000K], [200K],
    [分区大小], [40KB], [80KB], [100KB], [200KB],
  )]
  , kind: table
  )

回收起始地址为 60K、大小为 140KB 的分区后，系统中空闲分区的数量、空闲分区链第一个分区的起始地址和大小分别是\_\_\_。


#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 3、20K、380KB
+ B. 3、500K、80KB
+ C. 4、20K、180KB
+ D. 4、500K、80KB
]
]
#block(breakable: false)[\26. 某文件系统的簇和磁盘扇区大小分别为1KB和512B。若一个文件的大小为1026B，则系统分配给该文件的磁盘空间大小是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1026B
+ B. 1536B
+ C. 1538B
+ D. 2048B
]
]
#block(breakable: false)[\27. 下列有关基于时间片的进程调度的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 时间片越短，进程切换的次数越多，系统开销也越大
+ B. 当前进程的时间片用完后，该进程状态由执行态变为阻塞态
+ C. 时钟中断发生后，系统会修改当前进程在时间片内的剩余时间
+ D. 影响时间片大小的主要因素包括响应时间、系统开销和进程数量等
]
]
#block(breakable: false)[\28. 与单道程序系统相比，多道程序系统的优点是\_\_\_。

I. CPU利用率高 II. 系统开销小

III. 系统吞吐量大 IV. I/O设备利用率高

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、III
+ B. 仅I、IV
+ C. 仅II、III
+ D. 仅I、III、IV
]
]
#block(breakable: false)[\29. 下列选项中，磁盘逻辑格式化程序所做的工作是\_\_\_。

I. 对磁盘进行分区

II. 建立文件系统的根目录

III. 确定磁盘扇区校验码所占位数

IV. 对保存空闲磁盘块信息的数据结构进行初始化

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅 II
+ B. 仅 II、IV
+ C. 仅 III、IV D
]
]
#block(breakable: false)[\30. 某文件系统中，针对每个文件，用户类别分为4类：安全管理员、文件主、文件主的伙伴、其他用户；访问权限分为5种：完全控制、执行、修改、读取、写入。若文件控制块中用二进制位串表示文件权限，为表示不同类别用户对一个文件的访问权限，则描述文件权限的位数至少应为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 5
+ B. 9
+ C. 12
+ D. 20
]
]
#block(breakable: false)[\31. 若文件 f1 的硬链接为 f2，两个进程分别打开 f1 和 f2，获得对应的文件描述符为 fd1和 fd2，则下列叙述中，正确的是\_\_\_。

I. f1和f2的读写指针位置保持相同

II. f1和f2共享同一个内存索引结点

III. fd1和fd2分别指向各自的用户打开文件表中的一项

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅III
+ B. 仅II、III
+ C. 仅I、II
+ D. I、II和III
]
]
#block(breakable: false)[\32. 系统将数据从磁盘读到内存的过程包括以下操作：

$①$ DMA控制器发出中断请求 $②$ 初始化DMA控制器并启动磁盘

$③$ 从磁盘传输一块数据到内存缓冲区 $④$ 执行“DMA结束”中断服务程序正确的执行顺序是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $③ arrow.r ① arrow.r ② arrow.r ④$
+ B. $② arrow.r ③ arrow.r ① arrow.r ④$
+ C. $② arrow.r ① arrow.r ③ arrow.r ④$
+ D. $① arrow.r ② arrow.r ④ arrow.r ③$
]
]
#block(breakable: false)[\33. 假设OSI参考模型的应用层欲发送400B的数据（无拆分），除物理层和应用层之外，其他各层在封装PDU时均引入20B的额外开销，则应用层数据传输效率约为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 80%
+ B. 83%
+ C. 87%
+ D. 91%
]
]
#block(breakable: false)[\34. 若信道在无噪声情况下的极限数据传输速率不小于信噪比为 30dB 条件下的极限数据传输速率，则信号状态数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 4
+ B. 8
+ C. 16
+ D. 32
]
]
#block(breakable: false)[\35. 在下图所示的网络中，若主机 H 发送一个封装访问 Internet 的 IP 分组的 IEEE 802.11 数据帧 F，则帧 F 的地址 1、地址 2 和地址 3 分别是\_\_\_。

#image("images/img-6.jpg")

A. 00-12-34-56-78-9a，00-12-34-56-78-9b，00-12-34-56-78-9c
B. 00-12-34-56-78-9b，00-12-34-56-78-9a，00-12-34-56-78-9c
C. 00-12-34-56-78-9b，00-12-34-56-78-9c，00-12-34-56-78-9a
D. 00-12-34-56-78-9a，00-12-34-56-78-9c，00-12-34-56-78-9b
]
#block(breakable: false)[\36. 下列IP地址中，只能作为IP分组的源IP地址但不能作为目的IP地址的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0.0.0.0
+ B. 127.0.0.1
+ C. 200.10.10.3
+ D. 255.255.255.255
]
]
#block(breakable: false)[\37. 直接封装 RIP、OSPF、BGP 报文的协议分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. TCP、UDP、IP
+ B. TCP、IP、UDP
+ C. UDP、TCP、IP
+ D. UDP、IP、TCP
]
]
#block(breakable: false)[\38. 若将网络21.3.0.0/16划分为128个规模相同的子网，则每个子网可分配的最大IP地址个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 254
+ B. 256
+ C. 510
+ D. 512
]
]
#block(breakable: false)[\39. 若甲向乙发起一个TCP连接，最大段长 MSS=1KB，RTT=5ms，乙开辟的接收缓存为64KB，则甲从连接建立成功至发送窗口达到32KB，需经过的时间至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 25ms
+ B. 30ms
+ C. 160ms
+ D. 165ms
]
]
#block(breakable: false)[\40. 下列关于 FTP 协议的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 数据连接在每次数据传输完毕后就关闭
+ B. 控制连接在整个会话期间保持打开状态
+ C. 服务器与客户端的 TCP 20 端口建立数据连接
+ D. 客户端与服务器的 TCP 21 端口建立控制连接
]
]
== 二、综合应用题（第41～47小题，共70分）
#block(breakable: false)[\41. （15分）请设计一个算法，将给定的表达式树（二叉树）转换为等价的中缀表达式（通过括号反映操作符的计算次序）并输出。例如，当下列两棵表达式树作为算法的输入时，输出的等价中缀表达式分别为 $\( upright(a) + upright(b) \)^(\*) \( upright(c)^(\*) \( - upright(d) \) \)$ 和 $\( upright(a)^(\*) upright(b) \) + \( - \( upright(c) - upright(d) \) \)$ 。

#image("images/img-7.jpg")

二叉树结点定义如下：

```c

typedef struct node{

    char data[10];                //存储操作数或操作符

    struct node *left, *right;
```

要求：

\\(1) 给出算法的基本设计思想。

\\(2) 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。
]
#block(breakable: false)[\42. （8分）使用Prim（普里姆）算法求带权连通图的最小（代价）生成树（MST）。请回答下列问题。

\\(1) 对下列图G，从顶点A开始求G的MST，依次给出按算法选出的边。

#image("images/img-8.jpg")

\\(2) 图G的MST是唯一的吗？

\\(3) 对任意的带权连通图，满足什么条件时，其MST是唯一的？
]
#block(breakable: false)[\43. （13分）已知 $f \( n \) = sum_(i = 0)^n 2^i = 2^(n + 1) - 1 = overbrace(11 dots.h.c 1, n + 1 upright("位"))$ ，计算 f(n)的C语言函数f1如下：

```c

int sum=1, power=1;

for(unsigned i=0;i<=n-1;i++){

    power *= 2;

    sum += power;

}

return sum;
```

将 f1 中的 int 都改为 float，可得到计算 f(n)的另一个函数 f2。假设 unsigned 和 int 型数据都占32位，float 采用 IEEE 754 单精度标准。请回答下列问题。

\\(1) 当 n=0时，f1会出现死循环，为什么？若将f1中的变量i和n都定义为int型，则f1是否还会出现死循环？为什么？

\\(2) f1(23)和 f2(23)的返回值是否相等？机器数各是什么（用十六进制表示）？

\\(3) f1(24)和f2(24)的返回值分别为33554431和33554432.0，为什么不相等？

\\(4) $upright(f) \( 3 1 \) = 2^(3 2) - 1$ ，而 f1(31)的返回值却为-1，为什么？若使 f1(n)的返回值与 f(n)相等，则最大的 n是多少？

\\(5) f2(127)的机器数为7F800000H，对应的值是什么？若使 f2(n)的结果不溢出，则最大的 n是多少？若使 f2(n)的结果精确（无舍入），则最大的 n是多少？
]
#block(breakable: false)[\44. （10分）在按字节编址的计算机M上，题43中f1的部分源程序（阴影部分）与对应的机器级代码（包括指令的虚拟地址）如下图所示。

```asm

int f1( unsigned n)

1 00401020 55 push ebp

... ... ...

for( unsigned i=0; i<= n-1; i++)

... ... ...

20 0040105E 39 4D F4 cmp dword ptr [ ebp-0Ch ], ecx

... ... ...

power * = 2;

...

...

23 00401066 D1 E2 shl edx,1

...

...

return sum;

...

...

35 0040107F C3 ret
```

其中，机器级代码行包括行号、虚拟地址、机器指令和汇编指令。请回答下列问题。

\\(1) 计算机M是RISC还是CISC？为什么？

\\(2) f1的机器指令代码共占多少字节？要求给出计算过程。

\\(3) 第20条指令cmp通过i减n-1实现对i和n-1的比较。执行f1(0)过程中，当 $upright(i) = 0$时，cmp指令执行后，进/借位标志CF的内容是什么？要求给出计算过程。

\\(4) 第23条指令shl通过左移操作实现了 power#emph[2运算，在f2中能否也用 shl指令实现 power ];2？为什么？
]
#block(breakable: false)[\45. （7分）假定题44给出的计算机M采用二级分页虚拟存储管理方式，虚拟地址格式如下：

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [页目录号（10位）], [页表索引（10位）], [页内偏移量（12位）],
  )]
  , kind: table
  )

请针对题43的函数f1和题44中的机器指令代码，回答下列问题。

\\(1) 函数f1的机器指令代码占多少页？

\\(2) 取第1条指令（pushebp）时，若在进行地址变换的过程中需要访问内存中的页目录和页表，则会分别访问它们各自的第几个表项（编号从0开始）？

\\(3) M的I/O采用中断控制方式。若进程P在调用f1之前通过scanf()获取n的值，则在执行scanf()的过程中，进程P的状态会如何变化？CPU是否会进入内核态？
]
#block(breakable: false)[\46. （8分）某进程中有3个并发执行的线程 thread1、thread2和 thread3，其伪代码如下所示。

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    [\/\/复数的结构类型定义 typedef struct { float a; float b; } cnum; cnum x,y,z; \/\/全局变量], [thread1 { cnum w; w=add(x,y); …], [thread3 { cnum w; w.a=1; w.b=1; z=add(z,w); y=add(y,w); …],
    [\/\/计算两个复数之和 cnum add(cnum p,cnum q) { cnum s; s.a=p.a+q.a; s.b=p.b+q.b; return s; }], [thread2 { cnum w; w=add(y,z); …], [],
  )]
  , kind: table
  )

请添加必要的信号量和P、V（或wa it()、signal l()）操作，要求确保线程互斥访问临界资源，并且最大限度地并发执行。
]
#block(breakable: false)[\47. （9分）甲乙双方均采用后退 $N$ 帧协议（GBN）进行持续的双向数据传输，且双方始终采用捎带确认，帧长均为 $1000 upright(B)$ 。 $upright(S)_(x \, y)$ 和 $upright(R)_(x \, y)$ 分别表示甲方和乙方发送的数据帧，其中 $x$ 是发送序号， $y$ 是确认序号（表示希望接收对方的下一帧序号）；数据帧的发送序号和确认序号字段均为3比特。信道传输速率为100Mbps，RTT $= 0.96 upright(m s)$ 。下图给出了甲方发送数据帧和接收数据帧的两种场景，其中 $t_0$ 为初始时刻，此时甲方的发送和确认序号均为0， $t_1$ 时刻甲方有足够多的数据待发送。

#figure(image("images/img-9.jpg"),
  caption: [(a)]
)

#figure(image("images/img-10.jpg"),
  caption: [(b)]
)

请回答下列问题。

\\(1) 对于图（a）， $t_0$时刻到 $t_1$时刻期间，甲方可以断定乙方已正确接收的数据帧数是多少？正确接收的是哪几个帧？（请用 $upright(S)_(x \, y)$形式给出。）

\\(2) 对于图（a），从 $t_1$时刻起，甲方在不出现超时且未收到乙方新的数据帧之前，最多还可以发送多少个数据帧？其中第一个帧和最后一个帧分别是哪个？（请用 $upright(S)_(x \, y)$形式给出。）

\\(3) 对于图（b），从 $t_1$时刻起，甲方在不出现新的超时且未收到乙方新的数据帧之前，需要重发多少个数据帧？重发的第一个帧是哪个？（请用 $upright(S)_(x \, y)$形式给出。）

\\(4) 甲方可以达到的最大信道利用率是多少？]