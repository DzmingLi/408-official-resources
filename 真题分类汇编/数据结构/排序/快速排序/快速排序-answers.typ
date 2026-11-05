// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：快速排序

=== 2010 10：D

=== 2011 10：A

=== 2014 11：C

=== 2016 43

#subquestions(allow-oversize: true)[
+ 算法的基本设计思想（4分）

  由题意知，将最小的$floor(n/2)$个元素放在$A_1$中，其余的元素放在$A_2$中，分组结果即可满足题目要求。仿照快速排序的思想，基于枢轴将$n$个整数划分为两个子集。根据划分后枢轴所处的位置$i$分别处理：

  ① 若$i=floor(n/2)$，则分组完成，算法结束；

  ② 若$i<floor(n/2)$，则枢轴及之前的所有元素均属于$A_1$，继续对$i$之后的元素进行划分；

  ③ 若$i>floor(n/2)$，则枢轴及之后的所有元素均属于$A_2$，继续对$i$之前的元素进行划分；

  基于该设计思想实现的算法，无须对全部元素进行全排序，其平均时间复杂度是$O(n)$，空间复杂度是$O(1)$。
+ 算法实现（9分）

  ```c
  int setPartition(int a[], int n)
  {
      int pivotkey, low=0, low0=0, high=n-1, high0=n-1,
          flag=1, k=n/2, i;
      int s1=0, s2=0;
      while (flag)
      {
          pivotkey=a[low];          // 选择枢轴
          while (low<high)         // 基于枢轴对数据进行划分
          {
              while (low<high && a[high]>=pivotkey) --high;
              if (low!=high) a[low]=a[high];
              while (low<high && a[low]<=pivotkey) ++low;
              if (low!=high) a[high]=a[low];
          }                        // end of while (low<high)
          a[low]=pivotkey;
          if (low==k-1)            // 如果枢轴是第n/2小元素，划分成功
              flag=0;
          else                     // 否则继续划分
          {
              if (low<k-1)
              {
                  low0=++low;
                  high=high0;
              }
              else
              {
                  high0=--high;
                  low=low0;
              }
          }
      }
      for (i=0; i<k; i++) s1+=a[i];
      for (i=k; i<n; i++) s2+=a[i];
      return s2-s1;
  }
  ```

  【（1）（2）的评分说明】

  ① 本题目只需将最大的一半元素与最小的一半元素分组，不需要对所有元素进行全部排序。参考答案基于快速排序思想，采用非递归的方式实现。若考生设计的算法满足题目的功能要求且正确，则（1）（2）根据所实现算法的平均时间复杂度给分，细则见下表。

  #table(columns: (auto, auto, 1fr),
    [时间复杂度], [分数], [说明],
    [$O(n)$], [13], [采用类似快速排序思想，没有对元素进行全排序。],
    [$O(n log_2 n)$], [11], [],
    [$O(n^2)$], [9], [],
    [其他], [7], [时间复杂度高于$O(n^2)$的算法。],
  )

  ② 若考生算法的基本设计思想描述中因文字表达没有清晰反映出算法思路，但在算法实现中能够表达出算法思想且正确的，可参照①的标准给分。

  ③ 考生算法的基本设计思想描述或算法实现中部分正确，可参照①中各种情况的相应得分标准酌情给分。

  ④ 参考答案中只给出了使用C语言的版本，使用C++语言的答案视同使用C语言。
+ 算法的平均时间复杂度和空间复杂度（2分）

  本参考答案给出的算法平均时间复杂度是$O(n)$，空间复杂度是$O(1)$。

  【评分说明】若考生所估计的平均时间复杂度和空间复杂度与考生所实现的算法一致，可各给1分。
]

=== 2019 10：D

=== 2023 11

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]

=== 2024 8：A
