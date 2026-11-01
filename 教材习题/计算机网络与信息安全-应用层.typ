// 人工对照《计算机网络与信息安全》（2024年版，李全龙）第112页；PDF第119页。
#import "template.typ": textbook, question, subquestions
#show: textbook.with(topic: "应用层")
= 习题

#question[计算机网络应用可以分为哪几种体系结构的应用类型？各种类型应用的特点分别是什么？]

#question[为什么说客户/服务器通信方式是网络应用通信的基本方式？]

#question[在网络应用通信过程中，需要用哪些信息标识一个应用进程？]

#question[简述DNS的层次结构。]

#question[举例说明DNS递归查询过程，以及DNS迭代查询过程。]

#question[什么是本地域名服务器？主机是如何确定本地域名服务器的？]

#question[简述HTTP/1.0请求浏览一个引用10张小JPEG图片的Web页面的通信过程。]

#question[什么是非持久连接的HTTP？什么是非流水方式持久连接？什么是流水方式持久连接？简述交互过程。]

#question[
假设你在浏览某网页时点击了一个超链接，URL为“http://www.kicker.com.cn/index.html”，且该URL对应的IP地址在你的计算机上没有缓存；文件index.html引用了8张小JPEG图片。域名解析过程中，无等待的一次DNS解析请求与响应时间记为 $"RTT"_d$，HTTP请求传输Web对象过程的一次往返时间记为 $"RTT"_h$。请回答下列问题。

#subquestions[
+ 你的浏览器解析到URL对应的IP地址的最短时间是多少？最长时间是多少？
+ 若浏览器没有配置并行TCP连接，则基于HTTP/1.0获取URL链接Web页面完整内容（包括引用的图片，下同）需要多长时间（不包括域名解析时间，下同）？
+ 若浏览器配置5个并行TCP连接，则基于HTTP/1.0获取URL链接Web页面完整内容需要多长时间？
+ 若浏览器没有配置并行TCP连接，则基于非流水方式持久连接的HTTP/1.1获取URL链接Web页面完整内容需要多长时间？基于流水方式持久连接的HTTP/1.1获取URL链接Web页面完整内容需要多长时间？
]
]

#question[电子邮件系统主要由哪几部分构成？]

#question[简述SMTP协议发送邮件过程。]

#question[FTP协议的“带外控制”特性是什么？控制连接和数据连接各有什么特点？它们的用途分别是什么？]

#question[考虑向 $N$ 个对等方（用户）分发大小为 $F = 15 "Gbit"$ 的一个文件。该服务器具有 $u_s = 30 "Mbit/s"$ 的上传速率；每个对等方的下载速率 $d_i = 2 "Mbit/s"$，上传速率为 $u$。请分别针对客户/服务器分发模式和P2P分发模式，对于 $N = 10$、100和1000以及 $u = 500 "kbit/s"$、1 Mbit/s和2 Mbit/s的每种组合，绘制最小分发时间图表。（注：$"k" = 10^3$，$"M" = 10^6$，$"G" = 10^9$）]

#question[简述TCP客户程序与TCP服务器程序的Socket API基本函数调用过程。]

#question[简述UDP客户程序与UDP服务器程序的Socket API基本函数调用过程。]
