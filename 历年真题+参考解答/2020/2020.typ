// 来源：内容来源/2022年计算机考试大纲.pdf
// 试题：书内第36～49页（PDF第40～53页），人工逐页录入，图表在题内重绘。
#import "../../template.typ": exam, choices, subquestions, statements
#show: exam.with(year: 2020, subject: "计算机学科专业基础", code: "408")
#set document(title: "2020年全国硕士研究生招生考试计算机学科专业基础试题")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz
#let emphasis = underline.with(stroke:(thickness:0.07em,dash:(array:(0pt,1em),phase:0.5em),cap:"round"),offset:0.16em)
#answer-state.update(false)

= 一、单项选择题：1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项是最符合题目要求的。

#question[
将一个 $10 times 10$ 对称矩阵 $M$ 的上三角部分的元素 $m_(i,j)$（$1 <= i <= j <= 10$）按列优先存入 C 语言的一维数组 N 中，元素 $m_(7,2)$ 在 N 中的下标是

#choices([15], [16], [22], [23])
]

#question[
对空栈 $S$ 进行 Push 和 Pop 操作，入栈序列为 a，b，c，d，e，经过 Push，Push，Pop，Push，Pop，Push，Push，Pop 操作后，得到的出栈序列是

#choices([b，a，c], [b，a，e], [b，c，a], [b，c，e])
]

#question[
对于任意一棵高度为5且有10个结点的二叉树，若采用顺序存储结构保存，每个结点占1个存储单元（仅存放结点的数据信息），则存放该二叉树需要的存储单元的数量至少是

#choices([31], [16], [15], [10])
]

#question[
已知森林 $F$ 及与之对应的二叉树 $T$，若 $F$ 的先根遍历序列是 a，b，c，d，e，f，后根遍历序列是 b，a，d，f，e，c，则 $T$ 的后序遍历序列是

#choices([b，a，d，f，e，c], [b，d，f，e，c，a], [b，f，e，d，c，a], [f，e，d，c，b，a])
]

#question[
下列给定的关键字输入序列中，不能生成如下二叉排序树的是

#align(center, diagram(node-stroke: 0.055em, edge-stroke: 0.055em, node-inset: 0pt,
  node((3.4em, 0em), text(size:0.85em)[4], radius: 0.7em),
  node((1.7em, -1.8em), text(size:0.85em)[2], radius: 0.7em),
  node((5.1em, -1.8em), text(size:0.85em)[5], radius: 0.7em),
  node((0em, -3.6em), text(size:0.85em)[1], radius: 0.7em),
  node((3.4em, -3.6em), text(size:0.85em)[3], radius: 0.7em),
  edge((3.4em, 0em), (1.7em, -1.8em)), edge((3.4em, 0em), (5.1em, -1.8em)),
  edge((1.7em, -1.8em), (0em, -3.6em)), edge((1.7em, -1.8em), (3.4em, -3.6em)),
))

#choices([4，5，2，1，3], [4，5，1，2，3], [4，2，5，3，1], [4，2，1，3，5])
]

#question[
修改递归方式实现的图的深度优先搜索（DFS）算法，将输出（访问）顶点信息的语句移到退出递归前（即执行输出语句后立即退出递归）。采用修改后的算法遍历有向无环图 $G$，若输出结果中包含 $G$ 中的全部顶点，则输出的顶点序列是 $G$ 的

#choices([拓扑有序序列], [逆拓扑有序序列], [广度优先搜索序列], [深度优先搜索序列])
]

#question[
已知无向图 $G$ 如下所示，使用克鲁斯卡尔（Kruskal）算法求图 $G$ 的最小生成树，加入到最小生成树中的边依次是

#align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  // 大纲 PDF 第 41 页，边权与顶点使用小于正文的字面。
  set-style(stroke:0.055em,content:(wrap:body =>
    box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  for (a,b) in (((0,0),(5.2,0)),((0,0),(0,-3.8)),((0,0),(2.6,-1.9)),
    ((0,-3.8),(2.6,-1.9)),((0,-3.8),(5.2,-3.8)),((2.6,-1.9),(5.2,0)),
    ((2.6,-1.9),(5.2,-3.8)),((5.2,0),(5.2,-3.8)),((5.2,0),(7.8,-1.9)),
    ((5.2,-3.8),(7.8,-1.9))) {line(a,b)}
  for (x,y,label) in ((0,0,[a]),(0,-3.8,[c]),(2.6,-1.9,[e]),(5.2,0,[b]),(5.2,-3.8,[d]),(7.8,-1.9,[f])) {
    circle((x,y),radius:0.65,fill:white);content((x,y),label)
  }
  for (x,y,label) in ((2.6,0.7,[20]),(-0.75,-1.9,[12]),(1.8,-0.6,[9]),
    (1.1,-2.15,[10]),(2.6,-4.5,[18]),(3.65,-0.6,[11]),(4.2,-2.15,[14]),
    (5.95,-1.9,[6]),(6.55,-0.65,[5]),(6.55,-3.25,[7])) {content((x,y),label)}
}))

