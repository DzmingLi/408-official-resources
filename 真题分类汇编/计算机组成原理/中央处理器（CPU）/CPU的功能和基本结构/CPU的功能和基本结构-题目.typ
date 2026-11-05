// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：CPU的功能和基本结构

#block(breakable: false)[#question(label: n => [2010 18])[
下列寄存器中，汇编语言程序员可见的是

#choices(
  [存储器地址寄存器（MAR）],
  [程序计数器（PC）],
  [存储器数据寄存器（MDR）],
  [指令寄存器（IR）],
)
]]

#question(label: n => [2010 43])[
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

#block(breakable: false)[#question(label: n => [2011 15])[
某计算机存储器按字节编址，主存地址空间大小为64
MB，现用 $4 "M" times 8$位的RAM芯片组成32
MB的主存储器，则存储器地址寄存器MAR的位数至少是

#choices(
  [22位],
  [23位],
  [25位],
  [26位],
)
]]

#block(breakable: false)[#question(label: n => [2016 18])[
某计算机主存空间为4 GB，字长为32位，按字节编址，采用32位定长指令字格式。若指令按字边界对齐存放，则程序计数器（PC）和指令寄存器（IR）的位数至少分别是
#choices([30,30], [30,32], [32,30], [32,32])
]]

#block(breakable: false)[#question(label: n => [2020 12])[
下列给出的部件中，其位数（宽度）一定与机器字长相同的是

#statements(columns: (1fr, 1fr), [Ⅰ．ALU], [Ⅱ．指令寄存器], [Ⅲ．通用寄存器], [Ⅳ．浮点寄存器],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ], [仅Ⅱ、Ⅲ], [仅Ⅱ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2021 17])[
下列寄存器中，汇编语言程序员可见的是

#statements(columns:(1fr,1fr),[Ⅰ．指令寄存器], [Ⅱ．微指令寄存器], [Ⅲ．基址寄存器], [Ⅳ．标志/状态寄存器],
)

#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅳ], [仅Ⅲ、Ⅳ])
]]

#question(label: n => [2021 43])[
（15分）假定计算机 M 字长为16位，按字节编址，连接 CPU 和主存的系统总线中地址线为20位、数据线为8位，采用16位定长指令字，指令格式及其说明如下：

#align(center,context {
  set text(size:0.85em)
  table(columns:(auto,6em,3em,3em,3em,4em,1fr),align:center,
    stroke:(x,y)=>if x == 0 or x == 6 or y == 0 {none} else {0.5pt},
    [格式],[6位],[2位],[2位],[2位],[4位],[指令功能或指令类型说明],
    [R 型],[000000],[rs],[rt],[rd],[op1],align(left)[R[rd] ← R[rs] op1 R[rt]],
    [I 型],[op2],[rs],[rt],table.cell(colspan:2)[imm],align(left)[含 ALU 运算、条件转移和访存操作3类指令],
    [J 型],[op3],table.cell(colspan:4)[target],align(left)[PC 的低10位 ← target],
  )
})

其中，op1～op3 为操作码，rs、rt 和 rd 为通用寄存器编号，R[r] 表示寄存器 r 的内容，imm 为立即数，target 为转移目标的形式地址。请回答下列问题。

#subquestions[
+ ALU 的宽度是多少位？可寻址主存空间大小为多少字节？指令寄存器、主存地址寄存器（MAR）和主存数据寄存器（MDR）分别应有多少位？
+ R 型格式最多可定义多少种操作？I 型和 J 型格式总共最多可定义多少种操作？通用寄存器最多有多少个？
+ 假定 op1 为0010和0011时，分别表示带符号整数减法和带符号整数乘法指令，则指令01B2H的功能是什么（参考上述指令功能说明的格式进行描述）？若1、2、3号通用寄存器当前内容分别为 B052H、0008H、0020H，则分别执行指令01B2H和01B3H后，3号通用寄存器内容各是什么？各自结果是否溢出？
+ 若采用 I 型格式的访存指令中 imm（偏移量）为带符号整数，则地址计算时应对 imm 进行零扩展还是符号扩展？
+ 无条件转移指令可以采用上述哪种指令格式？

]
]
