#import "../../template.typ": exam, choices, subquestions, statements
#show: exam.with(year: 2010, subject: "计算机学科专业基础", code: "408")
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#answer-state.update(false)
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/cetz:0.5.2" as cetz

#set document(title: "2010年全国硕士研究生入学统一考试计算机科学与技术学科联考计算机学科专业基础综合试题")
= 一、单项选择题：第1～40小题，每小题2分，共80分。下列每题给出的四个选项中，只有一个选项最符合题目要求。
#question[
若元素
a，b，c，d，e，f依次进栈，允许进栈、退栈操作交替进行，但不允许连续三次进行退栈操作，则不可能得到的出栈序列是

#choices(
  [d，c，e，b，f，a],
  [c，b，d，a，e，f],
  [b，c，a，e，f，d],
  [a，f，e，d，c，b],
)
]

#question[
某队列允许在其两端进行入队操作，但仅允许在一端进行出队操作。若元素
a，b，c，d， e依次入此队列后再进行出队操作，则不可能得到的出队序列是

#choices(
  [b，a，c，d，e],
  [d，b，a，c，e],
  [d，b，c，a，e],
  [e，c，b，a，d],
)
]

#question[
下列线索二叉树中（用虚线表示线索），符合后序线索树定义的是

#choices(
  [#cetz.canvas(length: 2.50em, baseline: (0, 0), {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let thread = (
      paint: black,
      thickness: 0.055em,
      dash: (array: (0pt, 0.15em), phase: 0em),
      cap: "round",
    )
    let tree-node(pos, body) = {
      circle(pos, radius: 0.36, fill: white, stroke: 0.055em)
      content(pos, text(size: 0.82em)[#body])
    }

    hide(rect((-1.90, -1.55), (2.35, 1.70), stroke: none), bounds: true)
    line((0, 1.20), (-0.90, 0.25), stroke: 0.055em)
    line((0, 1.20), (0.90, 0.25), stroke: 0.055em)
    line((-0.90, 0.25), (0, -0.75), stroke: 0.055em)
    tree-node((0, 1.20), [a])
    tree-node((-0.90, 0.25), [b])
    tree-node((0.90, 0.25), [c])
    tree-node((0, -0.75), [d])

    bezier(
      (-1.22, 0.06), (-0.18, 1.51),
      (-2.00, -0.14), (-1.62, 1.58),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.56, 0.18), (-0.54, 0.27),
      (0.20, -0.02), (-0.10, 0.08),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (1.22, 0.06), (0.34, -0.69),
      (1.70, -0.05), (1.35, -0.73),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0, -1.11), (0.90, -0.11),
      (-0.12, -1.53), (0.88, -1.38),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.29, -0.95), (1.47, -1.13),
      (0.72, -0.96), (1.12, -1.06),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((1.59, -1.13), text(size: 0.78em)[NULL], anchor: "west")
  })],
  [#cetz.canvas(length: 2.50em, baseline: (0, 0), {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let thread = (
      paint: black,
      thickness: 0.055em,
      dash: (array: (0pt, 0.15em), phase: 0em),
      cap: "round",
    )
    let tree-node(pos, body) = {
      circle(pos, radius: 0.36, fill: white, stroke: 0.055em)
      content(pos, text(size: 0.82em)[#body])
    }

    hide(rect((-2.45, -1.55), (2.45, 1.70), stroke: none), bounds: true)
    line((0, 1.20), (-0.90, 0.25), stroke: 0.055em)
    line((0, 1.20), (0.90, 0.25), stroke: 0.055em)
    line((-0.90, 0.25), (0, -0.75), stroke: 0.055em)
    tree-node((0, 1.20), [a])
    tree-node((-0.90, 0.25), [b])
    tree-node((0.90, 0.25), [c])
    tree-node((0, -0.75), [d])

    bezier(
      (-1.25, 0.20), (-2.02, 0.16),
      (-1.55, 0.18), (-1.76, 0.17),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((-2.14, 0.16), text(size: 0.78em)[NULL], anchor: "east")
    bezier(
      (1.25, 0.18), (2.02, 0.04),
      (1.52, 0.12), (1.76, 0.07),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((2.14, 0.04), text(size: 0.78em)[NULL], anchor: "west")
    bezier(
      (-0.18, -1.07), (-0.90, -0.11),
      (-0.82, -1.54), (-1.34, -1.08),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.18, -1.07), (0.18, 0.89),
      (1.18, -1.54), (1.12, 0.28),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.62, 0.12), (-0.16, 0.89),
      (0.24, -0.03), (0.09, 0.64),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
  })],
  [#cetz.canvas(length: 2.50em, baseline: (0, 0), {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let thread = (
      paint: black,
      thickness: 0.055em,
      dash: (array: (0pt, 0.15em), phase: 0em),
      cap: "round",
    )
    let tree-node(pos, body) = {
      circle(pos, radius: 0.36, fill: white, stroke: 0.055em)
      content(pos, text(size: 0.82em)[#body])
    }

    hide(rect((-1.90, -1.55), (2.50, 1.70), stroke: none), bounds: true)
    line((0, 1.20), (-0.90, 0.25), stroke: 0.055em)
    line((0, 1.20), (0.90, 0.25), stroke: 0.055em)
    line((-0.90, 0.25), (0, -0.75), stroke: 0.055em)
    tree-node((0, 1.20), [a])
    tree-node((-0.90, 0.25), [b])
    tree-node((0.90, 0.25), [c])
    tree-node((0, -0.75), [d])

    bezier(
      (-1.22, 0.06), (-0.18, 1.51),
      (-2.00, -0.14), (-1.62, 1.58),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (-0.18, -1.07), (-0.90, -0.11),
      (-0.82, -1.52), (-1.34, -1.04),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.62, 0.10), (0.27, -0.50),
      (0.36, -0.02), (0.24, -0.26),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.18, -1.07), (0.90, -0.11),
      (0.82, -1.53), (1.34, -1.04),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (1.25, 0.22), (2.02, 0.20),
      (1.53, 0.21), (1.78, 0.20),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((2.14, 0.20), text(size: 0.78em)[NULL], anchor: "west")
  })],
  [#cetz.canvas(length: 2.50em, baseline: (0, 0), {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let thread = (
      paint: black,
      thickness: 0.055em,
      dash: (array: (0pt, 0.15em), phase: 0em),
      cap: "round",
    )
    let tree-node(pos, body) = {
      circle(pos, radius: 0.36, fill: white, stroke: 0.055em)
      content(pos, text(size: 0.82em)[#body])
    }

    hide(rect((-2.35, -1.55), (2.10, 1.70), stroke: none), bounds: true)
    line((0, 1.20), (-0.90, 0.25), stroke: 0.055em)
    line((0, 1.20), (0.90, 0.25), stroke: 0.055em)
    line((-0.90, 0.25), (0, -0.75), stroke: 0.055em)
    tree-node((0, 1.20), [a])
    tree-node((-0.90, 0.25), [b])
    tree-node((0.90, 0.25), [c])
    tree-node((0, -0.75), [d])

    bezier(
      (1.25, 0.28), (1.74, -0.43),
      (1.72, 0.20), (1.95, -0.15),
      stroke: thread,
    )
    bezier(
      (1.74, -0.43), (0.35, 1.30),
      (2.18, -1.13), (2.08, 1.56),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.58, 0.18), (-0.54, 0.28),
      (0.18, -0.06), (-0.10, 0.12),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (0.20, -1.07), (-0.58, 0.07),
      (0.93, -1.48), (0.80, -0.18),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (-1.24, 0.07), (-0.35, -0.72),
      (-1.86, -0.16), (-1.18, -0.80),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    bezier(
      (-0.35, -0.88), (-1.68, -1.13),
      (-0.79, -0.99), (-1.30, -1.10),
      stroke: thread, mark: (end: ">", fill: black, scale: 0.67),
    )
    content((-1.82, -1.13), text(size: 0.78em)[NULL], anchor: "east")
  })],
)
]

