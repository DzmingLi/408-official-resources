#set text(lang: "zh")
#import "@preview/taskize:0.2.8": tasks

= 2024考研408真题
== 一、单项选择题：1\~40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项是符合题目要求的。
#block(breakable: false)[\1. 已知带头结点的非空单链表 L 的头指针为 h，结点结构为 data next，其中 next 是指向直接后继结点的指针。现有指针 p 和 q，若 p 指向 L 中非首且非尾的任意一个结点，则执行语句序列“q=p-\>next； p-\>next=q-\>next； q-\>next=h-\>next;； h-\>next=q；”的结果是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 在 p 所指结点后插入 q 所指结点
+ B. 在 q 所指结点后插入 p 所指结点
+ C. 将 p 所指结点移动到 L 的头结点之后
+ D. 将 q 所指结点移动到 L 的头结点之后
]
]
#block(breakable: false)[\2. 与表达式 x+y $""^(\*)$ (z-u)/v 等价的后缀表达式是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. xyzu- $""^(\*)$ v/+
+ B. xyzu-v/ $""^(\*)$
+ C. +x / $""^(\*)$ y-zuv
+ D. +x $""^(\*)$ y/-zuv
]
]
#block(breakable: false)[\3. 若 p、q 和 v均为二叉树 T 中的结点，v有两个孩子结点，T的中序遍历序列形如：“…， p，v，q，…”，则下列叙述中，正确的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. p没有右孩子，q没左孩子
+ B. p没有右孩子，q有左孩子
+ C. p有右孩子，q没有左孩子
+ D. p有右孩子，q有左孩子
]
]
#block(breakable: false)[\4. 若无向图 G = (V，E)的邻接多重表如下图所示，则 G 中顶点 b与 d的度分别是（ ）。

#figure(image("images/img-1.jpg"),
  caption: [题4图]
)

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0，2
+ B. 2，4
+ C. 2，5
+ D. 3，4
]
]
#block(breakable: false)[\5. 下列数据结构中，不适合直接使用折半查找的是（ ）。

I. 有序链表 II. 无序数组

III. 有序静态链表 IV. 无序静态链表

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅 I 、III
+ B. 仅 II、IV
+ C. 仅 II、III、IV
+ D.I、II、III、IV
]
]
#block(breakable: false)[\6. KMP算法使用修正后的next数组进行模式匹配，模式串 S=“aabaab”，当主串中某字符与 S中某字符失配时， S将向右滑动的最长距离是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.5
+ B.4
+ C.3
+ D.2
]
]
#block(breakable: false)[\7. 一棵二叉搜索树如题7图所示，k1、k2、k3分别是对应结点保存的关键字，子树T的任一结点中保存的关键字x满足的是（ ）。

#image("images/img-2.jpg")
]
#block(breakable: false)[\8. 使用快速排序算法对含 n(n≥3)个元素的数组 M 进行排序，若第一趟排序将 M 中除枢轴外的 n-1 个元素划分为均不为空的 P和Q两块，则下列叙述中，正确的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. P与Q块间有序
+ B. P与Q均块内有序
+ C. P和Q的元素个数大致相等
+ D. P中和Q中均不存在相等的元素
]
]
#block(breakable: false)[\9. 已知关键字序列 28，22，20，19，8，12，15，5是大根堆（最大堆），对该堆进行两次删除操作后，得到的新堆是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.20，19，15，12，8，5
+ B.20，19，15，5，8，12
+ C.20，19，12，15，8，5
+ D.20，19，8，12，15，5
]
]
#block(breakable: false)[\10. 现有由关键字组成的3个有序序列（3，5）、（7，9）和（6），若按从左至右的次序选择有序序列进行二路归并排序，则关键字之间的总比较次数是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.3
+ B.4
+ C.5
+ D.6
]
]
#block(breakable: false)[\11. 在外排序中，利用败者树对初始为升序的归并段进行多路归并，败者树中记录“冠军”的结点保存的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.最大关键字
+ B.最小关键字
+ C.最大关键字所在的归并段号
+ D.最小关键字所在的归并段号
]
]
#block(breakable: false)[\12. C语言代码如下。

```c
int i=32777;
short si=i;
int j=si;
```

