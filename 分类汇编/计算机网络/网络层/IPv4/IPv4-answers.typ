// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 分类汇编：IPv4

== IPv4分组

=== 2021 36：B

== IPv4地址与NAT

=== 2016 38：D

=== 2017 36：A

=== 2020 47

#subquestions(allow-oversize: true)[
+ 需要静态配置 R2 的 NAT，实现 NAT 穿透，具体配置为：
  
  #align(center,table(columns:(1fr,1fr,1fr,1fr),align:center,
    table.cell(colspan:2)[外网],table.cell(colspan:2)[内网],
    [IP 地址],[端口号],[IP 地址],[端口号],
    [203.10.2.2],[80],[192.168.1.2],[80],
  ))
  
+ H2 发送的 P 的源 IP 地址和目的 IP 地址分别是：192.168.1.2和203.10.2.2；R3 转发后，P 的源 IP 地址和目的 IP 地址分别是：203.10.2.6和203.10.2.2；R2 转发后，P 的源 IP 地址和目的 IP 地址分别是：203.10.2.6和192.168.1.2。

]

== 子网划分、路由聚集、子网掩码与CIDR

=== 2010 37：B

=== 2011 38：C

=== 2012 39：D

=== 2016 39：C

=== 2017 38：C

=== 2018 38：C

=== 2018 47

#subquestions(allow-oversize: true)[
+ 销售部子网的广播地址是192.168.1.127，技术部子网的子网地址是192.168.1.128；技术部子网还可以连接主机数：$126-((208-129)+1+1)=45$ 台。
  
+ 最大 IP 分片封装数据的字节数：$floor((800-20)/8) times 8=776$，至少需要的分片数：$ceil((1500-20)/776)=2$，2个分片的片偏移量分别是：0和97。

]

=== 2019 37：B

=== 2021 35：B

=== 2022 35：B

=== 2022 36：D

== ARP协议、DHCP协议与ICMP协议

=== 2010 36：C

=== 2012 33：B

=== 2012 38：A

=== 2015 47

#subquestions(allow-oversize: true)[
+ DHCP服务器可为主机2～主机N动态分配IP地址的最大范围是：111.123.15.5～111.123.15.254；主机2发送的封装DHCP Discover报文的IP分组的源IP地址和目的IP地址分别是0.0.0.0和255.255.255.255。
  
+ 主机2发出的第一个以太网帧的目的MAC地址是ff-ff-ff-ff-ff-ff；封装主机2发往Internet的IP分组的以太网帧的目的MAC地址是00-a1-a1-a1-a1-a1。
  
+ 主机1能访问WWW服务器，但不能访问Internet。由于主机1的子网掩码配置正确而默认网关IP地址被错误地配置为111.123.15.2（正确IP地址是111.123.15.1），所以主机1可以访问在同一个子网内的WWW服务器，但当主机1访问Internet时，主机1发出的IP分组会被路由到错误的默认网关（111.123.15.2），从而无法到达目的主机。

]

=== 2022 47

#subquestions(allow-oversize: true)[
+ 设备1选择100BaseT 以太网交换机，设备2选择100BaseT 集线器。
+ 设 H2 与 H3 之间的最远距离是 $D$，根据 CSMA/CD 协议的工作原理有：
  
  $ (64 times 8) / (100 times 10^6) = (2 times D) / (2 times 10^8) + 2 times 1.51 times 10^(-6) $
  
  解得：$D = 210$ m。
  
+ M 是 DHCP 发现报文（DISCOVER 报文）；路由器 E0 接口能收到封装 M 的以太网帧；目的 MAC 地址是 FF-FF-FF-FF-FF-FF。
+ H5 收到的帧中，地址1、地址2和地址3分别是：00-11-11-11-11-E1、00-11-11-11-11-C1 和00-11-11-11-11-D1。

]
