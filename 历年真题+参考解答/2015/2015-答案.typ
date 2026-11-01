#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2015, subject: "计算机学科专业基础", code: "408", solutions: true)
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS, answer-state, question
#mode-state.update(HANDOUTS)
#answer-state.update(true)

// 与 question 使用同样的题号悬挂逻辑，但不放入不可跨页的 figure。
#let answer-counter = counter("answer-question")
#let answer-question(body) = context {
  answer-counter.step()
  let label = box(width: 1em, align(right, answer-counter.display("1.")))
  terms(
    indent: 0em,
    hanging-indent: measure(label).width + 1em,
    separator: h(1em, weak: true),
    terms.item(label, body),
  )
}

#set document(title: "计算机学科专业基础综合试题参考答案（2015年）")

= 一、单项选择题

#answer-key(
  columns: 5,
  stroke: none,
  inset: (x: 1.1em, y: 0.35em),
  align: left,
  [1．A], [2．B], [3．D], [4．D], [5．D],
  [6．C], [7．A], [8．C], [9．C], [10．C],
  [11．A], [12．A], [13．B], [14．D], [15．C],
  [16．B], [17．B], [18．D], [19．C], [20．B],
  [21．B], [22．D], [23．B], [24．C], [25．D],
  [26．B], [27．A], [28．A], [29．B], [30．C],
  [31．C], [32．C], [33．D], [34．A], [35．B],
  [36．B], [37．A], [38．C], [39．A], [40．C],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  
  算法的核心思想是用空间换时间。使用辅助数组记录链表中已出现的数值，从而只需对链表进行一趟扫描。
  
  因为 $abs("data") <= n$，故辅助数组q的大小为 $n + 1$，各元素的初值均为0。依次扫描链表中的各结点，同时检查 $q[abs("data")]$ 的值，如果为0，则保留该结点，并令 $q[abs("data")] = 1$；否则，将该结点从链表中删除。
  
+ 使用C语言描述的单链表结点的数据类型定义
  
  ```c
  typedef struct node {
      int data;
      struct node *link;
  } NODE;
  typedef NODE *PNODE;
  ```
  
+ 算法实现
  
  ```c
  void func(PNODE h, int n)
  {
      PNODE p = h, r;
      int *q, m;
  
      q = (int *)malloc(sizeof(int) * (n + 1)); // 申请n+1个位置的辅助空间
      for (int i = 0; i < n + 1; i++)           // 数组元素初值置0
          *(q + i) = 0;
  
      while (p->link != NULL) {
          m = p->link->data > 0 ? p->link->data : -p->link->data;
          if (*(q + m) == 0) {                  // 判断该结点的data是否已出现过
              *(q + m) = 1;                     // 首次出现
              p = p->link;                      // 保留
          }
          else {                                // 重复出现
              r = p->link;                      // 删除
              p->link = r->link;
              free(r);
          }
      }
      free(q);
  }
  ```
  
  【（1）、（2）、（3）的评分说明】
  
  ① 若考生设计的算法满足题目的功能要求且正确，则（1）、（3）根据所实现算法的时间复杂度给分，细则见下表：
  
  #table(
    columns: (1fr, 0.55fr, 3fr),
    align: (center + horizon, center + horizon, left + horizon),
    inset: (x: 0.55em, y: 0.4em),
    [时间复杂度], [分数], [说明],
    [$O(m)$], [11], [对链表进行一趟扫描，且采用时间复杂度为 $O(1)$ 的方法判断 $abs("data")$ 是否是首次出现。],
    [$O(m)$], [8], [对链表进行一趟扫描，且采用时间复杂度 $> O(1)$ 的方法判断 $abs("data")$ 是否是首次出现。],
    [$> O(m)$], [5], [对链表进行多趟扫描，例如采用顺序查找算法，对每个结点在当前链表中进行查找，删除重复出现的结点。],
  )
  
  ② 若在算法的基本设计思想描述中因文字表达没有清晰反映出算法思路，但在算法实现中能够表达出算法思想且正确的，可参照①的标准给分。
  
  ③ 若算法的基本设计思想描述或算法实现中部分正确，可参照①中各种情况的相应给分标准酌情给分。
  
  ④ 若考生给出的单链表结点的数据类型定义与题目中所给的结点形式不完全相同，酌情给分。
  
  ⑤ 参考答案中只给出了使用C语言的版本，使用C++语言的答案视同使用C语言。
  
