#import "../../template.typ": exam, choices, subquestions, statements, inline-node
#show: exam.with(year: 2015, subject: "计算机学科专业基础", code: "408")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#import "@preview/cetz:0.5.2" as cetz
#answer-state.update(false)

#set document(title: "2015年全国硕士研究生招生考试计算机科学与技术学科联考计算机学科专业基础综合试题")

= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项符合题目要求。

#question[
已知程序如下：

```c
int S(int n)
{
    return (n <= 0) ? 0 : S(n - 1) + n;
}
void main()
{
    cout << S(1);
}
```

程序运行时使用栈来保存调用过程的信息，自栈底到栈顶保存的信息依次对应的是

#choices(
  [main() $arrow.r$ S(1) $arrow.r$ S(0)],
  [S(0) $arrow.r$ S(1) $arrow.r$ main()],
  [main() $arrow.r$ S(0) $arrow.r$ S(1)],
  [S(1) $arrow.r$ S(0) $arrow.r$ main()],
)
]

#question[
先序序列为 $a,b,c,d$ 的不同二叉树的个数是

#choices([13], [14], [15], [16])
]

#question[
下列选项给出的是从根分别到达两个叶结点路径上的权值序列，能属于同一棵哈夫曼树的是

#choices(
  [24，10，5和24，10，7],
  [24，10，5和24，12，7],
  [24，10，10和24，14，11],
  [24，10，5和24，14，6],
)
]

#question[
现有一棵无重复关键字的平衡二叉树（AVL树），对其进行中序遍历可得到一个降序序列。下列关于该平衡二叉树的叙述中，正确的是

#choices(
  [根结点的度一定为2],
  [树中最小元素一定是叶结点],
  [最后插入的元素一定是叶结点],
  [树中最大元素一定无左子树],
)
]

#question[
设有向图 $G = (V, E)$，顶点集 $V = \{v_0, v_1, v_2, v_3\}$，边集 $E = \{⟨v_0, v_1⟩, ⟨v_0, v_2⟩, ⟨v_0, v_3⟩, ⟨v_1, v_3⟩\}$。若从顶点 $v_0$ 开始对图进行深度优先遍历，则可能得到的不同遍历序列个数是

#choices([2], [3], [4], [5])
]

#question[
求下面带权图的最小（代价）生成树时，可能是克鲁斯卡尔（Kruskal）算法第2次选中但不是普里姆（Prim）算法（从 $v_4$ 开始）第2次选中的边是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  line((0, 6), (6, 6), (6, 0), (0, 0), close: true)
  line((0, 6), (6, 0))
  line((0, 0), (6, 6))
  for (p, body) in (((0, 6), [$v_1$]), ((6, 6), [$v_2$]), ((0, 0), [$v_3$]), ((6, 0), [$v_4$])) {
    circle(p, radius: 0.93, fill: white)
    content(p, body)
  }
  content((3, 6.62), [10])
  content((-0.66, 3), [8])
  content((6.78, 3), [11])
  content((3, -0.62), [8])
  content((1.17, 3.75), [5])
  content((4.82, 3.75), [8])
}))

#choices(
  [$(v_1, v_3)$],
  [$(v_1, v_4)$],
  [$(v_2, v_3)$],
  [$(v_3, v_4)$],
)
]

#question[
下列选项中，不能构成折半查找中关键字比较序列的是

#choices(
  [500, 200, 450, 180],
  [500, 450, 200, 180],
  [180, 500, 200, 450],
  [180, 200, 500, 450],
)
]

#question[
已知字符串 $s$ 为“abaabaabacacaabaabcc”，模式串 $t$ 为“abaabc”。采用KMP算法进行匹配，第一次出现“失配”（$s[i] != t[j]$）时，$i = j = 5$，则下次开始匹配时，$i$ 和 $j$ 的值分别是

#choices(
  [$i = 1, j = 0$],
  [$i = 5, j = 0$],
  [$i = 5, j = 2$],
  [$i = 6, j = 2$],
)
]

#question[
下列排序算法中，元素的移动次数与关键字的初始排列次序无关的是

#choices([直接插入排序], [起泡排序], [基数排序], [快速排序])
]

#question[
已知小根堆为8，15，10，21，34，16，12，删除关键字8之后需重建堆，在此过程中，关键字之间的比较次数是

#choices([1], [2], [3], [4])
]

#question[
希尔排序的组内排序采用的是

#choices([直接插入排序], [折半插入排序], [快速排序], [归并排序])
]

#question[
计算机硬件能够直接执行的是

#statements(
  columns: (1fr, 1fr, 1fr),
  [Ⅰ．机器语言程序], [Ⅱ．汇编语言程序], [Ⅲ．硬件描述语言程序],
)

#choices([仅Ⅰ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]

#question[
由3个“1”和5个“0”组成的8位二进制补码，能表示的最小整数是

#choices([$-126$], [$-125$], [$-32$], [$-3$])
]

#question[
下列有关浮点数加减运算的叙述中，正确的是