执行上述代码段后，j的值是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. -32777
+ B. -32759
+ C. 32759
+ D. 32777
]
]
#block(breakable: false)[\13. 通常情况下，将汇编语言程序中实现特定功能的指令序列定义成一条伪指令 (pseudoinstruction)。下列选项中，CPU能理解并直接执行的是（ ）。

I.伪指令 II.微指令

III.机器指令 IV.汇编指令

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.仅Ⅰ、Ⅳ
+ B.仅Ⅱ、Ⅲ
+ C.仅Ⅲ、Ⅳ
+ D.仅Ⅰ、Ⅲ、Ⅳ
]
]
#block(breakable: false)[\14. 某科学实验中，需要使用大量的整型参数，为了保证表数精度的基础上提高运算速度，需要选择合理的数据表示方法。若整型参数 $alpha$ 、 $beta$的取值范围分别为 $- 2^(2 0) tilde.op 2^(2 0)$ 、 $- 2^(4 0) tilde.op 2^(4 0)$ ，则下列选项中， $alpha$ 、 $beta$最适宜采用的数据表示方法分别是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 32位整数、32位整数
+ B. 单精度浮点数、单精度浮点数
+ C. 32位整数、双精度浮点数
+ D. 单精度浮点数、双精度浮点数
]
]
#block(breakable: false)[\15. 下列关于整数乘法运算的叙述中，错误的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 用阵列乘法器实现乘运算可以在一个时钟周期内完成
+ B. 用 ALU 和移位器实现的乘运算无法在一个时钟周期内完成
+ C. 变量与常数的乘运算可以编译优化为若干条移位及加/减运算指令
+ D. 两个变量的乘运算无法编译转换为移位及加法等指令的循环实现
]
]
#block(breakable: false)[\16. 对于页式虚拟存储管理系统，下列关于存储器层次结构的叙述中，错误的是（ ）。

A. Cache-主存层次的交换单位为主存块，主存-外存层次的交换单位为页
B. Cache-主存层次替换算法由硬件实现，主存-外存层次替换算法由软件实现
C. Cache-主存层次可采用回写法写策略，主存-外存层次通常采用回写法写策略 D. Cache-主存层次可采用直接映射方式，主存-外存层次通常采用直接映射方式
]
#block(breakable: false)[\17. 某计算机按字节编址，采用页式虚拟存储管理方式，虚拟地址为32位，主存地址为30位，页大小为1KB。若 TLB共有32个表项，采用4路组相联映射方式，则 TLB表项中标记字段的位数至少是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.17
+ B.18
+ C.19
+ D.20
]
]
#block(breakable: false)[\18. 下列事件中，不是在 MMU 地址转换过程中检测的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.访问越权
+ B. Cache缺失
+ C.页面缺失
+ D. TLB缺失
]
]
#block(breakable: false)[\19. 对于采用“取指、译码/取数、执行、访存、写回”5段流水线的RISC数据通路，下列关于指令流水线数据冒险处理的叙述中，错误的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.相邻两条指令中的操作数相关可能引起数据冒险
+ B.在数据相关的指令间插入 “气泡”能避免数据冒险
+ C.所有数据冒险都可以通过加入转发（旁路）电路解决
+ D.所有数据冒险都能通过调整指令顺序和插入 nop指令解决
]
]
#block(breakable: false)[\20. 某存储器总线的时钟频率为 420MHz，总线宽度为64位，每个时钟周期传送2次数据；其总线事务支持突发传送方式，最多传送8次数据，第1个时钟周期传送地址和读/写命令，从第4个至第7个时钟周期连续传送8次数据。该总线的总线带宽（最大数据传输率）为（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 3.84 GB/s
+ B. 6.72 GB/s
+ C. 30.72 GB/s
+ D. 53.76 GB/s
]
]
#block(breakable: false)[\21. 下列关于中断 I/O 方式的叙述中，错误的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 中断屏蔽字用于确定中断响应的优先级
+ B. 保存断点和程序状态字在中断响应阶段完成
+ C. 保存通用寄存器和设置新中断屏蔽字由软件实现
+ D. 单重中断方式下中断处理时 CPU 处于关中断状态
]
]
#block(breakable: false)[\22. DMA控制I/O方式下，设备的输入/输出由DMA控制器控制完成，此时，DMA控制器控制的数据传输通路位于（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. CPU和主存之间
+ B. CPU和DMA控制器之间
+ C.设备接口和主存之间
+ D.设备接口和DMA控制器之间
]
]
#block(breakable: false)[\23. 下列关于中断、异常和系统调用的叙述中，错误的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.中断或异常发生时，CPU处于内核态
+ B.每个系统调用都有对应的内核服务例程
+ C.中断处理程序开始执行时，CPU处于内核态
+ D.系统添加新类型设备时，需注册相应的中断服务例程
]
]
#block(breakable: false)[\24. 下列选项中，操作系统在终止进程时不一定执行的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.终止子进程
+ B.回收进程占用的设备
+ C.释放进程控制块
+ D.回收为进程分配的内存
]
]
#block(breakable: false)[\25. 在支持页式存储管理的系统中，进程切换时操作系统需要执行的操作是（ ）。

