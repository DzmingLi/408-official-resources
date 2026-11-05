// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：数据通路的功能和基本结构

#question(label: n => [2009 44])[
（13分）某计算机字长16位，采用16位定长指令字结构，部分数据通路结构如下图所示，图中所有控制信号为1时表示有效、为0时表示无效，例如控制信号MDRinE为1表示允许数据从DB打入MDR，MDRin为1表示允许数据从内总线打入MDR。假设MAR的输出一直处于使能状态。加法指令“ADD（R1），R0”的功能为（R0）+（（R1））
$arrow.r$
（R1），即将R0中的数据与R1的内容所指主存单元的数据相加，并将结果送入R1的内容所指主存单元中保存。

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  // 对照2010年考纲书内第29页；MDR右侧输入信号按题干订正为MDRinE。
  let p(x, y) = (x / 37.5, (1115 - y) / 37.5)
  let pen = 0.05em
  let wire(..pts, arrow: true) = line(..pts.pos().map(q => p(..q)),
    stroke: pen, mark: if arrow { (end: ">", fill: black, scale: 0.65) } else { none })
  let label(x, y, body, anchor: "center") = content(p(x, y), {
    set par(leading: 0.2em, spacing: 0pt)
    show par: it => it
    box(text(top-edge: "bounds", bottom-edge: "bounds", body))
  }, anchor: anchor)
  let unit(x1, y1, x2, y2, body) = {
    rect(p(x1, y1), p(x2, y2), fill: white, stroke: pen)
    label((x1 + x2) / 2, (y1 + y2) / 2, body)
  }
  let bus(y, name, fill: white) = {
    line(..((15, y), (65, y - 22), (65, y - 10),
      (1275, y - 10), (1275, y - 22), (1320, y),
      (1275, y + 22), (1275, y + 10), (65, y + 10),
      (65, y + 22)).map(q => p(..q)), close: true, fill: fill, stroke: pen)
    label(1200, y - 33, name, anchor: "west")
  }
  let gate(x, y, up: true) = {
    let direction = if up { -1 } else { 1 }
    line(p(x, y + direction * 14), p(x - 13, y - direction * 12),
      p(x + 13, y - direction * 12), close: true, fill: white, stroke: pen)
  }

  // 存储器和外部总线。跨越其他总线的线段由总线轮廓遮断。
  wire((592, 201), (592, 135))
  wire((750, 201), (750, 135))
  wire((905, 245), (905, 135))
  wire((905, 245), (905, 271))
  wire((1060, 337), (1060, 135))
  wire((195, 437), (195, 357))
  wire((742, 430), (742, 291))
  wire((824, 291), (824, 430))

  // 内总线对MAR、MDR、R0、R1、A、PC和IR的传送。
  wire((195, 576), (195, 494))
  wire((744, 576), (744, 486))
  wire((825, 486), (825, 576))
  wire((411, 689), (411, 628), (228, 628), (228, 596))
  wire((411, 827), (411, 769), (228, 769), (228, 596))
  wire((576, 596), (576, 716), (472, 716))
  wire((576, 716), (576, 852), (472, 852))
  wire((805, 596), (805, 641))
  wire((1077, 596), (1077, 683))
  wire((1118, 683), (1118, 596))
  wire((1022, 596), (1022, 885), (1078, 885))

  // ALU的两个输入、运算结果和AC回送通路。
  wire((805, 695), (805, 754))
  wire((896, 596), (896, 754))
  wire((837, 829), (837, 859))
  wire((837, 914), (837, 1002), (630, 1002), (630, 596))
  wire((1120, 914), (1120, 997))
  wire((1096, 780), (1096, 739))

  bus(211, [CB])
  bus(281, [DB])
  bus(347, [AB])
  bus(586, [内总线], fill: luma(75%))

  rect(p(328, 5), p(1238, 135), fill: white, stroke: pen)
  label(783, 51, [存储器（M）])
  for (x, name) in ((592, [MemR]), (750, [MemW]), (905, [Data]), (1060, [Addr])) {
    label(x, 108, name)
  }
  unit(125, 437, 255, 494, [MAR])
  unit(707, 430, 854, 486, [MDR])
  unit(378, 689, 472, 742, [R0])
  unit(378, 827, 472, 880, [R1])
  unit(755, 641, 850, 695, [A])
  unit(1055, 683, 1145, 739, [PC])
  unit(788, 859, 884, 914, [AC])
  unit(1078, 859, 1180, 914, [IR])
  line(..((748, 754), (800, 754), (837, 775), (859, 754),
    (928, 754), (882, 829), (791, 829)).map(q => p(..q)),
    close: true, fill: white, stroke: pen)
  label(838, 798, [ALU])

  // 空心三角形为三态门，控制端为不带箭头的短线。
  gate(742, 390)
  wire((729, 390), (700, 390), arrow: false)
  label(688, 390, [MDRoutE], anchor: "east")
  gate(825, 520, up: false)
  wire((838, 523), (896, 523), arrow: false)
  label(908, 523, [MDRout], anchor: "west")
  for (y, name) in ((650, [R0out]), (794, [R1out])) {
    gate(411, y)
    wire((424, y), (449, y), arrow: false)
    label(461, y, name, anchor: "west")
  }
  gate(1118, 650)
  wire((1131, 650), (1155, 650), arrow: false)
  label(1167, 650, [PCout], anchor: "west")
  gate(837, 947, up: false)
  wire((824, 950), (796, 950), arrow: false)
  label(784, 950, [ACout], anchor: "east")

  // 寄存器输入控制端及ALU加法控制端。
  for (x1, x2, y, name) in (
    (313, 255, 466, [MARin]), (915, 854, 458, [MDRinE]),
    (1196, 1145, 711, [PCin]), (1230, 1180, 886, [IRin]),
  ) {
    wire((x1, y), (x2, y))
    label(x1 + 12, y, name, anchor: "west")
  }
  for (x1, x2, y, name) in (
    (645, 707, 458, [MDRin]), (335, 378, 716, [R0in]),
    (335, 378, 852, [R1in]), (700, 755, 667, [Ain]),
    (718, 773, 798, [Add]), (736, 788, 885, [ACin]),
  ) {
    wire((x1, y), (x2, y))
    label(x1 - 12, y, name, anchor: "east")
  }
  label(1096, 810, [PC+1])
  label(1120, 1035, [至指令译码部件])

  // 原图控制信号图例。
  rect(p(15, 910), p(595, 1115), fill: white, stroke: pen)
  label(305, 948, [控制信号图例])
  gate(50, 1006)
  wire((63, 1006), (93, 1006), arrow: false)
  label(105, 1006, [Xout], anchor: "west")
  label(215, 1006, [三态门及其控制信号], anchor: "west")
  wire((95, 1070), (35, 1070))
  label(105, 1070, [Xin], anchor: "west")
  label(215, 1070, [寄存器输入控制信号], anchor: "west")
}))