Ⅰ．对阶操作不会引起阶码上溢或下溢
\
Ⅱ．右规和尾数舍入都可能引起阶码上溢
\
Ⅲ．左规时可能引起阶码下溢
\
Ⅳ．尾数溢出时结果不一定溢出

#choices(
  [仅Ⅱ、Ⅲ],
  [仅Ⅰ、Ⅱ、Ⅳ],
  [仅Ⅰ、Ⅲ、Ⅳ],
  [Ⅰ、Ⅱ、Ⅲ、Ⅳ],
)
]

#question[
假定主存地址为32位，按字节编址，主存和Cache之间采用直接映射方式，主存块大小为4个字，每字32位，采用回写（Write Back）方式，则能存放4K字数据的Cache的总容量的位数至少是

#choices([146K], [147K], [148K], [158K])
]

#question[
假定编译器将赋值语句“`x = x + 3;`”转换为指令“`add xaddr, 3`”，其中，xaddr是x对应的存储单元地址。若执行该指令的计算机采用页式虚拟存储管理方式，并配有相应的TLB，且Cache使用直写（Write Through）方式，则完成该指令功能需要访问主存的次数至少是

#choices([0], [1], [2], [3])
]

#question[
下列存储器中，在工作期间需要周期性刷新的是

#choices([SRAM], [SDRAM], [ROM], [FLASH])
]

#question[
某计算机使用4体交叉编址存储器，假定在存储器总线上出现的主存地址（十进制）序列为8005，8006，8007，8008，8001，8002，8003，8004，8000，则可能发生访存冲突的地址对是

#choices([8004和8008], [8002和8007], [8001和8008], [8000和8004])
]

#question[
下列有关总线定时的叙述中，错误的是

#choices(
  [异步通信方式中，全互锁协议的速度最慢],
  [异步通信方式中，非互锁协议的可靠性最差],
  [同步通信方式中，同步时钟信号可由各设备提供],
  [半同步通信方式中，握手信号的采样由同步时钟控制],
)
]

#question[
若磁盘转速为7200转/分，平均寻道时间为8 ms，每个磁道包含1000个扇区，则访问一个扇区的平均存取时间大约是

#choices([8.1 ms], [12.2 ms], [16.3 ms], [20.5 ms])
]

#question[
在采用中断I/O方式控制打印输出的情况下，CPU和打印控制接口中的I/O端口之间交换的信息不可能是

#choices([打印字符], [主存地址], [设备状态], [控制命令])
]

#question[
内部异常（内中断）可分为故障（fault）、陷阱（trap）和终止（abort）三类。下列有关内部异常的叙述中，错误的是

#choices(
  [内部异常的产生与当前执行指令相关],
  [内部异常的检测由CPU内部逻辑实现],
  [内部异常的响应发生在指令执行过程中],
  [内部异常处理后返回到发生异常的指令继续执行],
)
]

#question[
处理外部中断时，应该由操作系统保存的是

#choices(
  [程序计数器（PC）的内容],
  [通用寄存器的内容],
  [快表（TLB）中的内容],
  [Cache中的内容],
)
]

#question[
假定下列指令已装入指令寄存器，则执行时不可能导致CPU从用户态变为内核态（系统态）的是

#choices(
  [DIV R0，R1；（R0）/（R1）→R0],
  [INT n；产生软中断],
  [NOT R0；寄存器R0的内容取非],
  [MOV R0，addr；把地址addr处的内存数据放入寄存器R0中],
)
]

#question[
下列选项中，会导致进程从执行态变为就绪态的事件是

#choices([执行P（wait）操作], [申请内存失败], [启动I/O设备], [被高优先级进程抢占])
]

#question[
若系统S1采用死锁避免方法，S2采用死锁检测方法。下列叙述中，正确的是

Ⅰ．S1会限制用户申请资源的顺序，而S2不会
\
Ⅱ．S1需要进程运行所需资源总量信息，而S2不需要
\
Ⅲ．S1不会给可能导致死锁的进程分配资源，而S2会

#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]

#question[
系统为某进程分配了4个页框，该进程已访问的页号序列为2，0，2，9，3，4，2，8，2，4，8，4，5。若进程要访问的下一页的页号为7，依据LRU算法，应淘汰页的页号是

#choices([2], [3], [4], [8])
]

#question[
在系统内存中设置磁盘缓冲区的主要目的是

#choices([减少磁盘I/O次数], [减少平均寻道时间], [提高磁盘数据可靠性], [实现设备无关性])
]

#question[
在文件的索引结点中存放直接索引指针10个，一级和二级索引指针各1个。磁盘块大小为1KB，每个索引指针占4个字节。若某文件的索引结点已在内存中，则把该文件偏移量（按字节编址）为1234和307400处所在的磁盘块读入内存，需访问的磁盘块个数分别是

#choices([1、2], [1、3], [2、3], [2、4])
]

#question[
在请求分页系统中，页面分配策略与页面置换策略不能组合使用的是

