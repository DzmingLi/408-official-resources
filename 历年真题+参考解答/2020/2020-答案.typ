// 来源同2020.typ；参考答案：书内第50～54页（PDF第54～58页），人工录入。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2020, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title:"2020年计算机学科专业基础试题参考答案")
#let answer-counter = counter("2020-answer-question")
#let answer-question(body) = context {
  answer-counter.step()
  let label = box(width:1em, align(right,answer-counter.display("1.")))
  terms(indent:0em,hanging-indent:measure(label).width + 1em,
    separator:h(1em,weak:true),terms.item(label,body))
}

= 一、单项选择题

#answer-key(columns:5,stroke:none,align:left,
  [1．C], [2．D], [3．A], [4．C], [5．B],
  [6．B], [7．A], [8．B], [9．C], [10．B],
  [11．A], [12．B], [13．A], [14．D], [15．D],
  [16．A], [17．B], [18．A], [19．C], [20．C],
  [21．B], [22．C], [23．B], [24．A], [25．D],
  [26．D], [27．B], [28．D], [29．B], [30．D],
  [31．B], [32．C], [33．C], [34．B], [35．C],
  [36．D], [37．A], [38．D], [39．C], [40．D],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
【答案要点】

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
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 使用一棵二叉树保存字符集中各字符的编码，每个编码对应于从根开始到达某叶结点的一条路径，路径长度等于编码位数，路径到达的叶结点中保存该编码对应的字符。
+ 从左至右依次扫描0/1串中的各位。从根开始，根据串中当前位沿当前结点的左子指针或右子指针下移，直到移动到叶结点时止。输出叶结点中保存的字符。然后再从根开始重复这个过程。直到扫描到0/1串结束，译码完成。
+ 二叉树既可用于保存各字符的编码，也可用于检测编码是否具有前缀特性。判定编码是否具有前缀特性的过程，同时也是构建二叉树的过程。初始时，二叉树中仅含有根结点，其左子指针和右子指针均为空。
  
  依次读入每个编码 C，建立/寻找从根开始对应于该编码的一条路径，过程如下：
  
  对每个编码，从左至右扫描 C 的各位，根据 C 当前位（0或1）沿结点的指针（左子指针或右子指针）向下移动。当遇到空指针时，创建新结点，让为空的指针指向该新结点并继续移动。沿指针移动过程中，可能遇到三种情况： \
  ① 若遇到了叶结点（非根），则表明不具有前缀特性，返回； \
  ② 若在处理 C 的所有位的过程中，均没有创建新结点，则表明不具有前缀特性，返回； \
  ③ 若处理 C 的最后一个编码位时创建了新结点，则继续验证下一个编码。
  
  若所有编码均通过验证，则编码具有前缀特性。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 编译器可以将乘法运算转换为一个循环代码段，在循环代码段中通过比较、加法、移位等指令实现乘法运算。
+ 控制逻辑的作用为：控制循环次数，控制加法和移位操作。
+ a）最长，c）最短。
  
  对于 a），需要用循环代码段（即软件）实现乘法操作，因而需反复执行很多条指令，而每条指令都需要取指令、译码、取数、执行并保存结果，所以执行时间很长；对于 b）和 c），都只要用一条乘法指令实现乘法操作，不过，b）中的乘法指令需要多个时钟周期才能完成，而 c）中的乘法指令可以在一个时钟周期内完成，所以 c）执行时间最短。
  
+ 当 $n=32$、$x=2^31-1$、$y=2$ 时，带符号整数和无符号整数乘法指令得到的64位乘积都为0000 0000 FFFF FFFEH。函数 imul 的结果溢出，而函数 umul 结果不溢出。对于无符号整数乘法，若乘积高 $n$ 位全为0，则不溢出，否则溢出。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 主存块大小为 $64 "B"=2^6$ 字节，故主存地址低6位为块内地址，Cache 组数为 $32 "KB" \/ (64 "B" times 8)=64=2^6$，故主存地址中间6位为 Cache 组号，主存地址中高 $32-6-6=20$ 位为标记，采用8路组相联映射，故每行中 LRU 位占3位，采用直写方式，故没有修改位。
+ 因为数组 s 的起始地址最后6位全为0，故 s 位于一个主存块开始处，占 $1024 times 4 "B" \/ 64 "B"=64$ 个主存块；执行程序过程中，每个主存块中的 $64 "B" \/ 4 "B"=16$ 个数组元素依次读、写1次，因而对于每个主存块，总是第一次访问缺失，以后每次命中。综上，数组 s 的数据 Cache 访问缺失次数为64次。
+ 0001 0003H = 0000 0000 0000 0001 0000 00000 00011B，根据主存地址划分可知，组索引为0，故该地址所在主存块映射到指令 Cache 第0组；因为 Cache 初始为空，所有 Cache 行的有效位均为0，所以 Cache 访问缺失。此时，将该主存块取出后存入指令 Cache 第0组的任意一行，并将主存地址高20位（00010H）填入该行标记字段，设置有效位，修改 LRU 位，最后根据块内地址000011B从该行中取出相应内容。
  // 上述二进制数字分组按官方印刷原文保留。

]
]

#answer-question[
【答案要点】

```text
Semaphore SAC = 0; // 控制操作A和C的执行顺序
Semaphore SBC = 0; // 控制操作B和C的执行顺序
Semaphore SCE = 0; // 控制操作C和E的执行顺序
Semaphore SDE = 0; // 控制操作D和E的执行顺序
CoBegin
    Begin 操作A; signal(SAC); End
    Begin 操作B; signal(SBC); End
    Begin wait(SAC); wait(SBC); 操作C; signal(SCE); End
    Begin 操作D; signal(SDE); End
    Begin wait(SCE); wait(SDE); 操作E; End
CoEnd
```
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 数组元素 a[1][2] 的虚拟地址是1080 0000H + (1024×1 + 2)×4 = 1080 1008H。
  
  对应的页目录号为042H，页号为001H。对应的页目录项的物理地址是0020 1000H + 4×42H = 0020 1108H。对应页表项的物理地址是00301H×1000H + 4×1H = 0030 1004H。
  
+ 数组 a 在虚拟地址空间中所占区域必须连续，在物理地址空间中所占区域不必连续。
+ 对数组 a 按行遍历局部性更好。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 需要静态配置 R2 的 NAT，实现 NAT 穿透，具体配置为：
  
  #align(center,table(columns:(1fr,1fr,1fr,1fr),align:center,
    table.cell(colspan:2)[外网],table.cell(colspan:2)[内网],
    [IP 地址],[端口号],[IP 地址],[端口号],
    [203.10.2.2],[80],[192.168.1.2],[80],
  ))
  
+ H2 发送的 P 的源 IP 地址和目的 IP 地址分别是：192.168.1.2和203.10.2.2；R3 转发后，P 的源 IP 地址和目的 IP 地址分别是：203.10.2.6和203.10.2.2；R2 转发后，P 的源 IP 地址和目的 IP 地址分别是：203.10.2.6和192.168.1.2。

]
]
