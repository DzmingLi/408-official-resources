// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：高级语言程序与机器级代码之间的对应

== 编译器、汇编器和链接器的基本概念

#block(breakable: false)[#question(label: n => [2016 12])[
将高级语言源程序转换为机器级目标代码文件的程序是
#choices([汇编程序], [链接程序], [编译程序], [解释程序])
]]

#block(breakable: false)[#question(label: n => [2022 20])[
将高级语言源程序转换为可执行目标文件的主要过程是

#choices([预处理→编译→汇编→链接], [预处理→汇编→编译→链接], [预处理→编译→链接→汇编], [预处理→汇编→链接→编译])
]]

== 循环结构语句的机器级表示

#question(label: n => [2017 44])[
原卷第43题共用背景（不含小问）：

已知 $f(n)=sum_(i=0)^n 2^i=2^(n+1)-1=overbrace(11 dots.c 1, n+1"位")"B"$，计算 $f(n)$ 的 C 语言函数 f1 如下：
```
1  int f1(unsigned n)
2  {    int sum=1, power=1;
3       for(unsigned i=0; i<=n-1; i++)
4       {    power *= 2;
5            sum += power;
6       }
7       return sum;
8  }
```
将 f1 中的 int 都改为 float，可得到计算 $f(n)$ 的另一个函数 f2。假设 unsigned 和 int 型数据都占32位，float 采用 IEEE 754 单精度标准。



（10分）在按字节编址的计算机 M 上，题43中 f1 的部分源程序（阴影部分）与对应的机器级代码（包括指令的虚拟地址）如下：
#align(center, table(columns: (2em, 6em, 5em, 16em), stroke: none,
 table.cell(colspan: 4, fill: luma(92%))[`int f1(unsigned n)`],
 [1], [00401020], [55], [`push ebp`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`for(unsigned i=0; i<=n-1; i++)`],
 [], [……], [……], [……],
 [20], [0040105E], [39 4D F4], [`cmp dword ptr [ebp-0Ch], ecx`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`{    power *= 2;`],
 [], [……], [……], [……],
 [23], [00401066], [D1 E2], [`shl edx, 1`],
 [], [……], [……], [……],
 table.cell(colspan: 4, fill: luma(92%))[`return sum;`],
 [], [……], [……], [……],
 [35], [0040107F], [C3], [`ret`]))
其中，机器级代码行包括行号、虚拟地址、机器指令和汇编指令。请回答下列问题。
#subquestions[
 + 计算机 M 是 RISC 还是 CISC？为什么？
 + f1 的机器指令代码共占多少字节？要求给出计算过程。
 + 第20条指令 cmp 通过 $i$ 减 $n-1$ 实现对 $i$ 和 $n-1$ 的比较。执行 f1(0)过程中，当 $i=0$ 时，cmp 指令执行后，进/借位标志 CF 的内容是什么？要求给出计算过程。
 + 第23条指令 shl 通过左移操作实现了 power\*2运算，在 f2 中能否也用 shl 指令实现 power\*2？为什么？
]
]

#question(label: n => [2023 44])[
原卷第43题共用背景（不含小问）：

已知计算机 M 字长为32位，按字节编址，采用请求调页策略的虚拟存储管理方式，虚拟地址为32位，页大小为4 KB；数据 Cache 采用4路组相联映射方式，数据区大小为8 KB，主存块大小为32 B。现有 C 语言程序段如下：
#block(stroke: (dash: "dashed", thickness: .5pt), inset: .45em)[
```c
int a[24][64];
…
for(i=0; i<24; i++)
    for(j=0; j<64; j++) a[i][j]=10;
```
]
已知二维数组 a 按行优先存放，在虚拟地址空间中分配的起始地址为0042 2000H，sizeof(int)=4，假定在 M 上执行上述程序段之前数组 a 不在主存，且在该程序段执行过程中不会发生页面置换。：