#choices([(b，f)，(b，d)，(a，e)，(c，e)，(b，e)], [(b，f)，(b，d)，(b，e)，(a，e)，(c，e)], [(a，e)，(b，e)，(c，e)，(b，d)，(b，f)], [(a，e)，(c，e)，(b，e)，(b，f)，(b，d)])
]

#question[
若使用 AOE 网估算工程进度，则下列叙述中正确的是

#choices([关键路径是从源点到汇点边数最多的一条路径], [关键路径是从源点到汇点路径长度最长的路径], [增加任一关键活动的时间不会延长工程的工期], [缩短任一关键活动的时间将会缩短工程的工期])
]

#question[
下列关于大根堆（至少含2个元素）的叙述中，正确的是

Ⅰ．可以将堆看成一棵完全二叉树 \
Ⅱ．可以采用顺序存储方式保存堆 \
Ⅲ．可以将堆看成一棵二叉排序树 \
Ⅳ．堆中的次大值一定在根的下一层

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅰ、Ⅱ、Ⅳ], [仅Ⅰ、Ⅲ、Ⅳ])
]

#question[
依次将关键字5，6，9，13，8，2，12，15插入初始为空的4阶 B 树后，根结点中包含的关键字是

#choices([8], [6，9], [8，13], [9，12])
]

#question[
对大部分元素已有序的数组进行排序时，直接插入排序比简单选择排序效率更高，其原因是

Ⅰ．直接插入排序过程中元素之间的比较次数更少 \
Ⅱ．直接插入排序过程中所需要的辅助空间更少 \
Ⅲ．直接插入排序过程中元素的移动次数更少

#choices([仅Ⅰ], [仅Ⅲ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ和Ⅲ])
]

#question[
下列给出的部件中，其位数（宽度）一定与机器字长相同的是

#statements(columns: (1fr, 1fr), [Ⅰ．ALU], [Ⅱ．指令寄存器], [Ⅲ．通用寄存器], [Ⅳ．浮点寄存器],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [仅Ⅱ、Ⅲ、Ⅳ])
]

#question[
已知带符号整数用补码表示，float 型数据用 IEEE 754 标准表示。假定变量 $x$ 的类型只可能是 int 或 float，当 $x$ 的机器数为 C800 0000H 时，$x$ 的值可能是

#choices([$-7 times 2^27$], [$-2^16$], [$2^17$], [$25 times 2^27$])
]

#question[
在按字节编址、采用小端方式的32位计算机中，按边界对齐方式为以下 C 语言结构型变量 a 分配存储空间。

```c
struct record {
    short x1;
    int   x2;
} a;
```

若 a 的首地址为2020 FE00H，a 的成员变量 x2 的机器数为1234 0000H，则其中34H所在存储单元的地址是

#choices([2020 FE03H], [2020 FE04H], [2020 FE05H], [2020 FE06H])
]

#question[
下列关于 TLB 和 Cache 的叙述中，#emphasis[错误]的是

#choices([命中率都与程序局部性有关], [缺失后都需要去访问主存], [缺失处理都可以由硬件实现], [都由 DRAM 存储器组成])
]

#question[
某计算机采用16位定长指令字格式，操作码位数和寻址方式位数固定，指令系统有48条指令，支持直接、间接、立即、相对4种寻址方式。单地址指令中，直接寻址方式的可寻址范围是

#choices([0～255], [0～1023], [−128～127], [−512～511])
]

#question[
下列给出的处理器类型中，理想情况下，CPI 为1的是

#statements(columns: (1fr, 1fr), [Ⅰ．单周期 CPU], [Ⅱ．多周期 CPU], [Ⅲ．基本流水线 CPU], [Ⅳ．超标量流水线 CPU],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ])
]

