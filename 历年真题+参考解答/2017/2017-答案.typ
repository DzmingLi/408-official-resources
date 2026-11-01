// 人工核对：2018年计算机考试大纲.pdf，书内70、72～73、76页。
// 第45、46题：同版书内74～75页，PDF第80～81页；人工按扫描录入。
// 第43、44题：同版书内73～74页，PDF第79～80页；人工按扫描录入。
// 第41题：同版书内70～72页，PDF第76～78页；人工按扫描录入。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2017, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title: "2017年计算机学科专业基础综合试题参考答案")
#let answer-counter = counter("2017-answer-question")
#let answer-question(body) = context {
  answer-counter.step()
  let label = box(width: 1em, align(right, answer-counter.display("1.")))
  layout(size => {
    let content = [
      #block(sticky: true, above: 0pt, below: 0pt, label)
      #pad(left: 2em, body)
    ]
    let oversize = measure(block(width: size.width, content)).height > 216mm
    block(breakable: oversize, content)
  })
}

= 一、单项选择题

#answer-key(
  columns: 5, stroke: none, align: left,
  [1．B], [2．C], [3．A], [4．B], [5．B],
  [6．D], [7．B], [8．A], [9．B], [10．B],
  [11．D], [12．C], [13．C], [14．A], [15．D],
  [16．A], [17．C], [18．B], [19．A], [20．D],
  [21．D], [22．B], [23．D], [24．C], [25．B],
  [26．D], [27．B], [28．D], [29．B], [30．D],
  [31．B], [32．B], [33．A], [34．D], [35．B],
  [36．A], [37．D], [38．C], [39．A], [40．C],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
#subquestions(allow-oversize: true)[
+ 算法的基本设计思想

  表达式树的中序序列加上必要的括号即为等价的中缀表达式。可以基于二叉树的中序遍历策略得到所需的表达式。（3分）

  表达式树中分支结点所对应的子表达式的计算次序，由该分支结点所处的位置决定。为得到正确的中缀表达式，需要在生成遍历序列的同时，在适当位置增加必要的括号。显然，表达式的最外层（对应根结点）及操作数（对应叶结点）不需要添加括号。（2分）
+ 算法实现（10分）

  ```c
  void BtreeToE(BTree *root)
  {
      BtreeToExp(root, 1);           // 根的高度为1
  }

  void BtreeToExp(BTree *root, int deep)
  {
      if (root==NULL) return;
      else if (root->left==NULL && root->right==NULL)
          // 若为叶结点
          printf("%s", root->data);  // 输出操作数
      else
      {
          if (deep>1) printf("(");  // 若有子表达式则加1层括号
          BtreeToExp(root->left, deep+1);
          printf("%s", root->data);  // 输出操作符
          BtreeToExp(root->right, deep+1);
          if (deep>1) printf(")");  // 若有子表达式则加1层括号
      }
  }
  ```
]
【评分说明】

① 若考生设计的算法满足题目的功能要求，则（1）（2）根据所实现算法的策略及输出结果给分，细则见下表。

#table(columns: (auto, 1fr),
 [分数], [备注],
 [15], [采用中序遍历算法且正确，括号嵌套正确，层数适当。],
 [14], [采用中序遍历算法且正确，括号嵌套正确，但括号嵌套层数过多。例如，表达式最外层加上括号，或操作数加括号如（a）。],
 [11], [采用中序遍历算法，但括号嵌套层数不完全正确。例如，左右括号数量不匹配。],
 [9], [采用中序遍历算法，但没有考虑括号。],
 [≤7], [其他。],
)

② 若考生采用其他方法得到正确结果，可参照①的评分标准给分。

③ 如果程序中使用了求结点深度等辅助函数，但没有给出相应实现过程，只要考生进行了必要的说明，可不扣分。

④ 若考生算法的基本设计思想描述中因文字表达没有清晰反映出算法思路，但在算法实现中能够表达出算法思想且正确的，可参照①的标准给分。

⑤ 考生算法的基本设计思想描述或算法实现中部分正确，可参照①中各种情况的相应得分标准酌情给分。

⑥ 参考答案中只给出了使用C语言的版本，使用C++语言的答案参照以上评分标准。
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 依次选取的边为(A, D)、(D, E)、(C, E)、(B, C)。（4分）
+ 图 $G$ 的最小生成树唯一。（2分）
+ 当带权连通图中任意一个环内的边的权值均不相同时，其最小生成树唯一。（2分）
]
【评分说明】第一问每条边正确且次序正确给1分；边正确而次序不完全正确时酌情给分。第三问给出其他充分条件（例如所有边权值均不同）也给分；仅限制顶点数小于3、图无环等的答案最多给1分。
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 由于$i$和$n$是unsigned型，故`i <= n-1`是无符号数比较，$n=0$时，$n-1$的机器数为全1，值是$2^32-1$，为unsigned型可表示的最大数，条件`i <= n-1`求真，因此出现死循环。（2分）

  若$i$和$n$改为int类型，则不会出现死循环。（1分）

  因为`i <= n-1`是带符号整数比较，$n=0$时，$n-1$的值是−1，当$i=0$时，条件`i <= n-1`不成立，此时退出for循环。（1分）
