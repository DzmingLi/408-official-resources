#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2014, subject: "计算机学科专业基础", code: "408", solutions: true)
#import "@preview/cetz:0.5.2" as cetz
#set document(title: "计算机学科专业基础综合试题参考答案及解析（2014年）")

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
// 综合应用题41—47题来源：2015高教社《考研计算机专业基础综合历年真题标准解析》，书内12—18页（PDF 18—24页）。
// 按扫描页核对答案、评分说明及备用解法；修复OCR与图表排版，选择题仍仅保留答案字母。

= 二、综合应用题

= 41. 【答案要点】
【答案一】

1）算法的设计思想：（4分）

本问题可采用递归算法实现。根据定义：

二叉树的 WPL 值=树中全部叶结点的带权路径长度之和

\=根结点左子树中全部叶结点的带权路径长度之和+

根结点右子树中全部叶结点的带权路径长度之和

叶结点的带权路径长度=该结点的 weight 域的值 $times$该结点的深度

设根结点的深度为0，若某结点的深度为 d时，则其孩子结点的深度为 d+1

#subquestions(start: 2, allow-oversize: true)[
+ 算法中使用的二叉树结点的数据类型定义如下：（2分）

  ```c
  typedef struct node {
      int weight;
      struct node *left, *right;
  } BTree;
  ```

+ 算法实现：（7分）

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
= 【答案二】
#subquestions(after-heading: true, allow-oversize: true)[
+ 算法的设计思想：（4分）

  若借用非叶结点的 weight 域保存其孩子结点中 weight 域值的和，则树的 WPL
  等于树中所有非叶结点 weight 域值之和。

  采用后序遍历策略，在遍历二叉树
  $T$时递归计算每个非叶结点的weight域的值，则树
  $T$的WPL等于根结点左子树的WPL加上右子树的WPL，再加上根结点中weight域

  的值。

+
  算法中使用的二叉树结点的数据类型定义同【答案一】。（2分）

+ 算法实现：（7分）

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
= 【评分说明】
①若考生给出能够满足题目要求的其他算法（包括用非递归的遍历方式实现的算法），且正确，可同样给分。

②参考答案中只给出了使用C语言的版本，使用C++语言正确实现的算法同样给分。

③若对算法的基本设计思想和主要数据结构的描述不十分清晰，但在算法实现中能够清晰反映出算法思想且正确，参照
①的标准给分。

④若考生给出的二叉树结点的数据类型定义及算法实现中，使用的是除整型之外的其他数值类型，可视同使用整型类型。

⑤若考生给出的答案中算法主要设计思想或算法实现中部分正确，可酌情给分。

= 42. 【答案要点】
#subquestions(after-heading: true, allow-oversize: true)[
+ 本题中的网络可抽象为图结构。（1分）

]
= 【评分说明】
只要考生的答案中给出与图的含义相似的描述，例如“网状结构”、“非线性结构”等，同样给分。

#subquestions(start: 2, allow-oversize: true)[
+ 链式存储结构的数据类型定义如下：（3分）

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

  对应题42表的链式存储结构示意图如下。（2分）

  #align(center, image("official-images/page-020-img-6.jpg", width: 27em))

]
= 【评分说明】
①若考生给出的答案是将链表中的表头结点保存在一个一维数组中（即采用邻接表形式），同样给分。

②若考生给出的答案中，弧结点没有使用union定义，而是采用两种不同的结构分别表示
Link和Net，同时在表头结点中定义了两个指针，分别指向由这两种类型的结点构成的两个链表，同样给分。

③考生所给答案的弧结点中，可以在单独定义的域中保存各直连网络IP地址的前缀长度，也可以与网络地址保存在同一个域中。

④数据类型定义中，只要采用了可行的链式存储结构，并保存了题目中所给的LSI信息，例如将网络抽象为一类结点，写出含8个表头结点的链式存储结构，均可参照
① $tilde.op$ ③的标准给分。

⑤考生给出的答案中，图示部分应与其数据类型定义部分一致，图示只要能够体现链式存储结构及题42图中的网络连接关系（可以不给出结点内的细节信息），即可给分。

⑥若解答不完全正确，酌情给分。

#subquestions(start: 3, allow-oversize: true)[
+ 计算结果如下表所示。（4分）

  #figure(
    align(center)[#table(
      columns: 4,
      align: (auto,auto,auto,auto,),
      [], [目的网络], [路径], [代价(费用)],
      [步骤1], [192.1.1.0/24], [直接到达], [1],
      [步骤2], [192.1.5.0/24], [R1→R3→192.1.5.0/24], [3],
      [步骤3], [192.1.6.0/24], [R1→R2→192.1.6.0/24], [4],
      [步骤4], [192.1.7.0/24], [R1→R2→R4→192.1.7.0/24], [8],
    )]
    , kind: table
    )

]
= 【评分说明】
①若考生给出的各条最短路径的结果部分正确，可酌情给分。

②若考生给出的从R1到达子网192.1.x.x的最短路径及代价正确，但不完全符合代价不减的次序，可酌情给分。

= 43. 【答案要点】
#subquestions(after-heading: true, allow-oversize: true)[
+
  子网192.1.6.0/24和192.1.7.0/24在R1的路由表中可聚合为一个子网
  192.1.6.0/23。于是得到R1的路由表如下：（6分）

  #figure(
    align(center)[#table(
      columns: 3,
      align: (auto,auto,auto,),
      [目的网络], [下一跳], [接口],
      [192.1.1.0/24], [\-], [E0],
      [192.1.6.0/23], [10.1.1.2], [L0],
      [192.1.5.0/24], [10.1.1.10], [L1],
    )]
    , kind: table
    )

]
= 【评分说明】
①每正确解答1个路由项，给2分，共6分。

