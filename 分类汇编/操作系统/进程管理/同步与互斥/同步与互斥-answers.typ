// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：同步与互斥

== 同步与互斥的基本概念

=== 2011 32：C

=== 2016 30：C

=== 2018 25：B

=== 2020 32：C

== 基本的实现方法

=== 2010 27：D

=== 2016 27：B

== 信号量

=== 2010 25：B

=== 2013 45

【评分说明】合理给出部件名称或功能说明均给分。

定义两个信号量：

```text
Semaphore empty = 500; // 博物馆可以容纳的最多人数（2分）
Semaphore mutex = 1;   // 用于出入口资源的控制（2分）
cobegin
参观者进程 i：
{
    ...
    P(empty);
    P(mutex);
    进门;
    V(mutex);
    参观;
    P(mutex);
    出门;
    V(mutex);
    V(empty);
    ...
}
coend
```

（3分）

*【评分说明】*
①信号量初值给1分，说明含义给1分，两个信号量的初值和含义共4分。

②对 mutex的P、V操作正确给2分。

③ ③ 对 empty的P、V操作正确给1分。

④其他答案，参照 ① $tilde.op$
③的标准给分。

=== 2017 46

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

=== 2018 32：C

=== 2020 45

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

=== 2021 45

#subquestions(allow-oversize: true)[
+ 因为信号量 S 是能够被多个进程共享的变量，多个进程都可以通过 wait() 和 signal() 对 S 进行读、写操作。所以，在 wait() 和 signal() 操作中对 S 的访问必须是互斥的。
+ 方法1是错误的。在 wait() 中，当 S ≤ 0 时，关中断后，其他进程无法修改 S 的值，while 语句陷入死循环。方法2是正确的。
+ 用户程序不能使用开/关中断指令实现临界区互斥。因为开中断和关中断指令都是特权指令。

]

=== 2022 46

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

== 条件变量

=== 2016 32：A

=== 2018 28：D

== 经典同步问题

=== 2009 45

#subquestions(allow-oversize: true)[
+ 缓冲区是一互斥资源，因此设互斥信号量 mutex。
+ 同步问题：P1、P2因为奇数的放置与取用而同步，设同步信号量 odd；P1、P3因为偶数的放置与取用而同步，设同步信号量 even；P1、P2、P3因为共享缓冲区，设同步信号量 empty。

  ```text
  semaphore mutex = 1;
  semaphore odd = 0, even = 0;
  semaphore empty = N;
  main()
  cobegin {
      Process P1
      while (True) {
          number = produce();
          P(empty);
          P(mutex);
          put();
          V(mutex);
          if (number % 2 == 0)
              V(even);
          else
              V(odd);
      }
      Process P2
      while (True) {
          P(odd);
          P(mutex);
          getodd();
          V(mutex);
          V(empty);
          countodd();
      }
      Process P3
      while (true) {
          P(even);
          P(mutex);
          geteven();
          V(mutex);
          V(empty);
          counteven();
      }
  } coend
  ```
]

=== 2011 45

#subquestions(allow-oversize: true)[
+ 互斥资源：取号机（一次只允许一位顾客领号），因此设一个互斥信号量 mutex；
+ 同步问题：顾客需要获得空座位等待叫号，当营业员空闲时，将选取一位顾客并为其服务。空座位的有、无影响等待顾客数量，顾客的有、无决定了营业员是否能开始服务，故分别设置信号量 empty 和 full 来实现这一同步关系。另外，顾客获得空座位后，需要等待叫号和被服务。这样，顾客与营业员就服务何时开始又构成了一个同步关系，定义信号量 service 来完成这一同步过程。

  ```text
  semaphore mutex = 1;   // 互斥使用取号机
  semaphore empty = 10;  // 空座位的数量
  semaphore full = 0;    // 已占座位的数量
  semaphore service = 0; // 等待叫号
  cobegin {
      process 顾客 i {
          P(empty);
          P(mutex);
          从取号机获得一个号;
          V(mutex);
          V(full);
          P(service);   // 等待叫号
          获得服务;
      }
      process 营业员 {
          while (TRUE) {
              P(full);
              V(empty);
              V(service); // 叫号
              为顾客服务;
          }
      }
  } coend
  ```
]

=== 2014 47

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

=== 2015 45

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

=== 2019 43

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

=== 旧版题型示例

编注：以下为本仓库整理解析，非官方参考答案。

理发师同步

设 waiting 为接待室内等待的顾客数，初值0。mutex（初值1）保护 waiting；customers（初值0）记录待服务顾客；ready（初值0）通知一位顾客进入工作室。seated、done 和 left（初值均为0）依次通知顾客入座、理发完成和顾客离开。

```text
semaphore mutex = 1, customers = 0, ready = 0;
semaphore seated = 0, done = 0, left = 0;
int waiting = 0;
barber() {
    while (true) {
        P(customers); // 无顾客时阻塞，即睡觉
        P(mutex);
        waiting--;
        V(ready);     // 让一位顾客进入工作室
        V(mutex);
        P(seated);    // 顾客坐好后才能开始理发
        cut_hair();
        V(done);
        P(left);      // 等该顾客离开工作椅
    }
}
customer() {
    P(mutex);
    if (waiting == n) {
        V(mutex);
        leave_shop();
        return;
    }
    waiting++;
    V(customers);
    V(mutex);
    P(ready);
    sit_for_haircut();
    V(seated);
    P(done);
    leave_work_chair();
    V(left);
}
```

理发师阻塞在 customers 时不占有 mutex；顾客也先释放 mutex 再等待 ready，因此不会因持锁等待而互相阻塞。题目不要求先来先服务；若要求公平，等待顾客还须采用 FIFO 队列。