#question[
下列关于“自陷”（Trap，也称陷阱）的叙述中，错误的是

#choices([自陷是通过陷阱指令预先设定的一类外部中断事件], [自陷可用于实现程序调试时的断点设置和单步跟踪], [自陷发生后 CPU 将转去执行操作系统内核相应程序], [自陷处理完成后将返回到陷阱指令的下一条指令执行])
]

#question[
QPI 总线是一种点对点全双工同步串行总线，总线上的设备可同时接收和发送信息，每个方向可同时传输20位信息（16位数据+4位校验位），每个 QPI 数据包有80位信息，分2个时钟周期传送，每个时钟周期传送2次。因此，QPI 总线带宽为：每秒传送次数×2 B×2。若 QPI 时钟频率为2.4 GHz，则总线带宽为

#choices([4.8 GB/s], [9.6 GB/s], [19.2 GB/s], [38.4 GB/s])
]

#question[
下列事件中，属于外部中断事件的是

#statements(columns: (1fr, 1fr), [Ⅰ．访存时缺页], [Ⅱ．定时器到时], [Ⅲ．网络数据包到达],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ和Ⅲ])
]

#question[
外部中断包括不可屏蔽中断（NMI）和可屏蔽中断。下列关于外部中断的叙述中，#emphasis[错误]的是

#choices([CPU 处于关中断状态时，也能响应 NMI 请求], [一旦可屏蔽中断请求信号有效，CPU 将立即响应], [不可屏蔽中断的优先级比可屏蔽中断的优先级高], [可通过中断屏蔽字改变可屏蔽中断的处理优先级])
]

#question[
若设备采用周期挪用 DMA 方式进行输入输出，每次 DMA 传送的数据块大小为512字节，相应的 I/O 接口中有一个32位数据缓冲寄存器。对于数据输入过程，下列叙述中，#emphasis[错误]的是

#choices([每准备好32位数据，DMA 控制器就发出一次总线请求], [相对于 CPU，DMA 控制器的总线使用权的优先级更高], [在整个数据块的传送过程中，CPU 不可以访问主存储器], [数据块传送结束时，会产生“DMA 传送结束”中断请求])
]

#question[
若多个进程共享同一个文件 F，则下列叙述中，正确的是

#choices([各进程只能用“读”方式打开文件 F], [在系统打开文件表中仅有一个表项包含 F 的属性], [各进程的用户打开文件表中关于 F 的表项内容相同], [进程关闭 F 时，系统删除 F 在系统打开文件表中的表项])
]

#question[
下列选项中，支持文件长度可变、随机访问的磁盘存储空间分配方式是

#choices([索引分配], [链接分配], [连续分配], [动态分区分配])
]

#question[
下列与中断相关的操作中，由操作系统完成的是

#statements(columns: (1fr, 1fr), [Ⅰ．保存被中断程序的断点], [Ⅱ．提供中断服务],
  [Ⅲ．初始化中断向量表], [Ⅳ．保存中断屏蔽字],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ], [仅Ⅱ、Ⅲ、Ⅳ])
]

#question[
下列与进程调度有关的因素中，在设计多级反馈队列调度算法时需要考虑的是

Ⅰ．就绪队列的数量 \
Ⅱ．就绪队列的优先级 \
Ⅲ．各就绪队列的调度算法 \
Ⅳ．进程在就绪队列间的迁移条件

#choices([仅Ⅰ、Ⅱ], [仅Ⅲ、Ⅳ], [仅Ⅱ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ和Ⅳ])
]

#question[
某系统中有 A、B 两类资源各6个，$t$ 时刻资源分配及需求情况如下表所示。

#align(center, table(columns: (auto, auto, auto, auto, auto), align: center,
  [进程], [A 已分配数量], [B 已分配数量], [A 需求总量], [B 需求总量],
  [P1], [2], [3], [4], [4],
  [P2], [2], [1], [3], [1],
  [P3], [1], [2], [3], [4],
))

$t$ 时刻安全性检测结果是

#choices([存在安全序列 P1、P2、P3], [存在安全序列 P2、P1、P3], [存在安全序列 P2、P3、P1], [不存在安全序列])
]

#question[
下列因素中，影响请求分页系统有效（平均）访存时间的是

#statements(columns: (1fr, 1fr), [Ⅰ．缺页率], [Ⅱ．磁盘读写时间],
  [Ⅲ．内存访问时间], [Ⅳ．执行缺页处理程序的 CPU 时间],
)