下表给出了上述指令取指和译码阶段每个节拍（时钟周期）的功能和有效控制信号，请按表中描述方式用表格列出指令执行阶段每个节拍的功能和有效控制信号。

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [时钟], [功能], [有效控制信号],
    [C1], [MAR←(PC)], [PCout,MARin],
    [C2], [MDR←M(MAR)\ PC←(PC)+1], [MemR,MDRinE\ PC+1],
    [C3], [IR←(MDR)], [MDRout,IRin],
    [C4], [指令译码], [无],
  )]
  , kind: table
  )

]

#question(label: n => [2013 44])[
（14分）某计算机采用16位定长指令字格式，其CPU中有一个标志寄存器，其中包含进位/借位标志CF、零标志ZF和符号标志NF。假定为该机设计了条件转移指令，其格式如下：

#align(center)[
  #box(width: 44%)[
    #let bit-range(first, last) = box(width: 100%)[
      #grid(
        columns: (1fr, 1fr),
        inset: (x: 0.10em),
        align: (left, right),
        first,
        last,
      )
    ]
    #grid(
      columns: 1,
      row-gutter: 0.15em,
      grid(
        columns: (5fr, 1fr, 1fr, 1fr, 8fr),
        column-gutter: 0pt,
        text(size: 0.75em)[#bit-range([15], [11])],
        text(size: 0.75em)[#align(center)[10]],
        text(size: 0.75em)[#align(center)[9]],
        text(size: 0.75em)[#align(center)[8]],
        text(size: 0.75em)[#bit-range([7], [0])],
      ),
      table(
        columns: (5fr, 1fr, 1fr, 1fr, 8fr),
        align: center + horizon,
        stroke: 0.6pt,
        [00000], [C], [Z], [N], [OFFSET],
      ),
    )
  ]
]

其中，00000为操作码OP；C、Z和N分别为CF、ZF和NF的对应检测位，某检测位为1时表示需检测对应标志，需检测的标志位中只要有一个为1就转移，否则不转移，例如，若
$"C" = 1, quad "Z" = 0, quad "N" = 1$
，则需检测CF和NF的值，当CF=1或NF=1时发生转移；OFFSET是相对偏移量，用补码表示。转移执行时，转移目标地址为（PC）+2+2×OFFSET；顺序执行时，下条指令地址为（PC）+2。请回答下列问题。

#subquestions[
+ 
  该计算机存储器按字节编址还是按字编址？该条件转移指令向后（反向）最多可跳转多少条指令？
  \
+ 
  某条件转移指令的地址为200CH，指令内容如下图所示，若该指令执行时
  $"CF" = 0$、$"ZF" = 0$、$"NF" = 1$
  ，则该指令执行后PC的值是多少？若该指令执行时 $"CF" = 1$、
  $"ZF" = 0$、$"NF" = 0$
  ，则该指令执行后PC的值又是多少？请给出计算过程。
  
  #align(center)[
    #box(width: 44%)[
      #let bit-range(first, last) = box(width: 100%)[
        #grid(
          columns: (1fr, 1fr),
          inset: (x: 0.10em),
          align: (left, right),
          first,
          last,
        )
      ]
      #grid(
        columns: 1,
        row-gutter: 0.15em,
        grid(
          columns: (5fr, 1fr, 1fr, 1fr, 8fr),
          column-gutter: 0pt,
          text(size: 0.75em)[#bit-range([15], [11])],
          text(size: 0.75em)[#align(center)[10]],
          text(size: 0.75em)[#align(center)[9]],
          text(size: 0.75em)[#align(center)[8]],
          text(size: 0.75em)[#bit-range([7], [0])],
        ),
        table(
          columns: (5fr, 1fr, 1fr, 1fr, 8fr),
          align: center + horizon,
          stroke: 0.6pt,
          [00000], [0], [1], [1], [11100011],
        ),
      )
    ]
  ]
  \
+ 
  实现“无符号数比较小于等于时转移”功能的指令中，C、Z和N应各是什么？
  \
+ 
  以下是该指令对应的数据通路示意图，要求给出图中部件①～③的名称或功能说明。
  
  #align(center)[
    #cetz.canvas(length: 0.95cm, {
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
      let wire = 0.55pt
      let and-gate(cx, top) = merge-path({
        line((cx - 0.47, top), (cx + 0.47, top), (cx + 0.47, top - 0.29))
        bezier(
          (cx + 0.47, top - 0.29), (cx, top - 0.98),
          (cx + 0.47, top - 0.72), (cx + 0.20, top - 0.98),
        )
        bezier(
          (cx, top - 0.98), (cx - 0.47, top - 0.29),
          (cx - 0.20, top - 0.98), (cx - 0.47, top - 0.72),
        )
      }, close: true, fill: white, stroke: wire)
      let or-gate(cx, top) = merge-path({
        bezier(
          (cx - 0.72, top), (cx + 0.72, top),
          (cx - 0.38, top - 0.54), (cx + 0.38, top - 0.54),
        )
        bezier(
          (cx + 0.72, top), (cx, top - 1.55),
          (cx + 0.70, top - 0.78), (cx + 0.35, top - 1.47),
        )
        bezier(
          (cx, top - 1.55), (cx - 0.72, top),
          (cx - 0.35, top - 1.47), (cx - 0.70, top - 0.78),
        )
      }, close: true, fill: white, stroke: wire)
  
      hide(rect((-0.15, 0), (14.45, 8.35), stroke: none), bounds: true)
  
      // The wires sit behind the components, matching the ordering in the scan.
      line((0.72, 6.88), (0.72, 5.70), stroke: wire)
      line((1.65, 6.88), (1.65, 5.70), stroke: wire)
      line((2.58, 6.88), (2.58, 5.70), stroke: wire)
      line((5.45, 6.88), (5.45, 6.35), (0.92, 6.35), (0.92, 5.70), stroke: wire)
      line((5.93, 6.88), (5.93, 6.08), (1.85, 6.08), (1.85, 5.70), stroke: wire)
      line((6.43, 6.88), (6.43, 5.82), (2.78, 5.82), (2.78, 5.70), stroke: wire)
  
      line((0.72, 4.72), (0.72, 3.96), (1.18, 3.96), (1.18, 3.41), stroke: wire)
      line((1.65, 4.72), (1.65, 3.19), stroke: wire)
      line((2.58, 4.72), (2.58, 3.96), (2.12, 3.96), (2.12, 3.41), stroke: wire)
      line(
        (1.65, 2.18), (1.65, 1.12), (7.78, 1.12),
        stroke: wire,
        mark: (end: ">", fill: black, scale: 0.68),
      )
  
      line((7.55, 6.88), (7.55, 5.47), stroke: wire)
      line((7.16, 4.67), (7.16, 4.30), stroke: wire)
      line((7.16, 3.63), (7.16, 2.79), stroke: wire)
      line((8.15, 2.36), (8.15, 1.55), stroke: wire)
  
      line((11.58, 7.00), (11.58, 5.77), stroke: wire)
      line((9.83, 6.63), (9.83, 5.77), stroke: wire)
      line((10.75, 4.65), (10.75, 2.78), (9.25, 2.78), stroke: wire)
      line((10.75, 2.78), (10.75, 1.55), stroke: wire)
      line((9.20, 0.72), (9.20, 0.18), (13.58, 0.18), (13.58, 8.10), (11.58, 8.10), (11.58, 7.75), stroke: wire)
  
      rect((0, 6.88), (3.30, 7.98), fill: white, stroke: wire)
      content((1.65, 7.43), text(size: 0.88em)[标志寄存器])
      line((1.65, 7.98), (1.65, 8.30), stroke: wire)
  
      rect((4.10, 6.88), (8.40, 7.98), fill: white, stroke: wire)
      content((6.25, 7.66), text(size: 0.88em)[①])
      content((4.43, 7.16), text(size: 0.78em)[OP])
      content((5.45, 7.16), text(size: 0.78em)[C])
      content((5.93, 7.16), text(size: 0.78em)[Z])
      content((6.43, 7.16), text(size: 0.78em)[N])
      content((7.55, 7.16), text(size: 0.78em)[OFFSET])
      line((6.25, 7.98), (6.25, 8.30), stroke: wire)
  
      and-gate(0.72, 5.70)
      and-gate(1.65, 5.70)
      and-gate(2.58, 5.70)
      or-gate(1.65, 3.73)
  
      rect((6.12, 4.67), (8.20, 5.47), fill: white, stroke: wire)
      content((7.16, 5.07), text(size: 0.86em)[符号扩展器])
      rect((6.10, 3.63), (8.22, 4.30), fill: white, stroke: wire)
      content((7.16, 3.97), text(size: 0.88em)[②])
      rect((7.00, 2.36), (9.25, 3.19), fill: white, stroke: wire)
      content((8.13, 2.78), text(size: 0.88em)[③])
  
      rect((10.50, 7.00), (12.66, 7.75), fill: white, stroke: wire)
      content((11.58, 7.38), text(size: 0.88em)[PC])
      content((9.60, 6.24), text(size: 0.82em)[2])
      line(
        (9.55, 5.77), (10.30, 5.77), (10.75, 5.43),
        (11.15, 5.77), (12.02, 5.77), (11.56, 4.65), (10.08, 4.65),
        close: true,
        fill: white,
        stroke: wire,
      )
      content((10.79, 5.11), text(size: 0.88em)[加法器])
  
      rect((7.78, 0.72), (10.75, 1.55), fill: white, stroke: wire)
      content((9.27, 1.13), text(size: 0.88em)[多路选择器])
    })
  ]
  
    
]
]

#block(breakable: false)[#question(label: n => [2021 18])[
下列关于数据通路的叙述中，#emphasis[错误]的是

#choices([数据通路包含 ALU 等组合逻辑（操作）元件], [数据通路包含寄存器等时序逻辑（状态）元件], [数据通路不包含用于异常事件检测及响应的电路], [数据通路中的数据流动路径由控制信号进行控制])
]]

#block(breakable: false)[#question(label: n => [2023 18])[
数据通路由组合逻辑元件（操作元件）和时序逻辑元件（状态元件）组成。下列给出的元件中，属于操作元件的是
#statements(columns: 1, [Ⅰ．算术逻辑部件（ALU）], [Ⅱ．程序计数器（PC）], [Ⅲ．通用寄存器组（GPRs）], [Ⅳ．多路选择器（MUX）])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2026 20])[
在不考虑异常/中断处理和访存额外开销的前提下，下列关于数据通路结构与 CPI 之间关系的叙述中，正确的是
#statements(columns: 1, [Ⅰ．单周期数据通路计算机的 CPI 等于1], [Ⅱ．多周期数据通路计算机的 CPI 大于1], [Ⅲ．流水线数据通路计算机的 CPI 等于1])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [Ⅰ、Ⅱ、Ⅲ])
]]
