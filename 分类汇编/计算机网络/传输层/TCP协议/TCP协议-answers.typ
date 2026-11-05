// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：TCP协议

== TCP段

=== 2009 38：D

=== 2013 39：B

=== 2020 39：C

== TCP连接管理

=== 2011 39：C

=== 2019 39：D

=== 2021 38：B

=== 2022 39：D

=== 2024 38：D

=== 2025 39：B

== TCP可靠传输

=== 2011 40：B

=== 2012 47

#subquestions(after-heading: true, allow-oversize: true)[
+
  由于题47-a表中1、3、4号分组的源IP地址均为192.168.0.8（c0a80008H），所以1、3、4号分组是由H发送的；（3分）

  题47-a表中1号分组封装的TCP段的FLAG为02H（即 syn=1，ack=0），seq=
  846b41c5H，2号分组封装的TCP段的FLAG为12H（即 syn=1，ack=1），seq=e059
  9fefH，ack=846b41c6H，3号分组封装的TCP段的FLAG为10H（即 ack=1），seq=
  846b41c6H，ack=e0599ff0H，所以1、2、3号分组完成了TCP连接建立过程；（1分）

  由于快速以太网数据帧有效载荷的最小长度为46字节，表中3、5号分组的总长度为40（28H）字节，小于46字节，其余分组总长度均大于46字节，所以3、5号分组在通过快速以太网传输时进行了填充。（1分）

+
  由3号分组封装的TCP段可知，发送应用层数据初始序号为846b41c6H，由5号

  分组封装的TCP段可知，ack为846b41d6H，所以S已经收到的应用层数据的字节数为846b41d6H-846b41c6H=10H=16B。（2分）

  【评分说明】其他正确解答，亦给2分；若解答结果不正确，但分析过程正确给1分；其他情况酌情给分。

+ 由于 S发出的 IP分组的标识 $= 6811 upright("H")$
  ，所以该分组所对应的是题47-a表中的5号分组。S发出的 IP分组的
  $upright("TTL") = 40 upright("H") = 64$ ，5号分组的
  $upright("TTL") = 31 upright("H") = 49$ ， $64 - 49 = 15 。$

  所以，可以推断该IP分组到达H时经过了15个路由器。（2分）

  【评分说明】若解答结果不正确，但分析过程正确给1分；其他情况酌情给分。

]

=== 2019 38：C

== TCP流量控制

=== 2010 39：A

=== 2021 40：C

== TCP拥塞控制

=== 2009 39：C

=== 2014 38：A

=== 2015 39：A

=== 2016 41

#block(breakable: false)[
#subquestions(allow-oversize: true)[
+ 第二次握手的TCP段中，SYN=1、ACK=1，确认序号为101。
+ H3收到第8个确认段时，接收窗口为12 KB，拥塞窗口为9 KB，发送窗口为9 KB。
+ 发送窗口为0时，下一个待发送数据的序号为 $20 times 1024 + 101 = 20581$。平均数据传输速率为 $20 "KB" / (5 times 200 "ms") = 20 "KB/s"$。

  编注：原参考答案在20 KB/s后另写“=20.48 kbps”，单位换算有误；按1 KB=1024 B，20 KB/s应为163.84 kb/s。
+ 从 $t$ 时刻起，S释放连接的最短时间为 $1.5 times 200 "ms" = 300 "ms"$。
]
]

=== 2017 39：A

=== 2020 38：D

=== 2022 38：C

=== 2025 38：A

=== 2026 47

本仓库尚未收录本题参考答案。