#question[
在下图所示的平衡二叉树中，插入关键字48后得到一棵新平衡二叉树。在新平衡二叉树中，关键字37所在结点的左、右子结点中保存的关键字分别是

#align(center)[
  #diagram(
    node-stroke: 0.8pt,
    node-fill: white,
    spacing: (0.45em, 1em),
    node-inset: 0pt,
    node((2, 0), text(size:0.85em)[24], radius: 0.84em),
    node((1, 1), text(size:0.85em)[13], radius: 0.84em),
    node((3, 1), text(size:0.85em)[53], radius: 0.84em),
    node((2, 2), text(size:0.85em)[37], radius: 0.84em),
    node((4, 2), text(size:0.85em)[90], radius: 0.84em),
    edge((2, 0), (1, 1)),
    edge((2, 0), (3, 1)),
    edge((3, 1), (2, 2)),
    edge((3, 1), (4, 2)),
  )
]

#choices(
  [13、48],
  [24、48],
  [24、53],
  [24、90],
)
]

#question[
在一棵度为4的树
T中，若有20个度为4的结点，10个度为3的结点，1个度为2的结点，10个度为1的结点，则树
T的叶结点个数是

#choices(
  [41],
  [82],
  [113],
  [122],
)
]

#question[
对
n（n≥2）个权值均不相同的字符构造哈夫曼树。下列关于该哈夫曼树的叙述中，错误

的是

#choices(
  [该树一定是一棵完全二叉树],
  [树中一定没有度为1的结点],
  [树中两个权值最小的结点一定是兄弟结点],
  [树中任一非叶结点的权值一定不小于下一层任一结点的权值],
)
]

