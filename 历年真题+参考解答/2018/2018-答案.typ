// 来源同2018.typ；参考答案：书内第48～52页（PDF第54～58页），人工录入。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2018, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title: "2018年计算机学科专业基础综合试题参考答案")
#import "@preview/cetz:0.5.2" as cetz
#let answer-counter = counter("2018-answer-question")
#let answer-question(body) = context {
  answer-counter.step()
  let label = box(width: 1em, align(right, answer-counter.display("1.")))
  terms(indent: 0em, hanging-indent: measure(label).width + 1em,
    separator: h(1em, weak: true), terms.item(label, body))
}

= 一、单项选择题

#answer-key(
  columns: 5, stroke: none, align: left,
  [1．B], [2．C], [3．A], [4．A], [5．A],
  [6．C], [7．D], [8．B], [9．C], [10．D],
  [11．A], [12．D], [13．C], [14．A], [15．A],
  [16．B], [17．C], [18．B], [19．A], [20．D],
  [21．B], [22．C], [23．C], [24．D], [25．B],
  [26．A], [27．C], [28．D], [29．D], [30．A],
  [31．D], [32．C], [33．B], [34．C], [35．D],
  [36．D], [37．D], [38．C], [39．B], [40．D],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
【答案要点】

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
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 最经济的光缆铺设方案可以抽象为求最小生成树的问题。根据题图可以求得两种最经济的光缆建设方案，如下所示。
  
  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em)
    for (scheme, dx) in ((1, 0), (2, 18)) {
      let positions = ((dx, 8), (dx + 5, 8), (dx + 10, 8), (dx, 4), (dx + 10, 4), (dx, 0), (dx + 5, 0), (dx + 10, 0))
      let common = ((0, 1, 2, (dx + 2.5, 8.6)), (0, 3, 2, (dx - 0.7, 6)),
        (2, 4, 2, (dx + 10.7, 6)), (4, 6, 2, (dx + 7.3, 2.35)),
        (5, 6, 3, (dx + 2.5, -0.65)), (6, 7, 2, (dx + 7.5, -0.65)))
      let extra = if scheme == 1 { ((3, 6, 3, (dx + 2.7, 2.35)),) } else { ((1, 2, 3, (dx + 7.5, 8.6)),) }
      for (a, b, w, p) in common + extra {
        line(positions.at(a), positions.at(b))
        content(p, text(size:0.8em,str(w)))
      }
      for (i, body) in ([XA], [BJ], [TL], [WH], [JN], [CS], [QD], [NJ]).enumerate() {
        circle(positions.at(i), radius: (1.3, 0.6), fill: white)
        content(positions.at(i), text(size:0.8em,body))
      }
      content((dx + 5, -2), [方案#scheme])
    }
  }))
  
  方案的总费用为16。
  
+ 可采用邻接矩阵保存题42图。可使用 Prim 算法求解。
+ 使用方案1：H2 不能收到该 IP 分组；使用方案2：H2 可以收到该 IP 分组。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 设备 A 准备32位数据所用时间为 $4 "B" \/ 2 "MB" = 2$ μs，所以，最多每隔2 μs 必须查询一次，才能不丢失数据。
  
  设备 A 每秒至少查询 $10^6/2=5 times 10^5$ 次，因此每秒钟内 CPU 用于设备 A 输入/输出的时间至少为 $5 times 10^5 times 10 times 4 = 2 times 10^7$ 个时钟周期，占整个 CPU 时间的百分比至少为 $2 times 10^7 \/ 500 "M" = 4%$。
  
+ 设备 B 不适合采用中断 I/O 方式。因为设备 B 准备32位数据所用时间为 $4 "B" \/ 40 "MB" = 0.1$ μs，而中断响应和中断处理时间为 $400 times (1 \/ 500 "M") = 0.8$ μs，大于0.1 μs，因而会造成数据丢失。
  
