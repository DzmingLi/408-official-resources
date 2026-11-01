// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：数据通路的功能和基本结构

=== 2009 44

参考答案一：

#align(center, table(columns: 3, align: center + horizon,
  [时钟], [功能], [有效控制信号],
  [C5], [MAR←(R1)], [R1out, MARin],
  [C6], [MDR←M(MAR)\ A←(R0)], [MemR, MDRinE\ R0out, Ain],
  [C7], [AC←(MDR)+(A)], [MDRout, Add, ACin],
  [C8], [MDR←(AC)], [ACout, MDRin],
  [C9], [M(MAR)←(MDR)], [MDRoutE, MemW],
))

“A←(R0)”也可在C7：“AC←(MDR)+(A)”之前单列的一个时钟周期内执行。

参考答案二：

#align(center, table(columns: 3, align: center + horizon,
  [时钟], [功能], [有效控制信号],
  [C5], [MAR←(R1)], [R1out, MARin],
  [C6], [MDR←M(MAR)], [MemR, MDRinE],
  [C7], [A←(MDR)], [MDRout, Ain],
  [C8], [AC←(A)+(R0)], [R0out, Add, ACin],
  [C9], [MDR←(AC)], [ACout, MDRin],
  [C10], [M(MAR)←(MDR)], [MDRoutE, MemW],
))

=== 2013 44

#subquestions(allow-oversize: true)[
+ 
  因为指令长度为16位，且下条指令地址为（PC）+2，故编址单位是字节。（1分）偏移量OFFSET为8位补码，范围为-128～127，故相对于当前条件转移指令，向后最多可跳转127条指令。（2分）
  
  【评分说明】若正确给出 OFFSET的取值范围，则酌情给分。
  
+ 指令中 $C = 0 \, Z = 1 \, N = 1$
  ，故应根据ZF和NF的值来判断是否转移。当CF=0，
  $Z F = 0 \, N F = 1$时，需转移。（1分）已知指令中偏移量为11100011B=E3H，符号扩展后为FFE3H，左移一位（乘2）后为FFC6H，故PC的值（即转移目标地址）为
  $2 0 0 upright(C H) + 2 + upright(F F C) 6 upright(H) = 1 upright(F D) 4 upright(H)$。（2分）当
  $upright(C F) = 1 \, upright(Z F) = 0 \, upright(N F) = 0$时不转移。（1分）PC的值为：
  $2 0 0 upright(C H) + 2 = 2 0 0 upright(E H)$。（1分）
  
+ 指令中的C、Z和N应分别设置为
  $upright(C = Z = 1 \, N = 0)$。（3分）
  
+ 部件
  ①：指令寄存器（用于存放当前指令）；部件
  ②：移位寄存器（用于左移一位）；部件
  ③：加法器（地址相加）。（3分）
  

]

=== 2021 18：C

=== 旧版题型示例

#block(breakable: false)[
自制解析（非官方）：原考纲未提供示例答案，以下答案与解析由本仓库自行编写。

CPU 数据通路

#subquestions[
+ a 为主存数据寄存器 MDR，b 为指令寄存器 IR，c 为主存地址寄存器 MAR，d 为程序计数器 PC。c 向主存提供地址；a 在主存与 CPU 之间传送数据；b 连接微操作信号发生器；d 具有“+1”通路。
+ 先把 PC 中的指令地址送入 MAR，发出读命令，主存把指令送入 MDR，再由 MDR 送入 IR。IR 中的操作码送入控制器译码并产生微操作控制信号。同时 PC 更新为下一条指令地址；图中的“+1”表示顺序取指时的地址推进，具体增量由编址和指令长度决定。
+ MAR 已有操作数地址时，主存按该地址读出数据并送入 MDR，再由 MDR 送入 ALU。AC 提供另一操作数，ALU 完成运算，结果经结果通路送回 MDR，再由 MDR 写入 MAR 指定的主存单元。ALU 产生的状态信息送入状态寄存器；若指令需保留累加结果，也可将结果送入 AC。
]
]
