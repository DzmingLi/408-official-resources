#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2014, subject: "计算机学科专业基础", code: "408", solutions: true)
#import "@preview/cetz:0.5.2" as cetz
#set document(title: "计算机学科专业基础综合试题参考答案（2014年）")
// 来源：2015年计算机考试大纲.pdf书内68～73页；2016年考纲书内55～56页补齐末尾。
// 按考纲录入；原汇编解析保留在本地参考/高教社汇编解析/，不参与构建。

= 一、单项选择题

#answer-key(
  columns: 5,
  stroke: none,
  inset: (x: 1.1em, y: 0.35em),
  align: left,
  [1．C], [2．B], [3．A], [4．D], [5．C],
  [6．D], [7．D], [8．D], [9．D], [10．B],
  [11．C], [12．D], [13．C], [14．A], [15．A],
  [16．D], [17．A], [18．C], [19．C], [20．C],
  [21．D], [22．B], [23．A], [24．B], [25．D],
  [26．A], [27．A], [28．C], [29．B], [30．A],
  [31．C], [32．D], [33．C], [34．B], [35．D],
  [36．C], [37．B], [38．A], [39．B], [40．D],
)

= 二、综合应用题

= 41. 【答案要点】
【答案一】

#subquestions(allow-oversize: true)[
+ 算法的设计思想：

  本问题可采用递归算法实现。根据定义：

  二叉树的WPL值=树中全部叶结点的带权路径长度之和\
  =根结点左子树中全部叶结点的带权路径长度之和+根结点右子树中全部叶结点的带权路径长度之和

  叶结点的带权路径长度=该结点的weight域的值×该结点的深度

  设根结点的深度为0，若某结点的深度为 $d$ 时，则其孩子结点的深度为 $d+1$。
+ 算法中使用的二叉树结点的数据类型定义如下：

  ```c
  typedef struct node {
      int weight;
      struct node *left, *right;
  } BTree;
  ```
+ 算法实现：

  ```c
  int WPL(BTree *root) { // 根据WPL的定义采用递归算法实现
      return WPL1(root, 0);
  }
  int WPL1(BTree *root, int d) { // d为结点深度
      if (root->left == NULL && root->right == NULL)
          return root->weight * d;
      else
          return WPL1(root->left, d+1) + WPL1(root->right, d+1);
  }
  ```
]

【答案二】

#subquestions(allow-oversize: true)[
+ 算法的设计思想：

  若借用非叶结点的weight域保存其孩子结点中weight域值的和，则树的WPL等于树中所有非叶结点weight域值之和。

  采用后序遍历策略，在遍历二叉树 $T$ 时递归计算每个非叶结点的weight域的值，则树 $T$ 的WPL等于根结点左子树的WPL加上右子树的WPL，再加上根结点中weight域的值。
+ 算法中使用的二叉树结点的数据类型定义同【答案一】。
+ 算法实现：

  ```c
  int WPL(BTree *root) { // 基于递归的后序遍历算法实现
      int w_l, w_r;
      if (root->left == NULL && root->right == NULL)
          return 0;
      else {
          w_l = WPL(root->left);  // 计算左子树的WPL
          w_r = WPL(root->right); // 计算右子树的WPL
          root->weight = root->left->weight + root->right->weight;
          // 填写非叶结点的weight域
          return w_l + w_r + root->weight; // 返回WPL值
      }
  }
  ```
]

= 42. 【答案要点】
#subquestions(allow-oversize: true)[
+ 本题中的网络可抽象为图结构。
+ 链式存储结构的数据类型定义如下：

  ```c
  typedef struct {
      unsigned int ID;
      unsigned int IP;
  } LinkNode; // Link的结构
  typedef struct {
      unsigned int Prefix;
      unsigned int Mask;
  } NetNode; // Net的结构
  typedef struct Node {
      int Flag; // Flag=1：Link；Flag=2：Net
      union {
          LinkNode Lnode;
          NetNode Nnode;
      } LinkORNet;
      unsigned int Metric;
      struct Node *Next;
  } ArcNode; // 弧结点
  typedef struct HNode {
      unsigned int RouterID;
      ArcNode *LN_link;
      struct HNode *Next;
  } HNODE; // 表头结点
  ```

  弧结点的两种基本形态

  #align(center, grid(columns: (auto, auto), column-gutter: 2em,
    table(columns: 2, align: center + horizon,
      [Flag=1], [Next], table.cell(colspan: 2)[ID],
      table.cell(colspan: 2)[IP], table.cell(colspan: 2)[Metric]),
    table(columns: 2, align: center + horizon,
      [Flag=2], [Next], table.cell(colspan: 2)[Prefix],
      table.cell(colspan: 2)[Mask], table.cell(colspan: 2)[Metric]),
  ))

  表头结点结构示意

  #align(center, table(columns: 1, align: center + horizon,
    [RouterID], [LN_link], [Next],
  ))

  对应题42表的链式存储结构示意图如下。

  #align(center, image("official-images/page-020-img-6.jpg", width: 27em))
