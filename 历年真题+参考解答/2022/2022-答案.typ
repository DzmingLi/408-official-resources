// 来源：内容来源/2024年计算机考试大纲.pdf。
// 书内第59～65页（PDF第64～70页），逐页人工核对并补齐旧扫描缺行。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2022, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title: "2022年计算机学科专业基础试题参考答案")
#import "@preview/ezexam:0.3.1": question, counter-question, mode-state, HANDOUTS, answer-state
#mode-state.update(HANDOUTS)
#answer-state.update(false)

= 一、单项选择题

#answer-key(columns: 5, stroke: none, align: left,
  [1．B], [2．D], [3．B], [4．C], [5．D],
  [6．D], [7．B], [8．D], [9．D], [10．A],
  [11．D], [12．A], [13．B], [14．A], [15．C],
  [16．A], [17．C], [18．B], [19．D], [20．A],
  [21．C], [22．C], [23．D], [24．A], [25．C],
  [26．B], [27．C], [28．D], [29．A], [30．D],
  [31．B], [32．A], [33．B], [34．C], [35．B],
  [36．D], [37．B], [38．C], [39．D], [40．B],
)

= 二、综合应用题

#counter-question.update(40)

#question[
【答案一】

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  
  对于采用顺序存储方式保存的二叉树，根结点保存在 SqBiTNode[0] 中；当某结点保存在 SqBiTNode[i] 中时，若有左孩子，则其值保存在 SqBiTNode[2i+1] 中；若有右孩子，则其值保存在 SqBiTNode[2i+2] 中；若有双亲结点，则其值保存在 SqBiTNode[(i−1)/2] 中。
  
  二叉搜索树需要满足的条件是：任一结点值大于其左子树中的全部结点值，小于其右子树中的全部结点值。中序遍历二叉搜索树得到一个升序序列。
  
  使用整型变量 val 记录中序遍历过程中已遍历结点的最大值，初值为一个负整数。若当前遍历的结点值小于等于 val，则算法返回 false，否则，将 val 的值更新为当前结点的值。
  
+ 算法实现
  
  ```c
  #define false 0
  #define true 1
  typedef int bool;
  bool judgeInOrderBST(SqBiTree bt, int k, int *val)
  // 初始调用时k的值是0
  {
      if (k < bt.ElemNum && bt.SqBiTNode[k] != -1)
      {
          if (!judgeInOrderBST(bt, 2*k+1, val)) return false;
          if (bt.SqBiTNode[k] <= *val) return false;
          *val = bt.SqBiTNode[k];
          if (!judgeInOrderBST(bt, 2*k+2, val)) return false;
      }
      return true;
  }
  ```
  
]

#block(sticky: true)[【答案二】]

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  
  对于采用顺序存储方式保存的二叉树，根结点保存在 SqBiTNode[0] 中；当某结点保存在 SqBiTNode[i] 中时，若有左孩子，则其值保存在 SqBiTNode[2i+1] 中；若有右孩子，则其值保存在 SqBiTNode[2i+2] 中；若有双亲结点，则其值保存在 SqBiTNode[(i−1)/2] 中。
  
  二叉搜索树需要满足的条件是：任一结点值大于其左子树中的全部结点值，小于其右子树中的全部结点值。设置两个数组 pmax 和 pmin。根据二叉搜索树的定义，SqBiTNode[i] 中的值应该大于以 SqBiTNode[2i+1] 为根的子树中的最大值（保存在 pmax[2i+1] 中），小于以 SqBiTNode[2i+2] 为根的子树中的最小值（保存在 pmin[2i+1] 中）。初始时，用数组 SqBiTNode 中前 ElemNum 个元素的值对数组 pmax 和 pmin 初始化。
  // pmin[2i+1]按官方印刷原文保留。
  
  在数组 SqBiTNode 中从后向前扫描，扫描过程中逐一验证结点与子树之间是否满足上述的大小关系。
  
+ 算法实现
  
  ```c
  #define false 0
  #define true 1
  typedef int bool;
  bool judgeBST(SqBiTree bt)
  {
      int k, m, *pmin, *pmax;
      pmin = (int *)malloc(sizeof(int) * (bt.ElemNum));
      pmax = (int *)malloc(sizeof(int) * (bt.ElemNum));
      for (k=0; k < bt.ElemNum; k++) // 辅助数组初始化
          pmin[k] = pmax[k] = bt.SqBiTNode[k];
      for (k=bt.ElemNum-1; k > 0; k--)
      // 从最后一个叶结点向根遍历
      {
          if (bt.SqBiTNode[k] != -1)
          {
              m = (k-1)/2; // 双亲
              if (k%2 == 1 && bt.SqBiTNode[m] > pmax[k])
              // 其为左孩子
                  pmin[m] = pmin[k];
              else if (k%2 == 0 && bt.SqBiTNode[m] < pmin[k])
                  // 其为右孩子
                  pmax[m] = pmax[k];
              else return false;
          }
      }
      return true;
  }
  ```

]
]