②路由项解答不完全正确或路由项多于3条，可酌情给分。

#subquestions(start: 2, allow-oversize: true)[
+
  R1通过L0接口转发该IP分组。（1分）主机192.1.7.211收到的IP分组的TTL

  是61。（1分）

+
  R1的LSI需要增加一条特殊的直连网络，网络前缀Prefix为“0.0.0.0/0”，Metric为10。（1分）

]
= 【评分说明】
考生只要回答：增加前缀 Prefix为“0.0.0.0/0”，Metric为10，同样给分。

= 44. 【答案要点】
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
= 【评分说明】
对于第1问，若考生回答：因为指令1和2、2和3、3和4、5和6发生数据相关，因而发生阻塞的指令为第2、3、4、6条指令，同样给3分。答对3个以上给3分，部分正确酌情给分。

= 45. 【答案要点】
#subquestions(after-heading: true, allow-oversize: true)[
+ 由于（R6）=1000，故（R2）=1000。（1分）

+ 指令 Cache 数据区的容量：
  $16 times 32 upright("B") = 512 upright("B")$。（1分）

  P共有6条指令，占24字节，小于主存块大小（32B），其起始地址为08048100H，因而所有指令都在同一个主存块中。读取第一条指令时，发生Cache缺失，故将P所在主存块调入Cache某一行，以后每次读取指令时，都能在指令Cache中命中。因此，P在
  1000次循环执行过程中共发生1次指令访问缺失，故指令Cache的命中率为：（
  $1000 times 6$ -1） $\/ \( 1000 times 6 \) = 99.98 %$
  。（2分）

  【评分说明】若考生给出正确的命中率，而未说明原因和过程，给1分。若命中率计算错误，但解题思路正确，可酌情给分。

+ P执行过程中，指令4（或add
  R1，R1，R5）的执行可能发生溢出异常。（2分）load指令（或指令3）的执行可能会产生缺页异常。因为load指令需要读取数组A的内容，当数组A不在主存时发生缺页异常。（1分）

  第一次执行 load 指令时，因为数组 A 未调入主存，故访问 TLB
  缺失，并发生缺页，需要从磁盘上读取数组 A，因为数组 A
  所在页在同一个磁盘扇区中，所以在不考虑页面置换的情况下，只要读取磁盘 1
  次。（2分）缺页异常处理结束后，重新执行 load 指令；load 指令的随后 1000
  次执行中，每次都能在 TLB 中命中，因而无须访问内存页表项和磁盘，所以，P
  在 1000 次循环执行过程中，对于数组 A，需要读取 TLB 共 1001 次。（2分）

]
= 【评分说明】
①对于第1问，若答案中除指令4外还包含其他运算类指令（即指令1、2、5），则给1分，其他情况，则给0分。

②对于第2问，只要回答“load指令”即可得分。

③对于第3问，若答案中给出的读TLB的次数为1002，同样给分。若直接给出正确的
TLB及磁盘的访问次数，而未说明原因，给3分。若给出的
TLB及磁盘的访问次数不正确，但解题思路正确，可酌情给分。

= 46. 【答案要点】
#subquestions(after-heading: true, allow-oversize: true)[
+
  向前移动文件的前29条记录，每条记录读写各1次，腾出一个磁盘块空间，以将该记录插入到此磁盘块作为文件的第30条记录。（1分）故需要磁盘访问的次数为：
  $29 times 2 + 1 = 59$次。（1分）

  文件控制块中文件的起始地址和文件大小发生了变化。（1分）

+
  采用链接分配方式存储文件F，需要读文件的前29块的链接指针（共读29次），在第29块内找到指向原第30块的链接指针。再为该记录分配一个空闲磁盘块，将该记录及第29块内保存的链接指针写入其中，将该块写到磁盘（写1次）。最后修改第29块的链接指针，指向新的插入块，并将第29块写回磁盘（写1次）。（1分）故需要磁盘访问的次数：
  $29 + 2 = 31$次。（1分）

  该文件系统支持的文件最大长度是：
  $\( 1024 - 4 \) times 2^(32) upright("B") = 4080 upright("GB") 。$
  （2分）

]
= 【评分说明】
①第（1）小题的第2问，若答案中不包括文件的起始地址和文件大小，则不给分。

②若按
$1024 times 2^(32) upright("B") = 4096 upright("GB")$计算文件最大长度，给1分。

= 47. 【答案要点】
伪代码如下：

```text
semaphore empty = 1000; // 空缓冲区数
semaphore full = 0;  // 非空缓冲区数（1分）
semaphore mutex1 = 1;   // 用于实现生产者之间的互斥
semaphore mutex2 = 1;   // 用于实现消费者之间的互斥（1分）
int in = 0;
int out = 0;
生产者进程（2分）
while (TRUE) {
    produce;
    P(empty);
    P(mutex1);
    put an item into buf[in];
    in = (in + 1) mod n;
    V(mutex1);
    V(full);
}
消费者进程（4分）
while (TRUE) {
    P(mutex2);
    for (int i = 0; i < 10; i++) {
        P(full);
        get an item from buf[out];
        out = (out + 1) mod n;
        V(empty);
    }
    V(mutex2);
    consume;
}
```

= 【评分说明】
①信号量的初值和含义都正确给2分。

②生产者之间的互斥操作正确给1分；生产者与消费者之间的同步操作正确给2分；消费者之间互斥操作正确给1分。

③控制消费者连续取产品数量正确给2分。

④仅给出经典生产者-消费者问题的信号量定义和伪代码描述，最多给3分。

⑤若考生将题意理解成缓冲区中至少有10件产品，消费者才能开始取产品，其他均正确，得6分。

⑥部分正确，酌情给分。