#choices([仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅳ], [仅Ⅰ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ和Ⅳ])
]

#question[
下列关于父进程与子进程的叙述中，#emphasis[错误]的是

#choices([父进程与子进程可以并发执行], [父进程与子进程共享虚拟地址空间], [父进程与子进程有不同的进程控制块], [父进程与子进程不能同时使用同一临界资源])
]

#question[
对于具备设备独立性的系统，下列叙述中，#emphasis[错误]的是

#choices([可以使用文件名访问物理设备], [用户程序使用逻辑设备名访问物理设备], [需要建立逻辑设备与物理设备之间的映射关系], [更换物理设备后必须修改访问该设备的应用程序])
]

#question[
某文件系统的目录项由文件名和索引节点号构成。若每个目录项长度为64字节，其中4个字节存放索引节点号，60个字节存放文件名，文件名由小写英文字母构成，则该文件系统能创建的文件数量的上限为

#choices([$2^26$], [$2^32$], [$2^60$], [$2^64$])
]

#question[
下列准则中，实现临界区互斥机制必须遵循的是

Ⅰ．两个进程不能同时进入临界区 \
Ⅱ．允许进程访问空闲的临界资源 \
Ⅲ．进程等待进入临界区的时间是有限的 \
Ⅳ．不能进入临界区的执行态进程立即放弃 CPU

#choices([仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ])
]

#question[
下图描述的协议要素是

#statements(columns: (1fr, 1fr, 1fr), [Ⅰ．语法], [Ⅱ．语义], [Ⅲ．时序])

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  content((0, 0.8), [发送方]); content((7, 0.8), [接收方])
  line((0, 0), (0, -7), mark: (end: ">", scale: 0.7))
  line((7, 0), (7, -7), mark: (end: ">", scale: 0.7))
  line((0, -0.8), (7, -2.5), mark: (end: ">", scale: 0.7))
  line((7, -2.7), (0, -4.4), mark: (end: ">", scale: 0.7))
  line((0, -4.6), (4.3, -5.6), mark: (end: ">", scale: 0.7))
  content((-0.4, -6.8), [时间], anchor: "east")
}))

#choices([仅Ⅰ], [仅Ⅱ], [仅Ⅲ], [Ⅰ、Ⅱ和Ⅲ])
]

#question[
下列关于虚电路网络的叙述中，#emphasis[错误]的是

#choices([可以确保数据分组传输顺序], [需要为每条虚电路预分配带宽], [建立虚电路时需要进行路由选择], [依据虚电路号（VCID）进行数据分组转发])
]

#question[
下图所示的网络中，冲突域和广播域的个数分别是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  let device(x, y, hub: false) = {
    merge-path({line((x - 0.9,y), (x - 0.9,y - 0.6), (x,y - 1.1), (x+0.9,y - 0.6), (x+0.9,y))},close:true,fill:luma(92%))
    merge-path({line((x - 0.9,y), (x,y+0.5), (x+0.9,y), (x,y - 0.5), (x - 0.9,y))}, close: true, fill: luma(94%))
    line((x,y - 0.5), (x,y - 1.1))
    line((x - 0.45,y+0.12), (x+0.45,y - 0.12), mark: (end: ">", scale: 0.6))
    if not hub {line((x+0.45,y+0.22), (x - 0.45,y - 0.02), mark: (end: ">", scale: 0.6))}
  }
  let laptop(x,y) = {
    merge-path({line((x - 0.45,y+0.8),(x+0.4,y+0.5),(x+0.15,y - 0.25),(x - 0.7,y+0.05))},close:true,fill:white)
    merge-path({line((x - 0.7,y+0.05),(x+0.15,y - 0.25),(x+0.6,y - 0.8),(x - 0.35,y - 0.55))},close:true,fill:luma(90%))
  }
  line((3,0),(15,0)); line((3,-0.5),(0,-3)); line((3,-0.5),(6,-3))
  line((15,-0.5),(12,-3)); line((15,-0.5),(18,-3))
  for (x1,x2,x3) in ((0,-2,2),(6,4,8),(12,10,14),(18,16,20)) {
    line((x1,-3.5),(x2,-6)); line((x1,-3.5),(x3,-6))
    content((x2,-6.25), image("../2012/assets/visio-2007-isometric-pc.png", width: 1.5em))
    laptop(x3,-6.2)
    device(x1,-3,hub:true)
  }
  device(3,0); device(15,0)
  merge-path({
    line((8.1,0.1),(8.1,-0.65))
    bezier((8.1,-0.65),(9.9,-0.65),(8.1,-1.2),(9.9,-1.2))
    line((9.9,-0.65),(9.9,0.1))
  },close:true,fill:white)
  circle((9,0.1),radius:(0.9,0.35),fill:white)
  line((8.5,0.2),(9.1,0.03),mark:(end:">",fill:black,scale:0.5))
  line((9.55,0.22),(9.1,0.1),mark:(end:">",fill:black,scale:0.5))
  line((8.8,-0.1),(8.6,0.12),mark:(end:">",fill:black,scale:0.5))
  line((9.25,0.07),(9.5,-0.12),mark:(end:">",fill:black,scale:0.5))
  content((3,1.3), text(size:0.8em)[以太网交换机])
  content((9,1.3), text(size:0.8em)[路由器])
  content((9,-2), text(size:0.8em)[100BaseT集线器])
}))