#choices([可变分配，全局置换], [可变分配，局部置换], [固定分配，全局置换], [固定分配，局部置换])
]

#question[
文件系统用位图法表示磁盘空间的分配情况，位图存于磁盘的32～127号块中，每个盘块占1024个字节，盘块和块内字节均从0开始编号。假设要释放的盘块号为409612，则位图中要修改的位所在的盘块号和块内字节序号分别是

#choices([81、1], [81、2], [82、1], [82、2])
]

#question[
某硬盘有200个磁道（最外侧磁道号为0），磁道访问请求序列为：130，42，180，15，199，当前磁头位于第58号磁道并从外侧向内侧移动。按照SCAN调度方法处理完上述请求后，磁头移过的磁道数是

#choices([208], [287], [325], [382])
]

#question[
通过POP3协议接收邮件时，使用的传输层服务类型是

#choices(
  [无连接不可靠的数据传输服务],
  [无连接可靠的数据传输服务],
  [有连接不可靠的数据传输服务],
  [有连接可靠的数据传输服务],
)
]

#question[
使用两种编码方案对比特流01100111进行编码的结果如下图所示，编码1和编码2分别是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  for i in range(9) {
    line((2.5 * i, 0), (2.5 * i, 8.4), stroke: (thickness: 0.04em, dash: "dashed"))
  }
  content((-0.7, 9.1), [比特流], anchor: "east")
  for (i, bit) in (0, 1, 1, 0, 0, 1, 1, 1).enumerate() {
    content((2.5 * i + 1.25, 9.1), str(bit))
  }
  content((-0.7, 6.8), [编码1], anchor: "east")
  content((-0.7, 1.8), [编码2], anchor: "east")
  line((0, 5.5), (2.5, 5.5), (2.5, 8), (7.5, 8), (7.5, 5.5), (12.5, 5.5), (12.5, 8), (20, 8), stroke: 0.10em)
  line((0, 0.7), (1.25, 0.7), (1.25, 3.2), (3.75, 3.2), (3.75, 0.7),
    (5, 0.7), (5, 3.2), (6.25, 3.2), (6.25, 0.7), (8.75, 0.7),
    (8.75, 3.2), (10, 3.2), (10, 0.7), (11.25, 0.7), (11.25, 3.2),
    (13.75, 3.2), (13.75, 0.7), (15, 0.7), (15, 3.2), (16.25, 3.2),
    (16.25, 0.7), (17.5, 0.7), (17.5, 3.2), (18.75, 3.2), (18.75, 0.7), (20, 0.7), stroke: 0.10em)
}))

#choices(
  [NRZ和曼彻斯特编码],
  [NRZ和差分曼彻斯特编码],
  [NRZI和曼彻斯特编码],
  [NRZI和差分曼彻斯特编码],
)
]

#question[
主机甲通过128 kbps卫星链路，采用滑动窗口协议向主机乙发送数据，链路单向传播延迟为250 ms，帧长为1000字节。不考虑确认帧的开销，为使链路利用率不小于80%，帧序号的比特数至少是

#choices([3], [4], [7], [8])
]

#question[
下列关于CSMA/CD协议的叙述中，错误的是

#choices(
  [边发送数据帧，边检测是否发生冲突],
  [适用于无线网络，以实现无线链路共享],
  [需要根据网络跨距和数据传输速率限定最小帧长],
  [当信号传播延迟趋近0时，信道利用率趋近100%],
)
]

#question[
下列关于交换机的叙述中，正确的是

#choices(
  [以太网交换机本质上是一种多端口网桥],
  [通过交换机互连的一组工作站构成一个冲突域],
  [交换机每个端口所连网络构成一个独立的广播域],
  [以太网交换机可实现采用不同网络层协议的网络互联],
)
]

#question[
某路由器的路由表如下表所示：

#figure(
  kind: table,
  numbering: none,
  align(center)[#table(
    columns: (1.7fr, 1.5fr, 0.7fr),
    align: center + horizon,
    [目的网络], [下一跳], [接口],
    [169.96.40.0/23], [176.1.1.1], [S1],
    [169.96.40.0/25], [176.2.2.2], [S2],
    [169.96.40.0/27], [176.3.3.3], [S3],
    [0.0.0.0/0], [176.4.4.4], [S4],
  )]
)

若路由器收到一个目的地址为169.96.40.5的IP分组，则转发该IP分组的接口是

#choices([S1], [S2], [S3], [S4])
]

#question[
主机甲和主机乙新建一个TCP连接，甲的拥塞控制初始阈值为32KB，甲向乙始终以MSS=1KB大小的段发送数据，并一直有数据发送；乙为该连接分配16KB接收缓存，并对每个数据段进行确认，忽略段传输延迟。若乙收到的数据全部存入缓存，不被取走，则甲从连接建立成功时刻起，未发生超时的情况下，经过4个RTT后，甲的发送窗口是

#choices([1KB], [8KB], [16KB], [32KB])
]

#question[
某浏览器发出的HTTP请求报文如下：

