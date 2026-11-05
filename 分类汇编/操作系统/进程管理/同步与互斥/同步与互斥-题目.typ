// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：同步与互斥

== 同步与互斥的基本概念

#block(breakable: false)[#question(label: n => [2011 32])[
有两个并发执行的进程 P1 和 P2，共享初值为1的变量 $x$。P1 对 $x$ 加1，P2 对 $x$ 减1。加1和减1操作的指令序列分别如下所示。

```text
P1 // 加1操作                    P2 // 减1操作
load R1, x // 取x到寄存器R1中    load R2, x
inc R1                           dec R2
store x, R1 // 将R1的内容存入x   store x, R2
```

两个操作完成后，x的值

#choices(
  [可能为-1或3],
  [只能为1],
  [可能为0、1或2],
  [可能为-1、0、1或2],
)
]]

#block(breakable: false)[#question(label: n => [2016 30])[
进程P1和P2均包含并发执行的线程，部分伪代码描述如下所示。

#align(center,table(columns:2,inset:0.45em,align:left,
 [```text
//进程 P1
int x=0;
Thread1()
{   int a;
    a=1; x+=1;
}
Thread2()
{   int a;
    a=2; x+=2;
}
```],
 [```text
//进程 P2
int x=0;
Thread3()
{   int a;
    a=x; x+=3;
}
Thread4()
{   int b;
    b=x; x+=4;
}
```],
))

下列选项中，需要互斥执行的操作是
#choices([`a=1`与`a=2`], [`a=x`与`b=x`], [`x+=1`与`x+=2`], [`x+=1`与`x+=3`])
]]

#block(breakable: false)[#question(label: n => [2018 25])[
属于同一进程的两个线程 thread1 和 thread2 并发执行，共享初值为0的全局变量 $x$。thread1 和 thread2 实现对全局变量 $x$ 加1的机器级代码描述如下。

#table(
  columns: (1fr, 1fr), align: left + top,
  table.cell(align: center)[thread1], table.cell(align: center)[thread2],
  [```asm
mov R1, x    // (x)→R1
inc R1       // (R1)+1→R1
mov x, R1    // (R1)→x
```],
  [```asm
mov R2, x    // (x)→R2
inc R2       // (R2)+1→R2
mov x, R2    // (R2)→x
```],
)

在所有可能的指令执行序列中，使 $x$ 的值为2的序列个数是

#choices([1], [2], [3], [4])
]]

#block(breakable: false)[#question(label: n => [2020 32])[
下列准则中，实现临界区互斥机制必须遵循的是

Ⅰ．两个进程不能同时进入临界区 \
Ⅱ．允许进程访问空闲的临界资源 \
Ⅲ．进程等待进入临界区的时间是有限的 \
Ⅳ．不能进入临界区的执行态进程立即放弃 CPU

#choices([仅Ⅰ、Ⅳ], [仅Ⅱ、Ⅲ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2026 27])[
若进程 P 读、写数据的集合分别记为 $R("P")$ 和 $W("P")$，进程 Q 读、写数据的集合分别记为 $R("Q")$ 和 $W("Q")$，则进程 P 和 Q 并发执行时#emphasis[不会]发生并发错误的充要条件是
#statements(columns: 2, [Ⅰ．$W("P") ∩ W("Q")=emptyset$], [Ⅱ．$R("P") ∩ W("Q")=emptyset$], [Ⅲ．$W("P") ∩ R("Q")=emptyset$], [Ⅳ．$R("P") ∩ R("Q")=emptyset$])
#choices([Ⅰ、Ⅳ同时成立], [Ⅱ、Ⅲ同时成立], [Ⅰ、Ⅱ、Ⅲ同时成立], [Ⅰ、Ⅱ、Ⅲ、Ⅳ同时成立])
]]

== 基本的实现方法

#block(breakable: false)[#question(label: n => [2010 27])[
进程 P0 和 P1的共享变量定义及其初值为：

#raw("boolean flag[2];") \
#raw("int turn = 0;") \
#raw("flag[0] = FALSE; flag[1] = FALSE;")

若进程P0和P1访问临界资源的类C伪代码实现如下：

