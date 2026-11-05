// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：主存储器

== DRAM芯片和内存条

#block(breakable: false)[#question(label: n => [2010 22])[
假定一台计算机的显示存储器用DRAM芯片实现，若要求显示分辨率为
$1 6 0 0 times 1 2 0 0$颜色深度为24位，帧频为85Hz，显存总带宽的
50%用来刷新屏幕，则需要的显存总带宽至少约为

#choices(
  [245 Mbps],
  [979 Mbps],
  [1958 Mbps],
  [7834 Mbps],
)
]]

#block(breakable: false)[#question(label: n => [2014 15])[
某容量为256 MB的存储器由若干
$4 "M" times 8$位的DRAM芯片构成，该DRAM芯片的地址引脚和数据引脚总数是

#choices(
  [19],
  [22],
  [30],
  [36],
)
]]

#block(breakable: false)[#question(label: n => [2022 17])[
某内存条包含8个 $8192 times 8192 times 8$ 位的 DRAM 芯片，按字节编址，支持突发（burst）传送方式，对应存储器总线宽度为64位，每个 DRAM 芯片内有一个行缓冲区（row buffer）。下列关于该内存条的叙述中，#emphasis[不正确]的是

#choices([内存条的容量为512 MB], [采用多模块交叉编址方式], [芯片的地址引脚为26位], [芯片内行缓冲有 $8192 times 8$ 位])
]]

== 多模块存储器

#block(breakable: false)[#question(label: n => [2015 18])[
某计算机使用4体交叉编址存储器，假定在存储器总线上出现的主存地址（十进制）序列为8005，8006，8007，8008，8001，8002，8003，8004，8000，则可能发生访存冲突的地址对是

#choices([8004和8008], [8002和8007], [8001和8008], [8000和8004])
]]

#block(breakable: false)[#question(label: n => [2026 15])[
若用8个 $64"M" times 8$ 位的 DRAM 芯片按交叉编址方式构成主存储器，并与一个宽度为64位的存储器总线相连，主存每次最多读写64位，且按字节编址，则下列地址中，与主存地址0018 001DH位于同一芯片中的是
#choices([0000 01D5H], [000F A020H], [0018 001EH], [0F02 0014H])
]]

== 主存和CPU之间的连接

#block(breakable: false)[#question(label: n => [2009 15])[
某计算机主存容量为64KB，其中ROM区为4KB，其余为RAM区，按字节编址。现要用
$2 "K" times 8$位的ROM芯片和
$4 "K" times 4$位的RAM芯片来设计该存储器，则需要上述规格的ROM芯片数和RAM芯片数分别是

#choices(
  [1、15],
  [2、15],
  [1、30],
  [2、30],
)
]]

#block(breakable: false)[#question(label: n => [2010 15])[
假定用若干个
$2 "K" times 4$位的芯片组成一个
$8 "K" times 8$位的存储器，则地址0B1FH所在芯片的最小地址是

#choices(
  [0000H],
  [0600H],
  [0700H],
  [0800H],
)
]]

#block(breakable: false)[#question(label: n => [2016 16])[
某存储器容量为64 KB，按字节编址，地址4000H～5FFFH为ROM区，其余为RAM区。若采用 $8 "K" times 4$ 位的SRAM芯片进行设计，则需要该芯片的数量是
#choices([7], [8], [14], [16])
]]

#block(breakable: false)[#question(label: n => [2021 15])[
某计算机的存储器总线中有24位地址线和32位数据线，按字节编址，字长为32位。若00 0000H～3F FFFFH为 RAM 区，则需要 $512"K" times 8$ 位的 RAM 芯片数为

#choices([8], [16], [32], [64])
]]

#block(breakable: false)[#question(label: n => [2023 15])[
某计算机的 CPU 有30根地址线，按字节编址，CPU 和主存芯片连接时，要求主存芯片占满所有可能的存储地址空间，并且 RAM 区和 ROM 区所分配的空间大小比是3∶1。若 RAM 在连续低地址区，ROM 在连续高地址区，则 ROM 的地址范围是
#choices([0000 0000H～0FFF FFFFH], [1000 0000H～2FFF FFFFH], [3000 0000H～3FFF FFFFH], [4000 0000H～4FFF FFFFH])
]]
