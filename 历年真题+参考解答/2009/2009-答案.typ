#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2009, subject: "计算机学科专业基础", code: "408", solutions: true)
#import "@preview/cetz:0.5.2" as cetz
#set document(title: "计算机学科专业基础综合试题参考答案及解析（2009年）")

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
// 综合应用题41—47题来源：2015高教社《考研计算机专业基础综合历年真题标准解析》，书内111—115页（PDF 117—121页）。
// 按扫描页核对答案、评分说明及备用解法；修复OCR与图表排版，选择题仍仅保留答案字母。

= 二、综合应用题

= 41. 【答案要点】
该方法不一定能（或不能）求得最短路径。

举例说明如下：

#align(center, image("official-images/page-117-img-12.jpg", width: 16em))

图a

#align(center, image("official-images/page-117-img-14.jpg", width: 16em))

图b

图a中，设初始顶点为1，目标顶点为4，欲求从顶点1到顶点4之间的最短路径。显然，这两点之间的最短路径长度为2。但利用给定方法求得的路径长度为3，因此这条路径并不是这两点之间的最短路径。

图b中，设初始顶点为1，目标顶点为3，欲求从顶点1到顶点3之间的最短路径。利用给定的方法，无法求出顶点1到顶点3的路径。

= 42. 【答案要点】
#subquestions(allow-oversize: true)[
+ 算法的基本设计思想：

  定义两个指针变量 p和
  q，初始时均指向头结点的下一个结点。p指针沿链表移动；当 p指针移动到第
  k个结点时，q指针开始与 p指针同步移动；当
  p指针移动到链表最后一个结点时，q指针所指元素为倒数第 k个结点。

  以上过程对链表仅进行一遍扫描。

+ 算法的详细实现步骤：

  ① $"count" = 0 \, p$ 和
  q指向链表表头结点的下一个结点；

  ②若 p为空，转 ⑤；

  ③ 若 count 等于 k，则 q 指向下一个结点；否则，count =
  count + 1；

  ④ $p$ 指向下一个结点，转步骤 ②

  ⑤若 count等于 k，则查找成功，输出该结点的 data
  域的值，返回1；否则，查找失败，返回0；

  ⑥算法结束。

+ 算法实现：

  ```c
  typedef struct LNode {
      int data;
      struct LNode *link;
  } *LinkList;
  int SearchN(LinkList list, int k) {
      LinkList p, q;
      int count = 0;  /* 计数器赋初值 */
      p = q = list->link;  /* p和q指向表头结点的下一个结点 */
      while (p != NULL) {
          if (count < k) count++; /* 计数器+1 */
          else q = q->link;  /* q移到下一个结点 */
          p = p->link;  /* p移到下一个结点 */
      }
      if (count < k) return 0;  /* 链表长度小于k，查找失败 */
      else {
          printf("%d", q->data); /* 查找成功 */
          return 1;
      }
  }
  ```

]

= 43. 【答案要点】
#subquestions(allow-oversize: true)[
+ 中断方式下，CPU每次用于数据传送的时钟周期数：
  $5 times 18 + 5 times 2 = 100$为达到外设0.5MB/s的数据传输率，外设每秒申请的中断次数：0.5MB/4B=
  125000。

  1秒钟内用于中断的开销：
  $100 times 125 med 000 = 12 med 500 med 000 = 12.5 upright("M")$个时钟周期。

  CPU用于外设I/O的时间占整个CPU时间的百分比：
  $12.5 upright("M") \/ 500 upright("M") = 2.5 %$。

+
  外设数据传输率提高到5MB/s时，1秒钟内需产生的DMA次数：5MB/5000B= 1000。

  CPU用于DMA处理的总开销： $1000 times 500 = 500000 = 0.5$
  M个时钟周期。

  CPU用于外设 I/O的时间占整个CPU时间的百分比：0.5 M/500 M=0.1%。

]

= 44. 【答案要点】
参考答案一：

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [时钟], [功能], [有效控制信号],
    [C5], [MAR←(R1)], [R1out,MARin],
    [C6], [MDR←M(MAR) A←(R0)], [MemR,MDRinE R0out,Ain],
    [C7], [AC←(MDR)+(A)], [MDRout,Add,ACin],
    [C8], [MDR←(AC)], [ACout,MDRin],
    [C9], [M(MAR)←(MDR)], [MDRoutE,MemW],
  )]
  , kind: table
  )