#figure(block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.65em,
    box(width: 100%, stroke: 0.5pt, inset: (x: 0.55em, y: 0.35em))[
      #raw("void P0()   // 进程 P0") \
      #raw("{") \
      #h(1.4em)#raw("while (TRUE) {") \
      #h(2.8em)#raw("flag[0] = TRUE; turn = 1;") \
      #h(2.8em)#raw("while (flag[1] && (turn == 1));") \
      #h(2.8em)临界区； \
      #h(2.8em)#raw("flag[0] = FALSE;") \
      #h(1.4em)#raw("}") \
      #raw("}")
    ],
    box(width: 100%, stroke: 0.5pt, inset: (x: 0.55em, y: 0.35em))[
      #raw("void P1()   // 进程 P1") \
      #raw("{") \
      #h(1.4em)#raw("while (TRUE) {") \
      #h(2.8em)#raw("flag[1] = TRUE; turn = 0;") \
      #h(2.8em)#raw("while (flag[0] && (turn == 0));") \
      #h(2.8em)临界区； \
      #h(2.8em)#raw("flag[1] = FALSE;") \
      #h(1.4em)#raw("}") \
      #raw("}")
    ],
  )
], kind: image)

则并发执行进程P0和P1时产生的情形是

#choices(
  [不能保证进程互斥进入临界区，会出现“饥饿”现象],
  [不能保证进程互斥进入临界区，不会出现“饥饿”现象],
  [能保证进程互斥进入临界区，会出现“饥饿”现象],
  [能保证进程互斥进入临界区，不会出现“饥饿”现象],
)
]]

#block(breakable: false)[#question(label: n => [2016 27])[
使用TSL（Test and Set Lock）指令实现进程互斥的伪代码如下所示。
```text
do {
    ……
    while(TSL(&lock));
    critical section;
    lock=FALSE;
    ……
} while(TRUE);
```
下列与该实现机制相关的叙述中，正确的是
#choices([退出临界区的进程负责唤醒阻塞态进程], [等待进入临界区的进程不会主动放弃CPU], [上述伪代码满足“让权等待”的同步准则], [`while(TSL(&lock))`语句应在关中断状态下执行])
]]

#question(label: n => [2023 45])[
（7分）现要求学生使用 swap 指令和布尔型变量 lock 实现临界区互斥。lock 为线程间共享的变量，lock 的值为 TRUE 时线程不能进入临界区，为 FALSE 时线程能够进入临界区。某同学编写的实现临界区互斥的伪代码如题45（a）图所示。
#figure([
#set text(size: .85em)
#grid(columns: (1.6fr, 1fr), gutter: .7em,
 [#table(columns: 1, rows: (auto, 20em), align: left + top,
 [#align(center)[某同学编写的伪代码]],
 [
 `bool lock = FALSE; // 共享变量`\
 ……
 #grid(columns: (1fr, auto), gutter: .8em,
 block(stroke: (dash: "dashed", thickness: .5pt), inset: .3em)[
 ```
 bool key = TRUE;
 if(key == TRUE)
     swap key, lock; // 交换key和lock的值
 ```
 ], [进入区])
 临界区；
 #grid(columns: (1fr, auto), gutter: .8em,
 block(width: 100%, stroke: (dash: "dashed", thickness: .5pt), inset: .3em)[`lock = TRUE;`], [退出区])
 ……
 ])
 #align(center)[（a）]],
 [#table(columns: 1, rows: (auto, 20em), align: left + top,
 [#align(center)[newSwap()的代码]],
 [```c
 void newSwap(bool *a, bool *b)
 {
     bool temp = *a;
     *a = *b;
     *b = temp;
 }
 ```])
 #align(center)[（b）]])
], caption: [题45图])
请回答下列问题。
#subquestions[
 + 题45（a）图的伪代码中哪些语句存在错误？将其改为正确的语句（不增加语句的条数）。
 + 题45（b）图给出了交换两个变量值的函数 newSwap()的代码，是否可以用函数调用语句“`newSwap(&key, &lock)`”代替指令“`swap key, lock`”以实现临界区互斥？为什么？
]
]

== 信号量

#block(breakable: false)[#question(label: n => [2010 25])[
设与某资源关联的信号量初值为3，当前值为1。若
$M$表示该资源的可用个数，$N$表示等待该资源的进程数，则 $M$、$N$分别是