（9分）题43中的 C 程序段在计算机 M 上的部分机器级代码如下，每个机器级代码行中依次包含指令序号、虚拟地址、机器指令和汇编指令。
#block(stroke: (dash: "dashed", thickness: .5pt), inset: 0pt)[
#table(columns: (1.5em, 5.5em, 11em, 1fr), stroke: none,
 table.cell(colspan: 4, fill: luma(82%))[`for(i=0; i<24; i++)`],
 [1], [00401072], [C7 45 F8 00 00 00 00], [`mov [ebp-8], 0`],
 [2], [*00401079*], [*EB 09*], [*`jmp 00401084h`*],
 [3], [0040107B], [8B 55 F8], [`mov eax, [ebp-8]`],
 [], […], […], […],
 [7], [*00401088*], [*7D 32*], [*`jge 004010bch`*],
 table.cell(colspan: 4, fill: luma(82%))[`for(j=0; j<64; j++)`],
 [8], [0040108A], [C7 45 FC 00 00 00 00], [`mov [ebp-4], 0`],
 [], […], […], […],
 table.cell(colspan: 4, fill: luma(82%))[`a[i][j]=10;`],
 [], […], […], […],
 [19], [*004010AE*], [*C7 84 82 00 20 42 00 0A 00 00 00*], [*`mov [ecx+edx*4+00422000h], 0Ah`*],
 [20], […], […], […])
]
请回答下列问题。
#subquestions[
 + 第20条指令的虚拟地址是多少？
 + 已知第2条 jmp 和第7条 jge 都是跳转指令，其操作码分别是 EBH 和7DH，跳转目标地址分别为0040 1084H、0040 10BCH，这两条指令都采用什么寻址方式？给出第2条指令 jmp 的跳转目标地址计算过程。
 + 已知第19条 mov 指令的功能为“a\[i\]\[j\]←10”，其中 ecx 和 edx 为寄存器名，0042 2000H是数组 a 的首地址，指令中源操作数采用什么寻址方式？已知 edx 中存放的是变量 $j$，ecx 中存放的是什么？根据该指令的机器码判断计算机 M 采用的是大端还是小端方式。
 + 第一次执行第19条指令时，取指令过程中是否会发生缺页异常？为什么？
]
]

#question(label: n => [2024 44])[
原卷第43题共用背景（不含小问）：


（本题13分）假定计算机 M 字长为32位，按字节编址，采用32位定长指令字，指令 add、slli 和 lw 的格式、编码和功能说明如题43图（a）所示。

#figure(align(center)[
  #set text(size: 0.8em)
  #table(columns: (3em,7fr,5fr,5fr,3fr,5fr,7fr,14em),stroke: none,align: center,
    [指令], [31#h(1fr)25], [24#h(1fr)20], [19#h(1fr)15], [14#h(1fr)12], [11#h(1fr)7], [6#h(1fr)0], [指令功能说明],
    [add], ..([0000000],[rs2],[rs1],[000],[rd],[0110011]).map(x=>table.cell(stroke: 0.045em,x)), [R[rd] ← R[rs1]+R[rs2]],
    [slli], ..([0000000],[shamt],[rs1],[010],[rd],[0010011]).map(x=>table.cell(stroke: 0.045em,x)), [R[rd] ← R[rs1]\<\<shamt],
    [lw], table.cell(colspan: 2,stroke: 0.045em)[imm], ..([rs1],[010],[rd],[0000011]).map(x=>table.cell(stroke: 0.045em,x)), [R[rd] ← M[R[rs1]+imm]],
  )
],caption: [题43图（a）],kind: image)

其中，R[$x$] 表示通用寄存器 $x$ 的内容，M[$x$] 表示地址为 $x$ 的存储单元内容，shamt 为移位位数，imm 为补码表示的偏移量。题43图（b）给出了计算机 M 的部分数据通路及其控制信号（用带箭头虚线表示），其中，A 和 B 分别表示从通用寄存器 rs1 和 rs2 中读出的内容；IR[31:20] 表示指令寄存器中的高12位；控制信号 Ext 为0、1时扩展器分别实现零扩展、符号扩展，ALUctr 为000、001、010时 ALU 分别实现加、减、逻辑左移运算。

