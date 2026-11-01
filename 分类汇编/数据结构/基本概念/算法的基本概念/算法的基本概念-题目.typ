// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：算法的基本概念

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2011 1])[
设 $n$ 是描述问题规模的非负整数，下面程序片段的时间复杂度是

```c
x = 2;
while (x < n / 2)
    x = 2 * x;
```

#choices(
  [$O(log_2 n)$],
  [$O(n)$],
  [$O(n log_2 n)$],
  [$O(n^2)$],
)
]]

#block(breakable: false)[#question(label: n => [2012 1])[
求整数 $n$（$n >= 0$）阶乘的算法如下，其时间复杂度是

```c
int fact(int n) {
    if (n <= 1) return 1;
    return n * fact(n - 1);
}
```

#choices(
  [$O \( log_2 n \)$],
  [O(n)],
  [$O \( n log_2 n \)$],
  [$O \( n^2 \)$],
)
]]

#block(breakable: false)[#question(label: n => [2014 1])[
下列程序段的时间复杂度是

```c
count = 0;
for (k = 1; k <= n; k *= 2)
    for (j = 1; j <= n; j++)
        count++;
```

#choices(
  [$O(log_2 n)$],
  [$O(n)$],
  [$O(n log_2 n)$],
  [$O(n^2)$],
)
]]

#block(breakable: false)[#question(label: n => [2017 1])[
下列函数的时间复杂度是
```c
int func(int n)
{
    int i=0, sum=0;
    while(sum<n) sum += ++i;
    return i;
}
```
#choices([$O(log n)$], [$O(n^(1\/2))$], [$O(n)$], [$O(n log n)$])
]]

#block(breakable: false)[#question(label: n => [2019 1])[
设 $n$ 是描述问题规模的非负整数，下列程序段的时间复杂度是

```c
x = 0;
while (n >= (x+1)*(x+1))
    x = x+1;
```

#choices([$O(log n)$], [$O(n^(1/2))$], [$O(n)$], [$O(n^2)$])
]]

#block(breakable: false)[#question(label: n => [2022 1])[
下列程序段的时间复杂度是

```c
int sum = 0;
for (int i = 1; i < n; i *= 2)
    for (int j = 0; j < i; j++)
        sum++;
```

#choices([$O(log n)$], [$O(n)$], [$O(n log n)$], [$O(n^2)$])
]]