```http
GET /index.html HTTP/1.1
Host: www.test.edu.cn
Connection: Close
Cookie: 123456
```

下列叙述中，错误的是

#choices(
  [该浏览器请求浏览index.html],
  [index.html存放在www.test.edu.cn上],
  [该浏览器请求使用持续连接],
  [该浏览器曾经浏览过www.test.edu.cn],
)
]

= 二、综合应用题：41～47小题，共70分。

#question[
（15分）用单链表保存 $m$ 个整数，结点的结构为：#inline-node(
    columns: (3.1em, 3.1em),
    [data], [link],
  )，且 $abs("data") <= n$（$n$ 为正整数）。现要求设计一个时间复杂度尽可能高效的算法，对于链表中data的绝对值相等的结点，仅保留第一次出现的结点而删除其余绝对值相等的结点。例如，若给定的单链表head如下：

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  for (i, value) in ([], [21], [-15], [-15], [-7], [15]).enumerate() {
    let x = 5.3 * i
    rect((x, 0), (x + 3.6, 1.7), fill: white)
    line((x + 2, 0), (x + 2, 1.7))
    content((x + 1, 0.85), value)
    if i < 5 {
      line((x + 2.65, 0.85), (x + 5.3, 0.85), mark: (end: ">", fill: black, scale: 0.6))
    } else {
      content((x + 2.8, 0.85), [∧])
    }
  }
  content((0.75, 3.55), [head])
  line((0.75, 2.85), (0.75, 1.7), mark: (end: ">", fill: black, scale: 0.6))
}))

则删除结点后的head为：

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  for (i, value) in ([], [21], [-15], [-7]).enumerate() {
    let x = 5.3 * i
    rect((x, 0), (x + 3.6, 1.7), fill: white)
    line((x + 2, 0), (x + 2, 1.7))
    content((x + 1, 0.85), value)
    if i < 3 {
      line((x + 2.65, 0.85), (x + 5.3, 0.85), mark: (end: ">", fill: black, scale: 0.6))
    } else {
      content((x + 2.8, 0.85), [∧])
    }
  }
  content((0.75, 3.55), [head])
  line((0.75, 2.85), (0.75, 1.7), mark: (end: ">", fill: black, scale: 0.6))
}))

要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 使用C或C++语言，给出单链表结点的数据类型定义。
  \
+ 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度和空间复杂度。
    
]
]

#question[
（8分）已知含有5个顶点的图 $G$ 如下图所示。

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  let points = ((2.8, 7), (8.3, 7), (0, 2.8), (5.3, 0.6), (10.6, 2.8))
  for (a, b) in ((0, 1), (0, 2), (0, 4), (1, 3), (1, 4), (2, 3), (3, 4)) {
    line(points.at(a), points.at(b))
  }
  for (i, p) in points.enumerate() {
    circle(p, radius: 0.86, fill: white)
    content(p, str(i))
  }
}))

请回答下列问题。

#subquestions[
+ 写出图 $G$ 的邻接矩阵 $A$（行、列下标均从0开始）。
  \
+ 求 $A^2$，矩阵 $A^2$ 中位于0行3列元素值的含义是什么？
  \
+ 若已知具有 $n$（$n >= 2$）个顶点的图的邻接矩阵为 $B$，则 $B^m$（$2 <= m <= n$）中非零元素的含义是什么？
    
]
]

#question[
（13分）某16位计算机的主存按字节编址，存取单位为16位；采用16位定长指令字格式；CPU采用单总线结构，主要部分如下图所示。图中R0～R3为通用寄存器；T为暂存器；SR为移位寄存器，可实现直送（mov）、左移一位（left）和右移一位（right）3种操作，控制信号为SRop，SR的输出由信号SRout控制；ALU可实现直送A（mova）、A加B（add）、A减B（sub）、A与B（and）、A或B（or）、非A（not）、A加1（inc）7种操作，控制信号为ALUop。请回答下列问题。

#subquestions[
+ 图中哪些寄存器是程序员可见的？为何要设置暂存器T？
  \