#figure(align(center,cetz.canvas(length:1em,{
  import cetz.draw: *
  // 2026 大纲 PDF 第 61 页；包括 ALUctr 的 3 位标记。
  set-style(stroke:0.045em,content:(wrap:body=>box(text(size:0.8em,top-edge:"bounds",bottom-edge:"bounds",body))))
  let p(x,y)=((x - 153) / 35,(966 - y) / 35)
  let label(x,y,body)=content(p(x,y),body)
  let arrow(a,b)=line(p(..a),p(..b),mark:(end:">",fill:black,scale:0.65))
  rect(p(371,819),p(519,873)); label(445,846,[扩展器])
  line(..((607,736),(674,770),(674,844),(607,879)).map(q=>p(..q)),close:true)
  label(619,768,[0]); label(619,852,[1])
  content(p(650,804),[MUX],angle:-90deg)
  line(..((754,648),(843,694),(843,807),(754,854),(754,768),(773,750),(754,733)).map(q=>p(..q)),close:true)
  content(p(803,750),[ALU],angle:-90deg)
  for (a,b) in (((283,849),(371,849)),((519,851),(607,851)),((674,811),(754,811)),
    ((520,692),(754,692)),((520,769),(607,769)),((843,754),(1031,754))) {arrow(a,b)}
  label(502,692,[A]);label(502,769,[B]);label(217,847,[IR[31:20]]);label(1050,754,[F])
  for (x,y,n) in ((314,849,[12]),(550,851,[32]),(689,811,[32]),(550,769,[32]),(550,692,[32]),(972,754,[32])) {
    line(p(x - 7,y - 7),p(x+7,y+7));label(x+15,y - 19,n)
  }
  for (y,body) in ((703,[OF]),(731,[SF]),(777,[ZF]),(805,[CF])) {
    arrow((843,y),(897,y));label(923,y,body)
  }
  for (x,y,body) in ((445,875,[Ext]),(642,861,[ALUBsrc]),(802,832,[ALUctr])) {
    line(p(x,915),p(x,y),stroke:(thickness:0.045em,dash:"dashed"),mark:(end:">",fill:black,scale:0.65))
    label(x,928,body)
  }
  line(p(795,871),p(809,885));label(818,864,[3])
  for (x,y,body) in ((259,895,[0：零扩展]),(269,936,[1：符号扩展]),
    (938,852,[000：加]),(938,887,[001：减]),(978,924,[010：逻辑左移]),(898,958,[⋯])) {label(x,y,body)}
})),caption:[题43图（b）],kind:image)






（本题10分）对于题43中的计算机 M，C 语言程序 P 包含语句“sum+=a[i];”，在 M 中对应的指令序列 S 如下。

#align(center,block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
```asm
slli r4, r2, 2     // R[r4]←R[r2]<<2
add  r4, r3, r4    // R[r4]←R[r3]+R[r4]
lw   r5, 0(r4)     // R[r5]←M[R[r4]+0]
add  r1, r1, r5    // R[r1]←R[r1]+R[r5]
```
])

已知变量 $i$、$s u m$ 和数组 $a$ 都为 int 型，通用寄存器 r1～r5 的编号为01H～05H。

请回答下列问题。

#subquestions[
+ 根据指令序列 S 中每条指令的功能，写出存放数组 $a$ 的首地址、变量 $i$ 和 $s u m$ 的通用寄存器编号。（3分）
+ 已知 M 为小端方式计算机，采用页式存储管理方式，页大小为4 KB。若执行到指令序列 S 中第1条指令时，$i=5$ 且 r1 和 r3 的内容分别为0000 1332H和0013 DFF0H，从地址0013 DFF0H开始的存储单元内容如题44图所示，则执行“sum+=a[i];”语句后，$a[i]$ 的地址、$a[i]$ 和 $s u m$ 的机器数分别是什么（用十六进制表示）？$a[i]$ 所在页的页号是多少？此次执行中，数组 $a$ 至少存放在几页中？（5分）
]

