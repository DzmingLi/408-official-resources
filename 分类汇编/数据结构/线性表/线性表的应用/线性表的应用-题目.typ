// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：线性表的应用

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#question(label: n => [2009 42])[
（15分）已知一个带有表头结点的单链表，结点结构为#inline-node(
  columns: (3.2em, 3.2em),
  [data], [link],
)，假设该链表只给出了头指针list。在不改变链表的前提下，请设计一个尽可能高效的算法，查找链表中倒数第
k个位置上的结点（
k为正整数）。若查找成功，算法输出该结点的data域的值，并返回1；否则，只返回0。要求：

#subquestions[
+ 描述算法的基本设计思想；
  \
+ 描述算法的详细实现步骤；
  \
+ 
  根据设计思想和实现步骤，采用程序设计语言描述算法（使用C、C++或Java语言实现），关键之处请给出简要注释。
  
    
]
]

#question(label: n => [2010 42])[
（13分）设将 $n$（$n > 1$）个整数存放到一维数组
R中。试设计一个在时间和空间两方面都尽可能高效的算法，将
R中保存的序列循环左移 $p$（$0 < p < n$）个位置，即将 R中的数据由
$(x_0, x_1, dots.h, x_(n - 1))$变换为
$(x_p, x_(p + 1), dots.h, x_(n - 1), x_0, x_1, dots.h, x_(p - 1))$。要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 
  根据设计思想，采用C或C++或Java语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度和空间复杂度。
  
    
]
]

#question(label: n => [2011 42])[
（15分）一个长度为
$L (L gt.eq 1)$的升序序列S，处在第
$ceil.l L \/ 2 ceil.r$个位置的数称为S的中位数。例如，若序列
$S_1 = (11, 13, 15, 17, 19)$
，则S1的中位数是15。两个序列的中位数是含它们所有元素的升序序列的中位数。例如，若
$S_2 = (2, 4, 6, 8, 20)$
，则S1和S2的中位数是11。现有两个等长升序序列A和B，试设计一个在时间和空间两方面都尽可能高效的算法，找出两个序列A和B的中位数。要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 
  根据设计思想，采用C或C++或Java语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度和空间复杂度。
  
    
]
]

#question(label: n => [2012 42])[
（13分）假定采用带头结点的单链表保存单词，当两个单词有相同的后缀时，则可共享相同的后缀存储空间。例如，“loading”和“being”的存储映像如下图所示。

#figure(align(center,cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "ascender", bottom-edge: "descender", body))))
  set-style(stroke: 0.045em)
  let node(x,y,label,head: false,last: false) = {
    rect((x,y),(x+1.6,y+1),fill: white)
    if head { rect((x,y),(x+1.1,y+1),fill: luma(75%)) }
    line((x+1.1,y),(x+1.1,y+1))
    if not head { content((x+0.55,y+0.5),label) }
    // 空指针记号按格内尺寸绘制，避免字体字形撑满窄指针格。
    if last { line((x+1.21,y+0.24),(x+1.35,y+0.76),(x+1.49,y+0.24)) }
  }
  for (x,y,label) in ((0,3,[]),(2.5,3,[l]),(5,3,[o]),(7.5,3,[a]),(10,3,[d]),(0,0,[]),(2.5,0,[b]),(5,0,[e]),(12.5,1.5,[i]),(15,1.5,[n]),(17.5,1.5,[g])) {
    node(x,y,label,head: label==[],last: label==[g])
  }
  for (x,y) in ((0,3),(2.5,3),(5,3),(7.5,3),(0,0),(2.5,0),(12.5,1.5),(15,1.5)) {
    line((x+1.35,y+0.5),(x+2.5,y+0.5),mark: (end: ">",scale: 0.55))
  }
  line((11.35,3.5),(12.7,3.5),(12.7,2.5),mark: (end: ">",scale: 0.55))
  line((6.35,0.5),(12.7,0.5),(12.7,1.5),mark: (end: ">",scale: 0.55))
  line((-0.8,4.5),(0.55,4),mark: (end: ">",scale: 0.55)); content((-1.2,4.7),[str1])
  line((-0.8,1.5),(0.55,1),mark: (end: ">",scale: 0.55)); content((-1.2,1.7),[str2])
  line((14.2,0),(13.3,1.5),mark: (end: ">",scale: 0.55)); content((14.6,-0.1),[$p$])
})),caption: [题42图],kind: image)


设 str1和 str2分别指向两个单词所在单链表的头结点，链表结点结构为：#inline-node([data], [next])，请设计一个时间上尽可能高效的算法，找出由 str1和
str2所指的两个链表共同后缀的起始位置（如图中字符 i所在结点的位置
p）。要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 
  根据设计思想，采用C或C++或Java语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度。
  
    
]
]

#question(label: n => [2013 41])[
（13分）已知一个整数序列
$A = （ a_0 \, a_1 \, dots.h.c \, a_(n - 1) ）$ ，其中 $0 lt.eq a_i < n$
（ $0 lt.eq i < n$ ）。若存在
$a_(p 1) = a_(p 2) = dots.h.c = a_(p m) = x$ 且 m\>n/2（
$0 lt.eq p_k < n \, 1 lt.eq k lt.eq m$ ），则称 x为 A的主元素。例如
$A = （ 0 \, 5 \, 5 \, 3 \, 5 \, 7 \, 5 \, 5 ）$ ，则5为主元素；又如
$A = （ 0 \, 5 \, 5 \, 3 \, 5 \, 1 \, 5 \, 7 ）$ ，则
A中没有主元素。假设 A中的
n个元素保存在一个一维数组中，请设计一个尽可能高效的算法，找出
A的主元素。若存在主元素，则输出该元素；否则输出-1。要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 
  根据设计思想，采用C或C++或Java语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度和空间复杂度。
  
    
]
]

