#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2009, subject: "计算机学科专业基础", code: "408", solutions: true)
#import "@preview/cetz:0.5.2" as cetz
#set document(title: "计算机学科专业基础综合试题参考答案（2009年）")
// 来源：2010年计算机考试大纲.pdf，书内32～37页（PDF 38～43页）。
// 按考纲录入；原汇编解析保留在本地参考/高教社汇编解析/，不参与构建。

= 一、单项选择题

#answer-key(
  columns: 5,
  stroke: none,
  inset: (x: 1.1em, y: 0.35em),
  align: left,
  [1．B], [2．C], [3．D], [4．B], [5．C],
  [6．B], [7．A], [8．D], [9．A], [10．B],
  [11．C], [12．D], [13．D], [14．C], [15．D],
  [16．C], [17．A], [18．A], [19．D], [20．B],
  [21．D], [22．A], [23．D], [24．D], [25．C],
  [26．A], [27．C], [28．B], [29．A], [30．A],
  [31．B], [32．A], [33．B], [34．B], [35．C],
  [36．A], [37．D], [38．D], [39．C], [40．A],
)

= 二、综合应用题

= 41. 【答案要点】
该方法不一定能（或不能）求得最短路径。

举例说明（略）。

= 42. 【答案要点】
#subquestions(allow-oversize: true)[
+ 算法的基本设计思想：

  定义两个指针变量 $p$ 和 $q$，初始时均指向头结点的下一个结点。$p$ 指针沿链表移动；当 $p$ 指针移动到第 $k$ 个结点时，$q$ 指针开始与 $p$ 指针同步移动；当 $p$ 指针移动到链表最后一个结点时，$q$ 指针所指元素为倒数第 $k$ 个结点。

  以上过程对链表仅进行一遍扫描。
+ 算法的详细实现步骤：

  ① count=0，$p$ 和 $q$ 指向链表表头结点的下一个结点；\
  ② 若 $p$ 为空，转⑤；\
  ③ 若 count 等于 $k$，则 $q$ 指向下一个结点；否则，count=count+1；\
  ④ $p$ 指向下一个结点，转步骤②；\
  ⑤ 若 count 等于 $k$，则查找成功，输出该结点的 data 域的值，返回1；否则，查找失败，返回0；\
  ⑥ 算法结束。
+ 算法实现：

  ```c
  typedef struct LNode {
      int data;
      struct LNode *link;
  } *LinkList;
  int SearchN(LinkList list, int k) {
      LinkList p, q;
      int count = 0;              /* 计数器赋初值 */
      p = q = list->link;         /* p和q指向表头结点的下一个结点 */
      while (p != NULL) {
          if (count < k)
              count++;           /* 计数器+1 */
          else
              q = q->link;       /* q移到下一个结点 */
          p = p->link;            /* p移到下一个结点 */
      }
      if (count < k)              /* 如果链表的长度小于k */
          return 0;              /* 查找失败 */
      else {
          printf("%d", q->data); /* 查找成功 */
          return 1;
      }
  }
  ```
]

= 43. 【答案要点】
#subquestions(allow-oversize: true)[
+ 2.5%（计算过程略）
+ 0.1%（计算过程略）
]

= 44. 【答案要点】
参考答案一：

#align(center, table(columns: 3, align: center + horizon,
  [时钟], [功能], [有效控制信号],
  [C5], [MAR←(R1)], [R1out, MARin],
  [C6], [MDR←M(MAR)\ A←(R0)], [MemR, MDRinE\ R0out, Ain],
  [C7], [AC←(MDR)+(A)], [MDRout, Add, ACin],
  [C8], [MDR←(AC)], [ACout, MDRin],
  [C9], [M(MAR)←(MDR)], [MDRoutE, MemW],
))

“A←(R0)”也可在C7：“AC←(MDR)+(A)”之前单列的一个时钟周期内执行。

参考答案二：

#align(center, table(columns: 3, align: center + horizon,
  [时钟], [功能], [有效控制信号],
  [C5], [MAR←(R1)], [R1out, MARin],
  [C6], [MDR←M(MAR)], [MemR, MDRinE],
  [C7], [A←(MDR)], [MDRout, Ain],
  [C8], [AC←(A)+(R0)], [R0out, Add, ACin],
  [C9], [MDR←(AC)], [ACout, MDRin],
  [C10], [M(MAR)←(MDR)], [MDRoutE, MemW],
))

