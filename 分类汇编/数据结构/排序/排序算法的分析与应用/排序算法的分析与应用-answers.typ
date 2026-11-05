// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：排序算法的分析与应用

=== 2012 10：A

=== 2017 10：B

=== 2017 11：D

=== 2019 7：D

=== 2020 11：A

=== 2021 42

#subquestions(allow-oversize: true)[
+ b[] = {−10，10，11，19，25，25}
+ 元素之间的比较次数是 $n(n-1)\/2$。
+ 不是。
  
  需要将程序中的 if 语句修改如下：
  
  ```c
  if (a[i] <= a[j]) count[j]++;
  else count[i]++;
  ```

]

=== 2022 11：D

=== 2022 42

#subquestions(allow-oversize: true)[
+ 算法思想
  
  【答案一】
  
  定义含10个元素的数组 A，元素值均为该数组类型能表示的最大数 MAX。
  
  ```text
  for M中的每个元素s
      if (s < A[9]) 丢弃A[9]并将s按升序插入A中；
  ```
  
  当数据全部扫描完毕，数组 A 中保存的就是最小的10个数。
  
  【答案二】
  
  定义含10个元素的大根堆 H，元素值均为该堆元素类型能表示的最大数 MAX。
  
  ```text
  for M中的每个元素s
      if (s < H的堆顶元素) 删除堆顶元素并将s插入H中；
  ```
  
  当数据全部扫描完毕，堆 H 中保存的就是最小的10个数。
  
+ 算法平均情况下的时间复杂度是 $O(n)$，空间复杂度是 $O(1)$。

]

=== 2023 10

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 2025 10：D

=== 旧版题型示例

#block(breakable: false)[
自制解析（非官方）：原考纲未提供示例答案，以下答案与解析由本仓库自行编写。

A

堆排序的时间复杂度为 $O(n log_2 n)$，额外空间为 $O(1)$。起泡排序最坏时间复杂度为 $O(n^2)$；快速排序平均为 $O(n log_2 n)$，但需要递归栈，最坏时间复杂度为 $O(n^2)$；希尔排序的复杂度依赖增量序列。故选堆排序。
]
