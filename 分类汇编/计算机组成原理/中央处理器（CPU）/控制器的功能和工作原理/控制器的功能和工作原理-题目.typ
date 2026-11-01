// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：控制器的功能和工作原理

#block(breakable: false)[#question(label: n => [2009 19])[
相对于微程序控制器，硬布线控制器的特点是

#choices(
  [指令执行速度慢，指令功能的修改和扩展容易],
  [指令执行速度慢，指令功能的修改和扩展难],
  [指令执行速度快，指令功能的修改和扩展容易],
  [指令执行速度快，指令功能的修改和扩展难],
)
]]

#block(breakable: false)[#question(label: n => [2012 18])[
某计算机的控制器采用微程序控制方式，微指令中的操作控制字段采用字段直接编码法，共有33个微命令，构成5个互斥类，分别包含7、3、12、5和6个微命令，则操作控制字段至少有

#choices(
  [5位],
  [6位],
  [15位],
  [33位],
)
]]

#block(breakable: false)[#question(label: n => [2014 18])[
某计算机采用微程序控制器，共有32条指令，公共的取指令微程序包含2条微指令，各指令对应的微程序平均由4条微指令组成，采用断定法（下址字段法）确定下条微指令地址，则微指令中下址字段的位数至少是

#choices(
  [5],
  [6],
  [8],
  [9],
)
]]

#question(label: n => [2015 43])[
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

#pagebreak(weak: true)

#question(label: n => [2015 44])[
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

#block(breakable: false)[#question(label: n => [2016 20])[
单周期处理器中所有指令的指令周期为一个时钟周期。下列关于单周期处理器的叙述中，#emphasis[错误]的是
#choices([可以采用单总线结构数据通路], [处理器时钟频率较低], [在指令执行过程中控制信号不变], [每条指令的CPI为1])
]]

#block(breakable: false)[#question(label: n => [2017 18])[
下列关于主存储器（MM）和控制存储器（CS）的叙述中，错误的是
#choices([MM 在 CPU 外，CS 在 CPU 内], [MM 按地址访问，CS 按内容访问], [MM 存储指令和数据，CS 存储微指令], [MM 用 RAM 和 ROM 实现，CS 用 ROM 实现])
]]

#block(breakable: false)[#question(label: n => [2019 17])[
某指令功能为 R\[r2\] ← R\[r1\] + M\[R\[r0\]\]，其两个源操作数分别采用寄存器、寄存器间接寻址方式。对于下列给定部件，该指令在取数及执行过程中需要用到的是

#statements(columns: (1fr, 1fr), [Ⅰ．通用寄存器组（GPRs）], [Ⅱ．算术逻辑单元（ALU）],
  [Ⅲ．存储器（Memory）], [Ⅳ．指令译码器（ID）],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅱ、Ⅲ、Ⅳ], [仅Ⅰ、Ⅲ、Ⅳ])
]]

#question(label: n => [2020 43])[
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

#pagebreak(weak: true)

#question(label: n => [2022 43])[
（15分）某 CPU 中部分数据通路如题43图所示，其中，GPRs 为通用寄存器组，FR 为标志寄存器，用于存放 ALU 产生的标志信息；带箭头虚线表示控制信号，如控制信号 Read、Write 分别表示主存读、主存写，MDRin 表示内部总线上数据写入 MDR，MDRout 表示 MDR 的内容读到内部总线。