#choices([2，2], [2，4], [4，2], [4，4])
]

#question[
假设主机甲采用停—等协议向主机乙发送数据帧，数据帧长与确认帧长均为1000 B，数据传输速率是10 kbps，单向传播时延是200 ms，则甲的最大信道利用率为

#choices([80%], [66.7%], [44.4%], [40%])
]

#question[
某 IEEE 802.11 无线局域网中，主机 H 与 AP 之间发送或接收 CSMA/CA 帧的过程如下图所示。在 H 或 AP 发送帧前所等待的帧间间隔时间（IFS）中，最长的是

#align(center, cetz.canvas(length:1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  content((0,1.7),[H]); content((8,1.7),[AP])
  merge-path({line((-0.5,0.8),(0.5,0.5),(0.3,-0.1),(-0.7,0.2))},close:true,fill:white)
  merge-path({line((-0.7,0.2),(0.3,-0.1),(0.65,-0.5),(-0.3,-0.25))},close:true,fill:luma(90%))
  line((0.4,0.7),(0.65,1.1)); line((0.7,0.8),(0.85,1.2))
  merge-path({line((7.75,-0.3),(8.25,-0.3),(8.1,0.7),(7.9,0.7))},close:true,fill:white)
  line((8,0.7),(8,1.2)); circle((8,1.2),radius:0.15)
  line((0,-0.6),(0,-11.5),mark:(end:">",scale:0.8))
  line((8,-0.3),(8,-11.5),mark:(end:">",scale:0.8))
  let frame(y1,y2,back:false,name:[]) = {
    let slope = if back {0.45} else {-0.45}
    merge-path({line((0,y1),(8,y1+slope),(8,y2+slope),(0,y2))},close:true,fill:luma(96%))
    content((3.5,(y1+y2+slope)/2),text(size:0.85em)[#name])
    if back {line((3.5,(y1+y2)/2),(2,(y1+y2)/2-0.1),mark:(end:">",scale:0.7))}
    else {line((4.2,(y1+y2)/2-0.25),(5.5,(y1+y2)/2-0.35),mark:(end:">",scale:0.7))}
  }
  frame(-1.1,-2.1,name:[RTS]); frame(-3.6,-4.6,back:true,name:[CTS])
  frame(-5.2,-7.2,name:[DATA]); frame(-9.2,-10.2,back:true,name:[ACK])
  content((-0.2,-0.9),text(size:0.8em)[IFS1],anchor:"east")
  content((8.2,-2.85),text(size:0.8em)[IFS2],anchor:"west")
  content((-0.2,-4.9),text(size:0.8em)[IFS3],anchor:"east")
  content((8.2,-8.1),text(size:0.8em)[IFS4],anchor:"west")
  content((-0.2,-11.1),[时间],anchor:"east")
}))

#choices([IFS1], [IFS2], [IFS3], [IFS4])
]

#question[
若主机甲与主机乙已建立一条 TCP 连接，最大段长（MSS）为1 KB，往返时间（RTT）为2 ms，则在不出现拥塞的前提下，拥塞窗口从8 KB增长到32 KB所需的最长时间是

#choices([4 ms], [8 ms], [24 ms], [48 ms])
]

#question[
若主机甲与主机乙建立 TCP 连接时，发送的 SYN 段中的序号为1000，在断开连接时，甲发送给乙的 FIN 段中的序号为5001，则在无任何重传的情况下，甲向乙已经发送的应用层数据的字节数为