#question[
若无向图 G =（V，E）中含有7个顶点，要保证图
G在任何情况下都是连通的，则需要的边数最少是

#choices(
  [6],
  [15],
  [16],
  [21],
)
]

#question[
对下图进行拓扑排序，可以得到不同拓扑序列的个数是

#align(center)[
  #diagram(
    node-stroke: 0.8pt,
    node-fill: white,
    edge-stroke: 0.8pt,
    mark-scale: 80%,
    spacing: (1em, 0.45em),
    node((0, 1), [a], radius: 0.82em),
    node((2, 0), [e], radius: 0.82em),
    node((4, 1), [d], radius: 0.82em),
    node((1, 2), [b], radius: 0.82em),
    node((3, 2), [c], radius: 0.82em),
    edge((0, 1), (2, 0), "-|>"),
    edge((2, 0), (4, 1), "-|>"),
    edge((0, 1), (1, 2), "-|>"),
    edge((0, 1), (3, 2), "-|>"),
    edge((1, 2), (3, 2), "-|>"),
    edge((3, 2), (4, 1), "-|>"),
  )
]

#choices(
  [4],
  [3],
  [2],
  [1],
)
]

#question[
已知一个长度为16的顺序表
L，其元素按关键字有序排列。若采用折半查找法查找一个
L中不存在的元素，则关键字的比较次数最多是

#choices(
  [4],
  [5],
  [6],
  [7],
)
]

#question[
采用递归方式对顺序表进行快速排序。下列关于递归次数的叙述中，正确的是

#choices(
  [递归次数与初始数据的排列次序无关],
  [每次划分后，先处理较长的分区可以减少递归次数],
  [每次划分后，先处理较短的分区可以减少递归次数],
  [递归次数与每次划分后得到的分区的处理顺序无关],
)
]

#question[
对一组数据（2，12，16，88，5，10）进行排序，若前三趟排序结果如下：

第一趟排序结果：2，12，16，5，10，88

第二趟排序结果：2，12，5，10，16，88

第三趟排序结果：2，5，10，12，16，88

则采用的排序方法可能是

#choices(
  [起泡排序],
  [希尔排序],
  [归并排序],
  [基数排序],
)
]

#question[
下列选项中，能缩短程序的CPU执行时间的措施是

I. 提高CPU时钟频率 II. 优化数据通路结构

Ⅲ. 对程序进行编译优化

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅰ和Ⅲ],
  [仅Ⅱ和Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]

#question[
假定有4个整数用8位补码分别表示为
r1 = FEH，r2 = F2H，r3 = 90H，r4 = F8H。
若将运算结果存放在一个8位寄存器中，则下列运算中会发生溢出的是

#choices(
  [r1×r2],
  [r2×r3],
  [r1×r4],
  [r2×r4],
)
]

#question[
假定变量 i、f和 d的数据类型分别为 int、float和
double（int用补码表示，float和
double分别用IEEE754单精度和双精度浮点数格式表示），已知
$i = 785$，$f = 1.5678 times 10^3$，$d = 1.5 times 10^100$。若在32位机器中执行下列关系表达式，则结果为“真”的是

#statements(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  [I. `i == (int)(float)i`],
  [II. `f == (float)(int)f`],
  [III. `f == (float)(double)f`],
  [IV. `(d + f) - d == f`],
)

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅰ和Ⅲ],
  [仅Ⅱ和Ⅲ],
  [仅Ⅲ和Ⅳ],
)
]

#question[
假定用若干个
$2 "K" times 4$位的芯片组成一个
$8 "K" times 8$位的存储器，则地址0B1FH所在芯片的最小地址是

#choices(
  [0000H],
  [0600H],
  [0700H],
  [0800H],
)
]

#question[
下列有关 RAM 和 ROM的叙述中，正确的是

I. RAM是易失性存储器，ROM是非易失性存储器

Ⅱ. RAM和ROM都采用随机存取方式进行信息访问

Ⅲ. RAM和ROM都可用作 Cache

Ⅳ. RAM和ROM都需要进行刷新

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅱ和Ⅲ],
  [仅Ⅰ、Ⅱ和Ⅳ],
  [仅Ⅱ、Ⅲ和Ⅳ],
)
]

#question[
下列命中组合情况中，一次访存过程中不可能发生的是

#choices(
  [TLB未命中、Cache未命中、Page未命中],
  [TLB未命中、Cache命中、Page命中],
  [TLB命中、Cache未命中、Page命中],
  [TLB命中、Cache命中、Page未命中],
)
]

#question[
下列寄存器中，汇编语言程序员可见的是

#choices(
  [存储器地址寄存器（MAR）],
  [程序计数器（PC）],
  [存储器数据寄存器（MDR）],
  [指令寄存器（IR）],
)
]