#figure(align(center,table(columns: (7em,auto,auto,auto,auto,auto,auto,auto,auto),align: center,stroke: none,
  [地址], [0], [1], [2], [3], [4], [5], [6], [7],
  [0013 DFF0], ..([FF],[FF],[FF],[7C],[70],[FE],[FF],[FF]).map(x=>table.cell(stroke: (top: 0.05em,bottom: 0.05em),x)),
  [0013 DFF8], ..([00],[00],[00],[0C],[3C],[02],[01],[FF]).map(x=>table.cell(stroke: (bottom: 0.05em),x)),
  [0013 E000], ..([F0],[F1],[00],[00],[DC],[EC],[FF],[FF]).map(x=>table.cell(stroke: (bottom: 0.05em),x)),
  [0013 E008], ..([FF],[FF],[01],[02],[00],[00],[01],[02]).map(x=>table.cell(stroke: (bottom: 0.05em),x)),
  table.vline(x: 1, start: 1, stroke: 0.05em),table.vline(x: 9,start: 1,stroke: 0.05em),
)),caption: [题44图],kind: image)

#subquestions(start: 3)[
+ 指令“slli r4, r2, 2”的机器码是什么（用十六进制表示）？若数组 $a$ 改为 short 类型，则指令序列 S 中 slli 指令的汇编形式应是什么？（2分）
]
]

#question(label: n => [2026 43])[
（本题10分）某16位计算机 C 按字节编址，通用寄存器 R0～R15 的编号为0～15，存储器地址为16位，采用定长指令字，指令格式有 R、I 和 M 型，如下所示。
#text(size: .9em)[
#table(columns: (3em, 3.2em, 3.2em, 4.2em, 3.2em, 1fr), stroke: none, align: center,
 [格式], [4位], [4位], [4位], [4位], [功能说明],
 [R型], table.cell(stroke: .5pt)[0000], table.cell(stroke: .5pt)[rt], table.cell(stroke: .5pt)[rs/num], table.cell(stroke: .5pt)[op1], [R\[rt\]←R\[rt\] op1 R\[rs\]，R\[rt\]←R\[rt\] op1 num],
 [I型], table.cell(stroke: .5pt)[op2], table.cell(stroke: .5pt)[rt], table.cell(colspan: 2, stroke: .5pt)[imm8], [R\[rt\]←R\[rt\] op2 imm8],
 [M型], table.cell(stroke: .5pt)[op3], table.cell(colspan: 3, stroke: .5pt)[offset], [R\[0\]←M\[R\[15\]+offset\]，M\[R\[15\]+offset\]←R\[0\]])
]
其中，op1 为0001、0010分别表示加、左移指令，op2 为0100表示加立即数指令，op3 为1110、1111分别表示取数、存数指令，R\[r\]表示寄存器 r 中的内容，num 为移位位数，M\[addr\]表示存储器地址 addr 中的内容。请回答下列问题。
#subquestions[
 + 主存单元和通用寄存器的宽度各是多少位？（2分）
 + op1 和 op2 的编码是否可以相同？op2 和 op3 的编码是否可以相同？（2分）
 + 若 R\[2\]=ABCDH，R\[9\]=F001H，则指令0000 0010 1001 0001执行后，R2 和 R9 中内容分别是多少（用十六进制表示）？（2分）
 + 若变量 $x,y$ 均为16位带符号整数，在存储器中依次从低地址向高地址连续存放，$x$ 的地址在 R15 中，实现“`y=16*x-5;`”的4条指令 I1～I4 如题43表所示，写出①～④处的内容。（4分）
]
#figure(block(stroke: .5pt, inset: .45em)[
 #table(columns: (2em, 3em, 3em, 3em, 3em), stroke: none, align: center,
 [I1：], [#underline[①]], [0000], [0000], [0000],
 [I2：], [0000], table.cell(colspan: 2)[#underline[　②　]], [0010],
 [I3：], [0100], [0000], table.cell(colspan: 2)[#underline[　③　]],
 [I4：], [1111], table.cell(colspan: 3)[#underline[　　④　　]])
], kind: table, caption: [题43表])
]
