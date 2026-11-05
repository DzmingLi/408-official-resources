// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：I/O管理基础

== I/O控制方式

#block(breakable: false)[#question(label: n => [2017 32])[
系统将数据从磁盘读到内存的过程包括以下操作：
#statements(columns: 1, [① DMA 控制器发出中断请求], [② 初始化 DMA 控制器并启动磁盘], [③ 从磁盘传输一块数据到内存缓冲区], [④ 执行“DMA 结束”中断服务程序])
正确的执行顺序是
#choices([③→①→②→④], [②→③→①→④], [②→①→③→④], [①→②→④→③])
]]

== I/O软件层次结构

#block(breakable: false)[#question(label: n => [2011 26])[
用户程序发出磁盘 I/O 请求后，系统的正确处理流程是

#choices(
  [用户程序 $arrow.r$系统调用处理程序 $arrow.r$中断处理程序 $arrow.r$设备驱动程序],
  [用户程序 $arrow.r$系统调用处理程序 $arrow.r$设备驱动程序 $arrow.r$中断处理程序],
  [用户程序 $arrow.r$设备驱动程序 $arrow.r$系统调用处理程序 $arrow.r$中断处理程序],
  [用户程序 $arrow.r$设备驱动程序 $arrow.r$中断处理程序 $arrow.r$系统调用处理程序],
)
]]

#block(breakable: false)[#question(label: n => [2012 26])[
操作系统的 I/O
子系统通常由四个层次组成，每一层明确定义了与邻近层次的接口。其合理的层次组织排列顺序是

#choices(
  [用户级 I/O 软件、设备无关软件、设备驱动程序、中断处理程序],
  [用户级 I/O 软件、设备无关软件、中断处理程序、设备驱动程序],
  [用户级 I/O 软件、设备驱动程序、设备无关软件、中断处理程序],
  [用户级 I/O 软件、中断处理程序、设备无关软件、设备驱动程序],
)
]]

#block(breakable: false)[#question(label: n => [2013 25])[
用户程序发出磁盘 I/O
请求后，系统的处理流程是：用户程序 $arrow.r$系统调用处理程序
$arrow.r$设备驱动程序
$arrow.r$中断处理程序。其中，计算数据所在磁盘的柱面号、磁头号、扇区号的程序是

#choices(
  [用户程序],
  [系统调用处理程序],
  [设备驱动程序],
  [中断处理程序],
)
]]

#block(breakable: false)[#question(label: n => [2022 32])[
下列关于驱动程序的叙述中，#emphasis[不正确]的是

#choices([驱动程序与 I/O 控制方式无关], [初始化设备是由驱动程序控制完成的], [进程在执行驱动程序时可能进入阻塞态], [读/写设备的操作是由驱动程序控制完成的])
]]

#question(label: n => [2023 46])[
（8分）进程 P 通过执行系统调用从键盘接收一个字符的输入，已知此过程中与进程 P 相关的操作包括：① 将进程 P 插入就绪队列；② 将进程 P 插入阻塞队列；③ 将字符从键盘控制器读入系统缓冲区；④ 启动键盘中断处理程序；⑤ 进程 P 从系统调用返回；⑥ 用户在键盘上输入字符。以上编号①～⑥仅用于标记操作，与操作的先后顺序无关。请回答下列问题。
#subquestions[
 + 按照正确的操作顺序，操作①的前一个和后一个操作分别是上述操作中的哪一个？操作⑥的后一个操作是上述操作中的哪一个？
 + 在上述哪个操作之后 CPU 一定从进程 P 切换到其他进程？在上述哪个操作之后 CPU 调度程序才能选中进程 P 执行？
 + 完成上述哪个操作的代码属于键盘驱动程序？
 + 键盘中断处理程序执行时，进程 P 处于什么状态？CPU 处于内核态还是用户态？
]
]

#block(breakable: false)[#question(label: n => [2024 31])[
键盘中断服务例程执行结束时，所输入数据的存放位置是

#choices([用户缓冲区], [CPU 中的通用寄存器], [内核缓冲区], [键盘控制器的数据寄存器])
]]

#question(label: n => [2025 46])[
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

#block(breakable: false)[#question(label: n => [2026 32])[
下列操作中，由鼠标中断处理程序完成的是
#choices([将当前进程的状态由执行态改为阻塞态], [将 CPU 运行模式由用户模式改为内核模式], [将接收到的输入数据存放到设备接口的数据寄存器中], [将输入数据从设备接口的数据寄存器传送到内核数据区])
]]