#question[
下列选项中，不会引起指令流水线阻塞的是

#choices(
  [数据旁路（转发）],
  [数据相关],
  [条件转移],
  [资源冲突],
)
]

#question[
下列选项中的英文缩写均为总线标准的是

#choices(
  [PCI、CRT、USB、EISA],
  [ISA、CPI、VESA、EISA],
  [ISA、SCSI、RAM、MIPS],
  [ISA、EISA、PCI、PCI-Express],
)
]

#question[
单级中断系统中，中断服务程序内的执行顺序是

#statements(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 0.6em,
  [I. 保护现场], [II. 开中断], [III. 关中断], [IV. 保存断点],
  [V. 中断事件处理], [VI. 恢复现场], [VII. 中断返回], [],
)

#choices(
  [$"I" arrow.r "V" arrow.r "VI" arrow.r "II" arrow.r "VII"$],
  [$"III" arrow.r "I" arrow.r "V" arrow.r "VII"$],
  [$"III" arrow.r "IV" arrow.r "V" arrow.r "VI" arrow.r "VII"$],
  [$"IV" arrow.r "I" arrow.r "V" arrow.r "VI" arrow.r "VII"$],
)
]

#question[
假定一台计算机的显示存储器用DRAM芯片实现，若要求显示分辨率为
$1 6 0 0 times 1 2 0 0$颜色深度为24位，帧频为85Hz，显存总带宽的
50%用来刷新屏幕，则需要的显存总带宽至少约为

#choices(
  [245 Mbps],
  [979 Mbps],
  [1958 Mbps],
  [7834 Mbps],
)
]

#question[
下列选项中，操作系统提供给应用程序的接口是

#choices(
  [系统调用],
  [中断],
  [库函数],
  [原语],
)
]

#question[
下列选项中，导致创建新进程的操作是

I. 用户登录成功 II. 设备分配 III. 启动程序执行

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅱ和Ⅲ],
  [仅Ⅰ和Ⅲ],
  [I、Ⅱ和Ⅲ],
)
]

#question[
设与某资源关联的信号量初值为3，当前值为1。若
$M$表示该资源的可用个数，$N$表示等待该资源的进程数，则 $M$、$N$分别是

#choices(
  [0、1],
  [1、0],
  [1、2],
  [2、0],
)
]

#question[
下列选项中，降低进程优先级的合理时机是

#choices(
  [进程的时间片用完],
  [进程刚完成 I/O，进入就绪队列],
  [进程长期处于就绪队列中],
  [进程从就绪态转为运行态],
)
]

#question[
进程 P0 和 P1的共享变量定义及其初值为：

#raw("boolean flag[2];") \
#raw("int turn = 0;") \
#raw("flag[0] = FALSE; flag[1] = FALSE;")

若进程P0和P1访问临界资源的类C伪代码实现如下：

#figure(block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.65em,
    box(width: 100%, stroke: 0.5pt, inset: (x: 0.55em, y: 0.35em))[
      #raw("void P0()   // 进程 P0") \
      #raw("{") \
      #h(1.4em)#raw("while (TRUE) {") \
      #h(2.8em)#raw("flag[0] = TRUE; turn = 1;") \
      #h(2.8em)#raw("while (flag[1] && (turn == 1));") \
      #h(2.8em)临界区； \
      #h(2.8em)#raw("flag[0] = FALSE;") \
      #h(1.4em)#raw("}") \
      #raw("}")
    ],
    box(width: 100%, stroke: 0.5pt, inset: (x: 0.55em, y: 0.35em))[
      #raw("void P1()   // 进程 P1") \
      #raw("{") \
      #h(1.4em)#raw("while (TRUE) {") \
      #h(2.8em)#raw("flag[1] = TRUE; turn = 0;") \
      #h(2.8em)#raw("while (flag[0] && (turn == 0));") \
      #h(2.8em)临界区； \
      #h(2.8em)#raw("flag[1] = FALSE;") \
      #h(1.4em)#raw("}") \
      #raw("}")
    ],
  )
], kind: image)

则并发执行进程P0和P1时产生的情形是

#choices(
  [不能保证进程互斥进入临界区，会出现“饥饿”现象],
  [不能保证进程互斥进入临界区，不会出现“饥饿”现象],
  [能保证进程互斥进入临界区，会出现“饥饿”现象],
  [能保证进程互斥进入临界区，不会出现“饥饿”现象],
)
]

#question[
某基于动态分区存储管理的计算机，其主存容量为55
MB（初始为空闲），采用最佳适配（Best
Fit）算法，分配和释放的顺序为：分配15 MB、分配30 MB、释放15 MB、分配8
MB、分配6 MB，此时主存中最大空闲分区的大小是

#choices(
  [7 MB],
  [9 MB],
  [10 MB],
  [15 MB],
)
]