I. 更新程序计数器的值

II. 更新栈基址寄存器的值

III. 更新页表基地址寄存器的值

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅Ⅲ
+ B. 仅Ⅰ、Ⅱ
+ C. 仅Ⅰ、Ⅲ
+ D. Ⅰ、Ⅱ、Ⅲ
]
]
#block(breakable: false)[\26. 文件系统需占用部分外存空间记录空闲块位置。下列方法中，占用外存空间的大小与当前空闲块数量无关的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.位图法
+ B.空闲表法
+ C.成组链接法
+ D.空闲链表法
]
]
#block(breakable: false)[\27. 下列算法中，每次回收分区时仅合并大小相等的空闲分区的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.伙伴算法
+ B.最佳适应算法
+ C.最坏适应算法
+ D.首次适应算法
]
]
#block(breakable: false)[\28. 若进程P中的线程T先打开文件，得到文件描述符fd，再创建两个线程Ta和Tb，则下列资源中，Ta与Tb可共享的是（ ）。

I. 进程P的地址空间 II. 线程T的栈 III. 文件描述符fd

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅Ⅰ
+ B. 仅Ⅰ、Ⅲ
+ C. 仅Ⅱ、Ⅲ
+ D. I、Ⅱ、Ⅲ
]
]
#block(breakable: false)[\29. 下列系统调用的实现中，包含文件按名查找功能的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. open( )
+ B. read( )
+ C. write( )
+ D. close( )
]
]
#block(breakable: false)[\30. 假设某系统使用时间片轮转调度算法进行CPU调度，时间片大小为5ms，系统共有10个进程，初始时均处于就绪队列，执行结束前仅处于执行态或就绪态。若队尾的进程P所需CPU

时间最短，时间为25ms，在不考虑系统开销的情况下，则进程P的周转时间为（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 200ms
+ B. 205ms
+ C. 250ms
+ D. 295ms
]
]
#block(breakable: false)[\31. 键盘中断服务例程执行结束时，所输入数据的存放位置是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.用户缓冲区
+ B. CPU 中的通用寄存器
+ C.内核缓冲区
+ D.键盘控制器的数据寄存器
]
]
#block(breakable: false)[\32. 某磁盘的磁道数为400(磁道号为0\~399)，采用循环扫描算法（CSCAN）进行磁盘调度，完成对200号磁道的请求后，磁头向磁道号减小的方向移动。若还有7个磁盘请求，对应的磁道号分别为300，120，110，0，160，210，399，则完成上述磁盘访问请求后磁头移动的距离是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.599
+ B.619
+ C.788
+ D.799
]
]
#block(breakable: false)[\33. 若某分组交换网络及每段链路的带宽如下图所示，则H1到H2的最大吞吐量约为（ ）。

#image("images/img-3.jpg")

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1 Mb/s
+ B. 10 Mb/s
+ C. 100 Mb/s
+ D. 1000 Mb/s
]
]
#block(breakable: false)[\34. 在下列二进制数字调制方法中，需要2个不同频率载波的是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. ASK
+ B. PSK
+ C. FSK
+ D. DPSK
]
]
#block(breakable: false)[\35. 如题35图所示的支持VLAN划分的交换机，已按端口划分了3个VLAN，部分端口连接主机的IP地址和MAC地址如图中所示，ARP表结构为\<IP地址，MAC地址，TTL\>。下列选项中，不会出现在H4的ARP表中的是（ ）。

A. 192.168.3.81，00-18-A2-3B-36-21，14:32:00

