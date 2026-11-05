// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：指令系统的基本概念

#block(breakable: false)[#question(label: n => [2022 18])[
下列选项中，属于指令集体系结构（ISA）规定的内容是

#statements(columns: (1fr, 1fr), [Ⅰ．指令字格式和指令类型], [Ⅱ．CPU 的时钟周期],
  [Ⅲ．通用寄存器个数和位数], [Ⅳ．加法器的进位方式],
)

#choices([Ⅰ、Ⅱ], [Ⅰ、Ⅲ], [Ⅱ、Ⅳ], [Ⅰ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2025 16])[
下列选项中，由指令集体系结构（ISA）规定的是

#choices([是否采用阵列乘法器],[是否采用定长指令字格式],[是否采用微程序控制器],[是否采用单总线数据通路])
]]

#block(breakable: false)[#question(label: n => [2026 16])[
对于下列选项中给出的相关内容，#emphasis[不是]由指令集体系结构规定的是
#choices([指令集中是否包含输入和输出指令], [采用向量中断还是非向量中断方式], [采用段式还是页式虚拟存储管理方式], [指令流水线是否采用超级流水线技术])
]]

#block(breakable: false)[#question(label: n => [2026 21])[
I/O 子系统中，由驱动程序和中断服务程序直接控制外设与主机之间的输入/输出操作，其中需要用到一些特权指令。下列指令中，#emphasis[不属于]特权指令的是
#choices([I/O 指令], [关中断指令], [中断返回指令], [系统调用指令])
]]