#question[
某计算机采用二级页表的分页存储管理方式，按字节编址，页大小为
$2^(1 0)$字节，页表项大小为2字节，逻辑地址结构为：页目录号 页号
页内偏移量，逻辑地址空间大小为
$2^(1 6)$页，则表示整个逻辑地址空间的页目录表中包含表项的个数至少是

#choices(
  [64],
  [128],
  [256],
  [512],
)
]

#question[
设文件索引节点中有7个地址项，其中4个地址项是直接地址索引，2个地址项是一级间接地址索引，1个地址项是二级间接地址索引，每个地址项大小为4字节。若磁盘索引块和磁盘数据块大小均为256字节，则可表示的单个文件最大长度是

#choices(
  [33KB],
  [519KB],
  [1057KB],
  [16513KB],
)
]

#question[
设置当前工作目录的主要目的是

#choices(
  [节省外存空间],
  [节省内存空间],
  [加快文件的检索速度],
  [加快文件的读/写速度],
)
]

#question[
本地用户通过键盘登录系统时，首先获得键盘输入信息的程序是

#choices(
  [命令解释程序],
  [中断处理程序],
  [系统调用服务程序],
  [用户登录程序],
)
]

#question[
下列选项中，不属于网络体系结构所描述的内容是

#choices(
  [网络的层次],
  [每一层使用的协议],
  [协议的内部实现细节],
  [每一层必须完成的功能],
)
]

#question[
在下图所示的采用“存储-转发”方式的分组交换网络中，所有链路的数据传输速率为
100
Mbps，分组大小为1000B，其中分组头大小为20B。若主机H1向主机H2发送一个大小为980000B的文件，则在不考虑分组拆装时间和传播延迟的情况下，从H1发送开始到H2接收完为止，需要的时间至少是

#align(center)[
  #cetz.canvas(length: 0.72cm, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let host(x, label) = {
      // 对照2012版考纲书内28页：原图是 COMPS 的完整 PC 母版。
      // 2003与2007版轮廓相同，扫描图不足以区分具体版本。
      content((x - 0.05, 1.27), box(fill: white, inset: 0pt)[
        #image("../../assets/network/visio-2003-pc.svg",
          width: 0.72cm, height: 0.72cm, fit: "contain")
      ])
      content((x, 0.40), [#text(size: 0.78em)[#label]])
    }

    let router(x, y) = content((x, y), box(fill: white, inset: 0pt)[
      #image("../../assets/network/router-symbol.svg",
        width: 0.78cm, height: 0.58cm, fit: "stretch")
    ])

    hide(rect((-0.50, -0.50), (9.90, 2.05), stroke: none), bounds: true)

    // Draw links first so the symbols cleanly cover their endpoints.
    line((0.38, 1.25), (2.65, 1.25), stroke: 0.55pt)
    line((3.45, 1.25), (6.45, 1.25), stroke: 0.55pt)
    line((7.25, 1.25), (9.08, 1.25), stroke: 0.55pt)
    line((3.18, 0.98), (4.63, 0.10), stroke: 0.55pt)
    line((5.37, 0.10), (6.82, 0.98), stroke: 0.55pt)

    host(0, [H1])
    router(3.05, 1.25)
    router(6.85, 1.25)
    router(5.00, 0.02)
    host(9.45, [H2])
  })
]

#choices(
  [80 ms],
  [80.08 ms],
  [80.16 ms],
  [80.24 ms],
)
]

#question[
某自治系统内采用 RIP协议，若该自治系统内的路由器
R1收到其邻居路由器 R2的距离矢量，距离矢量中包含信息
〈net1，16〉，则能得出的结论是

#choices(
  [R2可以经过R1到达net1，跳数为17],
  [R2可以到达net1，跳数为16],
  [R1可以经过R2到达net1，跳数为17],
  [R1不能经过R2到达net1],
)
]

#question[
若路由器R因为拥塞丢弃IP分组，则此时R可向发出该IP分组的源主机发送的ICMP报文类型是

#choices(
  [路由重定向],
  [目的不可达],
  [源抑制],
  [超时],
)
]

#question[
某网络的IP地址空间为192.168.5.0/24，采用定长子网划分，子网掩码为255.255.255.248，则该网络中的最大子网个数、每个子网内的最大可分配地址个数分别是

#choices(
  [32、8],
  [32、6],
  [8、32],
  [8、30],
)
]

#question[
下列网络设备中，能够抑制广播风暴的是

#statements(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 0.6em,
  [I. 中继器], [II. 集线器], [III. 网桥], [IV. 路由器],
)

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅲ],
  [仅Ⅲ和Ⅳ],
  [仅Ⅳ],
)
]

