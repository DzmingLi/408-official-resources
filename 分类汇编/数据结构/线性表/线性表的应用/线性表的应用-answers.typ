// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：线性表的应用

=== 2009 42

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

=== 2010 42

#subquestions(allow-oversize: true)[
+ 给出算法的基本设计思想：

  先将 $n$ 个数据 $x_0,x_1,dots,x_p,dots,x_(n-1)$ 原地逆置，得到 $x_(n-1),dots,x_p,x_(p-1),dots,x_0$，然后再将前 $n-p$ 个和后 $p$ 个元素分别原地逆置，得到最终结果：$x_p,x_(p+1),dots,x_(n-1),x_0,x_1,dots,x_(p-1)$。
+ 算法实现：

  ```c
  void reverse(int r[], int left, int right) {
      int k = left, j = right, temp; // k等于左边界left，j等于右边界right
      while (k < j) {              // 交换r[k]与r[j]
          temp = r[k];
          r[k] = r[j];
          r[j] = temp;
          k++;                     // k右移一个位置
          j--;                     // j左移一个位置
      }
  }
  void leftShift(int r[], int n, int p) {
      if (p > 0 && p < n) {
          reverse(r, 0, n-1);      // 将全部数据逆置
          reverse(r, 0, n-p-1);    // 将前n-p个元素逆置
          reverse(r, n-p, n-1);    // 将后p个元素逆置
      }
  }
  ```
+ 说明算法复杂性：上述算法的时间复杂度为 $O(n)$，空间复杂度为 $O(1)$。
]

=== 2011 42

#subquestions(allow-oversize: true)[
+ 给出算法的基本设计思想：

  分别求两个升序序列A、B的中位数，设为 $a$ 和 $b$。若 $a=b$，则 $a$ 或 $b$ 即为所求的中位数；否则，舍弃 $a$、$b$ 中较小者所在序列之较小一半，同时舍弃较大者所在序列之较大一半，要求两次舍弃的元素个数相同。在保留的两个升序序列中，重复上述过程，直到两个序列中均只含一个元素时为止，则较小者即为所求的中位数。
+ 算法实现：

  ```c
  int M_Search(int A[], int B[], int n) {
      int start1, end1, mid1, start2, end2, mid2;
      start1 = 0; end1 = n-1;
      start2 = 0; end2 = n-1;
      while (start1 != end1 || start2 != end2) {
          mid1 = (start1+end1)/2;
          mid2 = (start2+end2)/2;
          if (A[mid1] == B[mid2])
              return A[mid1];
          if (A[mid1] < B[mid2]) {
              // 分别考虑奇数和偶数，保持两个子数组元素个数相等
              if ((start1+end1)%2 == 0) { // 若元素为奇数个
                  start1 = mid1; // 舍弃A中间点以前的部分且保留中间点
                  end2 = mid2;   // 舍弃B中间点以后的部分且保留中间点
              } else {           // 若元素为偶数个
                  start1 = mid1+1; // 舍弃A的前半部分
                  end2 = mid2;     // 舍弃B的后半部分
              }
          } else {
              if ((start1+end1)%2 == 0) { // 若元素为奇数个
                  end1 = mid1;   // 舍弃A中间点以后的部分且保留中间点
                  start2 = mid2; // 舍弃B中间点以前的部分且保留中间点
              } else {           // 若元素为偶数个
                  end1 = mid1;     // 舍弃A的后半部分
                  start2 = mid2+1; // 舍弃B的前半部分
              }
          }
      }
      return A[start1] < B[start2] ? A[start1] : B[start2];
  }
  ```
+ 上述所给算法的时间、空间复杂度分别是 $O(log_2 n)$ 和 $O(1)$。
]

=== 2012 42

#subquestions(allow-oversize: true)[
+ ① 分别求出str1和str2所指的两个链表的长度 $m$ 和 $n$。\
  ② 将两个链表以表尾对齐：令指针 $p$、$q$ 分别指向str1和str2的头结点，若 $m>=n$，则使 $p$ 指向链表中的第 $m-n+1$ 个结点；若 $m<n$，则使 $q$ 指向链表中的第 $n-m+1$ 个结点，即使指针 $p$ 和 $q$ 所指的结点到表尾的长度相等。\
  ③ 反复将指针 $p$ 和 $q$ 同步向后移动，并判断它们是否指向同一结点。若 $p$ 和 $q$ 指向同一结点，则该点即为所求的共同后缀的起始位置。
