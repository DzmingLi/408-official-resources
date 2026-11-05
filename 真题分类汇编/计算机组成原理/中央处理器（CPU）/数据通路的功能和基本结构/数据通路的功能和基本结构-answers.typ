// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：数据通路的功能和基本结构

=== 2009 44

参考答案一：

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [时钟], [功能], [有效控制信号],
    [C5], [MAR←(R1)], [R1out,MARin],
    [C6], [MDR←M(MAR) A←(R0)], [MemR,MDRinE R0out,Ain],
    [C7], [AC←(MDR)+(A)], [MDRout,Add,ACin],
    [C8], [MDR←(AC)], [ACout,MDRin],
    [C9], [M(MAR)←(MDR)], [MDRoutE,MemW],
  )]
  , kind: table
  )

“A $arrow.l$ （R0）”也可在C7：“AC $arrow.l$
（MDR）+（A）”之前单列的一个时钟周期内执行。参考答案二：

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [时钟], [功能], [有效控制信号],
    [C5], [MAR←(R1)], [R1out,MARin],
    [C6], [MDR←M(MAR)], [MemR,MDRinE],
    [C7], [A←(MDR)], [MDRout,Ain],
    [C8], [AC←(A)+(R0)], [R0out,Add,ACin],
    [C9], [MDR←(AC)], [ACout,MDRin],
    [C10], [M(MAR)←(MDR)], [MDRoutE,MemW],
  )]
  , kind: table
  )

=== 2013 44

#subquestions(after-heading: true, allow-oversize: true)[
+
  因为指令长度为16位，且下条指令地址为（PC）+2，故编址单位是字节。（1分）偏移量OFFSET为8位补码，范围为-128～127，故相对于当前条件转移指令，向后最多可跳转127条指令。（2分）

  【评分说明】若正确给出 OFFSET的取值范围，则酌情给分。

+ 指令中 $C = 0 \, Z = 1 \, N = 1$
  ，故应根据ZF和NF的值来判断是否转移。当CF=0，
  $Z F = 0 \, N F = 1$时，需转移。（1分）已知指令中偏移量为11100011B=E3H，符号扩展后为FFE3H，左移一位（乘2）后为FFC6H，故PC的值（即转移目标地址）为
  $200 upright("CH") + 2 + upright("FFC") 6 upright("H") = 1 upright("FD") 4 upright("H")$。（2分）当
  $upright("CF") = 1 \, upright("ZF") = 0 \, upright("NF") = 0$时不转移。（1分）PC的值为：
  $200 upright("CH") + 2 = 200 upright("EH")$。（1分）

+ 指令中的C、Z和N应分别设置为
  $upright("C=Z=1\,N=0")$。（3分）

+ 部件
  ①：指令寄存器（用于存放当前指令）；部件
  ②：移位寄存器（用于左移一位）；部件
  ③：加法器（地址相加）。（3分）

]

=== 2021 18：C

=== 2023 18

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 2026 20

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]
