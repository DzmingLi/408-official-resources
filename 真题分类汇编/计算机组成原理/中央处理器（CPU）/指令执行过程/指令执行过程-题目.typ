// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：指令执行过程

#block(breakable: false)[#question(label: n => [2009 11])[
冯·诺依曼计算机中指令和数据均以二进制形式存放在存储器中，CPU区分它们的依据是

#choices(
  [指令操作码的译码结果],
  [指令和数据的寻址方式],
  [指令周期的不同阶段],
  [指令和数据所在的存储单元],
)
]]

#block(breakable: false)[#question(label: n => [2011 19])[
假定不采用
Cache和指令预取技术，且机器处于“开中断”状态，则在下列有关指令执行的叙述中，错误的是

#choices(
  [每个指令周期中 CPU 都至少访问内存一次],
  [每个指令周期一定大于或等于一个 CPU 时钟周期],
  [空操作指令的指令周期中任何寄存器的内容都不会被改变],
  [当前程序在每条指令执行结束时都可能被外部中断打断],
)
]]

#block(breakable: false)[#question(label: n => [2019 16])[
下列有关处理器时钟脉冲信号的叙述中，错误的是

#choices(
  [时钟脉冲信号由机器脉冲源发出的脉冲信号经整形和分频后形成],
  [时钟脉冲信号的宽度称为时钟周期，时钟周期的倒数为机器主频],
  [时钟周期以相邻状态单元间组合逻辑电路的最大延迟为基准确定],
  [处理器总是在每来一个时钟脉冲信号时就开始执行一条新的指令],
)
]]

#block(breakable: false)[#question(label: n => [2024 13])[
通常情况下，将汇编语言程序中实现特定功能的指令序列定义成一条伪指令（pseudoinstruction）。下列选项中，CPU 能理解并直接执行的是

#statements(columns: (1fr,1fr,1fr,1fr), [Ⅰ．伪指令], [Ⅱ．微指令], [Ⅲ．机器指令], [Ⅳ．汇编指令])

#choices([仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅲ、Ⅳ], [仅Ⅰ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2026 17])[
下列指令中，执行后有可能按存放顺序执行其下一条指令的是
#statements(columns: 2, [Ⅰ．条件跳转指令], [Ⅱ．过程调用指令], [Ⅲ．陷阱（Trap）指令], [Ⅳ．过程返回指令])
#choices([仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅲ、Ⅳ])
]]