#pagebreak(weak: true)
#question[
#subquestions(allow-oversize: true)[
+ 算法思想
  
  【答案一】
  
  定义含10个元素的数组 A，元素值均为该数组类型能表示的最大数 MAX。
  
  ```text
  for M中的每个元素s
      if (s < A[9]) 丢弃A[9]并将s按升序插入A中；
  ```
  
  当数据全部扫描完毕，数组 A 中保存的就是最小的10个数。
  
  【答案二】
  
  定义含10个元素的大根堆 H，元素值均为该堆元素类型能表示的最大数 MAX。
  
  ```text
  for M中的每个元素s
      if (s < H的堆顶元素) 删除堆顶元素并将s插入H中；
  ```
  
  当数据全部扫描完毕，堆 H 中保存的就是最小的10个数。
  
+ 算法平均情况下的时间复杂度是 $O(n)$，空间复杂度是 $O(1)$。

]
]

#question[
#subquestions(allow-oversize: true)[
+ $"SF" = F_15$；加运算时，$"OF" = overline(A_15) dot overline(B_15) dot F_15 + A_15 dot B_15 dot overline(F_15)$；减运算时，$"OF" = overline(A_15) dot B_15 dot F_15 + A_15 dot overline(B_15) dot overline(F_15)$。
+ 因为单总线结构中每一时刻总线上只有一个数据有效，而 ALU 有两个输入端和一个输出端，因此需要设置 Y 和 Z 两个暂存器，以缓存 ALU 的一个输入端和输出端数据。
+ GPRs 中最多有 $2^4 = 16$ 个通用寄存器；rs 和 rd 来自指令寄存器 IR；rd 应连接地址译码器。
+ 取指阶段的控制信号序列为：① PCout，MARin ② Read ③ MDRout，IRin。取指令阶段至少需要7个时钟周期。
+ 图中控制信号由控制部件（CU）产生。指令寄存器 IR 和标志寄存器 FR 的输出信号会连到控制部件的输入端。

]
]

#pagebreak(weak: true)
#question[
#subquestions(allow-oversize: true)[
+ 3个字段的名称为柱面号（或磁道号）、磁头号（或盘面号）、扇区号；该磁盘的柱面号、磁头号、扇区号字段至少分别占 $ceil(log_2 20000) = 15$ 位、$ceil(log_2 (4 times 2)) = 3$ 位、$ceil(log_2 500) = 9$ 位。
+ 该磁盘转一圈的时间为 $60 times 10^3 \/ 7200 approx 8.33$ ms，一个扇区的平均访问时间约为 $5 + 8.33 \/ 2 + 8.33 \/ 500 approx 9.18$ ms。
+ 在一个扇区读写过程中，DMA 控制器向 CPU 发送了512 B/64 b = 64次总线请求。DMA 控制器可以获得总线使用权。因为一旦磁盘开始读写就必须按时完成数据传送，否则会发生数据丢失。

]
]

#question[
#subquestions(allow-oversize: true)[
+ 目录文件 stu 中两个目录项的内容是：
  
  #align(center, table(columns: (10em, 12em), align: center,
    [文件名], [索引节点号],
    [course], [2],
    [doc], [10],
  ))
  
+ 文件 doc 占用的磁盘块的块号 $x$ 的值为30。
+ 需要读2个磁盘块。先读 course1 的索引节点所在的磁盘块，再读 course1 的内容所在的磁盘块。
+ 存取 course2 需要使用索引节点的一级和二级间接地址项。6 MB大小的文件需占用 $6 "MB" \/ 4 "KB" = 1536$ 个磁盘块。直接地址项可记录10个磁盘块号，一级间接地址块可记录 $4 "KB" \/ 4 "B" = 1024$ 个磁盘块号，二级间接地址块可记录 $1024 times 1024$ 个磁盘块号，而 $10 + 1024 < 1536 < 10 + 1024 + 1024 times 1024$。

]
]

#pagebreak(weak: true)
#question[
#table(columns: (1fr, 1fr), align: left, inset: 0.6em,
  table.cell(colspan: 2)[
```text
Semaphore S_AC = 0; // 描述A、C之间的同步关系
Semaphore S_CE = 0; // 描述C、E之间的同步关系
```
  ],
  [
```text
T1:
    A;
    signal(S_AC);
    wait(S_CE);
    E;
    F;
```
  ],
  [
```text
T2:
    B;
    wait(S_AC);
    C;
    signal(S_CE);
    D;
```
  ],
)
]

#question[
#subquestions(allow-oversize: true)[
+ 设备1选择100BaseT 以太网交换机，设备2选择100BaseT 集线器。
+ 设 H2 与 H3 之间的最远距离是 $D$，根据 CSMA/CD 协议的工作原理有：
  
  $ (64 times 8) / (100 times 10^6) = (2 times D) / (2 times 10^8) + 2 times 1.51 times 10^(-6) $
  
  解得：$D = 210$ m。
  
+ M 是 DHCP 发现报文（DISCOVER 报文）；路由器 E0 接口能收到封装 M 的以太网帧；目的 MAC 地址是 FF-FF-FF-FF-FF-FF。
+ H5 收到的帧中，地址1、地址2和地址3分别是：00-11-11-11-11-E1、00-11-11-11-11-C1 和00-11-11-11-11-D1。

]
]