+ 参考答案所给算法的时间复杂度为 $O(m)$，空间复杂度为 $O(n)$。
  
  【评分说明】若考生所估计的时间复杂度和空间复杂度与考生实现的算法一致，可给分。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 图 $G$ 的邻接矩阵 $A$ 如下：
  
  $ A = mat(
    0, 1, 1, 0, 1;
    1, 0, 0, 1, 1;
    1, 0, 0, 1, 0;
    0, 1, 1, 0, 1;
    1, 1, 0, 1, 0
  ) $
  
+ $A^2$ 如下：
  
  $ A^2 = mat(
    3, 1, 0, 3, 1;
    1, 3, 2, 1, 2;
    0, 2, 2, 0, 2;
    3, 1, 0, 3, 1;
    1, 2, 2, 1, 3
  ) $
  
  0行3列的元素值3表示从顶点0到顶点3之间长度为2的路径共有3条。
  
+ $B^m$（$2 <= m <= n$）中位于 $i$ 行 $j$ 列（$0 <= i, j <= n - 1$）的非零元素的含义是：图中从顶点 $i$ 到顶点 $j$ 长度为 $m$ 的路径条数。
  
  【评分说明】
  
  ① 若考生给出的邻接矩阵 $A$ 中，结点与行、列的对应次序与本参考答案不完全一致，只要正确，同样给分。问题（2）中，考生所给的答案中顶点编号要与其所给的邻接矩阵相对应。
  
  ② 若考生给出的矩阵 $A$ 及 $A^2$ 部分正确，酌情给分。
  
  ③ 若考生分别说明矩阵 $B^2, B^3, dots, B^n$ 中非零元素的含义，同样给分。
  
  ④ 若考生给出的 $B^m$（$2 <= m <= n$）中非零元素的含义部分正确，酌情给分。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 程序员可见寄存器为通用寄存器（R0～R3）和PC。因为采用了单总线结构，因此，若无暂存器T，则ALU的A、B端口会同时获得两个相同的数据，使数据通路不能正常工作。
  
  【评分说明】回答通用寄存器（R0～R3），给分；回答PC，给分；部分正确，酌情给分。设置暂存器T的原因若回答用于暂时存放端口A的数据，则给分，其他答案，酌情给分。
  
+ ALU共有7种操作，故其操作控制信号ALUop至少需要3位；移位寄存器有3种操作，其操作控制信号SRop至少需要2位。
  
+ 信号SRout所控制的部件是一个三态门，用于控制移位器与总线之间数据通路的连接与断开。
  
  【评分说明】只要回答出三态门或者控制连接/断开，即给分。
  
+ 端口①、②、③、⑤、⑧须连接到控制部件输出端。
  
  【评分说明】答案包含④、⑥、⑦、⑨中任意一个，不给分；答案不全酌情给分。
  
+ 连线1，⑥→⑨；连线2，⑦→④。
  
  【评分说明】回答除上述连线以外的其他连线，酌情给分。
  
+ 因为每条指令的长度为16位，按字节编址，所以每条指令占用2个内存单元，顺序执行时，下条指令地址为（PC）+2。MUX的一个输入端为2，可便于执行（PC）+2操作。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 指令操作码有7位，因此最多可定义 $2^7 = 128$ 条指令。
  
