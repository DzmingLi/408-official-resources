// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：电子邮件

== SMTP协议与POP3协议

#question(label: n => [2012 40])[
若用户1与用户2之间发送和接收电子邮件的过程如下图所示，则图中
①、②、③阶段分别使用的应用层协议可以是

#align(center)[
  #cetz.canvas(length: 0.61cm, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    // 同源图标：Microsoft Visio 2007 的等距投影模板。
    // PC: https://www.graffletopia.com/stencils/529
    // Server: https://www.graffletopia.com/stencils/523
    let pc(x) = content(
      (x, 1.36),
      image("../../../../assets/network/visio-2007-isometric-pc.png", width: 0.88cm),
    )

    let server(x) = content(
      (x, 1.36),
      image("../../../../assets/network/visio-2007-isometric-server.png", width: 0.88cm),
    )

    let numbered-arrow(x1, x2, n) = {
      line(
        (x1, 1.38), (x2, 1.38),
        stroke: 0.62pt,
        mark: (end: ">", fill: black, scale: 0.72),
      )
      circle(((x1 + x2) / 2, 1.38), radius: 0.27, fill: white, stroke: 0.58pt)
      content(((x1 + x2) / 2, 1.38), text(size: 0.72em)[#n])
    }

    hide(rect((-0.15, 0.25), (14.15, 3.55), stroke: none), bounds: true)
    numbered-arrow(1.78, 3.70, [1])
    numbered-arrow(5.25, 8.14, [2])
    numbered-arrow(9.70, 12.24, [3])
    pc(0.90)
    server(4.48)
    server(8.92)
    pc(13.10)
    content((0.90, 2.72), text(size: 0.72em)[用户1])
    content((4.48, 3.05), text(size: 0.72em)[#stack(dir: ttb, spacing: 0.25em, [用户1的], [邮件服务器])])
    content((8.92, 3.05), text(size: 0.72em)[#stack(dir: ttb, spacing: 0.25em, [用户2的], [邮件服务器])])
    content((13.10, 2.72), text(size: 0.72em)[用户2])
  })
]

#choices(
  [SMTP、SMTP、SMTP],
  [POP3、SMTP、POP3],
  [POP3、SMTP、SMTP],
  [SMTP、SMTP、POP3],
)
]

#question(label: n => [2013 40])[
下列关于 SMTP 协议的叙述中，正确的是

I. 只支持传输7比特 ASC II码内容

Ⅱ. 支持在邮件服务器之间发送邮件

Ⅲ. 支持从用户代理向邮件服务器发送邮件

Ⅳ. 支持从邮件服务器向用户代理发送邮件

#choices(
  [仅Ⅰ、Ⅱ和Ⅲ],
  [仅Ⅰ、Ⅱ和Ⅳ],
  [仅Ⅰ、Ⅲ和Ⅳ],
  [仅Ⅱ、Ⅲ和Ⅳ],
)
]

#question(label: n => [2018 40])[
无须转换即可由 SMTP 协议直接传输的内容是

#choices([JPEG 图像], [MPEG 视频], [EXE 文件], [ASCII 文本])
]

#question(label: n => [2025 40])[
下列关于 POP3 协议的叙述中，正确的是

Ⅰ．支持用户代理从邮件服务器读取邮件\
Ⅱ．支持用户代理向邮件服务器发送邮件\
Ⅲ．支持邮件服务器之间发送与接收邮件\
Ⅳ．支持通过一条 TCP 连接收取多封邮件

#choices([仅Ⅰ、Ⅳ],[仅Ⅱ、Ⅲ],[仅Ⅰ、Ⅱ、Ⅲ],[仅Ⅰ、Ⅲ、Ⅳ])
]