+ 控制信号ALUop和SRop的位数至少各是多少？
  
  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    let p(x, y) = (x / 30, (625 - y) / 30)
    let wire(..pts, arrow: true, dotted: false, both: false) = line(
      ..pts.pos().map(q => p(..q)),
      stroke: if dotted { (thickness: 0.07em, dash: "dotted") } else { 0.065em },
      mark: if arrow { (start: if both { "<" } else { none }, end: ">", fill: black, scale: 0.7) } else { none },
    )
    let unit(x1, y1, x2, y2, body) = {
      rect(p(x1, y1), p(x2, y2), fill: white, stroke: 0.075em)
      content(p((x1 + x2) / 2, (y1 + y2) / 2), align(center, text(size: 0.9em)[#body]))
    }
    let port(x, y, tx, ty, body) = {
      circle(p(x, y), radius: 0.10, fill: black, stroke: none)
      content(p(tx, ty), body)
    }
    rect(p(10, 7), p(951, 617), stroke: 0.075em)
    rect(p(31, 21), p(512, 604), fill: luma(93%), stroke: (thickness: 0.09em, dash: "dashed"))
    // CPU 内总线和主存总线使用空心双向箭头。
    for (x, top, bottom) in ((714, 17, 589), (1000, 86, 600)) {
      line(p(x, top), p(x + 21, top + 12), p(x + 8, top + 12),
        p(x + 8, bottom - 12), p(x + 21, bottom - 12), p(x, bottom),
        p(x - 21, bottom - 12), p(x - 8, bottom - 12), p(x - 8, top + 12),
        p(x - 21, top + 12), close: true, fill: white, stroke: 0.05em)
    }
    wire((177, 75), (177, 51), (701, 51))
    wire((714, 547), (104, 547), (104, 404))
    wire((105, 354), (105, 296))
    wire((177, 227), (177, 188))
    wire((177, 121), (177, 106))
    wire((257, 343), (257, 296))
    wire((230, 377), (142, 377), dotted: true)
    wire((413, 91), (264, 91), dotted: true)
    wire((395, 153), (268, 153), dotted: true)
    wire((373, 264), (274, 264), dotted: true)
    wire((258, 426), (349, 426), dotted: true)
    wire((407, 377), (407, 391), arrow: false)
    wire((369, 491), (369, 457))
    wire((440, 501), (440, 457))
    for (y, name) in ((127, [R0]), (216, [R1]), (312, [R2]), (400, [R3])) {
      unit(543, y - 28, 665, y + 28, name)
      wire((665, y), (706, y), both: true)
    }
    unit(772, 99, 893, 154, [MAR])
    unit(772, 188, 895, 244, [MDR])
    unit(772, 284, 895, 340, [PC])
    unit(772, 369, 895, 419, [IR])
    wire((722, 127), (772, 127))
    wire((722, 216), (772, 216), both: true)
    wire((722, 312), (772, 312), both: true)
    wire((722, 394), (772, 394))
    wire((835, 419), (835, 463))
    unit(752, 463, 932, 533, [控制部件])
    wire((789, 533), (789, 596), dotted: true)
    wire((896, 533), (896, 596), dotted: true)
    // 外部宽总线连接。
    line(p(893, 123), p(984, 123), p(984, 116), p(993, 126), p(984, 136), p(984, 129), p(893, 129), stroke: 0.04em)
    for (x1, x2, y) in ((895, 991, 216), (932, 991, 495), (1008, 1073, 188)) {
      line(p(x1, y), p(x1 + 9, y - 10), p(x1 + 9, y - 3), p(x2 - 9, y - 3),
        p(x2 - 9, y - 10), p(x2, y), p(x2 - 9, y + 10), p(x2 - 9, y + 3),
        p(x1 + 9, y + 3), p(x1 + 9, y + 10), close: true, fill: white, stroke: 0.04em)
    }
    unit(1073, 119, 1150, 257, [主 \
      存])
    unit(70, 354, 142, 404, [T])
    unit(86, 121, 268, 188, [移位寄存器 \
      SR])
    rect(p(86, 74), p(264, 106), fill: white, stroke: (thickness: 0.065em, dash: "dotted"))
    line(p(52, 296), p(123, 227), p(232, 227), p(303, 296), p(213, 296),
      p(176, 269), p(145, 296), close: true, fill: white, stroke: 0.075em)
    content(p(177, 252), text(size: 0.9em)[ALU])
    content(p(105, 281), text(size: 0.9em)[A])
    content(p(251, 281), text(size: 0.9em)[B])
    line(p(336, 457), p(372, 391), p(437, 391), p(472, 457), close: true, fill: white, stroke: 0.075em)
    content(p(405, 423), text(size: 0.9em)[MUX])
    content(p(369, 446), text(size: 0.8em)[0])
    content(p(440, 446), text(size: 0.8em)[1])
    content(p(369, 514), [2])
    content(p(818, 49), text(size: 0.9em)[CPU \
      （中央处理器）])
    content(p(663, 484), text(size: 0.9em)[CPU \
      内总线])
    content(p(1038, 510), text(size: 0.9em)[主 \
      存 \
      总 \
      线])
    content(p(841, 567), [⋯])
    content(p(337, 75), text(size: 0.9em)[SRout])
    content(p(333, 137), text(size: 0.9em)[SRop])
    content(p(315, 242), text(size: 0.9em)[ALUop])
    content(p(195, 360), text(size: 0.9em)[Tin])
    content(p(289, 448), text(size: 0.9em)[MUXop])
    for (x, y, tx, ty, body) in ((413, 91, 441, 89, [①]), (395, 153, 420, 157, [②]),
      (373, 264, 405, 267, [③]), (257, 343, 287, 339, [④]), (230, 377, 258, 377, [⑤]),
      (482, 547, 493, 575, [⑥]), (407, 377, 379, 368, [⑦]),
      (258, 426, 228, 426, [⑧]), (440, 501, 476, 502, [⑨])) {
      port(x, y, tx, ty, body)
    }
  }))
  
