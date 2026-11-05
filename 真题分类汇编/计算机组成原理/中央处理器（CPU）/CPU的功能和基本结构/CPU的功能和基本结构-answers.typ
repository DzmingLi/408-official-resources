// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：CPU的功能和基本结构

=== 2010 18：B

=== 2010 43

#subquestions(after-heading: true, allow-oversize: true)[
+
  该指令系统最多可有16条指令；该机最多有8个通用寄存器；因为地址空间大小为128KB，按字编址，故共有64K个存储单元；地址位数为16位，所以MAR至少为16位；因为字长为16位，所以MDR至少为16位。

+ 转移指令的目标地址范围为
  $0000 upright("H") tilde.op upright("FFFFH") 。$

+
  对于汇编语句“add（R4），（R5）+”，对应的机器码为：0010001100010101B，用十六进制表示为2315H。

  “add（R4），（R5）+”指令执行后，R5和存储单元5678H的内容会改变。执行后，
  R5的内容从5678H变为5679H，存储单元5678H中的内容从1234H变为68ACH。

]

=== 2011 15：D

=== 2016 18：B

=== 2020 12：B

=== 2021 17：D

=== 2021 43

#subquestions(allow-oversize: true)[
+ ALU 的宽度为16位。可寻址主存空间大小为 $2^20$ 字节（或1 MB）。指令寄存器、MAR 和 MDR 各有16位、20位和8位。
+ R 型最多有 $2^4$（或16）种操作。I 型和 J 型总共最多有63种操作。通用寄存器最多有4个。
+ 指令01B2H = 000000 01 10 11 0010B，其功能为 R[3] ← R[1]−R[2]。执行指令01B2H后，R[3] = B052H−0008H = B04AH；结果不溢出；执行指令01B3H后，R[3] = R[1]×R[2] = B052H×0008H = 8290H，结果溢出。
+ 应对 imm 进行符号扩展。
+ 无条件转移指令可以采用 J 型格式。

]