= 45. 【答案要点】
#subquestions(allow-oversize: true)[
+ 缓冲区是一互斥资源，因此设互斥信号量 mutex。
+ 同步问题：P1、P2因为奇数的放置与取用而同步，设同步信号量 odd；P1、P3因为偶数的放置与取用而同步，设同步信号量 even；P1、P2、P3因为共享缓冲区，设同步信号量 empty。

  ```text
  semaphore mutex = 1;
  semaphore odd = 0, even = 0;
  semaphore empty = N;
  main()
  cobegin {
      Process P1
      while (True) {
          number = produce();
          P(empty);
          P(mutex);
          put();
          V(mutex);
          if (number % 2 == 0)
              V(even);
          else
              V(odd);
      }
      Process P2
      while (True) {
          P(odd);
          P(mutex);
          getodd();
          V(mutex);
          V(empty);
          countodd();
      }
      Process P3
      while (true) {
          P(even);
          P(mutex);
          geteven();
          V(mutex);
          V(empty);
          counteven();
      }
  } coend
  ```
]

= 46. 【答案要点】
#subquestions(allow-oversize: true)[
+ 2362H的访问时间=10 ns（访问TLB）+100 ns（访问页表）+100 ns（访问内存单元）=210 ns。

  1565H的访问时间=10 ns（访问TLB）+100 ns（访问页表）+100 000 000 ns（调页）+10 ns（访问TLB）+100 ns（访问内存单元）=100 000 220 ns。

  25A5H的访问时间=10 ns（访问TLB）+100 ns（访问内存单元）=110 ns。
+ 1565H的物理地址是：101565H；因为2号页面刚被访问，不会被置换，因此用101H页框。
]

= 47. 【答案要点】
#subquestions(allow-oversize: true)[
+ 把IP地址空间202. 118. 1. 0/24划分为2个等长的子网。划分结果为：

  子网1：子网地址为202. 118. 1. 0，子网掩码为255. 255. 255. 128（或子网1：202. 118. 1. 0/25）

  子网2：子网地址为202. 118. 1. 128，子网掩码为255. 255. 255. 128（或子网2：202. 118. 1. 128/25）

  地址分配方案：子网1分配给局域网1，子网2分配给局域网2；或子网1分配给局域网2，子网2分配给局域网1。
+ R1的路由表如下：

  参考答案一：（若子网1分配给局域网1，子网2分配给局域网2）

  #align(center, table(columns: 4, align: center + horizon,
    [目的网络IP地址], [子网掩码], [下一跳IP地址], [接口],
    [#text("202. 118. 1. 0")], [#text("255. 255. 255. 128")], [—], [E1],
    [#text("202. 118. 1. 128")], [#text("255. 255. 255. 128")], [—], [E2],
    [#text("202. 118. 3. 2")], [#text("255. 255. 255. 255")], [#text("202. 118. 2. 2")], [L0],
    [#text("0. 0. 0. 0")], [#text("0. 0. 0. 0")], [#text("202. 118. 2. 2")], [L0],
  ))

  参考答案二：（若子网1分配给局域网2，子网2分配给局域网1）

  #align(center, table(columns: 4, align: center + horizon,
    [目的网络IP地址], [子网掩码], [下一跳IP地址], [接口],
    [#text("202. 118. 1. 128")], [#text("255. 255. 255. 128")], [—], [E1],
    [#text("202. 118. 1. 0")], [#text("255. 255. 255. 128")], [—], [E2],
    [#text("202. 118. 3. 2")], [#text("255. 255. 255. 255")], [#text("202. 118. 2. 2")], [L0],
    [#text("0. 0. 0. 0")], [#text("0. 0. 0. 0")], [#text("202. 118. 2. 2")], [L0],
  ))
+ R2的路由表中，到局域网1和局域网2的路由表项如下：

  #align(center, table(columns: 4, align: center + horizon,
    [目的网络IP地址], [子网掩码], [下一跳IP地址], [接口],
    [#text("202. 118. 1. 0")], [#text("255. 255. 255. 0")], [#text("202. 118. 2. 1")], [L0],
  ))
]