+ 控制信号SRout所控制部件的名称或作用是什么？
  \
+ 端点①～⑨中，哪些端点须连接到控制部件的输出端？
  \
+ 为完善单总线数据通路，需要在端点①～⑨中相应的端点之间添加必要的连线。写出连线的起点和终点，以正确表示数据的流动方向。
  \
+ 为什么二路选择器MUX的一个输入端是2？
    
]
]

#question[
（10分）题43中描述的计算机，其部分指令执行过程的控制信号如题44图a所示。

#figure(
  align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.05em)
    line((19, 7), (19, 4.6), (9, 4.6), (9, 3))
    line((19, 4.6), (28.5, 4.6), (28.5, 3))
    line((0, 5.45), (39, 5.45), stroke: (thickness: 0.04em, dash: "dashed"))
    rect((9, 7), (30, 12.2), fill: white)
    rect((0, 0), (17.7, 3), fill: white)
    rect((18.7, -2.4), (39, 3), fill: white)
    content((9.3, 11.9), text(size: 0.85em)[
      PCout=1, MARin=1, Tin=1, MEMop=read \
      MUXop=#underline[①], ALUop=add, SRop=#underline[②] \
      SRout=1, PCin=1 \
      MDRout=1, IRin=1
    ], anchor: "north-west")
    content((0.3, 2.65), text(size: 0.85em)[
      R1out=1, Tin=1, ALUop=#underline[③], SRop=#underline[④] \
      SRout=1, R2in=1
    ], anchor: "north-west")
    content((19, 2.65), text(size: 0.85em)[
      R1out=1, MARin=1, MEMop=#underline[⑤] \
      R2out=1, Tin=1 \
      MDRout=1, MUXop=1, ALUop=#underline[⑥], SRop=#underline[⑦] \
      #underline[⑧]=1, R0in=1
    ], anchor: "north-west")
    content((1.3, 6.6), [取指阶段], anchor: "west")
    content((1.3, 4.3), [执行阶段], anchor: "west")
    content((10.7, 3.75), [shl R2, R1])
    content((32.8, 3.75), [sub R0, R2, (R1)])
    content((0.7, -0.65), text(size: 0.82em)[
      注：值为0的寄存器输入/输出控制信号以及 \
      值为任意的其他控制信号均未在图中标出。
    ], anchor: "north-west")
  })),
  kind: image,
  caption: [题44图a　部分指令的控制信号],
  numbering: none,
)

该机指令格式如题44图b所示，支持寄存器直接和寄存器间接两种寻址方式，寻址方式位分别为0和1，通用寄存器R0～R3的编号分别为0、1、2和3。

#figure(
  block(stroke: (thickness: 0.045em, dash: "dashed"), inset: 0.6em)[
    #set align(left)
    #table(
      columns: (2fr, 1fr, 1fr, 1fr, 0.75fr, 1fr, 0.75fr),
      align: center + horizon,
      stroke: (x, y) => if y == 0 { none } else { 0.05em },
      table.vline(x: 2, start: 1, end: 2, stroke: (dash: "dashed", thickness: 0.05em)),
      table.vline(x: 4, start: 1, end: 2, stroke: (dash: "dashed", thickness: 0.05em)),
      table.vline(x: 6, start: 1, end: 2, stroke: (dash: "dashed", thickness: 0.05em)),
      table.cell(rowspan: 1)[指令操作码],
      table.cell(colspan: 2)[目的操作数],
      table.cell(colspan: 2)[源操作数1],
      table.cell(colspan: 2)[源操作数2],
      [OP], [Md], table.cell(stroke: (left: (dash: "dashed", thickness: 0.05em)))[Rd],
      [Ms1], table.cell(stroke: (left: (dash: "dashed", thickness: 0.05em)))[Rs1],
      [Ms2], table.cell(stroke: (left: (dash: "dashed", thickness: 0.05em)))[Rs2],
    )

    其中：Md、Ms1、Ms2 为寻址方式位，Rd、Rs1、Rs2 为寄存器编号。

    #grid(
      columns: (auto, 1fr),
      column-gutter: 1em,
      row-gutter: 0.4em,
      [三地址指令：], [源操作数1　OP 源操作数2→目的操作数地址],
      [二地址指令（末3位均为0）：], [OP 源操作数1→目的操作数地址],
      [单地址指令（末6位均为0）：], [OP 目的操作数→目的操作数地址],
    )
  ],
  kind: image,
  caption: [题44图b　指令格式],
  numbering: none,
)

请回答下列问题。

#subquestions[
+ 该机的指令系统最多可定义多少条指令？
  \
+ 假定inc、shl和sub指令的操作码分别为01H、02H和03H，则以下指令对应的机器代码各是什么？
  
  ① `inc R1`；（R1）+1→R1
  \
  ② `shl R2, R1`；（R1）＜＜1→R2
  \
  ③ `sub R3, (R1), R2`；（（R1））-（R2）→R3
  \
