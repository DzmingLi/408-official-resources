// 人工核对：2018年计算机考试大纲.pdf，书内50～51页。
// 标准答案按题号逐项列出，供提取器读取。
// 第45、46题：同版书内54～55页，PDF第60～61页；人工按扫描录入。
// 第44题：同版书内54页，PDF第60页；人工按扫描录入。
// 第42、43、47题：同版书内51～54、56页，PDF第57～60、62页；人工按扫描录入。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2016, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title: "2016年计算机学科专业基础综合试题参考答案")
#let answer-counter = counter("2016-answer-question")
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
  [1．D], [2．D], [3．C], [4．B], [5．C],
  [6．D], [7．B], [8．B], [9．B], [10．A],
  [11．D], [12．C], [13．D], [14．A], [15．C],
  [16．C], [17．C], [18．B], [19．B], [20．A],
  [21．A], [22．A], [23．A], [24．B], [25．C],
  [26．A], [27．B], [28．D], [29．A], [30．C],
  [31．D], [32．A], [33．C], [34．C], [35．D],
  [36．B], [37．B], [38．D], [39．C], [40．C],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
#subquestions(allow-oversize: true)[
+ 第二次握手的TCP段中，SYN=1、ACK=1，确认序号为101。
+ H3收到第8个确认段时，接收窗口为12 KB，拥塞窗口为9 KB，发送窗口为9 KB。
+ 发送窗口为0时，下一个待发送数据的序号为 $20 times 1024 + 101 = 20581$。平均数据传输速率为 $20 "KB" / (5 times 200 "ms") = 20 "KB/s"$。

  编注：原参考答案在20 KB/s后另写“=20.48 kbps”，单位换算有误；按1 KB=1024 B，20 KB/s应为163.84 kb/s。
+ 从 $t$ 时刻起，S释放连接的最短时间为 $1.5 times 200 "ms" = 300 "ms"$。
]
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 根据定义，正则$k$叉树中仅含有两类结点：叶结点（个数记为$n_0$）和度为$k$的分支结点（个数记为$n_k$）。树$T$中的结点总数$n=n_0+n_k=n_0+m$。树中所含的边数$e=n-1$，这些边均为$m$个度为$k$的结点发出的，即$e=m times k$。整理得：$n_0+m=m times k+1$，故$n_0=(k-1) times m+1$。（3分）
+ 高度为$h$的正则$k$叉树$T$中，含最多结点的树形为：除第$h$层外，第1到第$h-1$层的结点都是度为$k$的分支结点，而第$h$层均为叶结点，即树是“满”树。此时第$j$（$1 <= j <= h$）层结点数为$k^(j-1)$，结点总数$M_1$为：

  $ M_1=sum_(j=1)^h k^(j-1)=(k^h-1)/(k-1) $（3分）

  含最少结点的正则$k$叉树的树形为：第1层只有根结点，第2到第$h-1$层仅含1个分支结点和$k-1$个叶结点，第$h$层有$k$个叶结点。即除根外第2到第$h$层中每层的结点数均为$k$，故$T$中所含结点总数$M_2$为：

  $ M_2=1+(h-1) times k $（2分）
]
【评分说明】

① 参考答案仅给出一种推导过程，若考生采用其他推导方法且正确，同样给分。

② 若考生仅给出结果，但没有推导过程，则（1）（2）的最高得分分别是2分和3分。若推导过程或答案不完全正确，酌情给分。
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 算法的基本设计思想（4分）

  由题意知，将最小的$floor(n/2)$个元素放在$A_1$中，其余的元素放在$A_2$中，分组结果即可满足题目要求。仿照快速排序的思想，基于枢轴将$n$个整数划分为两个子集。根据划分后枢轴所处的位置$i$分别处理：

  ① 若$i=floor(n/2)$，则分组完成，算法结束；

  ② 若$i<floor(n/2)$，则枢轴及之前的所有元素均属于$A_1$，继续对$i$之后的元素进行划分；

  ③ 若$i>floor(n/2)$，则枢轴及之后的所有元素均属于$A_2$，继续对$i$之前的元素进行划分；

  基于该设计思想实现的算法，无须对全部元素进行全排序，其平均时间复杂度是$O(n)$，空间复杂度是$O(1)$。