#choices([4002], [4001], [4000], [3999])
]

#question[
假设下图所示网络中的本地域名服务器只提供递归查询服务，其他域名服务器均只提供迭代查询服务；局域网内主机访问 Internet 上各服务器的往返时间（RTT）均为10 ms，忽略其他各种时延。若主机 H 通过超链接 http://www.abc.com/index.html 请求浏览纯文本 Web 页 index.html，则从点击超链接开始到浏览器接收到 index.html 页面为止，所需的最短时间与最长时间分别是

#align(center, cetz.canvas(length:1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  merge-path({
    bezier((9,0),(9,4),(6.8,1),(7,3))
    bezier((9,4),(14,5.5),(10,6),(12,6))
    bezier((14,5.5),(19,3.5),(16,7),(19,6))
    bezier((19,3.5),(17,-1),(21,1),(20,-1))
    bezier((17,-1),(12,-1.4),(16,-3),(13,-3))
    bezier((12,-1.4),(9,0),(9,-2),(7,-1))
  },close:true,fill:luma(97%))
  line((0,0),(5.5,0),stroke:0.35em)
  line((1,0),(1,2)); line((4.5,0),(4.5,2))
  line((2.6,0),(2.6,-1.4))
  line((5.3,2),(6.5,1.7),(6,1.3),(7.2,1),(8,1.4))
  content((1,2.3),image("../2012/assets/visio-2007-isometric-server.png",width:1.4em))
  merge-path({
    line((3.6,2.65),(3.6,1.9))
    bezier((3.6,1.9),(5.4,1.9),(3.6,1.35),(5.4,1.35))
    line((5.4,1.9),(5.4,2.65))
  },close:true,fill:white)
  circle((4.5,2.65),radius:(0.9,0.35),fill:white)
  line((4,2.75),(4.6,2.58),mark:(end:">",fill:black,scale:0.5))
  line((5.05,2.77),(4.6,2.65),mark:(end:">",fill:black,scale:0.5))
  line((4.3,2.45),(4.1,2.67),mark:(end:">",fill:black,scale:0.5))
  line((4.75,2.62),(5,2.43),mark:(end:">",fill:black,scale:0.5))
  content((2.6,-2),image("../2012/assets/visio-2007-isometric-pc.png",width:1.7em))
  content((1,4.25),text(size:0.8em)[本地域名])
  content((1,3.4),text(size:0.8em)[服务器])
  content((4.5,3.7),text(size:0.8em)[路由器])
  content((0.1,-0.8),text(size:0.8em)[局域网],anchor:"west")
  content((3.8,-2),[H]); content((10.7,4.65),text(size:0.8em)[Internet])
  for (x,y) in ((8.8,2.5),(14,4.6),(14.8,2),(12.5,-0.5)) {
    content((x,y),image("../2012/assets/visio-2007-isometric-server.png",width:1.4em))
  }
  for (x,y,label) in ((9.8,3,[com顶级]),(9.8,2.1,[域名服务器]),(15,5.1,[根域名]),
    (15,4.2,[服务器]),(15.8,2.5,[abc.com]),(15.8,1.6,[域名服务器]),(13.5,-0.5,[www.abc.com])) {
    content((x,y),text(size:0.8em,label),anchor:"west")
  }
}))

#choices([10 ms，40 ms], [10 ms，50 ms], [20 ms，40 ms], [20 ms，50 ms])
]

= 二、综合应用题：41～47小题，共70分。

#question[
（13分）定义三元组 $(a,b,c)$（$a$，$b$，$c$ 均为整数）的距离 $D=abs(a-b)+abs(b-c)+abs(c-a)$。给定3个非空整数集合 S1、S2 和 S3，按升序分别存储在3个数组中。请设计一个尽可能高效的算法，计算并输出所有可能的三元组 $(a,b,c)$（$a in "S1"$，$b in "S2"$，$c in "S3"$）中的最小距离。例如，S1 = {−1，0，9}，S2 = {−25，−10，10，11}，S3 = {2，9，17，30，41}，则最小距离为2，相应的三元组为(9，10，9)。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。
+ 说明你所设计算法的时间复杂度和空间复杂度。

]
]

#question[
（10分）若任一个字符的编码都不是其他字符编码的前缀，则称这种编码具有前缀特性。现有某字符集（字符个数≥2）的不等长编码，每个字符的编码均为二进制的0、1序列，最长为 $L$ 位，且具有前缀特性。请回答下列问题。

