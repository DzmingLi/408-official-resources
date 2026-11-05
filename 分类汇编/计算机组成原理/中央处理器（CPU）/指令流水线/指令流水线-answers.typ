// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：指令流水线

== 指令流水线的基本概念

=== 2013 18：C

== 指令流水线的基本实现

=== 2009 18：A

=== 2017 19：A

=== 2018 20：D

=== 2025 18：B

== 结构冒险、数据冒险和控制冒险的处理

=== 2010 19：A

=== 2011 18：D

=== 2012 44

#subquestions(after-heading: true, allow-oversize: true)[
+ $x$ 的机器码为 $[x]_(补)=1111110111111111 "B"$，即指令执行前(R1)=FDFFH，右移1位后为1111 1110 1111 1111B，即指令执行后(R1)=FEFFH。（2分）

  【评分说明】仅正确写出指令执行前的（R1）可给1分。
+ 至少需要4+(5−1)=8个时钟周期数。（2分）
+ $I_3$ 的ID段被阻塞的原因：因为 $I_3$ 与 $I_1$ 和 $I_2$ 都存在数据相关，需等到 $I_1$ 和 $I_2$ 将结果写回寄存器后，$I_3$ 才能读寄存器内容，所以 $I_3$ 的ID段被阻塞。（1分）

  $I_4$ 的IF段被阻塞的原因：因为 $I_4$ 的前一条指令 $I_3$ 在ID段被阻塞，所以 $I_4$ 的IF段被阻塞。（1分）
+ 因2\*x操作有左移和加法两种实现方法，故x=2\*x+a对应的指令序列为：

  ```text
  I1  LOAD   R1, [x]
  I2  LOAD   R2, [a]
  I3  SHL    R1  // 或者ADD R1, R1
  I4  ADD    R1, R2
  I5  STORE  R2, [x]
  ```

  // STORE R2沿用2015高教社标准解析书内54页印文，不擅自改写。
  【评分说明】指令正确给2分；其他正确答案同样给分；部分正确，酌情给分。

  这5条指令在流水线中的执行过程如下图所示。（3分）

  #context {
    let schedule = ((1, 2, 3, 4, 5), (2, 3, 4, 5, 6), (3, 6, 7, 8, 9), (6, 10, 11, 12, 13), (10, 14, 15, 16, 17))
    let stages = ([IF], [ID], [EX], [M], [WB])
    let cells = ()
    for (i, times) in schedule.enumerate() {
        cells.push([$I_#(i+1)$])
      for t in range(1, 18) {
        let s = times.position(value => value == t)
        cells.push(if s == none { [] } else { stages.at(s) })
      }
    }
    text(size: 0.8em, table(
      columns: (2.4em, ..range(17).map(_ => 1fr)),
      align: center + horizon,
      inset: (x: 0.12em, y: 0.25em),
      table.cell(rowspan: 2)[指令], table.cell(colspan: 17)[时间单元],
      ..range(1, 18).map(n => [#n]), ..cells,
    ))
  }

  故执行x=2\*x+a语句最少需要17个时钟周期。（1分）
]

=== 2014 16：D

=== 2014 44

#subquestions(after-heading: true, allow-oversize: true)[
+
  因为每条指令长度为32位，占4个单元，所以存储器编址单位是字节。（2分）

+
  数组A中每个元素的地址通过下标左移两位（即乘4）再加数组首址得到，故每个数组元素占4个字节，即32位。（2分）

+ $upright("OFFSET=FFFAH")$
  ，值为-6。（1分）指令bne所在地址为08048114H，转移目标地址为08048100H，因为
  $0804 med 8100 upright("H") = 0804 med 8114 upright("H") + 4 + \( - 6 \) times 4$
  ，（1分）所以，指令bne的转移目标地址计算公式为：
  $\( upright("PC") \) + 4 + upright("OFFSET") times 4$ （1分）

+
  由于数据相关而发生阻塞的指令为第2、3、4、6条，因为第2、3、4、6条指令都与各自的前一条指令发生数据相关。（3分）第6条指令会发生控制冒险。（1分）当前循环的第5条指令与下次循环的第1条指令虽有数据相关，但由于第6条指令后面有3个时钟周期的阻塞，因而消除了该数据相关。（1分）

]
*【评分说明】*
对于第1问，若考生回答：因为指令1和2、2和3、3和4、5和6发生数据相关，因而发生阻塞的指令为第2、3、4、6条指令，同样给3分。答对3个以上给3分，部分正确酌情给分。

=== 2016 19：B

=== 2019 18：C

=== 2023 19

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 2024 19：C

== 超标量和动态流水线的基本概念

=== 2017 17：C

=== 2020 17：B
