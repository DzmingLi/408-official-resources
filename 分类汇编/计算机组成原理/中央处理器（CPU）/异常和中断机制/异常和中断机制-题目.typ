// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：异常和中断机制

== 异常和中断的分类

#block(breakable: false)[#question(label: n => [2009 22])[
下列选项中，能引起外部中断的事件是

#choices(
  [键盘输入],
  [除数为0],
  [浮点运算下溢],
  [访存缺页],
)
]]

#block(breakable: false)[#question(label: n => [2016 22])[
异常是指令执行过程中在处理器内部发生的特殊事件，中断是来自处理器外部的请求事件。下列关于中断或异常情况的叙述中，#emphasis[错误]的是
#choices([“访存时缺页”属于中断], [“整数除以0”属于异常], [“DMA传送结束”属于中断], [“存储保护错”属于异常])
]]

#block(breakable: false)[#question(label: n => [2020 18])[
下列关于“自陷”（Trap，也称陷阱）的叙述中，错误的是

#choices([自陷是通过陷阱指令预先设定的一类外部中断事件], [自陷可用于实现程序调试时的断点设置和单步跟踪], [自陷发生后 CPU 将转去执行操作系统内核相应程序], [自陷处理完成后将返回到陷阱指令的下一条指令执行])
]]

#block(breakable: false)[#question(label: n => [2020 20])[
下列事件中，属于外部中断事件的是

#statements(columns: (1fr, 1fr), [Ⅰ．访存时缺页], [Ⅱ．定时器到时], [Ⅲ．网络数据包到达],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ和Ⅲ])
]]

== 异常和中断的检测与响应

#question(label: n => [2014 45])[
原卷第44题共用背景（不含小问）：

某程序中有如下循环代码段 $P$：

```c
for (i = 0; i < N; i++)
    sum += A[i];
```

假设编译时变量 `sum` 和 $i$ 分别分配在寄存器 R1 和 R2 中，常量 $N$ 在寄存器 R6 中，数组 $A$ 的首地址在寄存器 R3 中。程序段 $P$ 起始地址为08048100H，对应的汇编代码和机器代码如题44表所示。

#{
  set figure.caption(position: top)
  figure(
    kind: table,
    caption: [题44表],
    numbering: none,
  )[
    #table(
      columns: (8.7%, 15.94%, 15.94%, 26.09%, 33.33%),
      align: (auto, auto, auto, auto, auto),
      [编号], [地址], [机器代码], [汇编代码], [注释],
      [1], [08048100H], [00022080H], [loop:sll R4,R2,2], [(R2)＜＜2→R4],
      [2], [08048104H], [00832020H], [add R4,R4,R3], [(R4)+(R3)→R4],
      [3], [08048108H], [8C850000H], [load R5,0(R4)], [((R4)+0)→R5],
      [4], [0804810CH], [00250820H], [add R1,R1,R5], [(R1)+(R5)→R1],
      [5], [08048110H], [20420001H], [addi R2,R2,1], [(R2)+1→R2],
      [6], [08048114H], [1446FFFAH], [bne R2,R6,loop], [if(R2)!=(R6)goto loop],
    )
  ]
}

执行上述代码的计算机M采用32位定长指令字，其中分支指令bne采用如下格式：

#align(center)[
  #box(width: 58%)[
    #let bit-range(first, last) = box(width: 100%)[
      #grid(
        columns: (1fr, 1fr),
        inset: (x: 0.12em),
        align: (left, right),
        first,
        last,
      )
    ]
    #grid(
      columns: 1,
      row-gutter: 0.15em,
      grid(
        columns: (6fr, 5fr, 5fr, 16fr),
        column-gutter: 0pt,
        text(size: 0.75em)[#bit-range([31], [26])],
        text(size: 0.75em)[#bit-range([25], [21])],
        text(size: 0.75em)[#bit-range([20], [16])],
        text(size: 0.75em)[#bit-range([15], [0])],
      ),
      table(
        columns: (6fr, 5fr, 5fr, 16fr),
        align: center + horizon,
        stroke: 0.6pt,
        [OP], [Rs], [Rd], [OFFSET],
      ),
    )
  ]
]
OP为操作码；Rs和Rd为寄存器编号；OFFSET为偏移量，用补码表示。，并说明理由。




（11分）假设对于题44中的计算机M和程序段P的机器代码，M采用页式虚拟存储管理；P开始执行时，
（R1）=（R2）= 0，（R6）= 1000
，其机器代码已调入主存但不在Cache中；数组A未调入主存，且所有数组元素在同一页，并存储在磁盘同一个扇区。请回答下列问题，并说明理由。

#subquestions[
+ P执行结束时，R2的内容是多少？
  \
+ M的指令 Cache和数据 Cache分离。若指令
  Cache共有16行，Cache和主存交换的块大小为32字节，则其数据区的容量是多少？若仅考虑程序段P的执行，则指令
  Cache的命中率为多少？
  \
+ 
  P在执行过程中，哪条指令的执行可能发生溢出异常？哪条指令的执行可能产生缺页异常？对于数组A的访问，需要读磁盘和TLB至少各多少次？
  
    
]
]