#question(label: n => [2015 41])[
（15分）用单链表保存 $m$ 个整数，结点的结构为：#inline-node(
    columns: (3.1em, 3.1em),
    [data], [link],
  )，且 $abs("data") <= n$（$n$ 为正整数）。现要求设计一个时间复杂度尽可能高效的算法，对于链表中data的绝对值相等的结点，仅保留第一次出现的结点而删除其余绝对值相等的结点。例如，若给定的单链表head如下：

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  for (i, value) in ([], [21], [-15], [-15], [-7], [15]).enumerate() {
    let x = 5.3 * i
    rect((x, 0), (x + 3.6, 1.7), fill: white)
    line((x + 2, 0), (x + 2, 1.7))
    content((x + 1, 0.85), value)
    if i < 5 {
      line((x + 2.65, 0.85), (x + 5.3, 0.85), mark: (end: ">", fill: black, scale: 0.6))
    } else {
      content((x + 2.8, 0.85), [∧])
    }
  }
  content((0.75, 3.55), [head])
  line((0.75, 2.85), (0.75, 1.7), mark: (end: ">", fill: black, scale: 0.6))
}))

则删除结点后的head为：

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  for (i, value) in ([], [21], [-15], [-7]).enumerate() {
    let x = 5.3 * i
    rect((x, 0), (x + 3.6, 1.7), fill: white)
    line((x + 2, 0), (x + 2, 1.7))
    content((x + 1, 0.85), value)
    if i < 3 {
      line((x + 2.65, 0.85), (x + 5.3, 0.85), mark: (end: ">", fill: black, scale: 0.6))
    } else {
      content((x + 2.8, 0.85), [∧])
    }
  }
  content((0.75, 3.55), [head])
  line((0.75, 2.85), (0.75, 1.7), mark: (end: ">", fill: black, scale: 0.6))
}))

要求：

#subquestions[
+ 给出算法的基本设计思想。
  \
+ 使用C或C++语言，给出单链表结点的数据类型定义。
  \
+ 根据设计思想，采用C或C++语言描述算法，关键之处给出注释。
  \
+ 说明你所设计算法的时间复杂度和空间复杂度。
    
]
]

#question(label: n => [2018 41])[
（13分）给定一个含 $n (n >= 1)$ 个整数的数组，请设计一个在时间上尽可能高效的算法，找出数组中未出现的最小正整数。例如，数组 $\{-5,3,2,3\}$ 中未出现的最小正整数是1；数组 $\{1,2,3\}$ 中未出现的最小正整数是4。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。
+ 说明你所设计算法的时间复杂度和空间复杂度。

]
]

#question(label: n => [2019 41])[
（13分）设线性表 $L=(a_1,a_2,a_3,dots,a_(n-2),a_(n-1),a_n)$ 采用带头结点的单链表保存，链表中结点定义如下：

```c
typedef struct node
{
    int data;
    struct node *next;
} NODE;
```

请设计一个空间复杂度为 $O(1)$ 且在时间上尽可能高效的算法，重新排列 $L$ 中的各结点，得到线性表 $L'=(a_1,a_n,a_2,a_(n-1),a_3,a_(n-2),dots)$。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。
+ 说明你所设计算法的时间复杂度。

]
]

#question(label: n => [2020 41])[
（13分）定义三元组 $(a,b,c)$（$a$，$b$，$c$ 均为整数）的距离 $D=abs(a-b)+abs(b-c)+abs(c-a)$。给定3个非空整数集合 S1、S2 和 S3，按升序分别存储在3个数组中。请设计一个尽可能高效的算法，计算并输出所有可能的三元组 $(a,b,c)$（$a in "S1"$，$b in "S2"$，$c in "S3"$）中的最小距离。例如，S1 = {−1，0，9}，S2 = {−25，−10，10，11}，S3 = {2，9，17，30，41}，则最小距离为2，相应的三元组为(9，10，9)。要求：

#subquestions[
+ 给出算法的基本设计思想。
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。
+ 说明你所设计算法的时间复杂度和空间复杂度。

]
]

#question(label: n => [2025 41])[
（本题13分）设有两个长度均为 $n$ 的一维整型数组 $A$ 和 $r e s$，对数组 $A$ 中的每个元素 $A[i]$，计算 $A[i]$ 与 $A[j]$（$0 ≤ i ≤ j ≤ n-1$）乘积的最大值，并将其保存到 $r e s[i]$ 中。例如，若 $A[ ]={1,4,-9,6}$，则得 $r e s[ ]={6,24,81,36}$。现给定数组 $A$，请设计一个时间和空间上尽可能高效的算法 calMulMax，求 $r e s$ 中各元素的值。函数原型为：void calMulMax(int A[], int res[], int n)。要求如下。

#subquestions[
+ 给出算法的基本设计思想。（4分）
+ 根据设计思想，采用 C 或 C++ 语言描述算法，关键之处给出注释。（7分）
+ 说明你所设计算法的时间复杂度和空间复杂度。（2分）

]
]