B. 192.168.3.91，00-3E-C2-39-12-B5，14:37:00

C. 192.168.3.125，00-E5-78-4A-09-B2，14:45:00

D. 192.168.3.129，00-08-6E-05-A7-82，14:52:00

#figure(image("images/img-4.jpg"),
  caption: [题35图]
)
]
#block(breakable: false)[\36.在采用 CSMA/CA的802.11无线局域网中，DIFS=128μs，SIFS=28μs，RTS、CTS和ACK帧的传输时延分别是3μs、2μs和2μs，忽略信号传播时延。若主机A欲向AP发送一个总长度为1998B的数据帧，无线链路带宽为54Mb/s，则隐藏站B收到AP发送的CTS帧时，设置的网络分配向量NAV的值是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 326μs
+ B. 354μs
+ C. 385μs
+ D. 513μs
]
]
#block(breakable: false)[\37. 主机甲通过选择重传(SR)滑动窗口协议向主机乙发送帧的部分过程如题37图所示，Fx为数据帧，ACKx为确认帧，x是位数为3比特的序号。乙只对正确接收的数据帧进行独立确认，发送窗口与接收窗口大小相同且均为最大值。甲在 $t_1$时刻和 $t_2$时刻发送的数据帧分别是（ ）。

#figure(image("images/img-5.jpg"),
  caption: [题37图]
)

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. F1，F3
+ B. F1，F4
+ C. F3，F1
+ D. F4，F1
]
]
#block(breakable: false)[\38. 假设主机H通过TCP向服务器发送长度为3000B的报文，往返时间RTT=10ms，最长报文段寿命MSL=30s，最大报文段长度MSS=1000B，忽略TCP段的传输时延，报文传输结束后H首先请求断开连接，则从H请求建立TCP连接时刻起，到H进入CLOSED状态为止，所需的时间至少是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 30.03s
+ B. 30.04s
+ C. 60.03s
+ D. 60.04s
]
]
#block(breakable: false)[\39. 若 UDP 协议在计算校验和过程中，计算得到中间结果为1011100110110110时，还需要

加上最后一个16位数0110010111000101，则最终计算得到的校验和是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 0001111101111011
+ B. 0001111101111100
+ C. 1110000010000011
+ D. 11100000100001000
]
]
#block(breakable: false)[\40. 若浏览器不支持并行 TCP 连接，使用非持久的 HTTP/1.0协议请求浏览1个Web页，该页中引用同一网站上7个小图像文件，则从浏览器为传输Web页请求建立TCP连接开始，到接收完所有内容为止，所需要的往返时间RTT数至少是（ ）。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.4
+ B.9
+ C.14
+ D.16
]
]
== 二、综合应用题：41～47小题，共70分。
#block(breakable: false)[\41. （13分）2023年10月26日，神州十七号载人飞船发射取得圆满成功，再次彰显了中国航天事业的辉煌成就。载人航天工程是包含众多子工程的复杂系统工程，为了保证工程的有序开展，需要明确各子工程的前导子工程，以协调各子工程的实施。该问题可以简化、抽象为有向图的拓扑序列问题。已知有向图G采用邻接矩阵存储，类型定义如下。

#image("images/img-6.jpg")

请设计算法：int uniquely(MGraph G)，判定 G 是否存在唯一的拓扑序列，若是，则返回1，否则返回0。要求如下。

\\(1) 给出算法的基本设计思想。（4分）

\\(2) 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。（9分）
]
#block(breakable: false)[\42. （10分）将关键字序列20，3，11，18，9，14，7依次存储到初始为空、长度为11的散列表HT中，散列函数 H（key）=（key \$\$3）%11。H（key）计算出的初始散列地址为 $H_0$发生冲突时探查地址序列是 $H_1$ $H_2$ $H_3$ ，…，其中， $H_k$ $= \( H_0 + k^2 \) % 1 1$ k=1，2，3，…。请回答下列问题。

\\(1) 画出所构造的 HT，并计算 HT的装填因子。（6分）

\\(2) 给出在 HT 中查找关键字14的关键字比较序列。（2分）

\\(3) 在 HT中查找关键字8，确认查找失败时的散列地址是多少？（2分）
]
#block(breakable: false)[\43. （13分）假定计算机M字长为32位，按字节编址，采用32位定长指令字，指令add、slli和1w的格式、编码和功能说明如图43（a）图所示。

