#set text(lang: "zh")
#import "@preview/taskize:0.2.8": tasks

= 2019年全国硕士研究生入学统一考试
= 计算机科学与技术学科联考计算机学科专业基础综合试题
== 一、单项选择题（第1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项最符合试题要求）
#block(breakable: false)[\1. 设 n是描述问题规模的非负整数，下列程序段的时间复杂度是\_\_\_。

```c
x=0;
while (n>=(x+1)*(x+1))
    x=x+1;
```

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $O \( log n \)$
+ B. $O \( n^(1 \/ 2) \)$
+ C. $O \( n \)$
+ D. $O \( n^2 \)$
]
]
#block(breakable: false)[\2. 若将一棵树 T转化为对应的二叉树 BT，则下列对 BT的遍历中，其遍历序列与 T的后根遍历序列相同的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 先序遍历
+ B. 中序遍历
+ C. 后序遍历
+ D. 按层遍历
]
]
#block(breakable: false)[\3. 对 n个互不相同的符号进行哈夫曼编码。若生成的哈夫曼树共有115个结点，则 n的值是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 56
+ B. 57
+ C. 58
+ D. 60
]
]
#block(breakable: false)[\4. 在任意一棵非空平衡二叉树（AVL树） $upright(T)_1$中，删除某结点 v之后形成平衡二叉树 $upright(T)_2$再将 v插入 $upright(T)_2$形成平衡二叉树 $upright(T)_3$。下列关于 $upright(T)_1$与 $upright(T)_3$的叙述中，正确的是\_\_\_。

I. 若 v是 $upright(T)_1$的叶结点，则 $upright(T)_1$与 $upright(T)_3$可能不相同

II. 若 v不是 $upright(T)_1$的叶结点，则 $upright(T)_1$与 $upright(T)_3$一定不相同

III. 若 v不是 $upright(T)_1$的叶结点，则 $upright(T)_1$与 $upright(T)_3$一定相同

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I
+ B. 仅II
+ C. 仅I、II
+ D. 仅I、III
]
]
#block(breakable: false)[\5. 下图所示的AOE网表示一项包含8个活动的工程。活动d的最早开始时间和最迟开始时间分别是\_\_\_。

#image("images/img-1.jpg")

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 3和7
+ B. 12和12
+ C. 12和14
+ D. 15和15
]
]
#block(breakable: false)[\6. 用有向无环图描述表达式 $\( x + y \) (\( x + y \) \/ x)$ ，需要的顶点个数至少是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 5
+ B. 6
+ C. 8
+ D. 9
]
]
#block(breakable: false)[\7. 选择一个排序算法时，除算法的时空效率，下列因素中，还需要考虑的是\_\_\_。

I. 数据的规模 II. 数据的存储方式 III. 算法的稳定性 IV. 数据的初始状态

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅 III
+ B. 仅 I、II
+ C. 仅 II、III、IV
+ D. I、II、III、IV
]
]
#block(breakable: false)[\8. 现有长度为11且初始为空的散列表HT，散列函数是 $H \( upright(k e y) \) = upright(k e y) % 7$ ，采用线性探查（线性探测再散列）法解决冲突。将关键字序列87，40，30，6，11，22，98，20依次插入HT后，HT查找失败的平均查找长度是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.4
+ B.5.25
+ C.6
+ D.6.29
]
]
#block(breakable: false)[\9. 设主串 T = "abaabaabcabaabc"，模式串 S = "abaabc"，采用 KMP 算法进行模式匹配，到匹配成功时为止，在匹配过程中进行的单个字符间的比较次数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 9
+ B. 10
+ C. 12
+ D. 15
]
]
#block(breakable: false)[\10. 排序过程中，对尚未确定最终位置的所有元素进行一遍处理称为一“趟”。下列序列中，不可能是快速排序第二趟结果的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 5,2,16,12,28,60,32,72
+ B. 2,16,5,28,12,60,32,72
+ C. 2,12,16,5,28,32,72,60
+ D. 5,2,12,28,16,32,72,60
]
]
#block(breakable: false)[\11. 设外存上有120个初始归并段，进行12路归并时，为实现最佳归并，需要补充的虚段个数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.1
+ B.2
+ C.3
+ D.4
]
]
#block(breakable: false)[\12. 下列关于冯·诺依曼结构计算机基本思想的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 程序的功能都通过中央处理器执行指令实现
+ B. 指令和数据都用二进制数表示，形式上无差别
+ C. 指令按地址访问，数据都在指令中直接给出
+ D. 程序执行前，指令和数据需预先存放在存储器中
]
]
#block(breakable: false)[\13. 考虑以下 C 语言代码：