“A $arrow.l$ （R0）”也可在C7：“AC $arrow.l$
（MDR）+（A）”之前单列的一个时钟周期内执行。参考答案二：

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    [时钟], [功能], [有效控制信号],
    [C5], [MAR←(R1)], [R1out,MARin],
    [C6], [MDR←M(MAR)], [MemR,MDRinE],
    [C7], [A←(MDR)], [MDRout,Ain],
    [C8], [AC←(A)+(R0)], [R0out,Add,ACin],
    [C9], [MDR←(AC)], [ACout,MDRin],
    [C10], [M(MAR)←(MDR)], [MDRoutE,MemW],
  )]
  , kind: table
  )

= 45. 【答案要点】
#subquestions(allow-oversize: true)[
+ 缓冲区是一互斥资源，因此设互斥信号量 mutex。

+
  同步问题：P1、P2因为奇数的放置与取用而同步，设同步信号量
  odd；P1、P3因为偶数的放置与取用而同步，设同步信号量
  even；P1、P2、P3因为共享缓冲区，设同步信号量 empty。

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
      while (True) {
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
根据页式管理的工作原理，应先考虑页面大小，以便将页号和页内位移分解出来。页面大小为
$4 upright("KB") = 2^(12) upright("B")$
，则得到页内位移占虚地址的低12位，页号占剩余高位。

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    [页号/页框号(4位)], [页内偏移量(12位)],
  )]
  , kind: table
  )

#subquestions(allow-oversize: true)[
+
  可得三个虚地址的页号P及访问时间如下（十六进制的一位数字转换成4位二进制，因此，十六进制的低12位正好为页内位移，最高位为页号）：

  1) 2362H：页号 $upright("P=2")$
  ，有效位为1，存在内存中。先访问快表10ns，因初始为空，不在快表中，因此，需要访问页表100ns得到页框号，合成物理地址后访问主存
  100ns，共计10ns+100ns+100ns=210ns.

  2) 1565H：页号 $upright("P=1")$
  ，有效位为0，不存在内存中。先访问快表10ns，落空，访问页表100ns，落空，进行缺页中断处理
  $10^8 upright("ns")$ ，合成物理地址后访问主存100ns，共计
  $10 upright("ns") + 100 upright("ns") + 10^8 upright("ns") + 100 upright("ns") = 100000220 upright("ns") .$

  3) 25A5H：页号
  P=2，有效位为1，存在内存中。访问快表，因第一次访问已将该页号放入快表，因此花费10ns便可合成物理地址，访问主存100ns，共计
  10ns+100ns=110ns。

+
  当访问虚地址1565H时，产生缺页中断，由于驻留集大小固定为2，必须从页表中淘汰一个页面。根据题目规定的最近最少使用置换算法，应淘汰0号页面，因此
  1565H的对应页框号为101H。由此可得1565H的物理地址为101565H。

]

= 47. 【答案要点】
#subquestions(allow-oversize: true)[
+
  把IP地址空间202.118.1.0/24划分为2个等长的子网。划分结果为：子网1：子网地址为202.118.1.0，子网掩码为255.255.255.128（或子网1：202.
  118.1.0/25）

  子网2：子网地址为202.118.1.128，子网掩码为255.255.255.128（或子网2：202.
  118.1.128/25)

  地址分配方案：子网1分配给局域网1，子网2分配给局域网2；或子网1分配给局域网2，子网2分配给局域网1。

+ R1的路由表如下：

  参考答案一：

  （若子网1分配给局域网1，子网2分配给局域网2）

  #figure(
    align(center)[#table(
      columns: 4,
      align: (auto,auto,auto,auto,),
      [目的网络IP地址], [子网掩码], [下一跳IP地址], [接口],
      [202.118.1.0], [255.255.255.128], [一], [E1],
      [202.118.1.128], [255.255.255.128], [一], [E2],
      [202.118.3.2], [255.255.255.255], [202.118.2.2], [L0],
      [0.0.0.0], [0.0.0.0], [202.118.2.2], [L0],
    )]
    , kind: table
    )

]
= 参考答案二：
（若子网1分配给局域网2，子网2分配给局域网1）

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    [目的网络IP地址], [子网掩码], [下一跳IP地址], [接口],
    [202.118.1.128], [255.255.255.128], [---], [E1],
    [202.118.1.0], [255.255.255.128], [---], [E2],
    [202.118.3.2], [255.255.255.255], [202.118.2.2], [L0],
    [0.0.0.0], [0.0.0.0], [202.118.2.2], [L0],
  )]
  , kind: table
  )

#subquestions(start: 3, allow-oversize: true)[
+ R2的路由表中，到局域网1和局域网2的路由表项如下：

  #figure(
    align(center)[#table(
      columns: 4,
      align: (auto,auto,auto,auto,),
      [目的网络IP地址], [子网掩码], [下一跳IP地址], [接口],
      [202.118.1.0], [255.255.255.0], [202.118.2.1], [L0],
    )]
    , kind: table
    )

]
