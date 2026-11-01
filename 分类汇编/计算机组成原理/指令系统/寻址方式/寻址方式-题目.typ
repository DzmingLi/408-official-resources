// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：寻址方式

#block(breakable: false)[#question(label: n => [2009 16])[
某机器字长16位，主存按字节编址，转移指令采用相对寻址，由两个字节组成，第一字节为操作码字段，第二字节为相对位移量字段。假定取指令时，每取一个字节PC自动加1。若某转移指令所在主存地址为2000H，相对位移量字段的内容为06H，则该转移指令成功转移后的目标地址是

#choices(
  [2006H],
  [2007H],
  [2008H],
  [2009H],
)
]]

#block(breakable: false)[#question(label: n => [2011 16])[
偏移寻址通过将某个寄存器内容与一个形式地址相加而生成有效地址。下列寻址方式中，不属于偏移寻址方式的是

#choices(
  [间接寻址],
  [基址寻址],
  [相对寻址],
  [变址寻址],
)
]]

#block(breakable: false)[#question(label: n => [2013 17])[
假设变址寄存器R的内容为1000H，指令中的形式地址为2000H；地址1000H中的内容为2000H，地址2000H中的内容为3000H，地址3000H中的内容为4000H，则变址寻址方式下访问到的操作数是

#choices(
  [1000H],
  [2000H],
  [3000H],
  [4000H],
)
]]

#block(breakable: false)[#question(label: n => [2014 17])[
某计算机有16个通用寄存器，采用32位定长指令字，操作码字段（含寻址方式位）为8位，Store指令的源操作数和目的操作数分别采用寄存器直接寻址和基址寻址方式。若基址寄存器可使用任一通用寄存器，且偏移量用补码表示，则Store指令中偏移量的取值范围是

#choices(
  [$-32768 tilde.op +32767$],
  [$-32767 tilde.op +32768$],
  [$-65536 tilde.op +65535$],
  [$-65535 tilde.op +65536$],
)
]]

#block(breakable: false)[#question(label: n => [2016 17])[
某指令格式如下所示。

#align(center, table(columns:(4em,3em,3em,5em), align:center, [OP],[M],[I],[D]))

其中 M 为寻址方式，I 为变址寄存器编号，D 为形式地址。若采用先变址后间址的寻址方式，则操作数的有效地址是
#choices([I+D], [(I)+D], [((I)+D)], [((I))+D])
]]

#block(breakable: false)[#question(label: n => [2017 15])[
下列寻址方式中，最适合按下标顺序访问一维数组元素的是
#choices([相对寻址], [寄存器寻址], [直接寻址], [变址寻址])
]]

#block(breakable: false)[#question(label: n => [2018 18])[
按字节编址的计算机中，某 double 型数组 A 的首地址为2000H，使用变址寻址和循环结构访问数组 A，保存数组下标的变址寄存器初值为0，每次循环取一个数组元素，其偏移地址为变址值乘以 sizeof(double)，取完后变址寄存器内容自动加1。若某次循环所取元素的地址为2100H，则进入该次循环时变址寄存器的内容是

#choices([25], [32], [64], [100])
]]

#block(breakable: false)[#question(label: n => [2020 16])[
某计算机采用16位定长指令字格式，操作码位数和寻址方式位数固定，指令系统有48条指令，支持直接、间接、立即、相对4种寻址方式。单地址指令中，直接寻址方式的可寻址范围是

#choices([0～255], [0～1023], [−128～127], [−512～511])
]]