+ 算法实现：

  ```c
  typedef struct Node {
      char data;
      struct Node *next;
  } SNODE;
  SNODE *findlist(SNODE *str1, SNODE *str2) {
      int m, n;
      SNODE *p, *q;
      m = listlen(str1);          /* 求str1的长度，O(m) */
      n = listlen(str2);          /* 求str2的长度，O(n) */
      /* 以下3个循环的时间复杂度为O(max(m, n)) */
      for (p = str1; m > n; m--) /* 使p指向的链表与q指向的链表等长 */
          p = p->next;
      for (q = str2; m < n; n--) /* 使q指向的链表与p指向的链表等长 */
          q = q->next;
      while (p->next != NULL && p->next != q->next) {
          /* 查找共同后缀起始点 */
          p = p->next;            /* 两个指针同步向后移动 */
          q = q->next;
      }
      return p->next;             /* 返回共同后缀的起始点 */
  }
  int listlen(SNODE *head) {      /* 求链表长度 */
      int len = 0;
      while (head->next != NULL) {
          len++;
          head = head->next;
      }
      return len;
  }
  ```
+ 参考答案的时间复杂度为：$O(m+n)$ 或 $O(max(m,n))$。其中 $m$、$n$ 分别为两个链表的长度。
]

=== 2013 41

#subquestions(allow-oversize: true)[
+ 给出算法的基本设计思想：（4分）
  
  算法的策略是从前向后扫描数组元素，标记出一个可能成为主元素的元素
  Num。然后重新计数，确认 Num 是否是主元素。
  
  算法可分为以下两步：
  
  ①选取候选的主元素：依次扫描所给数组中的每个整数，将第一个遇到的整数
  Num保存到 c中，记录 Num的出现次数为1；若遇到的下一个整数仍等于
  Num，则计数加1，否则计数减1；当计数减到0时，将遇到的下一个整数保存到
  c中，计数重新记为1，开始新一轮计数，即从当前位置开始重复上述过程，直到扫描完全部数组元素。
  
  ②判断 c中元素是否是真正的主元素：再次扫描该数组，统计
  c中元素出现的次数，若大于 n/2，则为主元素；否则，序列中不存在主元素。
  
+ 算法实现：（7分）
  
  ```c
  int Majority( int A[ ],int n )
  {
      int i,c,count=1;                // c 用来保存候选主元素,count 用来计数
      c = A[0];                        // 设置 A[0]为候选主元素
      for ( i=1; i<n; i++ )            // 查找候选主元素
          if ( A[i] == c )
              count++;                // 对 A 中的候选主元素计数
      else
          if ( count > 0 )            // 处理不是候选主元素的情况
              count--;
      else                            // 更换候选主元素,重新计数
      { c = A[i];
          count = 1;
      }
      if ( count > 0 )
      for ( i=count=0; i<n; i++ )    // 统计候选主元素的实际出现次数
          if ( A[i] == c )
              count++;
      if ( count > n/2 ) return c;   // 确认候选主元素
      else return -1;                // 不存在主元素
  }
  ```
  

]
*【（1）、（2）的评分说明】*
①若考生设计的算法满足题目的功能要求且正确，则（1）、（2）根据所实现算法的效率给分，细则见下表：

#figure(
  align(center)[#table(
    columns: (14.63%, 14.63%, 10.98%, 10.98%, 48.78%),
    align: (auto,auto,auto,auto,auto,),
    [时间复杂度], [空间复杂度], [(1)得分], [(2)得分], [说明],
    [O(n)], [O(1)], [4], [7], [],
    [O(n)], [O(n)], [4], [6], [如采用计数排序思想,见表后Majority1程序],
    [O(nlog2n)], [其他], [3], [6], [如采用其他排序的思想],
    [≥O(n2)], [其他], [3], [5], [其他方法],
  )]
  , kind: table
  )

```c
int Majority1( int A[ ],int n )// 采用计数排序思想,时间:O(n),空间:O(n)
{
    int k, * p, max;
    p = (int * ) malloc( sizeof(int) * n);                // 申请辅助计数数组
    for ( k=0; k < n; k++ ) p[k] = 0;                      // 计数数组清0
    max = 0;
    for ( k=0; k < n; k++ )
    { p[ A[k] ] ++;                                 // 计数器+1
        if ( p[ A[k] ] > p[ max ] ) max = A[k];          // 记录出现次数最多的元素
    }
    if ( p[ max ] > n/2 ) return max;
    else return -1;
}
```

②若在算法的基本设计思想描述中因文字表达没有非常清晰反映出算法思路，但在算法实现中能够清晰看出算法思想且正确的，可参照
①的标准给分。

③若算法的基本设计思想描述或算法实现中部分正确，可参照
①中各种情况的相应给分标准酌情给分。

④参考答案中只给出了使用C语言的版本，使用C++或Java语言的答案视同使用C语言。

#subquestions(start: 3, allow-oversize: true)[
+ 说明算法复杂性：（2分）
  
  参考答案中实现的程序的时间复杂度为 O(n) ，空间复杂度为 O(1)。
  
  【评分说明】若考生所估计的时间复杂度与空间复杂度与考生所实现的算法一致，可各给1分。
  

]

