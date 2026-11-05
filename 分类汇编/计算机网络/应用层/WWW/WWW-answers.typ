// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：WWW

== HTTP协议

=== 2011 47

#subquestions(after-heading: true, allow-oversize: true)[
+
  从题47-b图可知，该数据帧所封装的IP分组的目的地址就是Web服务器的IP地址，即64.170.98.32（40aa6220H）；（1分）该数据帧的目的MAC地址就是该主机的默认网关MAC地址，即00-21-27-21-51-ee。（1分）

+
  该主机在构造题47-b图的数据帧时，使用ARP协议确定目的MAC地址；（1分）因为ARP协议请求报文需要进行广播，所以封装ARP协议请求报文的以太网帧的目的MAC地址是ff-ff-ff-ff-ff-ff。（1分）

+ 根据持续的非流水线方式
  HTTP/1.1协议的工作原理，每个RTT传输一个对象，共需要传输6个对象（1个html页面和5个JPEG小图像），所以共需要6个RTT。（2分）

+
  该帧所封装的IP分组经过路由器R转发时，需要修改IP分组头中的字段有：源IP地址、TTL和头部校验和。（3分）

  【评分说明】若考生解答时将所有IP头中的字段进行罗列，不给分，其他情况酌情给分。

]

=== 2014 40：D

=== 2015 40：C

=== 2020 40：D

=== 2022 40：B

=== 2024 40：D

=== 2026 40

#block(breakable: false)[
本仓库尚未收录本题参考答案。
]
