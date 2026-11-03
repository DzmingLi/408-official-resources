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

#question(label: n => [2015 43])[
（13分）某16位计算机的主存按字节编址，存取单位为16位；采用16位定长指令字格式；CPU采用单总线结构，主要部分如下图所示。图中R0～R3为通用寄存器；T为暂存器；SR为移位寄存器，可实现直送（mov）、左移一位（left）和右移一位（right）3种操作，控制信号为SRop，SR的输出由信号SRout控制；ALU可实现直送A（mova）、A加B（add）、A减B（sub）、A与B（and）、A或B（or）、非A（not）、A加1（inc）7种操作，控制信号为ALUop。请回答下列问题。

#subquestions[
+ 图中哪些寄存器是程序员可见的？为何要设置暂存器T？
  \
+ 控制信号ALUop和SRop的位数至少各是多少？
  
  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    // 对照2016年考纲书内第65页（PDF第69页）；九个端点为原题待补连线。
    set-style(content: (wrap: body => {
      set text(top-edge: "bounds", bottom-edge: "bounds")
      set par(leading: 0.1em, spacing: 0pt)
      body
    }))
    let p(x, y) = (x / 34, (625 - y) / 34)
    let label(x, y, body, size: 0.85em) = {
      content(p(x, y), text(size: size, body))
    }
    let wire(..pts, arrow: true, dotted: false, both: false) = line(
      ..pts.pos().map(q => p(..q)),
      stroke: if dotted { (thickness: 0.07em, dash: "dotted") } else { 0.065em },
      mark: if arrow { (start: if both { "stealth" } else { none }, end: "stealth", fill: black, scale: 0.6) } else { none },
    )
    let unit(x1, y1, x2, y2, body) = {
      rect(p(x1, y1), p(x2, y2), fill: white, stroke: 0.075em)
      label((x1 + x2) / 2, (y1 + y2) / 2, body, size: 0.9em)
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
    wire((177, 75), (177, 51), (706, 51))
    wire((706, 547), (104, 547), (104, 404))
    wire((105, 354), (105, 296))
    wire((177, 227), (177, 188))
    wire((177, 121), (177, 106))
    wire((257, 343), (257, 296))
    wire((230, 377), (142, 377), dotted: true)
    wire((413, 91), (264, 91), dotted: true)
    wire((395, 153), (268, 153), dotted: true)
    wire((373, 264), (270, 264), dotted: true)
    wire((258, 426), (353, 426), dotted: true)
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
    unit(1073, 119, 1150, 257, [])
    label(1111.5, 167, [主], size: 0.9em)
    label(1111.5, 209, [存], size: 0.9em)
    unit(70, 354, 142, 404, [T])
    unit(86, 121, 268, 188, [])
    label(177, 143, [移位寄存器], size: 0.8em)
    label(177, 172, [SR], size: 0.85em)
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
    label(818, 43, [CPU], size: 0.9em)
    label(818, 76, [（中央处理器）], size: 0.75em)
    label(663, 474, [CPU], size: 0.8em)
    label(663, 507, [内总线], size: 0.8em)
    for (y, body) in ((452, [主]), (486, [存]), (520, [总]), (554, [线])) {
      label(1038, y, body, size: 0.8em)
    }
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
  // 对照2024年考纲书内第54页（PDF第59页）逐线重绘。
  set-style(stroke: 0.045em)
  set-style(content: (wrap: body => {
    set par(leading: 0.1em, spacing: 0pt)
    set text(top-edge: "bounds", bottom-edge: "bounds")
    body
  }))
  let p(x, y) = (x / 40, (650 - y) / 40)
  let label(x, y, body, size: 0.8em, anchor: "center") = {
    content(p(x, y), text(size: size, body), anchor: anchor)
  }
  let wire(..pts, both: false, arrow: true, dashed: false) = {
    line(..pts.pos().map(q => p(..q)),
      stroke: if dashed { (thickness: 0.045em, dash: "dashed") } else { 0.045em },
      mark: if arrow { (start: if both { "stealth" } else { none }, end: "stealth", fill: black, scale: 0.55) } else { none })
  }
  let unit(x1, y1, x2, y2, body) = {
    rect(p(x1, y1), p(x2, y2), fill: white)
    label((x1 + x2) / 2, (y1 + y2) / 2, body, size: 0.88em)
  }
  let bus(x1, x2, y, half-width: 10, head: 25) = {
    line(p(x1, y), p(x1 + head, y - head), p(x1 + head, y - half-width),
      p(x2 - head, y - half-width), p(x2 - head, y - head), p(x2, y),
      p(x2 - head, y + head), p(x2 - head, y + half-width),
      p(x1 + head, y + half-width), p(x1 + head, y + head),
      close: true, fill: white)
  }
  let buffer(x, y, up: false) = {
    let d = if up { -1 } else { 1 }
    line(p(x, y + d * 11), p(x - 8, y - d * 9), p(x + 8, y - d * 9),
      close: true, fill: white)
  }
  let width-mark(x, y, body) = {
    wire((x - 7, y + 7), (x + 7, y - 7), arrow: false)
    label(x - 13, y - 19, body)
  }

  rect(p(195, 160), p(1263, 638))
  bus(30, 1300, 95, half-width: 16, head: 36)
  label(665, 50, [系统总线], size: 0.85em)
  bus(209, 1248, 330, half-width: 10, head: 25)
  label(367, 295, [内部总线], size: 0.85em)
  // 主存与系统总线之间为双向空心箭头。
  line(p(100, 115), p(75, 143), p(89, 143), p(89, 195),
    p(75, 195), p(100, 222), p(125, 195), p(111, 195),
    p(111, 143), p(125, 143), close: true, fill: white)
  unit(57, 224, 144, 432, [主#linebreak()存#linebreak()储#linebreak()器])

  unit(209, 195, 307, 242, [MAR])
  wire((258, 320), (258, 242))
  wire((258, 195), (258, 115))
  wire((384, 218), (307, 218), dashed: true)
  label(371, 197, [MARin])

  unit(455, 195, 554, 242, [MDR])
  wire((504, 195), (504, 115), both: true)
  wire((490, 320), (490, 242))
  wire((518, 242), (518, 320))
  buffer(518, 270)
  wire((632, 218), (554, 218), dashed: true)
  label(623, 197, [MDRin])
  wire((623, 270), (526, 270), dashed: true)
  label(631, 249, [MDRout])

  unit(709, 195, 806, 242, [PC])
  wire((743, 320), (743, 242))
  wire((772, 242), (772, 320))
  buffer(772, 270)
  wire((883, 218), (806, 218), dashed: true)
  label(862, 197, [PCin])
  wire((881, 270), (780, 270), dashed: true)
  label(870, 249, [PCout])

  unit(930, 238, 1027, 285, [IR])
  wire((978, 320), (978, 285))
  wire((958, 238), (958, 210))
  wire((1007, 238), (1007, 210))
  label(984, 222, [⋯])
  label(1000, 180, [送CU等部件], size: 0.75em)
  wire((1100, 261), (1027, 261), dashed: true)
  label(1084, 240, [IRin])
  wire((1177, 191), (1177, 115), dashed: true)
  wire((1220, 230), (1220, 115), dashed: true)
  label(1176, 211, [Read])
  label(1219, 251, [Write])

  unit(242, 390, 340, 438, [Y])
  wire((291, 340), (291, 390))
  wire((291, 438), (291, 469), (459, 469), (459, 384), (562, 384), (562, 418), arrow: false)
  wire((410, 414), (340, 414), dashed: true)
  label(386, 393, [Yin])
  width-mark(539, 384, [16])
  wire((659, 340), (659, 418))
  width-mark(659, 385, [16])
  line(p(528, 418), p(695, 418), p(653, 474), p(571, 474), close: true, fill: white)
  label(612, 447, [ALU], size: 0.9em)
  label(586, 400, [A])
  label(680, 400, [B])
  wire((735, 445), (675, 445), dashed: true)
  label(727, 470, [ALUop])
  wire((619, 474), (619, 536))
  wire((612, 524), (626, 510), arrow: false)
  label(589, 510, [16])
  label(638, 492, [F])
  wire((576, 474), (576, 501), (478, 501), (478, 536))
  rect(p(420, 536), p(538, 583), fill: white)
  wire((458, 536), (458, 583), arrow: false)
  wire((498, 536), (498, 583), arrow: false)
  label(440, 560, [SF], size: 0.75em)
  label(479, 560, [OF], size: 0.75em)
  label(518, 560, [⋯], size: 0.75em)
  label(394, 560, [FR])
  unit(570, 536, 667, 583, [Z])
  wire((619, 583), (619, 616), (798, 616), (798, 340))
  buffer(798, 550, up: true)
  wire((870, 550), (806, 550), dashed: true)
  label(865, 527, [Zout])

  unit(954, 389, 1074, 500, [GPRs])
  wire((917, 340), (917, 419), (954, 419))
  wire((1074, 419), (1113, 419), (1113, 340))
  buffer(1113, 384, up: true)
  wire((1170, 384), (1121, 384), dashed: true)
  label(1188, 408, [GPRout])
  wire((1003, 560), (1003, 500), dashed: true)
  label(1003, 578, [GPRin])
  wire((913, 473), (954, 473))
  wire((1122, 473), (1074, 473))
  width-mark(927, 473, [4])
  width-mark(1100, 473, [4])
  label(891, 473, [rd])
  label(1136, 473, [rs])
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