#subquestions[
+ 哪种数据结构适宜保存上述具有前缀特性的不等长编码？
+ 基于你所设计的数据结构，简述从0/1串到字符串的译码过程。
+ 简述判定某字符集的不等长编码是否具有前缀特性的过程。

]
]

#question[
（13分）有实现 $x times y$ 的两个 C 语言函数如下：

```c
unsigned umul(unsigned x, unsigned y) { return x * y; }
int imul(int x, int y) { return x * y; }
```

假定某计算机 M 中 ALU 只能进行加减运算和逻辑运算。请回答下列问题。

#subquestions[
+ 若 M 的指令系统中没有乘法指令，但有加法、减法和移位等指令，则在 M 上也能实现上述两个函数中的乘法运算，为什么？
+ 若 M 的指令系统中有乘法指令，则基于 ALU、移位器、寄存器以及相应控制逻辑实现乘法指令时，控制逻辑的作用是什么？
+ 针对以下三种情况：a）没有乘法指令；b）有使用 ALU 和移位器实现的乘法指令；c）有使用阵列乘法器实现的乘法指令，函数 umul() 在哪种情况下执行时间最长？哪种情况下执行时间最短？说明理由。
+ $n$ 位整数乘法指令可保存 $2n$ 位乘积，当仅取低 $n$ 位为乘积时，其结果可能会发生溢出。当 $n=32$、$x=2^31-1$、$y=2$ 时，带符号整数乘法指令和无符号整数乘法指令得到的 $x times y$ 的 $2n$ 位乘积分别是什么（用十六进制表示）？此时函数 umul() 和 imul() 的返回结果是否溢出？对于无符号整数乘法运算，当仅取乘积的低 $n$ 位作为乘法结果时，如何用 $2n$ 位乘积进行溢出判断？

]
]

#question[
（10分）假定主存地址为32位，按字节编址，指令 Cache 和数据 Cache 与主存之间均采用8路组相联映射方式、直写（Write Through）写策略和 LRU 替换算法，主存块大小为64 B，数据区容量各为32 KB，开始时 Cache 均为空。请回答下列问题。

#subquestions[
+ Cache 每一行中标记（Tag）、LRU 位各占几位？是否有修改位？
+ 有如下 C 语言程序段：
  
  ```c
  for (k = 0; k < 1024; k++)
      s[k] = 2 * s[k];
  ```
  
  若数组 s 及变量 k 均为 int 型，int 型数据占4 B，变量 k 分配在寄存器中，数组 s 在主存中的起始地址为0080 00C0H，则该程序段执行过程中，访问数组 s 的数据 Cache 缺失次数为多少？ \
+ 若 CPU 最先开始的访问操作是读取主存单元0001 0003H中的指令，简要说明从 Cache 中访问该指令的过程，包括 Cache 缺失处理过程。

]
]

#question[
（7分）现有5个操作 A、B、C、D 和 E，操作 C 必须在 A 和 B 完成后执行，操作 E 必须在 C 和 D 完成后执行。请使用信号量的 wait()、signal() 操作（P、V 操作）描述上述操作之间的同步关系，并说明所用信号量及其初值。
]

#question[
（8分）某32位系统采用基于二级页表的请求分页存储管理方式，按字节编址，页目录项和页表项长度均为4字节，虚拟地址结构如下所示。

#align(center, table(columns:(10fr,10fr,12fr), align:center,
  [页目录号（10位）], [页号（10位）], [页内偏移量（12位）],
))

某 C 程序中数组 a[1024][1024] 的起始虚拟地址为1080 0000H，数组元素占4字节。该程序运行时，其进程的页目录起始物理地址为0020 1000H，请回答下列问题。

#subquestions[
+ 数组元素 a[1][2] 的虚拟地址是什么？对应的页目录号和页号分别是什么？对应的页目录项的物理地址是什么？若该页目录项中存放的页框号为00301H，则 a[1][2] 所在页对应的页表项的物理地址是什么？
+ 数组 a 在虚拟地址空间中所占区域是否必须连续？在物理地址空间中所占区域是否必须连续？
+ 已知数组 a 按行优先方式存放，若对数组 a 分别按行遍历和按列遍历，则哪一种遍历方式的局部性更好？

]
]

