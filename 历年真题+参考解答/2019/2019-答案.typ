// 来源同2019.typ；参考答案：书内第65～69页（PDF第71～75页），人工录入。
#import "../../template.typ": exam, subquestions, answer-key
#show: exam.with(year: 2019, subject: "计算机学科专业基础", code: "408", solutions: true)
#set document(title: "2019年计算机学科专业基础综合试题参考答案")
#import "@preview/cetz:0.5.2" as cetz
#let answer-counter = counter("2019-answer-question")
#let answer-question(body) = context {
  answer-counter.step()
  let label = box(width: 1em, align(right, answer-counter.display("1.")))
  terms(indent: 0em, hanging-indent: measure(label).width + 1em,
    separator: h(1em, weak: true), terms.item(label, body))
}

= 一、单项选择题

#answer-key(
  columns: 5, stroke: none, align: left,
  [1．B], [2．B], [3．C], [4．A], [5．C],
  [6．A], [7．D], [8．C], [9．B], [10．D],
  [11．B], [12．C], [13．A], [14．D], [15．D],
  [16．D], [17．B], [18．C], [19．B], [20．C],
  [21．A], [22．D], [23．B], [24．C], [25．C],
  [26．B], [27．C], [28．B], [29．C], [30．B],
  [31．A], [32．C], [33．C], [34．A], [35．B],
  [36．B], [37．B], [38．C], [39．D], [40．B],
)

= 二、综合应用题

#answer-counter.update(41)

#answer-question[
【答案要点】

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
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 采用链式存储结构（两段式单向循环链表），队头指针为 front，队尾指针为 rear。
+ 初始时，创建只有一个空闲结点的两段式单向循环链表，头指针 front 与尾指针 rear 均指向空闲结点。如下图所示。
  
  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em)
    merge-path({
      line((-1.3, 0.7), (1.3, 0.7))
      bezier((1.3, 0.7), (1.3, -0.7), (2.6, 0.7), (2.6, -0.7))
      line((1.3, -0.7), (-1.3, -0.7))
      bezier((-1.3, -0.7), (-1.3, 0.7), (-2.6, -0.7), (-2.6, 0.7))
    }, close: true)
    line((0, -0.7), (0, 0.7))
    circle((1.25, 0), radius: 0.13, fill: black)
    bezier((1.25, 0), (-2.25, 0), (7, -1.7), (-9, -1.7),
      mark: (end: ">", fill: black, scale: 0.75))
    for (x, label, side) in ((-0.7, [front], "east"), (0.5, [rear], "west")) {
      rect((x - 0.35, 2.05), (x + 0.35, 2.65))
      circle((x, 2.35), radius: 0.1, fill: black)
      line((x, 2.35), (0, 0.7), mark: (end: ">", fill: black, scale: 0.75))
      content((x + if side == "east" { -0.5 } else { 0.5 }, 2.35), label, anchor: side)
    }
  }))
  
  队空的判定条件：`front == rear`。 \
  队满的判定条件：`front == rear->next`。 \
+ 插入第一个元素后的队列状态：
  
  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em)
    for x in (0, 7) {
      merge-path({
        line((x - 1.3, 0.7), (x + 1.3, 0.7))
        bezier((x + 1.3, 0.7), (x + 1.3, -0.7), (x + 2.6, 0.7), (x + 2.6, -0.7))
        line((x + 1.3, -0.7), (x - 1.3, -0.7))
        bezier((x - 1.3, -0.7), (x - 1.3, 0.7), (x - 2.6, -0.7), (x - 2.6, 0.7))
      }, close: true)
      line((x, -0.7), (x, 0.7))
      circle((x + 1.25, 0), radius: 0.13, fill: black)
    }
    content((-0.9, 0), [1])
    line((1.25, 0), (4.75, 0), mark: (end: ">", fill: black, scale: 0.75))
    bezier((8.25, 0), (-2.25, 0), (19, -1.7), (-15, -1.7),
      mark: (end: ">", fill: black, scale: 0.75))
    for (x, label, side) in ((-0.7, [front], "east"), (7.7, [rear], "west")) {
      rect((x - 0.35, 2.05), (x + 0.35, 2.65))
      circle((x, 2.35), radius: 0.1, fill: black)
      line((x, 2.35), (if x < 0 { 0 } else { 7 }, 0.7),
        mark: (end: ">", fill: black, scale: 0.75))
      content((x + if side == "east" { -0.5 } else { 0.5 }, 2.35), label, anchor: side)
    }
  }))
  