+ 各条指令的机器代码分别如下：
  
  ① “`inc R1`”的机器码为：`0000001 0 01 0 00 0 00`，即0240H。
  
  ② “`shl R2, R1`”的机器码为：`0000010 0 10 0 01 0 00`，即0488H。
  
  ③ “`sub R3, (R1), R2`”的机器码为：`0000011 0 11 1 01 0 10`，即06EAH。
  
+ 各标号处的控制信号或控制信号取值如下：
  
  ① 0；② mov；③ mova；④ left；⑤ read；⑥ sub；⑦ mov；⑧ SRout。
  
  【评分说明】答对两个给分。
  
+ 指令“`sub R1, R3, (R2)`”的执行阶段至少包含4个时钟周期；
  
  指令“`inc R1`”的执行阶段至少包含2个时钟周期。

]
]

#answer-question[
【答案要点】

```c
semaphore Full_A = x;       // Full_A表示A的信箱中的邮件数量
semaphore Empty_A = M - x;  // Empty_A表示A的信箱中还可存放的邮件数量
semaphore Full_B = y;       // Full_B表示B的信箱中的邮件数量
semaphore Empty_B = N - y;  // Empty_B表示B的信箱中还可存放的邮件数量
semaphore mutex_A = 1;      // mutex_A用于A的信箱互斥
semaphore mutex_B = 1;      // mutex_B用于B的信箱互斥
```

#align(center)[CoBegin]

#table(
  columns: (1fr, 1fr),
  inset: 0.7em,
  align: top + left,
  [```c
A {
    while (TRUE) {
        P(Full_A);
        P(mutex_A);
        从A的信箱中取出一个邮件;
        V(mutex_A);
        V(Empty_A);
        回答问题并提出一个新问题;
        P(Empty_B);
        P(mutex_B);
        将新邮件放入B的信箱;
        V(mutex_B);
        V(Full_B);
    }
}
```],
  [```c
B {
    while (TRUE) {
        P(Full_B);
        P(mutex_B);
        从B的信箱中取出一个邮件;
        V(mutex_B);
        V(Empty_B);
        回答问题并提出一个新问题;
        P(Empty_A);
        P(mutex_A);
        将新邮件放入A的信箱;
        V(mutex_A);
        V(Full_A);
    }
}
```],
)

#align(center)[CoEnd]

【评分说明】

① 每对信号量的定义及初值正确，给分。

② 每个互斥信号量的P、V操作使用正确，各给分。

③ 每个同步信号量的P、V操作使用正确，各给分。

④ 其他答案酌情给分。
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 页和页框大小均为4KB。进程的虚拟地址空间大小为 $2^32 / 2^12 = 2^20$ 页。
  
+ $(2^10 times 4) / 2^12$（页目录所占页数）$+ (2^20 times 4) / 2^12$（页表所占页数）$= 1025$ 页。
  
+ 需要访问一个二级页表。因为虚拟地址0100 0000H和0111 2048H的最高10位的值都是4，访问的是同一个二级页表。
  
  【评分说明】用其他方法计算，思路和结果正确同样给分。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ DHCP服务器可为主机2～主机N动态分配IP地址的最大范围是：111.123.15.5～111.123.15.254；主机2发送的封装DHCP Discover报文的IP分组的源IP地址和目的IP地址分别是0.0.0.0和255.255.255.255。
  
+ 主机2发出的第一个以太网帧的目的MAC地址是ff-ff-ff-ff-ff-ff；封装主机2发往Internet的IP分组的以太网帧的目的MAC地址是00-a1-a1-a1-a1-a1。
  
+ 主机1能访问WWW服务器，但不能访问Internet。由于主机1的子网掩码配置正确而默认网关IP地址被错误地配置为111.123.15.2（正确IP地址是111.123.15.1），所以主机1可以访问在同一个子网内的WWW服务器，但当主机1访问Internet时，主机1发出的IP分组会被路由到错误的默认网关（111.123.15.2），从而无法到达目的主机。

]
]