```c
unsigned short usi = 65535;
short si = usi;
```

执行上述程序段后，si的值是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. -1
+ B. -32767
+ C. -32768
+ D. -65535
]
]
#block(breakable: false)[\14. 下列关于缺页处理的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 缺页是在地址转换时 CPU 检测到的一种异常
+ B. 缺页处理由操作系统提供的缺页处理程序来完成
+ C. 缺页处理程序根据页故障地址从外存读入所缺失的页
+ D. 缺页处理完成后回到发生缺页的指令的下一条指令执行
]
]
#block(breakable: false)[\15. 某计算机采用大端方式，按字节编址。某指令中操作数的机器数为1234 FF00H，该操作数采用基址寻址方式，形式地址（用补码表示）为FF12H，基址寄存器的内容为F000 0000H，则该操作数的LSB（最低有效字节）所在的地址是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. F000 FF12H
+ B. F000 FF15H
+ C. EFFF FF12H
+ D. EFFF FF15H
]
]
#block(breakable: false)[\16. 下列有关处理器时钟脉冲信号的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 时钟脉冲信号由机器脉冲源发出的脉冲信号经整形和分频后形成
+ B. 时钟脉冲信号的宽度称为时钟周期，时钟周期的倒数为机器主频
+ C. 时钟周期以相邻状态单元间组合逻辑电路的最大延迟为基准确定
+ D. 处理器总是在每来一个时钟脉冲信号时就开始执行一条新的指令
]
]
#block(breakable: false)[\17. 某指令功能为 $upright(R \[ r 2 \]) arrow.l upright(R \[ r 1 \]) + upright(M) \[ upright(R \[ r 0 \]) \]$ ，其两个源操作数分别采用寄存器、寄存器间接寻址方式。对于下列给定部件，该指令在取数及执行过程中需要用到的是\_\_\_。

I. 通用寄存器组（GPRs） II. 算术逻辑单元（ALU）

III. 存储器（Memory） IV. 指令译码器（ID）

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅I、II、III
+ C. 仅II、III、IV
+ D. 仅I、III、IV
]
]
#block(breakable: false)[\18. 在采用“取指、译码/取数、执行、访存、写回”5段流水线的处理器中，执行如下指令序列，其中s0、s1、s2、s3和t2表示寄存器编号。

I1: add s2,s1,s0 \/\/R\[s2\] $arrow.l$ R\[s1\]+R\[s0\]

I2: load s3,0(t2) \/\/R\[s3\] $arrow.l$ M\[R\[t2\]+0\]

I3: add s2,s2,s3 \/\/R\[s2\] $arrow.l$ R\[s2\]+R\[s3\]

I4: store s2,0(t2) \/\/M\[R\[t2\]+0\] $arrow.l$ R\[s2\]

下列指令对中，不存在数据冒险的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. I1和I3
+ B. I2和I3
+ C. I2和I4
+ D. I3和I4
]
]
#block(breakable: false)[\19. 假定一台计算机采用3通道存储器总线，配套的内存条型号为DDR3-1333，即内存条所接插的存储器总线的工作频率为1333MHz，总线宽度为64位，则存储器总线的总带宽大约是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 10.66GB/s
+ B. 32GB/s
+ C. 64GB/s
+ D. 96GB/s
]
]
#block(breakable: false)[\20. 下列关于磁盘存储器的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 磁盘的格式化容量比非格式化容量小
+ B. 扇区中包含数据、地址和校验等信息
+ C. 磁盘存储器的最小读写单位为一字节
+ D. 磁盘存储器由磁盘控制器、磁盘驱动器和盘片组成
]
]
#block(breakable: false)[\21. 某设备以中断方式与CPU进行数据交换，CPU主频为1GHz，设备接口中的数据缓冲寄存器为32位，设备的数据传输率为50kB/s。若每次中断开销（包括中断响应和中断处理）为 1000个时钟周期，则CPU用于该设备输入/输出的时间占整个CPU时间的百分比最多是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 1.25%
+ B. 2.5%
+ C. 5%
+ D. 12.5%
]
]
#block(breakable: false)[\22. 下列关于 DMA 方式的叙述中，正确的是\_\_\_。