指令

31

25

24

20

19

15

14

12

11

7

6

0

指令功能说明

add

0000000

rs2

rs1

000

rd

0110011

R\[rd\]←R\[rs1\]+R\[rs2\]

slli

0000000

shamt

rs1

010

rd

0010011

R\[rd\]←R\[rs1\]\<

1w

imm

rs1

010

rd

0000011

R\[rd\]←M\[R\[rs1\]+imm\]

#block[
题43图（a）

]
其中，R\[x\]表示通用寄存器x的内容，M\[x\]表示地址为x的存储单元内容，shamt为移位位数，imm为补码表示的偏移量。题43图(b)给出了计算机M的部分数据通路及其控制信号（用带箭头虚线表示），其中，A和B分别表示从通用寄存器rsI和rs2中读出的内容；IR\[31:20\]表示指令寄存器中的高12位；控制信号Ext为0、1时扩展器分别实现零扩展、符号扩展，ALUctr为000、001、010时ALU分别实现加、减、逻辑左移运算。

#figure(image("images/img-7.jpg"),
  caption: [题43图（b）]
)

请回答下列问题。

\\(1) 计算机M最多有多少个通用寄存器？为什么 shamt 字段占5位？（2分）

\\(2) 执行 add 指令时，控制信号 ALUBsrc的取值应是什么？若 rs1和 rs2寄存器内容分别是 87654321H和98765432H，则 add 指令执行后，ALU输出端 F、OF和 CF的结果分别是什么？若该 add 指令处理的是无符号整数，则应根据哪个标志判断是否溢出？（5分）

\\(3) 执行 slli 指令时，控制信号 Ext的取值可以是0也可以是1，为什么？（2分）

\\(4) 执行1w指令时，控制信号Ext、ALUctr的取值分别是什么？（2分）

\\(5) 若一条指令的机器码是 A040 A103H，则该指令一定是 1w 指令，为什么？若执行该指令时， $upright(R \[ 01 H \]) = upright(F F F F) quad upright(A 2 D 0 H)$ ，则所读取数据的存储地址是什么？（2分）
]
#block(breakable: false)[\44. （10分）对于题43中的计算机M，C语言程序P包含的语句“sum+=a\[i\]；”在M中对应的指令序列S如下。

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    [slli r4,r2,2], [\/\/R\[r4\]←R\[r2\]\<\<2],
    [add r4,r3,r4], [\/\/R\[r4\]←R\[r3\]+R\[r4\]],
    [1w r5,0(r4)], [\/\/R\[r5\]←M\[R\[r4\]+0\]],
    [add r1,r1,r5], [\/\/R\[r1\]←R\[r1\]+R\[r5\]],
  )]
  , kind: table
  )

已知变量 i、sum和数组a都为int型，通用寄存器 r1\~r5的编号为 01H\~05H。请回答下列问题。

\\(1) 根据指令序列 S中每条指令的功能，写出存放数组 a的首地址、变量 i和 sum的通用寄存器编号。（3分）

\\(2) 已知 M为小端方式计算机，采用页式存储管理方式，页大小为4KB。若执行到指令序列 S中第1条指令时，i=5且r1和r3的内容分别为00001332H和0013DFF0H，从地址0013 DFF0H开始的存储单元内容如题44图所示，则执行“sum+=a\[i\]；”语句后，a\[i\]的地址、a\[i\]和sum的机器数分别是什么（用十六进制表示）？a\[i\]所在页的页号是多少？此次执行中，数组a至少存放在子页中？（5分）

#figure(
  align(center)[#table(
    columns: 10,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    [地址], [0], [1], [2], [3], [4], [5], [6], [7], [],
    [0013 DFF0], [FF], [FF], [FF], [7C], [70], [FE], [FF], [FF], [],
    [0013 DFF8], [00], [00], [00], [0C], [3C], [02], [01], [FF], [],
    [0013 E000], [F0], [F1], [00], [00], [DC], [EC], [FF], [FF], [],
    [0013 E008], [FF], [FF], [01], [02], [00], [00], [01], [02], [],
  )]
  , kind: table
  )

