// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：运算方法和运算电路

== 加/减运算

#block(breakable: false)[#question(label: n => [2011 17])[
某机器有一个标志寄存器，其中有进位/借位标志CF、零标志ZF、符号标志SF和溢出标志OF，条件转移指令bgt（无符号整数比较大于时转移）的转移条件是

#choices(
  [$"CF" + "OF" = 1$],
  [$overline("SF") + "ZF" = 1$],
  [$overline("CF" + "ZF") = 1$],
  [$overline("CF" + "SF") = 1$],
)
]]

#block(breakable: false)[#question(label: n => [2018 19])[
减法指令“`sub R1, R2, R3`”的功能为“（R1）-（R2）→R3”，该指令执行后将生成进位/借位标志 CF 和溢出标志 OF。若（R1）=FFFF FFFFH，（R2）=FFFF FFF0H，则该减法指令执行后，CF 与 OF 分别为

#choices([CF=0，OF=0], [CF=1，OF=0], [CF=0，OF=1], [CF=1，OF=1])
]]

#block(breakable: false)[#question(label: n => [2023 16])[
已知 $x,y$ 为 int 类型，当 $x=100,y=200$ 时，执行“$x$ 减 $y$”指令得到的溢出标志 OF 和借位标志 CF 分别为0、1，那么，当 $x=10,y=-20$ 时，执行该指令得到的 OF 和 CF 分别为
#choices([OF=0，CF=0], [OF=0，CF=1], [OF=1，CF=0], [OF=1，CF=1])
]]

#block(breakable: false)[#question(label: n => [2025 14])[
假设8位字长的计算机中，两个带符号整数 $x$ 和 $y$ 的补码表示分别为 $[x]_补=$ A3H、$[y]_补=$75H，则通过补码加减运算器得到的 $x-y$ 的值及 OF 标志分别为

#choices([24，0],[24，1],[46，0],[46，1])
]]

== 乘/除运算

#block(breakable: false)[#question(label: n => [2024 15])[
下列关于整数乘法运算的叙述中，#emphasis[错误]的是

#choices([用阵列乘法器实现的乘运算可以在一个时钟周期内完成], [用 ALU 和移位器实现的乘运算无法在一个时钟周期内完成], [变量与常数的乘运算可编译优化为若干条移位及加/减运算指令], [两个变量的乘运算无法编译转换为移位及加法等指令的循环实现])
]]