+ 计算结果如下表所示。

  #align(center, table(columns: 4, align: center + horizon,
    [], [目的网络], [路径], [代价（费用）],
    [步骤1], [#text("192. 1. 1. 0/24")], [直接到达], [1],
    [步骤2], [#text("192. 1. 5. 0/24")], [R1→R3→192. 1. 5. 0/24], [3],
    [步骤3], [#text("192. 1. 6. 0/24")], [R1→R2→192. 1. 6. 0/24], [4],
    [步骤4], [#text("192. 1. 7. 0/24")], [R1→R2→R4→192. 1. 7. 0/24], [8],
  ))
]

= 43. 【答案要点】
#subquestions(allow-oversize: true)[
+ 子网192. 1. 6. 0/24和192. 1. 7. 0/24在R1的路由表中可聚合为一个子网192. 1. 6. 0/23。于是得到R1的路由表如下：

  #align(center, table(columns: 3, align: center + horizon,
    [目的网络], [下一跳], [接口],
    [#text("192. 1. 1. 0/24")], [—], [E0],
    [#text("192. 1. 6. 0/23")], [#text("10. 1. 1. 2")], [L0],
    [#text("192. 1. 5. 0/24")], [#text("10. 1. 1. 10")], [L1],
  ))
+ R1通过L0接口转发该IP分组。主机192. 1. 7. 211收到的IP分组的TTL是61。
+ R1的LSI需要增加一条特殊的直连网络，网络前缀Prefix为“0. 0. 0. 0/0”，Metric为10。
]

= 44. 【答案要点】
#subquestions(allow-oversize: true)[
+ 因为每条指令长度为32位，占4个单元，所以存储器编址单位是字节。
+ 数组A中每个元素的地址通过下标左移两位（即乘4）再加数组首址得到，故每个数组元素占4个字节，即32位。
+ OFFSET=FFFAH，值为−6。指令bne所在地址为0804 8114H，转移目标地址为0804 8100H，因为0804 8100H=0804 8114H+4+(−6)×4，所以，指令bne的转移目标地址计算公式为：(PC)+4+OFFSET×4。
+ 由于数据相关而发生阻塞的指令为第2、3、4、6条，因为第2、3、4、6条指令都与各自的前一条指令发生数据相关。第6条指令会发生控制冒险。当前循环的第5条指令与下次循环的第1条指令虽有数据相关，但由于第6条指令后面有3个时钟周期的阻塞，因而消除了该数据相关。
]

= 45. 【答案要点】
#subquestions(allow-oversize: true)[
+ 由于(R6)=1000，故(R2)=1000。
+ 指令Cache数据区的容量：16×32 B=512 B。

  P共有6条指令，占24字节，小于主存块大小（32 B），其起始地址为0804 8100H，因而所有指令都在同一个主存块中。读取第一条指令时，发生Cache缺失，故将P所在主存块调入Cache某一行，以后每次读取指令时，都能在指令Cache中命中。因此，P在1000次循环执行过程中共发生1次指令访问缺失，故指令Cache的命中率为：(1000×6−1)/(1000×6)=99.98%。
+ P执行过程中，指令4（或add R1, R1, R5）的执行可能发生溢出异常。load指令（或指令3）的执行可能会产生缺页异常。因为load指令需要读取数组A的内容，当数组A不在主存时发生缺页异常。

  第一次执行load指令时，因为数组A未调入主存，故访问TLB缺失，并发生缺页，需要从磁盘上读取数组A，因为数组A所在页在同一个磁盘扇区中，所以在不考虑页面置换的情况下，只要读取磁盘1次。缺页异常处理结束后，重新执行load指令；load指令的随后1000次执行中，每次都能在TLB中命中，因而无须访问内存页表项和磁盘，所以，P在1000次循环执行过程中，对于数组A，需要读取TLB共1001次。
]

= 46. 【答案要点】
#subquestions(allow-oversize: true)[
+ 向前移动文件的前29条记录，每条记录读写各1次，腾出一个磁盘块空间，以将该记录插入到此磁盘块作为文件的第30条记录。故需要磁盘访问的次数为：29×2+1=59次。

  文件控制块中文件的起始地址和文件大小发生了变化。
+ 采用链接分配方式存储文件F，需要读文件的前29块的链接指针（共读29次），在第29块内找到指向原第30块的链接指针。再为该记录分配一个空闲磁盘块，将该记录及第29块内保存的链接指针写入其中，将该块写到磁盘（写1次）。最后修改第29块的链接指针，指向新的插入块，并将第29块写回磁盘（写1次）。故需要磁盘访问的次数：29+2=31次。

  该文件系统支持的文件最大长度是：$(1024-4) times 2^32$ B=4080 GB。
]

= 47. 【答案要点】
伪代码如下：

```text
semaphore empty = 1000; // 空缓冲区数
semaphore full = 0;     // 非空缓冲区数
semaphore mutex1 = 1;   // 用于实现生产者之间的互斥
semaphore mutex2 = 1;   // 用于实现消费者之间的互斥
int in = 0;
int out = 0;
生产者进程
while (TRUE) {
    produce;
    P(empty);
    P(mutex1);
    put an item into buf[in];
    in = (in+1) mod n;
    V(mutex1);
    V(full);
}
消费者进程
while (TRUE) {
    P(mutex2);
    for (int i = 0; i < 10; i++) {
        P(full);
        get an item from buf[out];
        out = (out+1) mod n;
        V(empty);
    }
    V(mutex2);
    consume;
}
```