#question[
主机甲和主机乙之间已建立了一个TCP连接，TCP最大段长度为1000字节。若主机甲的当前拥塞窗口为4000字节，在主机甲向主机乙连续发送两个最大段后，成功收到主机乙发送的对第一个段的确认段，确认段中通告的接收窗口大小为2000字节，则此时主机甲还可以向主机乙发送的最大字节数是

#choices(
  [1000],
  [2000],
  [3000],
  [4000],
)
]

#question[
如果本地域名服务器无缓存，当采用递归方法解析另一网络某主机域名时，用户主机、本地域名服务器发送的域名请求消息数分别为

#choices(
  [一条、一条],
  [一条、多条],
  [多条、一条],
  [多条、多条],
)
]

= 二、综合应用题：第41～47小题，共70分。
#question[
（10分）将关键字序列（7，8，30，11，18，9，14）散列存储到散列表中，散列表的存储空间是一个下标从0开始的一维数组，散列函数为：
$H(k e y) = (k e y times 3) "MOD" 7$
，处理冲突采用线性探测再散列法，要求装填（载）因子为0.7。

#subquestions[
+ 请画出所构造的散列表。
  \
+ 
  分别计算等概率情况下查找成功和查找不成功的平均查找长度。
  
    
]
]

#question[
（13分）设将 $n$（$n > 1$）个整数存放到一维数组
R中。试设计一个在时间和空间两方面都尽可能高效的算法，将
R中保存的序列循环左移 $p$（$0 < p < n$）个位置，即将 R中的数据由
$(x_0, x_1, dots.h, x_(n - 1))$变换为
$(x_p, x_(p + 1), dots.h, x_(n - 1), x_0, x_1, dots.h, x_(p - 1))$。要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 
  根据设计思想，采用C或C++或Java语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度和空间复杂度。
  
    
]
]

#question[
（11分）某计算机字长为16位，主存地址空间大小为128KB，按字编址。采用单字长指令格式，指令各字段定义如下：

#align(center)[
  #box(width: 48%)[
    #grid(
      columns: (4fr, 3fr, 3fr, 3fr, 3fr),
      column-gutter: 0pt,
      text(size: 0.75em)[#grid(columns: (1fr, 1fr), inset: (x: 0.12em), align: (left, right), [15], [12])],
      text(size: 0.75em)[#grid(columns: (1fr, 1fr), inset: (x: 0.12em), align: (left, right), [11], [])],
      text(size: 0.75em)[#grid(columns: (1fr, 1fr), inset: (x: 0.12em), align: (left, right), [], [6])],
      text(size: 0.75em)[#grid(columns: (1fr, 1fr), inset: (x: 0.12em), align: (left, right), [5], [])],
      text(size: 0.75em)[#grid(columns: (1fr, 1fr), inset: (x: 0.12em), align: (left, right), [], [0])],
    )
    #table(
      columns: (4fr, 3fr, 3fr, 3fr, 3fr),
      align: center + horizon,
      stroke: 0.5pt,
      inset: (x: 0.35em, y: 0.2em),
      [OP], [Ms], [Rs], [Md], [Rd],
    )
    #grid(
      columns: (4fr, 6fr, 6fr),
      column-gutter: 0pt,
      [],
      box(width: 100%, stroke: (top: 0.5pt), inset: (top: 0.12em))[
        #align(center)[源操作数]
      ],
      box(width: 100%, stroke: (top: 0.5pt), inset: (top: 0.12em))[
        #align(center)[目的操作数]
      ],
    )
  ]
]

转移指令采用相对寻址方式，相对偏移量用补码表示。寻址方式定义如下：

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [Ms/Md], [寻址方式], [助记符], [含义],
    [000B], [寄存器直接], [Rn], [操作数=(Rn)],
    [001B], [寄存器间接], [(Rn)], [操作数=((Rn))],
    [010B], [寄存器间接、自增], [(Rn)+], [操作数=((Rn)),(Rn)+1→Rn],
    [011B], [相对], [D(Rn)], [转移目标地址=(PC)+(Rn)],
  )]
  , kind: table
  )

注：(x)表示存储器地址 x或寄存器 x的内容。

请回答下列问题：

#subquestions[
+ 
  该指令系统最多可有多少条指令？该计算机最多有多少个通用寄存器？存储器地址寄存器（MAR）和存储器数据寄存器（MDR）至少各需要多少位？
  \
+ 转移指令的目标地址范围是多少？
  \
+ 
  若操作码0010B表示加法操作（助记符为add），寄存器R4和R5的编号分别为
  100B和101B，R4的内容为1234H，R5的内容为5678H，地址1234H中的内容为
  5678H，地址5678H中的内容为1234H，则汇编语句“add（R4），（R5）+”（逗号前为源操作数，逗号后为目的操作数）对应的机器码是什么（用十六进制表示）？该指令执行后，哪些寄存器和存储单元中的内容会改变？改变后的内容是什么？
  
    
]
]

