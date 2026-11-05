// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：栈、队列和数组的应用

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2012 2])[
已知操作符包括“+”、“-”、“\*”、“/”、“（”和“）”。将中缀表达式
$(a + b - a) ast ((c + d) \/ (e - f)) + g$转换为等价的后缀表达式
$a b + a c d + e \/ f - ast - g +$时，用栈来存放暂时还不能确定运算次序的操作符。若栈初始时为空，则转换过程中同时保存在栈中的操作符的最大个数是

#choices(
  [5],
  [7],
  [8],
  [11],
)
]]

#block(breakable: false)[#question(label: n => [2014 2])[
假设栈初始为空，将中缀表达式
$a \/ b + (c ast d - e ast f) \/ g$ 转换为等价的后缀表达式的过程中，当扫描到 $f$ 时，栈中的元素依次是

#choices(
  [$+ ( ast -$],
  [$+ ( - ast$],
  [$\/ + ( ast - ast$],
  [$\/ + - ast$],
)
]]

#block(breakable: false)[#question(label: n => [2015 1])[
已知程序如下：

```c
int S(int n)
{
    return (n <= 0) ? 0 : S(n - 1) + n;
}
void main()
{
    cout << S(1);
}
```

程序运行时使用栈来保存调用过程的信息，自栈底到栈顶保存的信息依次对应的是

#choices(
  [main() $arrow.r$ S(1) $arrow.r$ S(0)],
  [S(0) $arrow.r$ S(1) $arrow.r$ main()],
  [main() $arrow.r$ S(0) $arrow.r$ S(1)],
  [S(1) $arrow.r$ S(0) $arrow.r$ main()],
)
]]

#block(breakable: false)[#question(label: n => [2016 3])[
设有如下图所示的火车车轨，入口到出口之间有 $n$ 条轨道，列车的行进方向均为从左至右，列车可驶入任意一条轨道。现有编号为1～9的9列列车，驶入的次序依次是8，4，2，5，3，9，1，6，7。若期望驶出的次序依次为1～9，则 $n$ 至少是

#align(center, image("../../../../历年真题+参考解答/2016/official-images/q03.png", width: 29em))
#choices([2], [3], [4], [5])
]]

#block(breakable: false)[#question(label: n => [2017 2])[
下列关于栈的叙述中，错误的是
#statements(columns: 1,
 [Ⅰ．采用非递归方式重写递归程序时必须使用栈],
 [Ⅱ．函数调用时，系统要用栈保存必要的信息],
 [Ⅲ．只要确定了入栈次序，即可确定出栈次序],
 [Ⅳ．栈是一种受限的线性表，允许在其两端进行操作])
#choices([仅Ⅰ], [仅Ⅰ、Ⅱ、Ⅲ], [仅Ⅰ、Ⅲ、Ⅳ], [仅Ⅱ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2018 1])[
若栈 $S_1$ 中保存整数，栈 $S_2$ 中保存运算符，函数 F() 依次执行下述各步操作：

#subquestions[
+ 从 $S_1$ 中依次弹出两个操作数 $a$ 和 $b$；
+ 从 $S_2$ 中弹出一个运算符 op；
+ 执行相应的运算 $b$ op $a$；
+ 将运算结果压入 $S_1$ 中。
  
  假定 $S_1$ 中的操作数依次是5，8，3，2（2在栈顶），$S_2$ 中的运算符依次是 $ast$，$-$，$+$（$+$ 在栈顶）。调用3次 F() 后，$S_1$ 栈顶保存的值是
  
  #choices([$-15$], [15], [$-20$], [20])

]
]]

#block(breakable: false)[#question(label: n => [2024 2])[
与表达式 $x+y*(z-u)\/v$ 等价的后缀表达式是

#choices([$x y z u - * v \/ +$], [$x y z u - v \/ * +$], [$+ x \/ * y - z u v$], [$+ x * y \/ - z u v$])
]]

#block(breakable: false)[#question(label: n => [2025 2])[
已知算法 A 用于检查字符串中各类括号是否匹配，A 执行过程中使用初始为空的栈保存遇到的括号。若栈的容量是3，则下列选项中，A #emphasis[不能]处理的是

#choices([$(a + [b + (c+d)\/e] + f) + g-h$],[$[a*((b+c)\/(d-e)+f\/g)-h]$],[$[a*(b-(c-d)*e\/(f+g))-h]$],[$[a-(b+[c*(d+e)-f]+g+h)]$])
]]