I. DMA 传送前由设备驱动程序设置传送参数

II. 数据传送前由 DMA 控制器请求总线使用权

III. 数据传送由 DMA 控制器直接控制总线完成

IV. DMA 传送结束后的处理由中断服务程序完成

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅 I、II
+ B. 仅 I、III、IV
+ C. 仅 II、III、IV
+ D. I、II、III、IV
]
]
#block(breakable: false)[\23. 下列关于线程的描述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 内核级线程的调度由操作系统完成
+ B. 操作系统为每个用户级线程建立一个线程控制块
+ C. 用户级线程间的切换比内核级线程间的切换效率高
+ D. 用户级线程可以在不支持内核级线程的操作系统上实现
]
]
#block(breakable: false)[\24. 下列选项中，可能会将进程唤醒的事件是\_\_\_。

I. I/O结束 II. 某进程退出临界区 III. 当前进程的时间片用完 A. 仅 I B. 仅 III C. 仅I、II D. I、II、III
]
#block(breakable: false)[\25. 下列关于系统调用的叙述中，正确的是\_\_\_。

I. 在执行系统调用服务程序的过程中，CPU处于内核态

II. 操作系统通过提供系统调用避免用户程序直接访问外设

III. 不同的操作系统为应用程序提供了统一的系统调用接口

IV. 系统调用是操作系统内核为应用程序提供服务的接口

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、IV
+ B. 仅II、III
+ C. 仅I、II、IV
+ D. 仅I、III、IV
]
]
#block(breakable: false)[\26. 下列选项中，可用于文件系统管理空闲磁盘块的数据结构是\_\_\_。

I. 位图 II. 索引结点 III. 空闲磁盘块链 IV. 文件分配表（FAT）

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅I、II
+ B. 仅I、III、IV
+ C. 仅I、III
+ D. 仅II、III、IV
]
]
#block(breakable: false)[\27. 系统采用二级反馈队列调度算法进行进程调度。就绪队列 $Q_1$采用时间片轮转调度算法，时间片为10ms；就绪队列 $Q_2$采用短进程优先调度算法；系统优先调度 $Q_1$队列中的进程，当 $Q_1$为空时系统才会调度 $Q_2$中的进程；新创建的进程首先进入 $Q_1$； $Q_1$中的进程执行一个时间片后，若未结束，则转入 $Q_2$。若当前 $Q_1$、 $Q_2$为空，系统依次创建进程 $P_1$、 $P_2$后即开始进程调度， $P_1$、 $P_2$需要的CPU时间分别为30ms和20ms，则进程 $P_1$、 $P_2$在系统中的平均等待时间为\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 25ms
+ B. 20ms
+ C. 15ms
+ D. 10ms
]
]
#block(breakable: false)[\28. 在分段存储管理系统中，用共享段表描述所有被共享的段。若进程 $upright(P)_1$和 $upright(P)_2$共享段 S，下列叙述中，错误的是\_\_\_。

A. 在物理内存中仅保存一份段 S的内容
B. 段 S在 $upright(P)_1$和 $upright(P)_2$中应该具有相同的段号
C. $upright(P)_1$和 $upright(P)_2$共享段 S在共享段表中的段表项
D. $upright(P)_1$和 $upright(P)_2$都不再使用段 S时才回收段 S所占的内存空间
]
#block(breakable: false)[\29. 某系统采用LRU页置换算法和局部置换策略，若系统为进程P预分配了4个页框，进程P访问页号的序列为0,1,2,7,0,5,3,5,0,2,7,6，则进程访问上述页的过程中，产生页置换的总次数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 3
+ B. 4
+ C. 5
+ D. 6
]
]
#block(breakable: false)[\30. 下列关于死锁的叙述中，正确的是\_\_\_。

I. 可以通过剥夺进程资源解除死锁

II. 死锁的预防方法能确保系统不发生死锁

III. 银行家算法可以判断系统是否处于死锁状态

IV. 当系统出现死锁时，必然有两个或两个以上的进程处于阻塞态

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 仅Ⅱ、Ⅲ
+ B. 仅Ⅰ、Ⅱ、Ⅳ
+ C. 仅Ⅰ、Ⅱ、Ⅲ
+ D. 仅Ⅰ、Ⅲ、Ⅳ
]
]
#block(breakable: false)[\31. 某计算机主存按字节编址，采用二级分页存储管理，地址结构如下所示：