#choices(
  [0、1],
  [1、0],
  [1、2],
  [2、0],
)
]]

#question(label: n => [2013 45])[
（7分）某博物馆最多可容纳500人同时参观，有一个出入口，该出入口一次仅允许一个人通过。参观者的活动描述如下：

```text
cobegin
参观者进程 i：
    ...
    进门；
    ...
    参观；
    ...
    出门；
    ...
coend
```

请添加必要的信号量和P、V（或wait（）、signal（））操作，以实现上述过程中的互斥与同步。要求写出完整的过程，说明信号量的含义并赋初值。

]

#question(label: n => [2017 46])[
（8分）某进程中有3个并发执行的线程 thread1、thread2 和 thread3，其伪代码如下所示。
#table(columns: (1.55fr, 1fr, 1fr),
 [```c
//复数的结构类型定义
typedef struct
{
    float a;
    float b;
} cnum;
cnum x, y, z; // 全局变量

//计算两个复数之和
cnum add(cnum p, cnum q)
{
    cnum s;
    s.a=p.a+q.a;
    s.b=p.b+q.b;
    return s;
}
```],
 [```
thread1
{
    cnum w;
    w=add(x,y);
    ……
}

thread2
{
    cnum w;
    w=add(y,z);
    ……
}
```],
 [```
thread3
{
    cnum w;
    w.a=1;
    w.b=1;
    z=add(z,w);
    y=add(y,w);
    ……
}
```])
请添加必要的信号量和 P、V（或 wait()、signal()）操作，要求确保线程互斥访问临界资源，并且最大程度地并发执行。
]

#block(breakable: false)[#question(label: n => [2018 32])[
在下列同步机制中，可以实现让权等待的是

#choices([Peterson 方法], [swap 指令], [信号量方法], [TestAndSet 指令])
]]

#question(label: n => [2020 45])[
（7分）现有5个操作 A、B、C、D 和 E，操作 C 必须在 A 和 B 完成后执行，操作 E 必须在 C 和 D 完成后执行。请使用信号量的 wait()、signal() 操作（P、V 操作）描述上述操作之间的同步关系，并说明所用信号量及其初值。
]

#question(label: n => [2021 45])[
（7分）下表给出了整型信号量 S 的 wait() 和 signal() 操作的功能描述，以及采用开/关中断指令实现信号量操作互斥的两种方法。

#table(columns:(1fr,1fr,1fr),align:top,
  align(center)[功能描述],align(center)[方法1],align(center)[方法2],
  [
```text
Semaphore S;
wait(S) {
    while(S <= 0);
    S = S-1;
}
```
  ],[
```text
Semaphore S;
wait(S) {
    关中断;
    while(S <= 0);
    S = S-1;
    开中断;
}
```
  ],[
```text
Semaphore S;
wait(S) {
    关中断;
    while(S <= 0) {
        开中断;
        关中断;
    }
    S = S-1;
    开中断;
}
```
  ],
  table.hline(stroke:none),
  [
```text
signal(S) {
    S = S+1;
}
```
  ],[
```text
signal(S) {
    关中断;
    S = S+1;
    开中断;
}
```
  ],[
```text
signal(S) {
    关中断;
    S = S+1;
    开中断;
}
```
  ],
)

请回答下列问题。

#subquestions[
+ 为什么在 wait() 和 signal() 操作中对信号量 S 的访问必须互斥执行？
+ 分别说明方法1和方法2是否正确。若不正确，请说明理由。
+ 用户程序能否使用开/关中断指令实现临界区互斥？为什么？

]
]

#question(label: n => [2022 46])[
（8分）某进程的两个线程 T1 和 T2 并发执行 A、B、C、D、E 和 F 共6个操作，其中 T1 执行 A、E 和 F，T2 执行 B、C 和 D。题46图表示上述6个操作的执行顺序所必须满足的约束：C 在 A 和 B 完成后执行，D 和 E 在 C 完成后执行，F 在 E 完成后执行。请使用信号量的 wait()、signal() 操作描述 T1 和 T2 之间的同步关系，并说明所用信号量的作用及其初值。