=== 2015 41

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

=== 2018 41

#subquestions(allow-oversize: true)[
+ 给出算法的基本设计思想：
  
  设要查找的数组中未出现的最小正整数为 $K$。$K$ 取值范围只能是 $[1,n+1]$。采用类似计数排序的思想，分配一个数组 B[n]，用来标记 A 中是否出现了1～$n$ 之间的正整数。
  
  从左至右依次扫描数组元素 A[i] 并标记数组 B。若 A[i] 是负数、零或是大于 $n$，则忽略该值；否则，根据计数排序的思想将 B[A[i]-1] 置为1。
  
  标记完毕，遍历数组 B，查找第一个值为0的元素，其下标+1即为目标元素 $K$；找不到0时，$K=n+1$。
  
+ 算法实现：
  
  ```c
  int findMissMin(int A[], int n)
  {
      int i, *B;                       // 标记数组
      B = (int *)malloc(sizeof(int) * n); // 分配空间
      memset(B, 0, sizeof(int) * n);    // 赋初值为0
      for (i = 0; i < n; i++)
          if (A[i] > 0 && A[i] <= n)
              // 若A[i]的值介于1～n，则标记数组B
              B[A[i] - 1] = 1;
      for (i = 0; i < n; i++)
          // 扫描计数数组，找到目标值K
          if (B[i] == 0) break;
      return i + 1;                    // 返回结果
  }
  ```
  
+ 以上算法的时空复杂度都是 $O(n)$。

]

=== 2019 41

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想：
  
  算法分3步完成。第1步，采用两个指针交替前行，找到单链表的中间结点；第2步，将单链表的后半段结点原地逆置；第3步，从单链表前后两段中依次各取一个结点，按要求重排。
  
+ 算法实现：
  
  ```c
  void change_list(NODE *h)
  {
      NODE *p, *q, *r, *s;
      p = q = h;
      while (q->next != NULL)          // 寻找中间结点
      {
          p = p->next;                // p走一步
          q = q->next;
          if (q->next != NULL) q = q->next; // q走两步
      }
      q = p->next; // p所指结点为中间结点，q为后半段链表的首结点
      p->next = NULL;
      while (q != NULL)               // 将链表后半段逆置
      {
          r = q->next;
          q->next = p->next;
          p->next = q;
          q = r;
      }
      s = h->next; // s指向前半段的第一个数据结点，即插入点
      q = p->next; // q指向后半段的第一个数据结点
      p->next = NULL;
      while (q != NULL)               // 将链表后半段的结点插入到指定位置
      {
          r = q->next;                // 指向后半段的下一个结点
          q->next = s->next;          // 将q所指结点插入到s所指结点之后
          s->next = q;
          s = q->next;               // s指向前半段的下一个插入点
          q = r;
      }
  }
  ```
  
+ 算法的时间复杂度：
  
  参考答案的时间复杂度为 $O(n)$。

]

=== 2020 41

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想
  ① 使用 min 记录当前所有已处理过的三元组的最小距离，初值为 C 语言能表示的最大整数 INT_MAX； \
  ② 若集合 S1、S2 和 S3 分别保存在数组 A、B、C 中。数组下标变量 i = j = k = 0，当 $i<abs("S1")$ 且 $j<abs("S2")$ 且 $k<abs("S3")$ 时（$abs(S)$ 表示集合 $S$ 中的元素个数），循环执行(a)～(c)： \
  （a）计算(A[i]，B[j]，C[k]) 的距离 d； \
  （b）若 d < min，则 min = d； \
  （c）将 A[i]、B[j]、C[k] 中的最小值的下标+1； \
  ③ 输出 min，结束。 \
+ 算法实现
  
  ```c
  #include <limits.h> // 定义最大整数INT_MAX的头文件
  #include <math.h>   // abs()函数所在的头文件
  #define xIsMin(x,y,z) (((x) <= (y)) && ((x) < (z))) // 定义辅助计算的宏
  int findMinofTrip(int A[], int n, int B[], int m, int C[], int p)
  {
      int i = 0, j = 0, k = 0, min = INT_MAX, dist;
      // min用于记录三元组最小距离，初值赋为INT_MAX
      while (i < n && j < m && k < p && min > 0)
      {
          dist = abs(A[i]-B[j]) + abs(B[j]-C[k]) + abs(C[k]-A[i]);
          if (dist < min) min = dist;
          if (xIsMin(A[i], B[j], C[k])) i++;
          else if (xIsMin(B[j], C[k], A[i])) j++;
          else k++;
      }
      return min;
  }
  ```
  
+ 算法的时间复杂度和空间复杂度
  设 $n=(abs("S1")+abs("S2")+abs("S3"))$，参考答案的时间复杂度为 $O(n)$，空间复杂度为 $O(1)$。

]