虚拟地址20501225H对应的页目录号、页号分别是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 081H、101H
+ B. 081H、401H
+ C. 201H、101H
+ D. 201H、401H
]
]
#block(breakable: false)[\32. 在下列动态分区分配算法中，最容易产生内存碎片的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 首次适应算法
+ B. 最坏适应算法
+ C. 最佳适应算法
+ D. 循环首次适应算法
]
]
#block(breakable: false)[\33. OSI参考模型的第5层（自下而上）完成的主要功能是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 差错控制
+ B. 路由选择
+ C. 会话管理
+ D. 数据表示转换
]
]
#block(breakable: false)[\34. 100BaseT快速以太网使用的导向传输介质是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 双绞线
+ B. 单模光纤
+ C. 多模光纤
+ D. 同轴电缆
]
]
#block(breakable: false)[\35. 对于滑动窗口协议，若分组序号采用3比特编号，发送窗口大小为5，则接收窗口最大是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A.2
+ B.3
+ C.4
+ D.5
]
]
#block(breakable: false)[\36. 假设一个采用 CSMA/CD 协议的 10Mb/s 局域网，最小帧长是 128B，则在一个冲突域内两个站点之间的单向传播延时最多是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 2.56 $mu s$
+ B. 5.12 $mu s$
+ C. 10.24 $mu s$
+ D. 20.48 $mu s$
]
]
#block(breakable: false)[\37. 若将 101.200.16.0/20划分为 5 个子网，则可能的最小子网的可分配 IP 地址数是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 126
+ B. 254
+ C. 510
+ D. 1022
]
]
#block(breakable: false)[\38. 某客户通过一个TCP连接向服务器发送数据的部分过程如题38图所示。客户在 $t_0$时刻第一次收到确认序列号 ack\_seq=100的段，并发送序列号 seq=100的段，但发生丢失。若TCP支持快速重传，则客户重新发送 seq=100段的时刻是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. $t_1$
+ B. $t_2$
+ C. $t_3$
+ D. $t_4$
]

#figure(image("images/img-2.jpg"),
  caption: [题38图]
)
]
#block(breakable: false)[\39. 若主机甲主动发起一个与主机乙的TCP连接，甲、乙选择的初始序列号分别为2018和2046，则第三次握手TCP段的确认序列号是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 2018
+ B. 2019
+ C. 2046
+ D. 2047
]
]
#block(breakable: false)[\40. 下列关于网络应用模型的叙述中，错误的是\_\_\_。

#tasks(label: none, columns: "auto-fit", max-columns: 4)[
+ A. 在P2P模型中，结点之间具有对等关系
+ B. 在客户/服务器（C/S）模型中，客户与客户之间可以直接通信
+ C. 在C/S模型中，主动发起通信的是客户，被动通信的是服务器
+ D. 在向多用户分发一个文件时，P2P模型通常比C/S模型所需的时间短
]
]
== 二、综合应用题（第41～47小题，共70分）
#block(breakable: false)[\41. （13分）设线性表 $L = (a_1 \, a_2 \, a_3 \, dots.h.c \, a_(n - 2) \, a_(n - 1) \, a_n)$采用带头结点的单链表保存，链表中的结点定义如下：

```c
typedef struct node
{
    int data;
    struct node *next;
} NODE;
```

请设计一个空间复杂度为 O(1)且时间上尽可能高效的算法，重新排列 L中的各结点，得到线性表 $L' = (a_1 \, a_n \, a_2 \, a_(n - 1) \, a_3 \, a_(n - 2) \, dots.h)$ 。要求：

\\(1) 给出算法的基本设计思想。

\\(2) 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。

\\(3) 说明你所设计的算法的时间复杂度。
]
#block(breakable: false)[\42. （10分）请设计一个队列，要求满足： $①$初始时队列为空； $②$入队时，允许增加队列占用空间； $③$出队后，出队元素所占用的空间可重复使用，即整个队列所占用的空间只增不减； $④$入队操作和出队操作的时间复杂度始终保持为 O(1)。请回答下列问题：

\\(1) 该队列是应选择链式存储结构，还是应选择顺序存储结构？

\\(2) 画出队列的初始状态，并给出判断队空和队满的条件。

\\(3) 画出第一个元素入队后的队列状态。