#question[
（12分）某计算机的主存地址空间大小为256MB，按字节编址。指令Cache和数据
Cache分离，均有8个Cache行，每个Cache行大小为64B，数据Cache采用直接映射方式。现有两个功能相同的程序A和B，其伪代码如下所示：

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.65em,
    box(width: 100%, stroke: 0.5pt, inset: (x: 0.55em, y: 0.35em))[
      程序 A： \
      #h(0.7em)#raw("int a[256][256];") \
      #h(0.7em)#raw("...") \
      #h(0.7em)#raw("int sum_array1()") \
      #h(0.7em)#raw("{") \
      #h(2.1em)#raw("int i,j,sum=0;") \
      #h(2.1em)#raw("for(i=0;i<256;i++)") \
      #h(3.5em)#raw("for(j=0;j<256;j++)") \
      #h(4.9em)#raw("sum+=a[i][j];") \
      #h(2.1em)#raw("return sum;") \
      #h(0.7em)#raw("}")
    ],
    box(width: 100%, stroke: 0.5pt, inset: (x: 0.55em, y: 0.35em))[
      程序 B： \
      #h(0.7em)#raw("int a[256][256];") \
      #h(0.7em)#raw("...") \
      #h(0.7em)#raw("int sum_array2()") \
      #h(0.7em)#raw("{") \
      #h(2.1em)#raw("int i,j,sum=0;") \
      #h(2.1em)#raw("for(j=0;j<256;j++)") \
      #h(3.5em)#raw("for(i=0;i<256;i++)") \
      #h(4.9em)#raw("sum+=a[i][j];") \
      #h(2.1em)#raw("return sum;") \
      #h(0.7em)#raw("}")
    ],
  )
]

假定 int
类型数据用32位补码表示，程序编译时i，j，sum均分配在寄存器中，数组a按行优先方式存放，其首地址为320（十进制数）。请回答下列问题，要求说明理由或给出计算过程。

#subquestions[
+ 若不考虑用于 Cache
  一致性维护和替换算法的控制位，则数据 Cache的总容量为多少？
  \
+ 数组元素 a[0][31]和
  a[1][1]各自所在的主存块对应的 Cache 行号分别是多少 （Cache
  行号从0开始）？
  \
+ 
  程序A和B的数据访问命中率各是多少？哪个程序的执行时间更短？
  
    
]
]

#question[
（7分）假设计算机系统采用CSCAN（循环扫描）磁盘调度策略，使用2KB的内存空间记录16384个磁盘块的空闲状态。

#subquestions[
+ 请说明在上述条件下如何进行磁盘块空闲状态的管理。
  \
+ 
  设某单面磁盘旋转速度为每分钟6000转，每个磁道有100个扇区，相邻磁道间的平均移动时间为1ms。若在某时刻，磁头位于100号磁道处，并沿着磁道号增大的方向移动（如下图所示），磁道号请求队列为50、90、30、120，对请求队列中的每个磁道需读取1个随机分布的扇区，则读完这4个扇区总共需要多少时间？要求给出计算过程。
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
      let polar(radius, angle) = (
        radius * calc.cos(angle),
        radius * calc.sin(angle),
      )
      let label(pos, body, anchor: "center") = content(
        pos,
        text(size: 0.88em)[#body],
        anchor: anchor,
      )
  
      hide(rect((-5.65, -3.05), (6.25, 3.05), stroke: none), bounds: true)
  
      // Seven equally spaced tracks and twelve 30-degree sectors.
      for i in range(1, 8) {
        circle((0, 0), radius: 3 * i / 7, fill: none, stroke: 0.55pt)
      }
      for angle in (
        0deg, 30deg, 60deg, 90deg, 120deg, 150deg,
        180deg, 210deg, 240deg, 270deg, 300deg, 330deg,
      ) {
        line((0, 0), polar(3, angle), stroke: 0.55pt)
      }
  
      // Randomly distributed sectors, hatched along their radial direction.
      for angle in (3deg, 7deg, 11deg, 15deg, 19deg, 23deg, 27deg) {
        line(polar(18 / 7, angle), polar(3, angle), stroke: 0.45pt)
      }
      for angle in (153deg, 157deg, 161deg, 165deg, 169deg, 173deg, 177deg) {
        line(polar(9 / 7, angle), polar(12 / 7, angle), stroke: 0.45pt)
      }
      for angle in (-57deg, -53deg, -49deg, -45deg, -41deg, -37deg, -33deg) {
        line(polar(12 / 7, angle), polar(15 / 7, angle), stroke: 0.45pt)
      }
  
      // Head and arm at the current track.
      rect((1.95, -0.08), (3.72, 0.08), fill: white, stroke: 0.55pt)
      circle((1.92, 0), radius: 0.17, fill: black, stroke: black)
  
      // Track and sector callouts.
      bezier(
        (-1.55, 0.30),
        (-4.02, 1.25),
        (-2.55, 0.05),
        (-3.48, 0.42),
        stroke: 0.55pt,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      label((-4.25, 1.57), [随机分布的某扇区])
  
      bezier(
        (2.36, 1.18),
        (4.58, 1.66),
        (3.12, 2.05),
        (4.03, 2.06),
        stroke: 0.55pt,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      label((4.58, 1.20), [0号磁道])
  
      bezier(
        (1.07, -1.55),
        (3.73, -2.18),
        (1.98, -2.42),
        (3.02, -2.58),
        stroke: 0.55pt,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      label((4.02, -1.74), [100号磁道])
  
      line(
        (4.02, -0.24), (3.18, -0.24),
        stroke: 0.55pt,
        mark: (end: ">", fill: black, scale: 0.70),
      )
      label((4.13, -0.61), [磁头当前运动方向], anchor: "west")
    })
  ]
  \
+ 
  如果将磁盘替换为随机访问的Flash半导体存储器（如U盘、SSD等），是否有比
  
  CSCAN更高效的磁盘调度策略？若有，给出磁盘调度策略的名称并说明理由；若无，说明理由。
  
    
]
]

