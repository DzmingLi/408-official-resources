// 来源同2025.typ；书内第85～89页（PDF第90～94页），逐页人工录入。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2025, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title: "2025年计算机学科专业基础试题参考答案")
#let answer-counter = counter("2025-answer-question")
#let answer-question(body) = context {
  answer-counter.step()
  let label = box(width: 1em,align(right,answer-counter.display("1.")))
  terms(indent: 0em,hanging-indent: measure(label).width+1em,
    separator: h(1em,weak: true),terms.item(label,body))
}

= 一、单项选择题

#answer-key(columns: 5,stroke: none,align: left,
  [1．B],[2．D],[3．D],[4．B],[5．D],
  [6．C],[7．C],[8．C],[9．A],[10．D],
  [11．A],[12．D],[13．D],[14．D],[15．C],
  [16．B],[17．C],[18．B],[19．A],[20．A],
  [21．B],[22．A],[23．D],[24．C],[25．C],
  [26．B],[27．D],[28．C],[29．C],[30．A],
  [31．C],[32．B],[33．B],[34．C],[35．C],
  [36．C],[37．B],[38．A],[39．B],[40．A],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  从后向前扫描一趟数组 $A$，对每个 $A[i]$（$0 ≤ i ≤ n-1$），分别找到从 $A[n-1]$ 到 $A[i]$ 中的最大值 Max 和最小值 Min，然后分以下情况处理：\
  ①若 $A[i] ≥ 0$，则 $A[i]$ 与 Max 相乘；\
  ②若 $A[i] < 0$，则 $A[i]$ 与 Min 相乘；\
  相乘的结果保存在 $r e s[i]$ 中。
  
+ 算法实现
  
  #block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em)[
  ```c
  void calMulMax(int A[], int res[], int n)
  {
      int i, Max, Min;
      Max=Min=A[n-1];
      for(i=n-1; i>=0; i--) // 从后向前扫描数组A
      {
          if(A[i]>Max) Max=A[i];
          else if(A[i]<Min) Min=A[i];
          if(A[i]>=0) res[i]=A[i]*Max; // 根据A[i]的正负性分别处理
          else res[i]=A[i]*Min;
      }
  }
  ```
  ]
  
+ 算法的时间复杂度为 $O(n)$；空间复杂度为 $O(1)$。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 完成该工程的最短时间是12。关键活动是 a，e，m，n。
+ 与 e 同时进行的活动可能有 b，c，d。
+ 时间余量最大的活动是 j。时间余量是6。
+ b 的持续时间最多是4。压缩 k 的持续时间。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ Cache 组号字段占6位；块内地址字段占6位。虚拟地址中 $"VA"_11 ∼ "VA"_6$ 可作为 Cache 索引。
+ $d[100]$ 的虚拟地址为0180 01B0H。Cache 组号是000110B=6。
+ $d[0]$ 在其所在主存块内的偏移量为20H。共发生129次 Cache 缺失，访问总次数为 $2048 times 2=4096$，Cache 缺失率为 $129\/4096 ≈ 3.15%$；数组元素的平均访问时间约为 $2+3.15% times 200=8.3$ 个时钟周期。
+ 数组 $d$ 分布在3页中。访问数组 $d$ 所引起的缺页次数是3。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ R 中初始内容是 FFFF FFFFH；Q 中初始内容是8765 4321H；Y 中初始内容是0000 00FFH。控制逻辑部件包含计数器。由 ALUop 所控制的 ALU 运算有加运算、减运算。
+ 当 $x$ 为0000 0000H时，发生除0异常；当 $d[i]$ 为8000 0000H且 $x$ 为 FFFF FFFFH时，发生除运算溢出异常。CPU 检测到除法异常后，需要将断点和程序状态保存到内核栈或者特定寄存器中，关中断，最后跳转到内核中的除法异常处理程序执行。

]
]

#answer-question[
【答案要点】

#table(columns: (1fr,1fr,1fr),
  table.cell(colspan: 3)[
```c
Semaphore position=3; // 可挖树坑的数量
Semaphore pit=0;      // 树坑的数量
Semaphore tree=0;     // 待浇水的树苗数
Semaphore mutex=1;    // 实现铁锹的互斥使用
```
  ], [
```c
甲：
for(;;)
{
    wait(position);
    wait(mutex);
    挖树坑;
    signal(mutex);
    signal(pit);
    ...
}
```
  ], [
```c
乙：
for(;;)
{
    wait(pit);
    放树苗;
    signal(position);
    wait(mutex);
    填土;
    signal(mutex);
    signal(tree);
    ...
}
```
  ], [
```c
丙：
for(;;)
{
    wait(tree);
    浇水;
    ...
}
```
  ],
)
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 进程控制块位于内核区。该进程处于阻塞态。
+ main() 函数的代码位于只读代码段。scanf() 和 printf() 的功能需要通过执行驱动程序实现。
+ $p t r$ 被分配在可读写数据段中。$l e n g t h$ 会被分配在用户栈中。$p t r$ 指向的字符串位于运行时堆中。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 单向传播时延 $=2 times (36 thin 000 times 10^3)/(300 thin 000 times 10^3)=240$ ms。
  最大吞吐量=200 kb/s。\
  最少时间 $=240 times 10^(-3)+(4000 times 8)/(200 times 10^3)=400$ ms。
  
+ 令 $W_"s"$ 为发送窗口，$k$ 为序号字段位数，则有
  
  $ (W_"s" times (1500 times 8)/(200 times 10^3))/(2 times 240 times 10^(-3)+(1500 times 8)/(200 times 10^3)) ≥ 0.8 quad "①" $
  
  解得 $W_"s" ≥ 7.2$，向上取整得 $W_"s" ≥ 8$，即发送窗口至少为8。
  
  对于 GBN，应满足 $2^k ≥ W_"s"+1$，即 $2^k ≥ 8+1=9$，$k$ 向上取整得 $k ≥ 4$，即序号字段至少需要4位。
  
+ 作业区子网的子网地址为10.10.10.64/26；管理区子网的子网地址为10.10.10.0/26；生活区子网的子网地址为10.10.10.128/25。

]
]