#figure(align(center, diagram(
  spacing: 1em, node-stroke: 0.045em, edge-stroke: 0.045em,
  node((0,0),text(size:0.85em)[A],name:<a>,radius:0.7em),
  node((0,3),text(size:0.85em)[B],name:<b>,radius:0.7em),
  node((3,1.5),text(size:0.85em)[C],name:<c>,radius:0.7em),
  node((6,0),text(size:0.85em)[D],name:<d>,radius:0.7em),
  node((6,3),text(size:0.85em)[E],name:<e>,radius:0.7em),
  node((9,1.5),text(size:0.85em)[F],name:<f>,radius:0.7em),
  edge(<a>,<c>,"->"),edge(<b>,<c>,"->"),edge(<c>,<d>,"->"),edge(<c>,<e>,"->"),edge(<e>,<f>,"->"),
)), caption: [题46图], numbering: none)
]

#question(label: n => [2024 46])[
（本题8分）计算机系统中的进程之间往往需要相互协作以完成一个任务。在某网络系统中，缓冲区 B 用于存放一个数据分组，对 B 的操作有 C1、C2 和 C3。C1 将一个数据分组写入 B 中，C2 从 B 中读出一个数据分组，C3 对 B 中的数据分组进行修改。要求 B 为空时才能执行 C1，B 非空时才能执行 C2 和 C3。

请回答下列问题。

#subquestions[
+ 假设进程 P1 和 P2 均需要执行 C1，实现 C1 的代码是否为临界区？为什么？（2分）
+ 假设 B 初始为空，进程 P1 执行 C1 一次，进程 P2 执行 C2 一次。请定义尽可能少的信号量，并用 wait()、signal() 操作描述进程 P1 和 P2 之间的同步或互斥关系，说明所用信号量的作用及其初值。（3分）
+ 假设 B 初始不为空，进程 P1 和 P2 各执行 C3 一次。请定义尽可能少的信号量，并用 wait()、signal() 操作描述进程 P1 和 P2 之间的同步或互斥关系，说明所用信号量的作用及其初值。（3分）
]
]

#question(label: n => [2025 45])[
（本题7分）甲、乙、丙三人一起植树，甲负责挖树坑，乙负责将树苗放入树坑中并填土，丙负责为新种的树苗浇水。植树的步骤依次为：挖树坑、放树苗、填土和浇水。现有铁锹和水桶各1个，铁锹用于挖树坑和填土，水桶用于浇水。当树坑的数量小于3时，甲才可以挖树坑。假设初始时树坑的数量为0，铁锹和水桶均可用。请定义尽可能少的信号量，用 wait()、signal() 操作描述植树过程中三人之间的同步或互斥关系，并说明所用信号量的作用及其初值。
]

#block(breakable: false)[#question(label: n => [2026 26])[
某系统中有8个进程均会执行如下图所示的代码片段，其中信号量 S 的初值为5。若某时刻 S 的值为−2，已执行到代码 Q 中的进程有 $m$ 个，因执行 wait(S)而被阻塞的进程有 $n$ 个，则 $m$ 和 $n$ 的值分别是
#align(center, block(stroke: .5pt, inset: .45em)[
```
wait(S);
代码Q;
signal(S);
```
])
#choices([5、2], [5、3], [6、2], [7、1])
]]

== 条件变量

#block(breakable: false)[#question(label: n => [2016 32])[
下列关于管程的叙述中，#emphasis[错误]的是
#choices([管程只能用于实现进程的互斥], [管程是由编程语言支持的进程同步机制], [任何时候只能有一个进程在管程中执行], [管程中定义的变量只能被管程内的过程访问])
]]

#block(breakable: false)[#question(label: n => [2018 28])[
若 $x$ 是管程内的条件变量，则当进程执行 x.wait() 时所做的工作是

#choices(
  [实现对变量 $x$ 的互斥访问],
  [唤醒一个在 $x$ 上阻塞的进程],
  [根据 $x$ 的值判断该进程是否进入阻塞状态],
  [阻塞该进程，并将之插入 $x$ 的阻塞队列中],
)
]]

== 经典同步问题

#question(label: n => [2009 45])[
（7分）三个进程P1、P2、P3互斥使用一个包含N（N\>0）个单元的缓冲区。P1每次用
produce()生成一个正整数并用put()送入缓冲区某一空单元中；P2每次用
getodd()从该缓冲区中取出一个奇数并用 countodd()统计奇数个数；P3每次用
geteven()从该缓冲区中取出一个偶数并用
counteven()统计偶数个数。请用信号量机制实现这三个进程的同步与互斥活动，并说明所定义信号量的含义。要求用伪代码描述。

]

