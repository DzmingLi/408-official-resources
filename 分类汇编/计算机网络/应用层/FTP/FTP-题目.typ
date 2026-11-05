// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：FTP

== 控制连接与数据连接

#question(label: n => [2009 40])[
FTP客户和服务器间传递FTP命令时，使用的连接是

#choices(
  [建立在TCP之上的控制连接],
  [建立在TCP之上的数据连接],
  [建立在UDP之上的控制连接],
  [建立在UDP之上的数据连接],
)
]

#question(label: n => [2017 40])[
下列关于 FTP 协议的叙述中，#emphasis[错误]的是
#choices([数据连接在每次数据传输完毕后就关闭], [控制连接在整个会话期间保持打开状态], [服务器与客户端的 TCP 20端口建立数据连接], [客户端与服务器的 TCP 21端口建立控制连接])
]

#question(label: n => [2023 47])[
（9分）某网络拓扑如题47图所示，主机 H 登录 FTP 服务器后，向服务器上传一个大小为18000 B的文件 F。假设 H 为传输 F 建立数据连接时，选择的初始序号为100，MSS=1000 B，拥塞控制初始阈值为4 MSS，RTT=10 ms，忽略 TCP 段的传输时延；在 F 的传输过程中，H 均以 MSS 段向服务器发送数据，且未发生差错、丢包和乱序现象。
#figure(image("../../../../历年真题+参考解答/2023/official-images/q47.png", width: 27em), caption: [题47图])
请回答下列问题。
#subquestions[
 + FTP 的控制连接是持久的还是非持久的？FTP 的数据连接是持久的还是非持久的？H 登录 FTP 服务器时，建立的 TCP 连接是控制连接还是数据连接？
 + H 通过数据连接发送 F 时，F 的第1个字节的序号是多少？在断开数据连接过程中，FTP 服务器发送的第二次挥手 ACK 段的确认序号是多少？
 + H 通过数据连接发送 F 的过程中，当 H 收到确认序号为2101的确认段时，H 的拥塞窗口调整为多少？收到确认序号为7101的确认段时，H 的拥塞窗口调整为多少？
 + H 从请求建立数据连接开始，到确认 F 已被服务器全部接收为止，至少需要多长时间？期间应用层数据平均发送速率是多少？
]
]
