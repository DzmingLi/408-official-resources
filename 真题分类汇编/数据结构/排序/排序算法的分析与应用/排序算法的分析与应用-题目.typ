// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：排序算法的分析与应用

#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)

#block(breakable: false)[#question(label: n => [2012 10])[
排序过程中，对尚未确定最终位置的所有元素进行一遍处理称为一趟排序。下列排序方法中，每一趟排序结束时都至少能够确定一个元素最终位置的方法是

I. 简单选择排序 II. 希尔排序 III. 快速排序

IV. 堆排序 V. 二路归并排序

#choices(
  [仅Ⅰ、Ⅲ、Ⅳ],
  [仅Ⅰ、Ⅲ、V],
  [仅Ⅱ、Ⅲ、Ⅳ],
  [仅Ⅲ、Ⅳ、V],
)
]]

#block(breakable: false)[#question(label: n => [2017 10])[
在内部排序时，若选择了归并排序而没有选择插入排序，则可能的理由是
#statements(columns: 1, [Ⅰ．归并排序的程序代码更短], [Ⅱ．归并排序的占用空间更少], [Ⅲ．归并排序的运行效率更高])
#choices([仅Ⅱ], [仅Ⅲ], [仅Ⅰ、Ⅱ], [仅Ⅰ、Ⅲ])
]]

#block(breakable: false)[#question(label: n => [2017 11])[
下列排序方法中，若将顺序存储更换为链式存储，则算法的时间效率会降低的是
#statements(columns: 3, [Ⅰ．插入排序], [Ⅱ．选择排序], [Ⅲ．起泡排序], [Ⅳ．希尔排序], [Ⅴ．堆排序])
#choices([仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ], [仅Ⅲ、Ⅳ], [仅Ⅳ、Ⅴ])
]]

#block(breakable: false)[#question(label: n => [2019 7])[
选择一个排序算法时，除算法的时空效率外，下列因素中，还需要考虑的是

#statements(columns: (1fr, 1fr), [Ⅰ．数据的规模], [Ⅱ．数据的存储方式],
  [Ⅲ．算法的稳定性], [Ⅳ．数据的初始状态],
)

#choices([仅Ⅲ], [仅Ⅰ、Ⅱ], [仅Ⅱ、Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]]

#block(breakable: false)[#question(label: n => [2020 11])[
对大部分元素已有序的数组进行排序时，直接插入排序比简单选择排序效率更高，其原因是

Ⅰ．直接插入排序过程中元素之间的比较次数更少 \
Ⅱ．直接插入排序过程中所需要的辅助空间更少 \
Ⅲ．直接插入排序过程中元素的移动次数更少

#choices([仅Ⅰ], [仅Ⅲ], [仅Ⅰ、Ⅱ], [Ⅰ、Ⅱ和Ⅲ])
]]

#question(label: n => [2021 42])[
（8分）已知某排序算法如下：

```c
void cmpCountSort(int a[], int b[], int n)
{
    int i, j, *count;
    count = (int *)malloc(sizeof(int) * n);
                                  // C++语言：count = new int[n];
    for (i = 0; i < n; i++) count[i] = 0;
    for (i = 0; i < n-1; i++)
        for (j = i+1; j < n; j++)
            if (a[i] < a[j]) count[j]++;
            else            count[i]++;
    for (i = 0; i < n; i++) b[count[i]] = a[i];
    free(count);                  // C++语言：delete count;
}
```

请回答下列问题。

#subquestions[
+ 若有 int a[] = {25，−10，25，10，11，19}，b[6]；，则调用 cmpCountSort(a，b，6) 后数组 b 中的内容是什么？
+ 若 a 中含有 $n$ 个元素，则算法执行过程中，元素之间的比较次数是多少？
+ 该算法是稳定的吗？若是，则阐述理由；否则，修改为稳定排序算法。

]
]

#block(breakable: false)[#question(label: n => [2022 11])[
对数据进行排序时，若采用直接插入排序而不采用快速排序，则可能的原因是

#statements(columns: (1fr, 1fr), [Ⅰ．大部分元素已有序], [Ⅱ．待排序元素数量很少],
  [Ⅲ．要求空间复杂度为 $O(1)$], [Ⅳ．要求排序算法是稳定的],
)

#choices([Ⅰ、Ⅱ], [Ⅲ、Ⅳ], [Ⅰ、Ⅱ、Ⅳ], [Ⅰ、Ⅱ、Ⅲ、Ⅳ])
]]

#question(label: n => [2022 42])[
（10分）现有 $n (n > 100000)$ 个数保存在一维数组 M 中，需要查找 M 中最小的10个数。请回答下列问题。

#subquestions[
+ 设计一个完成上述查找任务的算法，要求平均情况下的比较次数尽可能少，简述其算法思想（不需要程序实现）。
+ 说明你所设计的算法平均情况下的时间复杂度和空间复杂度。

]
]

#block(breakable: false)[#question(label: n => [2023 10])[
下列排序算法中，不稳定的是
#statements(columns: 2, [Ⅰ．希尔排序], [Ⅱ．归并排序], [Ⅲ．快速排序], [Ⅳ．堆排序], [Ⅴ．基数排序])
#choices([Ⅰ、Ⅱ], [Ⅱ、Ⅴ], [Ⅰ、Ⅲ、Ⅳ], [Ⅲ、Ⅳ、Ⅴ])
]]

#block(breakable: false)[#question(label: n => [2025 10])[
下列排序算法中，最坏情况下元素移动次数最少的是

#choices([起泡排序],[直接插入排序],[快速排序],[简单选择排序])
]]