+ f1(23)与f2(23)的返回值相等。（1分）

  f1(23)的机器数是00FF FFFFH；（1分）

  f2(23)的机器数是4B7F FFFFH。（1分）
+ 当$n=24$时，$f(24)="1 1111 1111 1111 1111 1111 1111B"$，而float型数只有24位有效位，舍入后数值增大，所以f2(24)比f1(24)大1。（1分）

  【评分说明】只要说明f2(24)需舍入处理即可给分。
+ 显然$f(31)$已超出了int型数据的表示范围，用f1(31)实现时得到的机器数为32个1，作为int型数解释时其值为−1，即f1(31)的返回值为−1。（1分）

  因为int型最大可表示数是0后面加31个1，故使f1($n$)的返回值与$f(n)$相等的最大$n$值是30。（1分）

  【评分说明】对于第二问，只要给出$n=30$即可给分。
+ IEEE 754标准用“阶码全1、尾数全0”表示无穷大。f2返回值为float型，机器数7F80 0000H对应的值是$+infinity$。（1分）

  当$n=126$时，$f(126)=2^127-1=1.dots.c 1 times 2^126$，对应阶码为127+126=253，尾数部分舍入后阶码加1，最终阶码为254，是IEEE 754单精度格式表示的最大阶码。故使f2结果不溢出的最大$n$值为126。（1分）

  当$n=23$时，$f(23)$为24位1，float型数有24位有效位，所以不需舍入，结果精确。故使f2获得精确结果的最大$n$值为23。（1分）

  【评分说明】对于第三问，只要给出$n=23$，即可给分。对于第二问，只要给出$n=126$，即可给分。
]
]

#answer-question[
#subquestions(allow-oversize: true)[
+ M为CISC。（1分）

  M的指令长短不一，不符合RISC指令系统特点。（1分）
+ f1的机器代码占96 B。（1分）

  因为f1的第一条指令`push ebp`所在的虚拟地址为0040 1020H，最后一条指令`ret`所在的虚拟地址为0040 107FH，所以，f1的机器指令代码长度为0040 107FH−0040 1020H+1=60H=96个字节。（1分）
+ CF=1。（1分）

  cmp指令实现$i$与$n-1$的比较功能，进行的是减法运算。在执行f1(0)过程中，$n=0$，当$i=0$时，$i$=0000 0000H，并且$n-1$=FFFF FFFFH。因此，当执行第20条指令时，在补码加/减运算器中执行“0减FFFF FFFFH”的操作，即0000 0000H+0000 0000H+1=0000 0001H，此时，进位输出C=0，减法运算时的借位标志$"CF"="C" xor 1=1$。（2分）
+ f2中不能用shl指令实现power\*2。（1分）

  因为shl指令用来将一个整数的所有有效数位作为一个整体左移；而f2中的变量power是float型，其机器数中不包含最高有效数位，但包含了阶码部分，将其作为一个整体左移时并不能实现“乘2”的功能，因而f2中不能用shl指令实现power\*2。（2分）
]
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 函数f1的代码段中所有指令的虚拟地址的高20位相同，因此f1的机器指令代码在同一页中，仅占用1页。
+ push ebp的虚拟地址的最高10位（页目录号）为00 0000 0001，中间10位（页表索引）为00 0000 0001，所以，取该指令时访问了页目录的第1个表项，在对应的页表中访问了第1个表项。
+ 在执行scanf()的过程中，进程P因等待输入而从执行态变为阻塞态，输入结束时，P被中断处理程序唤醒，变为就绪态；P被调度程序调度，变为运行态。CPU状态会从用户态变为内核态。
]
]

#answer-question[
```text
semaphore mutex_y1 = 1; // thread1与thread3对变量y的互斥访问
semaphore mutex_y2 = 1; // thread2与thread3对变量y的互斥访问
semaphore mutex_z = 1;  // 变量z的互斥访问
```
互斥代码如下：
#table(columns: (1fr, 1fr, 1fr), align: left,
 [```c
thread1
{
    cnum w;
    wait(mutex_y1);
    w = add(x,y);
    signal(mutex_y1);
    ……
}
```],
 [```c
thread2
{
    cnum w;
    wait(mutex_y2);
    wait(mutex_z);
    w = add(y,z);
    signal(mutex_z);
    signal(mutex_y2);
    ……
}
```],
 [```c
thread3
{
    cnum w;
    w.a = 1;
    w.b = 1;
    wait(mutex_z);
    z = add(z,w);
    signal(mutex_z);
    wait(mutex_y1);
    wait(mutex_y2);
    y = add(y,w);
    signal(mutex_y1);
    signal(mutex_y2);
    ……
}
```])
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 从 $t_0$ 到 $t_1$ 期间，甲方可以断定乙方已正确接收3个数据帧，分别为S0,0、S1,0、S2,0。（2分）
+ 从 $t_1$ 起，甲方最多还可以发送5个数据帧，其中第一个为S5,2，最后一个为S1,2。（3分）
+ 甲方需要重传3个数据帧，重传的第一个帧为S2,3。（2分）
+ 甲方可以达到的最大信道利用率为
  $ (7 times (8 times 1000) / (100 times 10^6)) / (0.96 times 10^(-3) + 2 times (8 times 1000) / (100 times 10^6)) times 100% = 50%. $（2分）
]
【评分说明】答案部分正确，酌情给分。
]