+ 假设寄存器X的输入和输出控制信号分别记为Xin和Xout，其值为1表示有效，为0表示无效（例如，PCout=1表示PC内容送总线）；存储器控制信号为MEMop，用于控制存储器的读（read）和写（write）操作。写出题44图a中标号①～⑧处的控制信号或控制信号取值。
  \
+ 指令“`sub R1, R3, (R2)`”和“`inc R1`”的执行阶段至少各需要多少个时钟周期？
    
]
]

#question[
（9分）有A、B两人通过信箱进行辩论，每个人都从自己的信箱中取得对方的问题，将答案和向对方提出的新问题组成一个邮件放入对方的信箱中。假设A的信箱最多放 $M$ 个邮件，B的信箱最多放 $N$ 个邮件。初始时A的信箱中有 $x$ 个邮件（$0 < x < M$），B的信箱中有 $y$ 个邮件（$0 < y < N$）。辩论者每取出一个邮件，邮件数减1。A和B两人的操作过程描述如下：

#align(center)[CoBegin]

#table(
  columns: (1fr, 1fr),
  inset: 0.7em,
  align: top + left,
  [```c
A {
    while (TRUE) {
        从A的信箱中取出一个邮件;
        回答问题并提出一个新问题;
        将新邮件放入B的信箱;
    }
}
```],
  [```c
B {
    while (TRUE) {
        从B的信箱中取出一个邮件;
        回答问题并提出一个新问题;
        将新邮件放入A的信箱;
    }
}
```],
)

#align(center)[CoEnd]

当信箱不为空时，辩论者才能从信箱中取邮件，否则等待。当信箱不满时，辩论者才能将新邮件放入信箱，否则等待。请添加必要的信号量和P、V（或wait、signal）操作，以实现上述过程的同步。要求写出完整的过程，并说明信号量的含义和初值。
]

#question[
（6分）某计算机系统按字节编址，采用二级页表的分页存储管理方式，虚拟地址格式如下所示：

#align(center)[#table(
  columns: (1fr, 1fr, 1.2fr),
  align: center + horizon,
  inset: (x: 1.1em, y: 0.35em),
  [10位], [10位], [12位],
  [页目录号], [页表索引], [页内偏移量],
)]

请回答下列问题。

#subquestions[
+ 页和页框的大小各为多少字节？进程的虚拟地址空间大小为多少页？
  \
+ 假定页目录项和页表项均占4个字节，则进程的页目录和页表共占多少页？要求写出计算过程。
  \
+ 若某指令周期内访问的虚拟地址为0100 0000H和0111 2048H，则进行地址转换时共访问多少个二级页表？要求说明理由。
    
]
]

#question[
（9分）某网络拓扑如题47图所示，其中路由器内网接口、DHCP服务器、WWW服务器与主机1均采用静态IP地址配置，相关地址信息见图中标注；主机2～主机N通过DHCP服务器动态获取IP地址等配置信息。