\\(4) 给出入队操作和出队操作的基本过程。
]
#block(breakable: false)[\43. （8分）有n（ $n gt.eq 3$ ）位哲学家围坐在一张圆桌边，每位哲学家交替地就餐和思考。在圆桌中心有m（ $m gt.eq 1$ ）个碗，每两位哲学家之间有一根筷子。每位哲学家必须取到一个碗和两侧的筷子后，才能就餐，进餐完毕，将碗和筷子放回原位，并继续思考。为使尽可能多的哲学家同时就餐，且防止出现死锁现象，请使用信号量的P、V操作\[wait()、signal()操作\]描述上述过程中的互斥与同步，并说明所用信号量及初值的含义。
]
#block(breakable: false)[\44. （7分）某计算机系统中的磁盘有300个柱面，每个柱面有10个磁道，每个磁道有200个扇区，扇区大小为512B。文件系统的每个簇包含2个扇区。请回答下列问题：

\\(1) 磁盘的容量是多少？

\\(2) 假设磁头在85号柱面上，此时有4个磁盘访问请求，簇号分别为100260、60005、 101660和110560。若采用最短寻道时间优先（SSTF）调度算法，则系统访问簇的先后次序是什么？

\\(3) 第100530簇在磁盘上的物理地址是什么？将簇号转换成磁盘物理地址的过程是由I/O系统的什么程序完成的？
]
#block(breakable: false)[\45. （16分）已知 $f \( n \) = n ! = n times \( n - 1 \) times \( n - 2 \) times dots.h.c times 2 times 1$ ，计算 f(n)的C语言函数f1的源程序（阴影部分）及其在32位计算机M上的部分机器级代码如下：

#image("images/img-3.jpg")

其中，机器级代码行包括行号、虚拟地址、机器指令和汇编指令，计算机M按字节编址，int型数据占32位。请回答下列问题：

\\(1) 计算 f(10)需要调用函数 f1多少次？执行哪条指令会递归调用 f1？

\\(2) 上述代码中，哪条指令是条件转移指令？哪几条指令一定会使程序跳转执行？

\\(3) 根据第16行的call指令，第17行指令的虚拟地址应是多少？已知第16行的call指令采用相对寻址方式，该指令中的偏移量应是多少（给出计算过程）？已知第16行的call指令的后4字节为偏移量，M是采用大端方式还是采用小端方式？

\\(4) $f \( 1 3 \) = 6 2 2 7 0 2 0 8 0 0$ ，但f1(13)的返回值为1932053504，为什么两者不相等？要使 f1(13)能返回正确的结果，应如何修改f1的源程序？

\\(5) 第19行的imul指令（带符号整数乘）的功能是 $upright(R \[ e a x \]) arrow.l upright(R \[ e a x \]) times upright(R \[ e c x \])$ ，当乘法器输出的高、低32位乘积之间满足什么条件时，溢出标志 $upright(O F) = 1$？要使CPU在发生溢出时转异常处理，编译器应在imul指令后应加一条什么指令？
]
#block(breakable: false)[\46. （7分）对于题45，若计算机M的主存地址为32位，采用分页存储管理方式，页大小为4KB，则第1行的push指令和第30行的ret指令是否在同一页中（说明理由）？若指令Cache有64行，采用4路组相联映射方式，主存块大小为64B，则32位主存地址中，哪几位表示块内地址？哪几位表示Cache组号？哪几位表示标记（tag）信息？读取第16行的call指令时，只可能在指令Cache的哪一组中命中（说明理由）？
]
#block(breakable: false)[\47. （9分）某网络拓扑如题47图所示，其中R为路由器，主机H1～H4的IP地址配置以及R的各接口IP地址配置如图中所示。现有若干以太网交换机（无VLAN功能）和路由器两类网络互连设备可供选择。

#figure(image("images/img-4.jpg"),
  caption: [题47图]
)

请回答下列问题：

\\(1) 设备1、设备2和设备3分别应选择什么类型的网络设备？

\\(2) 设备1、设备2和设备3中，哪几个设备的接口需要配置IP地址？为对应的接口配置正确的IP地址。

\\(3) 为确保主机 H1～H4能够访问Internet，R需要提供什么服务？

\\(4) 若主机H3发送一个目的地址为192.168.1.127的IP数据报，网络中哪几个主机会接收该数据报？]