+ 操作的基本过程：
  
  #table(
    columns: (1fr,), stroke: 0.065em,
    table.cell(fill: luma(85%))[入队操作：],
    [若（`front == rear->next`）#h(2em)`// 队满` \
    #h(2em)则在 rear 后面插入一个新的空闲结点； \
    入队元素保存到 rear 所指结点中；`rear = rear->next;` 返回。],
    [出队操作：],
    [若（`front == rear`）#h(2em)`// 队空` \
    #h(2em)则出队失败，返回； \
    取 front 所指结点中的元素 e；`front = front->next;` 返回 e。],
  )

]
]

#answer-question[
【答案要点】

```c
// 信号量
semaphore bowl;          // 用于协调哲学家对碗的使用
semaphore chopsticks[n]; // 用于协调哲学家对筷子的使用
for (int i = 0; i < n; i++)
    chopsticks[i].value = 1; // 设置两个哲学家之间筷子的数量
bowl.value = min(n-1, m); // bowl.value≤n-1，确保不死锁
CoBegin
while (True) {           // 哲学家i的程序
    思考;
    P(bowl);             // 取碗
    P(chopsticks[i]);    // 取左边筷子
    P(chopsticks[(i+1) MOD n]); // 取右边筷子
    就餐;
    V(chopsticks[i]);
    V(chopsticks[(i+1) MOD n]);
    V(bowl);
}
CoEnd
```
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 磁盘容量 $=(300 times 10 times 200 times 512 \/ 1024)$ KB $=3 times 10^5$ KB。
+ 依次访问的簇是100 260、101 660、110 560、60 005。
+ 第100 530簇在磁盘上的物理地址由其所在的柱面号、磁头号、扇区号构成。
  
  其所在的柱面号为 $floor(100530 \/ (10 times 200 \/ 2))=100$。 \
  $100530 \% (10 times 200 \/ 2)=530$，磁头号为 $floor(530 \/ (200 \/ 2))=5$。 \
  扇区号为 $(530 times 2) \% 200=60$。 \
  将簇号转换成磁盘物理地址的过程由磁盘驱动程序完成。

]
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 计算 $f(10)$ 需要调用函数 f1 共10次。执行第16行 call 指令会递归调用 f1。
+ 第12行 jle 指令是条件转移指令。第16行 call 指令、第20行 jmp 指令、第30行 ret 指令一定会使程序跳转执行。
+ 第16行 call 指令的下一条指令的地址为0040 1025H + 5 = 0040 102AH，故第17行指令的虚拟地址是0040 102AH。call 指令采用相对寻址方式，即目标地址 =（PC）+ 偏移量，call 指令的目标地址为0040 1000H，所以偏移量 = 目标地址 −（PC）= 0040 1000H − 0040 102AH = FFFF FFD6H。根据第16行 call 指令的偏移量字段为 D6 FF FF FF，可确定 M 采用小端方式。
+ 因为 $f(13)$ = 6 227 020 800，大于32位 int 型数据可表示的最大值，因而 f1(13) 的返回值是一个发生了溢出的结果。
  
  为使 f1(13) 能返回正确结果，可将函数 f1 的返回值类型改为 double（或 long long 或 long double 或 float）。 \
+ 若乘积的高33位为非全0或非全1，则 OF = 1。
  
  编译器应该在 imul 指令后加一条“溢出自陷指令”，使得 CPU 自动查询溢出标志 OF，当 OF = 1 时调出“溢出异常处理程序”。

]
]

#answer-question[
【答案要点】

第1行指令和第30行指令的代码在同一页。

因为页大小为4 KB，所以虚拟地址的高20位为虚拟页号。第1行指令和第30行指令的虚拟地址高20位都是00401H，因此两条指令在同一页中。

Cache 组数为64/4 = 16，因此，主存地址划分中，低6位为块内地址、中间4位为组号（组索引）、高22位为标记。

读取第16行 call 指令时，只可能在指令 Cache 第0组中命中。

因为页大小为4 KB，所以虚拟地址和物理地址的最低12位完全相同，因而 call 指令虚拟地址0040 1025H 中的025H = 0000 0010 0101B = 00 0000 100101B 为物理地址的低12位，故对应 Cache 组号为0。
]

#answer-question[
【答案要点】

#subquestions(allow-oversize: true)[
+ 设备1：路由器，设备2：以太网交换机，设备3：以太网交换机。
+ 设备1的接口需要配置 IP 地址；设备1的 IF1、IF2 和 IF3 接口的 IP 地址分别是：192.168.1.254、192.168.1.1和192.168.1.65。
+ R 需要提供 NAT 服务。
+ 主机 H4 会接收该数据报。

]
]