#figure(
  align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.055em)
    let label(x, y, body, anchor: "center") = content((x, y), text(size: 0.92em)[#body], anchor: anchor)
    // 先铺连线，设备图标遮住进入设备内部的端点。
    line((7.4, 14.5), (13, 10.5))
    line((14.3, 14.4), (13, 10.5))
    line((13, 10.5), (34.1, 10.5))
    line((34.1, 11.4), (34.1, 17.6))
    line((13, 10.5), (3.5, 4.4))
    line((13, 10.5), (10.3, 4.4))
    line((13, 10.5), (22.5, 4.4))

    // 服务器按原图的机箱外形重建；CRT 主机复用已有 Visio 图标。
    let server(x, y) = {
      let at(a, b) = (x + a, y + b)
      line(at(-1.7, 1.5), at(-0.35, 0.8), at(-0.35, -2.4), at(-1.7, -1.7), close: true, fill: luma(93%))
      line(at(-0.35, 0.8), at(1.65, 1.9), at(1.65, -1.3), at(-0.35, -2.4), close: true, fill: luma(77%))
      line(at(-1.7, 1.5), at(0.35, 2.6), at(1.65, 1.9), at(-0.35, 0.8), close: true, fill: luma(97%))
      for b in (1.05, 0.65, 0.25) {
        line(at(-1.4, b), at(-0.6, b - 0.42), stroke: 0.11em)
      }
      circle(at(-1.08, -0.48), radius: 0.12, fill: black, stroke: none)
      for b in (-1.1, -1.32, -1.54) {
        line(at(-1.4, b), at(-0.6, b - 0.42), stroke: 0.045em)
      }
    }
    server(7.4, 16.6)
    server(14.3, 16.6)
    for x in (3.5, 10.3, 22.5) {
      content((x, 4.4), image("assets/visio-2007-isometric-pc.png", width: 5.4em))
    }
    label(7.4, 19.8, [WWW服务器])
    label(14.3, 19.8, [DHCP服务器])
    label(8.8, 13.1, [111.123.15.3/24], anchor: "east")
    label(14.8, 13.5, [111.123.15.2/24], anchor: "west")
    label(14.8, 12.3, [00-b1-b1-b1-b1-b1], anchor: "west")

    // 交换机顶部及两侧保持原图的等距投影方向。
    line((10.5, 10.8), (13, 9.3), (13, 7.9), (10.5, 9.4), close: true, fill: luma(92%))
    line((13, 9.3), (15.5, 10.8), (15.5, 9.4), (13, 7.9), close: true, fill: luma(80%))
    line((10.5, 10.8), (13, 12.1), (15.5, 10.8), (13, 9.3), close: true, fill: luma(97%))
    for (a, b) in (((11.4, 10.9), (12.7, 10.2)), ((12.5, 11.6), (13.8, 10.9)),
      ((12, 10.5), (13.3, 11.2)), ((13.3, 9.9), (14.6, 10.6))) {
      line(a, b, stroke: 0.16em, mark: (end: ">", fill: black, scale: 0.9))
    }
    label(9.5, 9.7, [以太网交换机], anchor: "east")

    // 圆柱路由器：黑箭头、浅灰侧面。
    merge-path({
      line((31.9, 10.5), (31.9, 8.7))
      bezier((31.9, 8.7), (36.3, 8.7), (31.9, 7.05), (36.3, 7.05))
      line((36.3, 8.7), (36.3, 10.5))
    }, close: true, fill: luma(88%))
    circle((34.1, 10.5), radius: (2.2, 1.2), fill: luma(97%))
    for (a, b) in (((32.7, 11.1), (34, 10.45)), ((34.2, 10.5), (35.55, 11.15)),
      ((35.55, 9.9), (34.2, 10.55)), ((34, 10.5), (32.7, 9.85))) {
      line(a, b, stroke: 0.18em, mark: (end: ">", fill: black, scale: 0.9))
    }
    label(34.1, 6.7, [路由器])
    label(31.4, 11.05, [111.123.15.1/24], anchor: "east")
    label(31.4, 9.7, [00-a1-a1-a1-a1-a1], anchor: "east")

    let cloud(cx, cy, fill) = merge-path({
      bezier((cx - 3.5, cy), (cx - 2.7, cy + 1.3), (cx - 4.1, cy + 0.9), (cx - 3.1, cy + 1.8))
      bezier((cx - 2.7, cy + 1.3), (cx - 1.3, cy + 1.7), (cx - 2.7, cy + 2.3), (cx - 1.6, cy + 2.3))
      bezier((cx - 1.3, cy + 1.7), (cx + 0.2, cy + 1.9), (cx - 1.2, cy + 2.5), (cx - 0.2, cy + 2.6))
      bezier((cx + 0.2, cy + 1.9), (cx + 1.7, cy + 1.5), (cx + 0.5, cy + 2.6), (cx + 1.5, cy + 2.3))
      bezier((cx + 1.7, cy + 1.5), (cx + 3.1, cy + 0.5), (cx + 2.7, cy + 2.1), (cx + 3.3, cy + 1.3))
      bezier((cx + 3.1, cy + 0.5), (cx + 2.7, cy - 1), (cx + 4.2, cy + 0.6), (cx + 3.8, cy - 1.1))
      bezier((cx + 2.7, cy - 1), (cx + 0.8, cy - 1.6), (cx + 2.8, cy - 2), (cx + 1.4, cy - 2.1))
      bezier((cx + 0.8, cy - 1.6), (cx - 0.8, cy - 1.5), (cx + 0.7, cy - 2.4), (cx - 0.4, cy - 2.3))
      bezier((cx - 0.8, cy - 1.5), (cx - 2.8, cy - 0.8), (cx - 1.3, cy - 2.3), (cx - 2.8, cy - 1.7))
      bezier((cx - 2.8, cy - 0.8), (cx - 3.5, cy), (cx - 3.8, cy - 1.2), (cx - 4, cy - 0.3))
    }, close: true, fill: fill)
    cloud(34.25, 17.45, black)
    cloud(34.05, 17.75, luma(88%))
    label(34.05, 17.75, [Internet])
    label(3.5, 0.95, [主机1])
    label(10.3, 0.95, [主机2])
    label(22.5, 0.95, [主机$N$])
    label(3.5, -0.3, [111.123.15.4/24])
    label(16.5, 4.15, [⋯ ⋯])
  })),
  kind: image,
  caption: [题47图],
  numbering: none,
)

请回答下列问题。

#subquestions[
+ DHCP服务器可为主机2～主机N动态分配IP地址的最大范围是什么？主机2使用DHCP协议获取IP地址的过程中，发送的封装DHCP Discover报文的IP分组的源IP地址和目的IP地址分别是什么？
  \
+ 若主机2的ARP表为空，则该主机访问Internet时，发出的第一个以太网帧的目的MAC地址是什么？封装主机2发往Internet的IP分组的以太网帧的目的MAC地址是什么？
  \
+ 若主机1的子网掩码和默认网关分别配置为255.255.255.0和111.123.15.2，则该主机是否能访问WWW服务器？是否能访问Internet？请说明理由。
    
]
]