+ 设备 B 每秒钟内 DMA 次数最多为 $40 "MB" \/ 1000 "B" = 40 000$，CPU 用于设备 B 输入/输出的时间最多为 $40 000 times 500 = 2 times 10^7$ 个时钟周期，占 CPU 总时间的百分比最多为 $2 times 10^7 \/ 500 "M" = 4%$。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 物理地址位数是 $20+3+5=28$（或 $16+12=28$）。
+ TLB 中每项都有一个比较器，故 TLB 采用全相联映射方式。TLB 采用 SRAM 实现。
  
+ Cache 中每组有两行，故采用2路组相联映射方式。
  
  因为是2路组相联并采用 LRU 替换算法，所以每行（或每组）需要1位 LRU 位；因为采用回写策略，所以每行有1位修改位（脏位）。
  
  28位物理地址中 Tag 字段占20位，组索引字段占3位，块内偏移地址占5位，故 Cache 共有 $2^3=8$ 组，每组2行，每行有 $2^5=32$ B；Cache 总容量为 $8 times 2 times (20+1+1+1+32 times 8)=4464$ 位=558字节。
  
  （或者 $8 times 2 times (20+1+1+32 times 8)+8=4456$ 位=557字节）
  
  有效位用来指出所在 Cache 行中的信息是否有效。
  
+ 虚拟地址0008 C040H对应的物理地址是004 0040H。
  
  访问 Cache 不命中。
  
  理由为：主存物理地址为004 0040H，其中高20位00400H为标志字段，低5位00000B为块内偏移量，中间3位010B为组号2，因此将00400H与 Cache 中第2组两行中的标志字段同时比较，可以看出，虽然有一个 Cache 行中的标志字段与00400H相等，但对应的有效位为0，而另一 Cache 行的标志字段与00400H不相等，故访问 Cache 不命中。
  
  因为物理地址的低12位与虚拟地址低12位相同，即为0010 0110 0000B，其中011B是组号（组索引），因此，该地址所在的主存块映射到的 Cache 组号为3。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 该虚拟地址为0180 6008H。
  
+ 该地址是物理地址。进程切换时，PDBR 的内容会变化；同一进程的线程切换时，PDBR 的内容不会变化。每个进程的地址空间、页目录和 PDBR 的内容存在一一对应的关系。进程切换时，地址空间发生了变化，对应的页目录及其起始地址也相应变化，因此需要用进程切换后当前进程的页目录起始地址刷新 PDBR。同一进程中的线程共享该进程的地址空间，其线程发生切换时，地址空间不变，线程使用的页目录不变，因此 PDBR 的内容也不变。
  
+ 需要设置访问字段（引用位/使用位）和修改字段（脏位）。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 该文件系统能支持的最大文件长度为
  
  $ 8 times 4 "KB" + ((4 "KB") / (4 "B")) times 4 "KB" + ((4 "KB") / (4 "B"))^2 times 4 "KB" + ((4 "KB") / (4 "B"))^3 times 4 "KB" \
    = 32 "KB" + 4 "MB" + 4 "GB" + 4 "TB" $
  
+ 文件索引节点总个数为：$1 "M" times 4 "KB" \/ 64 "B" = 64 "M"$。5600 B 的文件占2个簇，512M个簇（$<2^32$ 个簇）可存放的文件总个数为：$512 "M" / 2 = 256 "M"$。可表示的文件总个数受限于文件索引节点总个数。因此，该文件系统能存储64M个大小为5600 B 的图像文件。
  
+ 需要的时间不相同。获取文件 F1 的最后一个簇的簇号只需要访问索引节点的直接地址项，而获取文件 F2 的最后一个簇的簇号还需要读一级索引表。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 销售部子网的广播地址是192.168.1.127，技术部子网的子网地址是192.168.1.128；技术部子网还可以连接主机数：$126-((208-129)+1+1)=45$ 台。
  
+ 最大 IP 分片封装数据的字节数：$floor((800-20)/8) times 8=776$，至少需要的分片数：$ceil((1500-20)/776)=2$，2个分片的片偏移量分别是：0和97。

]
]