#block[
题44图

]
\\(3) 指令“slli r4，r2，2”的机器码是什么（用十六进制表示）？若数组a改为short类型，则指令序列S中slli指令的汇编形式应是什么？（2分）
]
#block(breakable: false)[\45. （7分）某计算机按字节编址，采用页式虚拟存储管理方式，虚拟地址和物理地址的长度均为32位，页表项的大小为4字节。页大小为4MB，虚拟地址结构如下。

页号（10位） 页内偏移量（22位）

进程P的页表起始虚拟地址为 B8C00000H，被装载到从物理地址 65400000H开始的连续主存空间中。

请回答下列问题，要求答案用十六进制表示。

\\(1) 若CPU在执行进程P的过程中，访问虚拟地址12345678H时发生了缺页异常，经过缺页异常处理和MMU地址转换后得到的物理地址是BAB45678H，在此次缺页异常处理过程中，需要为所缺页分配页框并更新相应的页表项，则该页表项的虚拟地址和物理地址分别是什么？该页表项中的页框号更新后的值是什么？（3分）

\\(2) 进程P的页表所在页的页号是什么？该页对应的页表项的虚拟地址是什么？该页表项中的页框号是什么？（4分）
]
#block(breakable: false)[\46. （8分）计算机系统中的进程之间往往需要相互协作以完成一个任务。在某网络系统中，缓冲区B用于存放一个数据分组，对B的操作有C1、C2和C3。C1将一个数据分组写入B中，C2从B中读出一个数据分组，C3对B中的数据分组进行修改。要求B为空时才能执行 C1，B非空时才能执行C2和C3。

（1）假设进程 P1和P2均需要执行C1，实现C1的代码是否为临界区？为什么？（2分）

（2）假设B初始为空，进程P1执行C1一次，进程P2执行C2一次。请定义尽可能少的信号量，并用 wait（）、signal（）操作描述进程P1和P2之间的同步或互斥关系，说明所用信号量的作用及其初值。（3分）

\\(3) 假设B初始不为空，进程P1和P2各执行C3一次。请定义尽可能少的信号量，并用 wait（ ）、signal（ ）操作描述进程P1和P2之间的同步或互斥关系，说明所用信号量的作用及其初值。（3分）
]
#block(breakable: false)[\47. （9分）网络空间是继陆海空天之后的“第五疆域”，网络技术是网络疆域建设与治理的基础。路由算法与协议是网络核心技术之一，对其准确认知、合理选择与应用，对于网络建设十分重要。假设现有互联网中的4个自治系统互连拓扑示意图如题47图所示。其中，AS1运行内部网关协议RIP；AS3规模较小，自治系统内任意两个主机间通信，经过路由器数量不超过15个；AS4规模较大，自治系统内任意两个主机间通信，经过路由器数量可能超过20个。

#figure(image("images/img-8.jpg"),
  caption: [题47图]
)

请回答下列问题。

\\(1) 若仅有 RIP和OSPF内部网关协议供选择，则AS4应该选择哪个协议？（1分）

\\(2) 若AS3中的某主机向本自治系统内另一主机发送1个IP分组，为确保该IP分组能够被正常接收，则该IP分组的初始TTL值应该至少设置为多少？（1分）

\\(3) 假设AS1中的路由器同一时刻启动，启动后立即构建并交换初始距离向量，之后每隔 30s交换一次最新的距离向量，则从交换初始距离向量时刻算起，R11\~R16路由器均获得到达网络210.2.3.0/24的正确路由，至少需要多长时间？均获得到达网络210.2.4.0/24的正确路由，至少需要多长时间？（2分）

\\(4) R44向R13通告到达网络136.5.16.0/20路由时，由BGP协议哪类会话完成？通过哪个BGP报文通告？R13通过BGP协议的哪类会话将该网络可达性信息通告给R14和R15？ （3分）

\\(5) 若 R14和R15均收到分别由 R11、R12、R13通告的到达网络136.5.16.0/20的可达性信息如下。

目的网络：136.5.16.0/20，AS路径：AS2 AS8 AS19，

下一跳：R11

目的网络：136.5.16.0/20，AS路径：AS3 AS7 AS11 AS19,

下一跳：R12

目的网络：136.5.16.0/20，AS路径：AS4 AS10 AS19，

下一跳：R13

则在无策略约束情况下，R14和R15更新路由表后，各自路由表中到达网络136.5.16.0/20路由的下一跳分别是什么（用路由器名称表示）？（2分）
]