#block(breakable: false)[#question(label: n => [2015 22])[
内部异常（内中断）可分为故障（fault）、陷阱（trap）和终止（abort）三类。下列有关内部异常的叙述中，错误的是

#choices(
  [内部异常的产生与当前执行指令相关],
  [内部异常的检测由CPU内部逻辑实现],
  [内部异常的响应发生在指令执行过程中],
  [内部异常处理后返回到发生异常的指令继续执行],
)
]]

#block(breakable: false)[#question(label: n => [2019 14])[
下列关于缺页处理的叙述中，错误的是

#choices(
  [缺页是在地址转换时 CPU 检测到的一种异常],
  [缺页处理由操作系统提供的缺页处理程序来完成],
  [缺页处理程序根据页故障地址从外存读入所缺失的页],
  [缺页处理完成后回到发生缺页的指令的下一条指令执行],
)
]]

#question(label: n => [2019 45])[
（16分）已知 $f(n)=n! = n times (n-1) times (n-2) times dots times 2 times 1$，计算 $f(n)$ 的 C 语言函数 f1 的源程序（阴影部分）及其在32位计算机 M 上的部分机器级代码如下：

#table(
  columns: (2em, 6em, 9em, 1fr), stroke: none,
  align: (right, left, left, left),
  table.cell(colspan: 4, fill: luma(85%), align: left)[`int f1(int n) {`],
  [1], [00401000], [55], [`push ebp`],
  [], [……], [……], [……],
  table.cell(colspan: 4, fill: luma(85%), align: left)[#h(1.5em)`if (n > 1)`],
  [11], [00401018], [83 7D 08 01], [`cmp dword ptr [ebp+8], 1`],
  [12], [0040101C], [7E 17], [`jle f1+35h (00401035)`],
  table.cell(colspan: 4, fill: luma(85%), align: left)[#h(3em)`return n * f1(n-1);`],
  [13], [0040101E], [8B 45 08], [`mov eax, dword ptr [ebp+8]`],
  [14], [00401021], [83 E8 01], [`sub eax, 1`],
  [15], [00401024], [50], [`push eax`],
  [16], [00401025], [E8 D6 FF FF FF], [`call f1 (00401000)`],
  [], [……], [……], [……],
  [19], [00401030], [0F AF C1], [`imul eax, ecx`],
  [20], [00401033], [EB 05], [`jmp f1+3Ah (0040103a)`],
  table.cell(colspan: 4, fill: luma(85%), align: left)[#h(1.5em)`else return 1;`],
  [21], [00401035], [B8 01 00 00 00], [`mov eax, 1`],
  table.cell(colspan: 4, fill: luma(85%), align: left)[`}`],
  [], [……], [……], [……],
  [26], [00401040], [3B EC], [`cmp ebp, esp`],
  [], [……], [……], [……],
  [30], [0040104A], [C3], [`ret`],
)

其中，机器级代码行包括行号、虚拟地址、机器指令和汇编指令，计算机 M 按字节编址，int 型数据占32位。请回答下列问题：

#subquestions[
+ 计算 $f(10)$ 需要调用函数 f1 多少次？执行哪条指令会递归调用 f1？
+ 上述代码中，哪条指令是条件转移指令？哪几条指令一定会使程序跳转执行？
+ 根据第16行 call 指令，第17行指令的虚拟地址应是多少？已知第16行 call 指令采用相对寻址方式，该指令中的偏移量应是多少（给出计算过程）？已知第16行 call 指令的后4字节为偏移量，M 采用大端还是小端方式？
+ $f(13)$ = 6 227 020 800，但 f1(13) 的返回值为1 932 053 504，为什么两者不相等？要使 f1(13) 能返回正确的结果，应如何修改 f1 源程序？
+ 第19行 imul 指令（带符号整数乘）的功能是 R\[eax\] ← R\[eax\] × R\[ecx\]，当乘法器输出的高、低32位乘积之间满足什么条件时，溢出标志 OF = 1？要使 CPU 在发生溢出时转异常处理，编译器应在 imul 指令后加一条什么指令？

]
]

#block(breakable: false)[#question(label: n => [2021 21])[
异常事件在当前指令执行过程中进行检测，中断请求则在当前指令执行后进行检测。下列事件中，相应处理程序执行后，必须回到当前指令重新执行的是

#choices([系统调用], [页缺失], [DMA 传送结束], [打印机缺纸])
]]
