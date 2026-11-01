// 来源同2024.typ；书内第62～67页（PDF第67～72页），逐页人工录入。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2024, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title: "2024年计算机学科专业基础试题参考答案")
#let answer-counter = counter("2024-answer-question")
#let answer-question(body) = context {
  answer-counter.step()
  let label = box(width: 1em, align(right, answer-counter.display("1.")))
  terms(indent: 0em, hanging-indent: measure(label).width + 1em,
    separator: h(1em, weak: true), terms.item(label, body))
}

= 一、单项选择题

#answer-key(columns: 5,stroke: none,align: left,
  [1．D],[2．A],[3．A],[4．B],[5．D],
  [6．A],[7．D],[8．A],[9．B],[10．C],
  [11．D],[12．B],[13．B],[14．C],[15．D],
  [16．D],[17．C],[18．B],[19．C],[20．B],
  [21．A],[22．C],[23．A],[24．A],[25．D],
  [26．A],[27．A],[28．B],[29．A],[30．C],
  [31．C],[32．C],[33．B],[34．C],[35．D],
  [36．B],[37．D],[38．D],[39．C],[40．D],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  建立图 $G$ 各顶点的入度表 degree[]。
  
  选择入度为0的顶点 $v$，将 $v$ 的所有邻接点的入度减1，重复执行这个过程。若每次选出的入度为0的顶点有且仅有一个，且共进行了 G.numVertices 次，则意味着存在唯一的拓扑序列，返回1，否则不存在拓扑序列，或存在多个拓扑序列，返回0。
  
+ 用 C 语言描述的算法
  
  #block(stroke: (dash: "dotted",thickness: 0.045em),inset: 0.5em,breakable: true)[
  ```c
  int uniquely(MGraph G) // 判定有向图是否存在唯一的拓扑序列
  {
      int *degree, i, j, count=0, in0=-1, prev_in0;
      degree=(int *)malloc(G.numVertices * sizeof(int));
      for(j=0; j<G.numVertices; j++) // 计算各顶点的入度
      {
          degree[j]=0;
          for(i=0; i<G.numVertices; i++)
              degree[j]+=G.Edge[i][j];
          if(degree[j]==0)
          {
              if(in0==-1) in0=j; // 入度为0的顶点
              else in0=-2;      // 有多个入度为0的顶点
          }
      }
      while(in0>=0)
      {
          count++;
          prev_in0=in0;
          in0=-1;
          for(j=0; j<G.numVertices; j++)
              if(G.Edge[prev_in0][j]>0)
              {
                  if(--degree[j]==0) // 邻接点入度值减1
                  {
                      if(in0==-1) in0=j; // 入度为0的顶点
                      else in0=-2;      // 有多个入度为0的顶点
                  }
              }
      }
      free(degree);
      if(count==G.numVertices) return 1;
      else return 0;
  }
  ```
  ]

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ $H T$ 如下。
  
  #align(center,table(columns: 11,align: center,stroke: none,
    [0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
    ..([11],[],[14],[7],[],[20],[9],[],[],[3],[18]).map(x=>table.cell(stroke: 0.045em,x)),
  ))
  
  装填因子 $α=7\/11$。
  
+ 查找关键字14的关键字比较序列：3，18，14。
+ 查找关键字8，确认查找失败时的散列地址是7。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 最多有 $2^5=32$ 个通用寄存器。M 字长为32位，故通用寄存器宽度为32位，因此 shamt 字段占 $log_2 32=5$ 位。
+ 控制信号 ALUBsrc=0。F=1FDB 9753H；OF=1；CF=1；根据 CF 判断是否溢出。
+ 因为 slli 指令的移位位数只使用 IR[31:20] 中的低5位，与高位 IR[31:25] 及扩展出来的位无关，故 Ext 取值可以是0也可以是1。
+ Ext=1；ALUctr=000。
+ 因为 A040 A103H=101000000100 00001 010 00010 0000011B，根据指令格式中 IR[6:0]=0000011B，IR[14:12]=010B，可以判定该指令是 lw 指令。lw 指令所读取数据的存储地址为 FFFF 9CD4H。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ $a$ 的首地址存放在 r3；$i$ 存放在 r2；$s u m$ 存放在 r1。
+ $a[i]$ 的地址为0013 E004H；$a[i]$ 的机器数为 FFFF ECDCH；$s u m$ 的机器数为0000 000EH。$a[i]$ 所在页的页号是0013EH。数组 $a$ 至少存放在2页中。
+ 指令机器码为0021 2213H。汇编形式是 slli r4, r2, 1。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 页表项的虚拟地址为：
  B8C0 0000H+48H\<\<2=B8C0 0120H。\
  页表项的物理地址为：\
  6540 0000H+48H\<\<2=6540 0120H。\
  相应页表项中的页框号为：BAB4 5678H>>22=2EAH。
  
+ 进程 P 的页表所在页的页号为：
  B8C0 0000H>>22=2E3H。\
  页表项的虚拟地址为：\
  B8C0 0000H+2E3H\<\<2=B8C0 0B8CH。\
  页表项中的页框号为：6540 0000H>>22=195H。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 实现 C1 的代码是临界区。因为代码 C1 执行对 B 的写操作，且 P1 和 P2 需要互斥执行 C1。
  
+ 进程 P1 和 P2 的同步伪代码如下。
  
  #table(columns: (1fr,1fr),
    table.cell(colspan: 2)[Semaphore S=0;　\/\/ 实现进程 P1 与 P2 的同步],
    [
  ```c
  P1
      ...
      C1;
      signal(S);
  ...
  ```
    ], [
  ```c
  P2
      ...
      wait(S);
      C2;
  ...
  ```
    ],
  )
  
+ 进程 P1 和 P2 的互斥伪代码如下。
  
  #table(columns: (1fr,1fr),
    table.cell(colspan: 2)[Semaphore mutex=1;　\/\/ 实现 P1 与 P2 互斥执行 C3],
    [
  ```c
  P1
      ...
      wait(mutex);
      C3;
      signal(mutex);
  ...
  ```
    ], [
  ```c
  P2
      ...
      wait(mutex);
      C3;
      signal(mutex);
  ...
  ```
    ],
  )

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ AS4 应该选择 OSPF 协议。
+ 初始 TTL 值应该至少设置为16。
+ R11～R16 路由器均获得到达网络210.2.3.0/24的正确路由，至少需要30 s。均获得到达网络210.2.4.0/24的正确路由，至少需要60 s。
+ 由 BGP 协议外部会话（eBGP）完成。通过 UPDATE 报文通告。R13 通过 BGP 协议内部会话（iBGP）通告给 R14 和 R15。
+ R14 路由表中到达网络136.5.16.0/20路由的下一跳是 R11；R15 路由表中到达网络136.5.16.0/20路由的下一跳是 R13。

]
]
