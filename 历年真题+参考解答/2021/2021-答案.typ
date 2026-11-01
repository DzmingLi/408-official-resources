// 来源同2021.typ；参考答案：书内第69～72页（PDF第73～76页），人工录入。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2021, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title:"2021年计算机学科专业基础试题参考答案")
#let answer-counter = counter("2021-answer-question")
#let answer-question(body) = context {
  answer-counter.step()
  let label = box(width:1em,align(right,answer-counter.display("1.")))
  terms(indent:0em,hanging-indent:measure(label).width + 1em,
    separator:h(1em,weak:true),terms.item(label,body))
}

= 一、单项选择题

#answer-key(columns:5,stroke:none,align:left,
  [1．D], [2．D], [3．B], [4．C], [5．B],
  [6．D], [7．A], [8．C], [9．A], [10．C],
  [11．B], [12．D], [13．D], [14．A], [15．C],
  [16．A], [17．D], [18．C], [19．C], [20．A],
  [21．B], [22．A], [23．B], [24．B], [25．C],
  [26．C], [27．D], [28．C], [29．B], [30．A],
  [31．C], [32．C], [33．B], [34．A], [35．B],
  [36．B], [37．D], [38．B], [39．D], [40．C],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  
  对于采用邻接矩阵存储的无向图，邻接矩阵每一行（列）中非零元素的个数为本行（列）对应顶点的度。可以依次计算连通图 $G$ 中各顶点的度，并记录度为奇数的顶点个数，若个数为0或2，则返回1，否则返回0。
  
+ 算法实现
  
  ```c
  int IsExistEL(MGraph G)
  // 采用邻接矩阵存储，判断图是否存在EL路径
  {
      int degree, i, j, count = 0;
      for (i = 0; i < G.numVertices; i++)
      {
          degree = 0;
          for (j = 0; j < G.numVertices; j++)
              // 依次计算各个顶点的度
              degree += G.Edge[i][j];
          if (degree % 2 != 0)
              count++; // 对度为奇数的顶点计数
      }
      if (count == 0 || count == 2)
          return 1;    // 存在EL路径，返回1
      else
          return 0;    // 不存在EL路径，返回0
  }
  ```
  
+ 算法的时间复杂度和空间复杂度
  本参考答案给出的算法的时间复杂度是 $O(n^2)$，空间复杂度是 $O(1)$。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ b[] = {−10，10，11，19，25，25}
+ 元素之间的比较次数是 $n(n-1)\/2$。
+ 不是。
  
  需要将程序中的 if 语句修改如下：
  
  ```c
  if (a[i] <= a[j]) count[j]++;
  else count[i]++;
  ```

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ ALU 的宽度为16位。可寻址主存空间大小为 $2^20$ 字节（或1 MB）。指令寄存器、MAR 和 MDR 各有16位、20位和8位。
+ R 型最多有 $2^4$（或16）种操作。I 型和 J 型总共最多有63种操作。通用寄存器最多有4个。
+ 指令01B2H = 000000 01 10 11 0010B，其功能为 R[3] ← R[1]−R[2]。执行指令01B2H后，R[3] = B052H−0008H = B04AH；结果不溢出；执行指令01B3H后，R[3] = R[1]×R[2] = B052H×0008H = 8290H，结果溢出。
+ 应对 imm 进行符号扩展。
+ 无条件转移指令可以采用 J 型格式。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 因为按字节编址，页大小为 $4 "KB"=2^12 "B"$，所以虚拟地址中高 $30-12=18$ 位表示虚页号。虚拟地址低12位表示页内地址。
+ 因为 TLB 采用2路组相联方式，共 $8=2^3$ 组，所以虚拟地址（或虚页号）中高 $18-3=15$ 位为 TLB 标记；虚拟地址中随后3位（或虚页号中低3位）为 TLB 组号。
+ 虚页号4对应的 TLB 表项被替换。因为虚页号与 TLB 组号的映射关系为 TLB 组号 = 虚页号 mod TLB 组数 = 虚页号 mod 8，因此，虚页号10、12、16、7、26、4、12、20映射到的 TLB 组号依次为2、4、0、7、2、4、4、4。TLB 采用2路组相联方式，从上述映射到的 TLB 组号序列可以看出，只有映射到4号组的虚页号数量大于2，相应虚页号依次是12、4、12和20。根据 LRU 替换策略，当访问第20页时，虚页号4对应的 TLB 表项被替换出来。
+ 虚拟地址位数增加到32位时，虚页号增加了 $32-30=2$ 位，使得每个 TLB 表项中的标记字段增加2位，因此，每个 TLB 表项的位数增加2位。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 因为信号量 S 是能够被多个进程共享的变量，多个进程都可以通过 wait() 和 signal() 对 S 进行读、写操作。所以，在 wait() 和 signal() 操作中对 S 的访问必须是互斥的。
+ 方法1是错误的。在 wait() 中，当 S ≤ 0 时，关中断后，其他进程无法修改 S 的值，while 语句陷入死循环。方法2是正确的。
+ 用户程序不能使用开/关中断指令实现临界区互斥。因为开中断和关中断指令都是特权指令。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 执行顺序依次是 ROM 中的引导程序、磁盘引导程序、分区引导程序、操作系统的初始化程序。
+ 4个操作的执行顺序依次是磁盘的物理格式化、对磁盘进行分区、逻辑格式化、操作系统的安装。
+ 磁盘扇区的划分是在磁盘的物理格式化操作中完成的。文件系统根目录的建立是在逻辑格式化操作中完成的。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 从 $t_0$ 到 $t_1$ 期间，H1 除了 HTTP 之外还运行了 DNS 应用层协议；DNS 报文从应用层到数据链路层，逐层封装关系是：DNS 报文→UDP 数据报→IP 数据报→CSMA/CD 帧。
+ S 在 $t_1$ 时刻的交换表为：
  #figure([
  #table(columns:(2fr,1fr),align:center,
    [MAC 地址],[端口],
    [00-11-22-33-44-cc],[4],
    [00-11-22-33-44-bb],[1],
    [00-11-22-33-44-aa],[2],
  )
  ],numbering:none)
  
+ H2 至少会接收到2个帧；接收到的均是封装 ARP 查询报文的以太网帧；这些帧的目的 MAC 地址均是：FF-FF-FF-FF-FF-FF。

]
]