#question[
（9分）某校园网有两个局域网，通过路由器 R1、R2 和 R3 互联后接入 Internet，S1 和 S2 为以太网交换机。局域网采用静态 IP 地址配置，路由器部分接口以及各主机的 IP 地址如题47图所示。

#figure(cetz.canvas(length:1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  let label(x,y,body,anchor:"center") = content((x,y),text(size:0.7em)[#body],anchor:anchor)
  let router(x,y) = content((x,y),image("../2009/assets/router-symbol.svg",width:2em,height:1.8em))
  let switch(x,y,name) = {
    merge-path({line((x - 1,y),(x - 1,y - 0.6),(x,y - 1.1),(x+1,y - 0.6),(x+1,y))},close:true,fill:luma(90%))
    merge-path({line((x - 1,y),(x,y+0.5),(x+1,y),(x,y - 0.5))},close:true,fill:luma(92%))
    line((x,y - 0.5),(x,y - 1.1))
    line((x - 0.6,y+0.1),(x+0.4,y - 0.2),mark:(end:">",scale:0.6))
    line((x+0.6,y+0.3),(x - 0.4,y),mark:(end:">",scale:0.6))
    label(x - 0.5,y+1.2,name)
  }
  merge-path({
    bezier((0,5),(0,7),(-1,5),(-1,7))
    bezier((0,7),(3.3,7),(0.8,8),(3,8))
    bezier((3.3,7),(3.3,5),(4.3,7),(4.3,5))
    bezier((3.3,5),(0,5),(2.4,4.2),(0.5,4.2))
  },close:true,fill:luma(90%))
  label(1.65,6,[Internet])
  line((3.5,6),(6,6),(6,3.5))
  line((0,0),(0,3.5),(12,3.5),(12,0))
  line((0,0),(6,0)); line((12,0),(18,0))
  line((6,-0.5),(2.8,-3)); line((6,-0.5),(8.3,-3))
  line((18,-0.5),(15.2,-3)); line((18,-0.5),(20.7,-3))
  router(6,3.5); router(0,0); router(12,0)
  switch(6,0,[S1]); switch(18,0,[S2])
  label(-0.8,1,[NAT]); label(10.6,1,[NAT])
  label(2.55,4.2,[203.10.2.1/30])
  label(7.2,3.9,[203.10.2.5/30],anchor:"west")
  label(0.2,1.5,[203.10.2.2/30],anchor:"west")
  label(12.2,1.5,[203.10.2.6/30],anchor:"west")
  label(1.1,0.5,[192.168.1.1],anchor:"west")
  label(13.1,0.5,[192.168.1.1],anchor:"west")
  content((2.8,-3.2),image("../2012/assets/visio-2007-isometric-server.png",width:1.5em))
  content((8.3,-3.2),image("../2012/assets/visio-2007-isometric-pc.png",width:1.7em))
  content((15.2,-3.2),image("../2012/assets/visio-2007-isometric-pc.png",width:1.7em))
  merge-path({line((20.3,-2.5),(21.3,-2.8),(21,-3.6),(20,-3.3))},close:true,fill:white)
  merge-path({line((20,-3.3),(21,-3.6),(21.5,-4),(20.4,-3.8))},close:true,fill:luma(92%))
  for (x,name,ip) in ((2.8,[Web服务器],[192.168.1.2]),(8.3,[H1],[192.168.1.3]),
    (15.2,[H2],[192.168.1.2]),(20.7,[H3],[192.168.1.3])) {
    label(x,-4.6,name); label(x,-5.6,ip)
  }
}),caption:[题47图],numbering:none)

假设 NAT 转换表结构为：

#align(center, table(columns:(1fr,1fr,1fr,1fr),align:center,
  table.cell(colspan:2)[外网], table.cell(colspan:2)[内网],
  [IP 地址], [端口号], [IP 地址], [端口号],
  [], [], [], [],
))

请回答下列问题。

#subquestions[
+ 为使 H2 和 H3 能够访问 Web 服务器（使用默认端口号），需要进行什么配置？给出具体配置。
+ 若 H2 主动访问 Web 服务器时，将 HTTP 请求报文封装到 IP 数据报 P 中发送，则 H2 发送的 P 的源 IP 地址和目的 IP 地址分别是什么？经过 R3 转发后，P 的源 IP 地址和目的 IP 地址分别是什么？经过 R2 转发后，P 的源 IP 地址和目的 IP 地址分别是什么？

]
]