#question(label: n => [2011 45])[
（8分）某银行提供1个服务窗口和10个供顾客等待的座位。顾客到达银行时，若有空座位，则到取号机上领取一个号，等待叫号。取号机每次仅允许一位顾客使用。当营业员空闲时，通过叫号选取一位顾客，并为其服务。顾客和营业员的活动过程描述如下：

```text
cobegin
{
    process 顾客 i
    {
        从取号机获得一个号码；
        等待叫号；
        获得服务；
    }
    process 营业员
    {
        while (TRUE) {
            叫号；
            为顾客服务；
        }
    }
}
coend
```

请添加必要的信号量和 P、V（或
wait（）、signal（））操作，实现上述过程中的互斥与同步。要求写出完整的过程，说明信号量的含义并赋初值。

]

#question(label: n => [2014 47])[
（8分）系统中有多个生产者进程和多个消费者进程，共享一个能存放1000件产品的环形缓冲区（初始为空）。当缓冲区未满时，生产者进程可以放入其生产的一件产品，否则等待；当缓冲区未空时，消费者进程可以从缓冲区取走一件产品，否则等待。要求一个消费者进程从缓冲区连续取走10件产品后，其他消费者进程才可以取产品。请使用信号量的P、V（wait（）、signal（））操作实现进程间的互斥与同步，要求写出完整的过程，并说明所用信号量的含义和初值。]

#question(label: n => [2015 45])[
（9分）有A、B两人通过信箱进行辩论，每个人都从自己的信箱中取得对方的问题，将答案和向对方提出的新问题组成一个邮件放入对方的信箱中。假设A的信箱最多放 $M$ 个邮件，B的信箱最多放 $N$ 个邮件。初始时A的信箱中有 $x$ 个邮件（$0 < x < M$），B的信箱中有 $y$ 个邮件（$0 < y < N$）。辩论者每取出一个邮件，邮件数减1。A和B两人的操作过程描述如下：

#align(center)[CoBegin]

#table(
  columns: (1fr, 1fr),
  inset: 0.7em,
  align: top + left,
  [```c
A {
    while (TRUE) {
        从A的信箱中取出一个邮件;
        回答问题并提出一个新问题;
        将新邮件放入B的信箱;
    }
}
```],
  [```c
B {
    while (TRUE) {
        从B的信箱中取出一个邮件;
        回答问题并提出一个新问题;
        将新邮件放入A的信箱;
    }
}
```],
)

#align(center)[CoEnd]

当信箱不为空时，辩论者才能从信箱中取邮件，否则等待。当信箱不满时，辩论者才能将新邮件放入信箱，否则等待。请添加必要的信号量和P、V（或wait、signal）操作，以实现上述过程的同步。要求写出完整的过程，并说明信号量的含义和初值。
]

#question(label: n => [2019 43])[
（8分）有 $n(n >= 3)$ 位哲学家围坐在一张圆桌边，每位哲学家交替地就餐和思考。在圆桌中心有 $m(m >= 1)$ 个碗，每两位哲学家之间有1根筷子。每位哲学家必须取到一个碗和两侧的筷子之后，才能就餐，进餐完毕，将碗和筷子放回原位，并继续思考。为使尽可能多的哲学家同时就餐，且防止出现死锁现象，请使用信号量的 P、V 操作（wait()、signal() 操作）描述上述过程中的互斥与同步，并说明所用信号量及初值的含义。
]

#block(breakable: false)[#question(label: n => [旧版题型示例])[
理发师问题描述如下：理发店包含一间接待室和一间工作室，接待室内有 $n (n >= 1)$ 把椅子，而工作室只有1把椅子。如果没有顾客，理发师就去睡觉；如果顾客来时所有的椅子都有人，那么顾客离去；如果理发师在忙且接待室有空闲的椅子，那么此顾客会坐在其中1把空闲的椅子上等待；如果理发师在睡觉，则顾客会唤醒他。请采用信号量机制解决该理发师问题（可用伪代码描述）。
]]