#question[
（8分）设某计算机的逻辑地址空间和物理地址空间均为64KB，按字节编址。若某进程最多需要6页（Page）数据存储空间，页的大小为1KB，操作系统采用固定分配局部置换策略为此进程分配4个页框（Page
Frame）。在时刻260前的该进程访问情况如下表所示（访问位即使用位）。

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [页号], [页框号], [装入时刻], [访问位],
    [0], [7], [130], [1],
    [1], [4], [230], [1],
    [2], [2], [200], [1],
    [3], [9], [160], [1],
  )]
  , kind: table
  )

当该进程执行到时刻260时，要访问逻辑地址为17CAH的数据。

请回答下列问题：

#subquestions[
+ 该逻辑地址对应的页号是多少？
  \
+ 
  若采用先进先出（FIFO）置换算法，该逻辑地址对应的物理地址是多少？要求给出计算过程。
  \
+ 
  若采用时钟（CLOCK）置换算法，该逻辑地址对应的物理地址是多少？要求给出计算过程（设搜索下一页的指针沿顺时针方向移动，且当前指向2号页框，示意图如下）。
  
  #align(center)[
    #cetz.canvas(length: 1.2cm, {
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
      let label(pos, body, anchor: "center") = content(
        pos,
        [#text(size: 0.78em)[#body]],
        anchor: anchor,
      )
  
      hide(rect((-2.28, -1.18), (2.28, 1.18), stroke: none), bounds: true)
  
      // Four page frames arranged as the CLOCK replacement ring.
      circle((0, 0), radius: 1.08, fill: white, stroke: 0.58pt)
      circle((0, 0), radius: 0.58, fill: white, stroke: 0.58pt)
      line((0, 0.58), (0, 1.08), stroke: 0.58pt)
      line((0.58, 0), (1.08, 0), stroke: 0.58pt)
      line((0, -0.58), (0, -1.08), stroke: 0.58pt)
      line((-0.58, 0), (-1.08, 0), stroke: 0.58pt)
  
      label((-0.48, 0.60), [3号页])
      label((0.48, 0.60), [2号页])
      label((-0.48, -0.62), [0号页])
      label((0.48, -0.62), [1号页])
  
      label((-1.28, 0.60), [9号页框], anchor: "east")
      label((1.28, 0.60), [2号页框], anchor: "west")
      label((-1.28, -0.62), [7号页框], anchor: "east")
      label((1.28, -0.62), [4号页框], anchor: "west")
  
      // The hand currently points at page frame 2 and advances clockwise.
      line((0, -0.06), (0.41, 0.42),
        stroke: 0.62pt,
        mark: (end: ">", fill: black, scale: 0.68),
      )
    })
  ]
  
    
]
]

#question[
（9分）某局域网采用CSMA/CD协议实现介质访问控制，数据传输速率为10
Mbps，主机甲和主机乙之间的距离为2km，信号传播速度是200000km/s。请回答下列问题，要求说明理由或写出计算过程。

#subquestions[
+ 
  若主机甲和主机乙发送数据时发生冲突，则从开始发送数据时刻起，到两台主机均检测到冲突时刻止，最短需经过多长时间？最长需经过多长时间？（假设主机甲和主机乙发送数据过程中，其他主机不发送数据）
  \
+ 
  若网络不存在任何冲突与差错，主机甲总是以标准的最长以太网数据帧（1518字节）向主机乙发送数据，主机乙每成功收到一个数据帧后立即向主机甲发送一个
  64字节的确认帧，主机甲收到确认帧后方可发送下一个数据帧。此时主机甲的有效数据传输速率是多少？（不考虑以太网帧的前导码）
    
]
]