#figure(align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(stroke: 0.045em)
  rect((3,-6),(27,4.5))
  line((0,5.5),(27,5.5), mark: (start: "stealth", end: "stealth", scale: 0.7))
  line((3.3,1),(26.7,1), stroke: 0.3em, mark: (start: "stealth", end: "stealth", scale: 0.5))
  content((6.8,1.7), text(size: 0.85em)[内部总线])
  rect((0,-1),(2,3.4))
  content((1,1.2), [主\ 存\ 储\ 器])
  line((1,3.4),(1,5.5), stroke: 0.15em, mark: (start: "stealth", end: "stealth", scale: 0.5))
  for (x,label) in ((4.6,[MAR]),(10.2,[MDR]),(16,[PC])) {
    rect((x - 1.1,2.8),(x + 1.1,3.8), fill: white)
    content((x,3.3), label)
    line((x,1),(x,2.8), mark: (end: "stealth", scale: 0.65))
  }
  line((4.6,3.8),(4.6,5.5), mark: (end: "stealth", scale: 0.65))
  line((10.2,3.8),(10.2,5.5), mark: (start: "stealth", end: "stealth", scale: 0.65))
  line((10.5,2.8),(10.5,1), mark: (end: "stealth", scale: 0.65))
  line((16.3,2.8),(16.3,1), mark: (end: "stealth", scale: 0.65))
  rect((20,2),(22.2,3), fill: white)
  content((21.1,2.5), [IR])
  line((21.1,1),(21.1,2), mark: (end: "stealth", scale: 0.65))
  line((20.7,3),(20.7,3.8), mark: (end: "stealth", scale: 0.65))
  line((21.5,3),(21.5,3.8), mark: (end: "stealth", scale: 0.65))
  content((21.1,4.1), text(size: 0.75em)[送CU等部件])
  for (a,b,label,pos) in (
    ((7.2,3.3),(5.7,3.3),[MARin],(7,3.8)),
    ((12.8,3.3),(11.3,3.3),[MDRin],(12.6,3.8)),
    ((12.8,1.8),(10.5,1.8),[MDRout],(12.6,2.3)),
    ((18.4,3.3),(17.1,3.3),[PCin],(18.2,3.8)),
    ((18.4,1.8),(16.3,1.8),[PCout],(18.2,2.3)),
    ((24,2.5),(22.2,2.5),[IRin],(23.7,3)),
    ((25,3.5),(25,5.5),[Read],(24.2,3.3)),
    ((26,2.7),(26,5.5),[Write],(26,2.3)),
  ) {
    line(a,b, stroke: (dash: "dashed"), mark: (end: "stealth", scale: 0.55))
    content(pos, text(size: 0.75em, label))
  }
  rect((4,-1.3),(6.2,-0.3), fill: white)
  content((5.1,-0.8), [Y])
  line((5.1,1),(5.1,-0.3), mark: (end: "stealth", scale: 0.6))
  line((5.1,-1.3),(5.1,-2),(9,-2),(9,-0.2),(11,-0.2),(11,-1.1), mark: (end: "stealth", scale: 0.6))
  line((13.5,1),(13.5,-1.1), mark: (end: "stealth", scale: 0.6))
  line((10.2,-1.1),(14.4,-1.1),(13.5,-2.5),(11.2,-2.5),close: true,fill:white)
  content((12.3,-1.7), [ALU])
  content((11.3,-0.6), text(size: 0.8em)[A])
  content((14,-0.6), text(size: 0.8em)[B])
  content((10.3,0.3), text(size: 0.75em)[16])
  content((13.2,0.3), text(size: 0.75em)[16])
  line((12.3,-2.5),(12.3,-3.8), mark: (end: "stealth", scale: 0.6))
  content((13,-3), text(size: 0.8em)[F])
  content((11.8,-3), text(size: 0.75em)[16], anchor: "east")
  rect((11.2,-4.8),(13.4,-3.8), fill: white)
  content((12.3,-4.3), [Z])
  line((12.3,-4.8),(12.3,-5.6),(16.5,-5.6),(16.5,1), mark: (end: "stealth", scale: 0.6))
  rect((7.5,-4.8),(10.5,-3.8), fill: white)
  content((9,-4.3), text(size: 0.8em)[SF OF ⋯])
  content((7.3,-4.3), [FR], anchor: "east")
  line((12.3,-3.1),(9,-3.1),(9,-3.8), mark: (end: "stealth", scale: 0.6))
  rect((20,-3),(23,-0.6), fill: white)
  content((21.5,-1.8), [GPRs])
  line((20.8,1),(20.8,-0.6), mark: (end: "stealth", scale: 0.6))
  line((23,-1.3),(24,-1.3),(24,1), mark: (end: "stealth", scale: 0.6))
  for (a,b,label,pos) in (
    ((7.5,-0.8),(6.2,-0.8),[Yin],(7.2,-0.3)),
    ((15.5,-1.7),(14,-1.7),[ALUop],(15.7,-2.2)),
    ((18.8,-4.6),(16.5,-4.6),[Zout],(18.6,-4.1)),
    ((25.8,-0.3),(24,-0.3),[GPRout],(25.2,-0.9)),
    ((21.5,-4.5),(21.5,-3),[GPRin],(21.5,-5)),
  ) {
    line(a,b, stroke: (dash: "dashed"), mark: (end: "stealth", scale: 0.55))
    content(pos, text(size: 0.75em, label))
  }
  line((18.7,-2.3),(20,-2.3), mark: (end:"stealth", scale:0.6))
  line((24.3,-2.3),(23,-2.3), mark: (end:"stealth", scale:0.6))
  content((18.3,-2.3), text(size:0.8em)[rd], anchor:"east")
  content((24.6,-2.3), text(size:0.8em)[rs], anchor:"west")
  content((19.2,-1.9), text(size:0.7em)[4])
  content((23.8,-1.9), text(size:0.7em)[4])
})), caption: [题43图], numbering: none)

请回答下列问题。

#subquestions[
+ 设 ALU 的输入端 A、B 及输出端 F 的最高位分别为 $A_15$、$B_15$ 及 $F_15$，FR 中的符号标志和溢出标志分别为 SF 和 OF，则 SF 的逻辑表达式是什么？A 加 B、A 减 B 时 OF 的逻辑表达式分别是什么？要求逻辑表达式的输入变量为 $A_15$、$B_15$ 及 $F_15$。
+ 为什么要设置暂存器 Y 和 Z？
+ 若 GPRs 的输入端 rs、rd 分别为所读、写的通用寄存器的编号，则 GPRs 中最多有多少个通用寄存器？rs 和 rd 来自图中的哪个寄存器？已知 GPRs 内部有一个地址译码器和一个多路选择器，rd 应连接地址译码器还是多路选择器？
+ 取指令阶段（不考虑 PC 增量操作）的控制信号序列是什么？若从发出主存读命令到主存读出数据并传送到 MDR 共需5个时钟周期，则取指令阶段至少需要几个时钟周期？
+ 图中控制信号由什么部件产生？图中哪些寄存器的输出信号会连到该部件的输入端？

]
]