+ 算法实现（9分）

  ```c
  int setPartition(int a[], int n)
  {
      int pivotkey, low=0, low0=0, high=n-1, high0=n-1,
          flag=1, k=n/2, i;
      int s1=0, s2=0;
      while (flag)
      {
          pivotkey=a[low];          // 选择枢轴
          while (low<high)         // 基于枢轴对数据进行划分
          {
              while (low<high && a[high]>=pivotkey) --high;
              if (low!=high) a[low]=a[high];
              while (low<high && a[low]<=pivotkey) ++low;
              if (low!=high) a[high]=a[low];
          }                        // end of while (low<high)
          a[low]=pivotkey;
          if (low==k-1)            // 如果枢轴是第n/2小元素，划分成功
              flag=0;
          else                     // 否则继续划分
          {
              if (low<k-1)
              {
                  low0=++low;
                  high=high0;
              }
              else
              {
                  high0=--high;
                  low=low0;
              }
          }
      }
      for (i=0; i<k; i++) s1+=a[i];
      for (i=k; i<n; i++) s2+=a[i];
      return s2-s1;
  }
  ```

  【（1）（2）的评分说明】

  ① 本题目只需将最大的一半元素与最小的一半元素分组，不需要对所有元素进行全部排序。参考答案基于快速排序思想，采用非递归的方式实现。若考生设计的算法满足题目的功能要求且正确，则（1）（2）根据所实现算法的平均时间复杂度给分，细则见下表。

  #table(columns: (auto, auto, 1fr),
    [时间复杂度], [分数], [说明],
    [$O(n)$], [13], [采用类似快速排序思想，没有对元素进行全排序。],
    [$O(n log_2 n)$], [11], [],
    [$O(n^2)$], [9], [],
    [其他], [7], [时间复杂度高于$O(n^2)$的算法。],
  )

  ② 若考生算法的基本设计思想描述中因文字表达没有清晰反映出算法思路，但在算法实现中能够表达出算法思想且正确的，可参照①的标准给分。

  ③ 考生算法的基本设计思想描述或算法实现中部分正确，可参照①中各种情况的相应得分标准酌情给分。

  ④ 参考答案中只给出了使用C语言的版本，使用C++语言的答案视同使用C语言。
+ 算法的平均时间复杂度和空间复杂度（2分）

  本参考答案给出的算法平均时间复杂度是$O(n)$，空间复杂度是$O(1)$。

  【评分说明】若考生所估计的平均时间复杂度和空间复杂度与考生所实现的算法一致，可各给1分。
]
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 每传送一个ASCII字符，需要传输的位数有1位起始位、7位数据位（ASCII字符占7位）、1位奇校验位和1位停止位，故总位数为1+7+1+1=10。（2分）

  I/O端口每秒最多可接收1000/0.5=2000个字符。（1分）

  【评分说明】对于第一问，若考生回答总位数为9，则给1分。
+ 一个字符传送时间包括：设备D将字符送I/O端口的时间、中断响应时间和中断服务程序前15条指令的执行时间。时钟周期为1/(50 MHz)=20 ns，设备D将字符送I/O端口的时间为0.5 ms/20 ns=$2.5 times 10^4$个时钟周期。一个字符的传送时间大约为$2.5 times 10^4+10+15 times 4=25070$个时钟周期。完成1000个字符传送所需时间大约为1000×25070=25070000个时钟周期。（3分）

  CPU用于该任务的时间大约为$1000 times (10+20 times 4)=9 times 10^4$个时钟周期。（1分）

  在中断响应阶段，CPU主要进行以下操作：关中断、保护断点和程序状态、识别中断源。（2分）

  【评分说明】

  ① 对于第一问，若答案是25070020，则同样给分；若答案是25000000或25000020，则给2分。如果没有给出分步计算步骤，但算式和结果正确，同样给分。

  ② 对于第三问，只要回答关中断和保护断点，就给2分，其他答案酌情给分。
]
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 页大小为8 KB，页内偏移地址为13位，故A=B=32−13=19；D=13；C=24−13=11。主存块大小为64 B，故G=6。2路组相联，每组数据区容量为64 B×2=128 B，共有64 KB/128 B=512组，故F=9；E=24−G−F=9。因此A=19，B=19，C=11，D=13，E=9，F=9，G=6。

  TLB中标记字段B的内容是虚页号，表示该TLB项对应哪个虚页的页表项。
+ 块号4099=00 0001 0000 0000 0011B，因此所映射的Cache组号为0 0000 0011B=3，对应的H字段内容为0 0000 1000B。
+ Cache缺失带来的开销小，而处理缺页的开销大。因为缺页处理需要访问磁盘，而Cache缺失只需要访问主存。
+ 因为采用直写策略时需要同时写快速存储器和慢速存储器，而写磁盘比写主存慢得多，所以，在Cache—主存层次，Cache可以采用直写策略，而在主存—外存（磁盘）层次，修改页面内容时总是采用回写策略。
]
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 由于采用了静态优先数，当就绪队列中总有优先数较小的进程时，优先数较大的进程一直没有机会运行，因而会出现饥饿现象。
+ 优先数priority的计算公式为：

  $ "priority" = "nice" + k_1 times "cpuTime" - k_2 times "waitTime" $，其中 $k_1>0$，$k_2>0$，用来分别调整cpuTime和waitTime在priority中所占的比例。waitTime可使长时间等待的进程优先数减小，从而避免出现饥饿现象。
]
]

#answer-question[
#subquestions(allow-oversize: true)[
+ 两个目录文件dir和dir1的内容如下表所示。（3分）

  #grid(columns: (1fr, 1fr), gutter: 2em,
    [dir目录文件\
     #table(columns: 2, [文件名], [簇号], [dir1], [48])],
    [dir1目录文件\
     #table(columns: 2, [文件名], [簇号], [file1], [100], [file2], [200])],
  )

  【评分说明】每个目录项的内容正确给1分，共3分。
+ FAT的最大长度为$2^16 times 2"B"=128"KB"$。（1分）文件的最大长度是$2^16 times 4"KB"=256"MB"$。（1分）

  【评分说明】若考生考虑到文件结束标志、坏块标志等，且答案正确，同样给分。
+ file1的簇号106存放在FAT的100号表项中，（1分）簇号108存放在FAT的106号表项中。（1分）
+ 需要访问目录文件dir1所在的48号簇，（1分）及文件file1的106号簇。（1分）
]
]
