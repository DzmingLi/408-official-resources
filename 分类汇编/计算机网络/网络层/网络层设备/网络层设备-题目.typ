// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：网络层设备

== 路由器的组成和功能

#question(label: n => [2010 38])[
下列网络设备中，能够抑制广播风暴的是

#statements(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 0.6em,
  [I. 中继器], [II. 集线器], [III. 网桥], [IV. 路由器],
)

#choices(
  [仅Ⅰ和Ⅱ],
  [仅Ⅲ],
  [仅Ⅲ和Ⅳ],
  [仅Ⅳ],
)
]

#question(label: n => [2012 37])[
下列关于 IP 路由器功能的描述中，正确的是

I. 运行路由协议，设置路由表

Ⅱ. 监测到拥塞时，合理丢弃 IP 分组

Ⅲ. 对收到的 IP 分组头进行差错校验，确保传输的 IP 分组不丢失

Ⅳ. 根据收到的 IP 分组的目的 IP 地址，将其转发到合适的输出线路上

#choices(
  [仅Ⅲ、Ⅳ],
  [仅Ⅰ、Ⅱ、Ⅲ],
  [仅Ⅰ、Ⅱ、Ⅳ],
  [I、Ⅱ、Ⅲ、Ⅳ],
)
]

#question(label: n => [2016 33])[
原卷题33～41共用下图，本题仍依据该图回答。

#figure(image("../../../../历年真题+参考解答/2016/official-images/q33-41.png",width:29em),caption:[2016年题33～41图],kind:image)

在OSI参考模型中，R1、Switch、Hub实现的最高功能层分别是
#choices([2,2,1], [2,2,2], [3,2,1], [3,2,2])
]

== 路由表与分组转发

#question(label: n => [2009 47])[
（9分）某网络拓扑如下页图所示，路由器R1通过接口E1、E2分别连接局域网1、局域网2，通过接口L0连接路由器R2，并通过路由器R2连接域名服务器与互联网。R1的
L0接口的IP地址是202.118.2.1；R2的L0接口的IP地址是202.118.2.2，L1接口的IP地址是130.11.120.1，E0接口的IP地址是202.118.3.1；域名服务器的IP地址

是202.118.3.2。

#align(center)[
  #cetz.canvas(length: 0.82cm, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let cloud-path(cx, cy, fill: white, stroke: 0.55pt) = merge-path({
      bezier((cx - 1.45, cy - 0.04), (cx - 1.18, cy + 0.32), (cx - 1.43, cy + 0.18), (cx - 1.35, cy + 0.34))
      bezier((cx - 1.18, cy + 0.32), (cx - 0.72, cy + 0.48), (cx - 1.02, cy + 0.50), (cx - 0.86, cy + 0.52))
      bezier((cx - 0.72, cy + 0.48), (cx - 0.15, cy + 0.56), (cx - 0.52, cy + 0.64), (cx - 0.30, cy + 0.63))
      bezier((cx - 0.15, cy + 0.56), (cx + 0.36, cy + 0.50), (cx + 0.02, cy + 0.70), (cx + 0.23, cy + 0.65))
      bezier((cx + 0.36, cy + 0.50), (cx + 0.86, cy + 0.46), (cx + 0.57, cy + 0.64), (cx + 0.76, cy + 0.60))
      bezier((cx + 0.86, cy + 0.46), (cx + 1.28, cy + 0.27), (cx + 1.10, cy + 0.52), (cx + 1.28, cy + 0.43))
      bezier((cx + 1.28, cy + 0.27), (cx + 1.46, cy - 0.06), (cx + 1.48, cy + 0.18), (cx + 1.50, cy + 0.04))
      bezier((cx + 1.46, cy - 0.06), (cx + 1.19, cy - 0.35), (cx + 1.45, cy - 0.25), (cx + 1.35, cy - 0.38))
      bezier((cx + 1.19, cy - 0.35), (cx + 0.72, cy - 0.43), (cx + 1.02, cy - 0.52), (cx + 0.84, cy - 0.52))
      bezier((cx + 0.72, cy - 0.43), (cx + 0.20, cy - 0.50), (cx + 0.51, cy - 0.57), (cx + 0.34, cy - 0.58))
      bezier((cx + 0.20, cy - 0.50), (cx - 0.35, cy - 0.50), (cx + 0.02, cy - 0.66), (cx - 0.18, cy - 0.64))
      bezier((cx - 0.35, cy - 0.50), (cx - 0.83, cy - 0.42), (cx - 0.56, cy - 0.60), (cx - 0.72, cy - 0.56))
      bezier((cx - 0.83, cy - 0.42), (cx - 1.24, cy - 0.33), (cx - 1.05, cy - 0.53), (cx - 1.23, cy - 0.47))
      bezier((cx - 1.24, cy - 0.33), (cx - 1.45, cy - 0.04), (cx - 1.43, cy - 0.30), (cx - 1.49, cy - 0.17))
    }, close: true, fill: fill, stroke: stroke)

    let label(x, y, body, anchor: "center", size: 0.74em) = content(
      (x, y), text(size: size)[#body], anchor: anchor,
    )

    let router(x, y, name) = {
      content((x, y), box(fill: white, inset: 0pt)[
        #image("../../../../历年真题+参考解答/2009/assets/router-symbol.svg",
          width: 1.05cm, height: 1.424cm, fit: "stretch")
      ])
      label(x, y + 1.05, name, size: 0.86em)
    }

    hide(rect((-0.25, -0.30), (16.25, 5.10), stroke: none), bounds: true)

    // 先画连线，使端点被设备符号自然遮住。
    line((2.30, 3.68), (2.30, 2.65), (5.60, 2.65), stroke: 0.55pt)
    line((6.68, 2.65), (10.22, 2.65), stroke: 0.55pt)
    line((10.75, 3.08), (12.52, 3.08), stroke: 0.55pt)
    line((6.10, 2.15), (6.10, 0.72), (2.15, 0.72), stroke: 0.55pt)

    // 互联网云及其阴影。
    cloud-path(2.40, 4.28, fill: luma(52%), stroke: none)
    cloud-path(2.27, 4.41, fill: luma(92%), stroke: 0.55pt)
    label(2.27, 4.40, [互联网], size: 0.86em)

    // 两个局域网的椭圆边界。
    circle((13.80, 3.08), radius: (1.48, 0.34), fill: white, stroke: 0.55pt)
    circle((13.80, 2.05), radius: (1.48, 0.34), fill: white, stroke: 0.55pt)
    label(13.80, 3.08, [局域网1], size: 0.82em)
    label(13.80, 2.05, [局域网2], size: 0.82em)

    router(6.10, 2.65, [R2])
    router(10.75, 2.65, [R1])

    // E2 线压住两端边框极小距离：左端接 R1，右端不明显伸入椭圆。
    line((11.10, 2.05), (12.34, 2.05), stroke: 0.55pt)

    // 原图是完全正视的 CRT、卧式机箱与独立键盘，不采用透视 PC 图标。
    content((2.15, 0.64), box(fill: white, inset: 0pt)[
      #image("../../../../历年真题+参考解答/2009/assets/pc-symbol.svg",
        width: 0.82cm, height: 0.70cm, fit: "contain")
    ])

    label(5.40, 2.98, [L1], anchor: "east")
    label(5.45, 2.28, [130.11.120.1], anchor: "east")
    label(6.80, 3.12, [L0], anchor: "west")
    label(6.80, 2.82, [202.118.2.2], anchor: "west")
    label(10.02, 2.16, [L0], anchor: "east")
    label(10.02, 1.74, [202.118.2.1], anchor: "east")
    label(11.48, 3.48, [E1], anchor: "west")
    label(11.48, 2.40, [E2], anchor: "west")
    label(5.82, 1.62, [E0], anchor: "east")
    label(5.82, 1.26, [202.118.3.1], anchor: "east")
    label(2.72, 0.52, [202.118.3.2], anchor: "west")
    label(2.15, -0.08, [域名服务器], size: 0.82em)
  })
]

R1和R2的路由表结构为：

#figure(
  align(center)[#table(
    columns: (9.5em, 9.5em, 9.5em, 9.5em),
    align: center + horizon,
    [目的网络IP地址], [子网掩码], [下一跳IP地址], [接口],
  )]
  , kind: table
  )

#subquestions[
+ 
  将IP地址空间202.118.1.0/24划分为2个子网，分别分配给局域网1、局域网2，每个局域网需分配的IP地址数不少于120个。请给出子网划分结果，说明理由或给出必要的计算过程。
  \
+ 
  请给出R1的路由表，使其明确包括到局域网1的路由、局域网2的路由、域名服务器的主机路由和互联网的路由。
  \
+ 
  请采用路由聚合技术，给出R2到局域网1和局域网2的路由。
    
]
]

#question(label: n => [2011 37])[
某网络拓扑如下图所示，路由器R1只有到达子网192.168.1.0/24的路由。为使R1可以将IP分组正确地路由到图中所有子网，则在R1中需要增加的一条路由（目的网络，子网掩码，下一跳）是

#align(center)[
  #cetz.canvas(length: 0.90cm, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    let cloud-path(cx, cy, sx: 1, sy: 1, fill: white, stroke: 0.55pt) = merge-path({
      bezier((cx - 1.45 * sx, cy - 0.04 * sy), (cx - 1.18 * sx, cy + 0.32 * sy), (cx - 1.43 * sx, cy + 0.18 * sy), (cx - 1.35 * sx, cy + 0.34 * sy))
      bezier((cx - 1.18 * sx, cy + 0.32 * sy), (cx - 0.72 * sx, cy + 0.48 * sy), (cx - 1.02 * sx, cy + 0.50 * sy), (cx - 0.86 * sx, cy + 0.52 * sy))
      bezier((cx - 0.72 * sx, cy + 0.48 * sy), (cx - 0.15 * sx, cy + 0.56 * sy), (cx - 0.52 * sx, cy + 0.64 * sy), (cx - 0.30 * sx, cy + 0.63 * sy))
      bezier((cx - 0.15 * sx, cy + 0.56 * sy), (cx + 0.36 * sx, cy + 0.50 * sy), (cx + 0.02 * sx, cy + 0.70 * sy), (cx + 0.23 * sx, cy + 0.65 * sy))
      bezier((cx + 0.36 * sx, cy + 0.50 * sy), (cx + 0.86 * sx, cy + 0.46 * sy), (cx + 0.57 * sx, cy + 0.64 * sy), (cx + 0.76 * sx, cy + 0.60 * sy))
      bezier((cx + 0.86 * sx, cy + 0.46 * sy), (cx + 1.28 * sx, cy + 0.27 * sy), (cx + 1.10 * sx, cy + 0.52 * sy), (cx + 1.28 * sx, cy + 0.43 * sy))
      bezier((cx + 1.28 * sx, cy + 0.27 * sy), (cx + 1.46 * sx, cy - 0.06 * sy), (cx + 1.48 * sx, cy + 0.18 * sy), (cx + 1.50 * sx, cy + 0.04 * sy))
      bezier((cx + 1.46 * sx, cy - 0.06 * sy), (cx + 1.19 * sx, cy - 0.35 * sy), (cx + 1.45 * sx, cy - 0.25 * sy), (cx + 1.35 * sx, cy - 0.38 * sy))
      bezier((cx + 1.19 * sx, cy - 0.35 * sy), (cx + 0.72 * sx, cy - 0.43 * sy), (cx + 1.02 * sx, cy - 0.52 * sy), (cx + 0.84 * sx, cy - 0.52 * sy))
      bezier((cx + 0.72 * sx, cy - 0.43 * sy), (cx + 0.20 * sx, cy - 0.50 * sy), (cx + 0.51 * sx, cy - 0.57 * sy), (cx + 0.34 * sx, cy - 0.58 * sy))
      bezier((cx + 0.20 * sx, cy - 0.50 * sy), (cx - 0.35 * sx, cy - 0.50 * sy), (cx + 0.02 * sx, cy - 0.66 * sy), (cx - 0.18 * sx, cy - 0.64 * sy))
      bezier((cx - 0.35 * sx, cy - 0.50 * sy), (cx - 0.83 * sx, cy - 0.42 * sy), (cx - 0.56 * sx, cy - 0.60 * sy), (cx - 0.72 * sx, cy - 0.56 * sy))
      bezier((cx - 0.83 * sx, cy - 0.42 * sy), (cx - 1.24 * sx, cy - 0.33 * sy), (cx - 1.05 * sx, cy - 0.53 * sy), (cx - 1.23 * sx, cy - 0.47 * sy))
      bezier((cx - 1.24 * sx, cy - 0.33 * sy), (cx - 1.45 * sx, cy - 0.04 * sy), (cx - 1.43 * sx, cy - 0.30 * sy), (cx - 1.49 * sx, cy - 0.17 * sy))
    }, close: true, fill: fill, stroke: stroke)

    let cloud(cx, cy, sx: 1, sy: 1) = {
      cloud-path(cx + 0.12, cy - 0.11, sx: sx, sy: sy, fill: luma(60%), stroke: none)
      cloud-path(cx, cy, sx: sx, sy: sy, fill: luma(96%), stroke: 0.55pt)
    }

    hide(rect((0, 0.40), (14.40, 5.60), stroke: none), bounds: true)

    // Draw the links first so the clouds and router symbols mask their ends.
    line((7.20, 5.03), (7.20, 4.02), stroke: 0.58pt)
    line((7.20, 2.76), (7.20, 1.82), stroke: 0.58pt)
    line((4.17, 1.50), (6.66, 1.50), stroke: 0.58pt)
    line((7.74, 1.50), (10.23, 1.50), stroke: 0.58pt)

    cloud(7.20, 3.38, sx: 1.20, sy: 1.02)
    cloud(2.15, 1.25, sx: 1.35, sy: 1.04)
    cloud(12.25, 1.25, sx: 1.35, sy: 1.04)

    content((7.20, 5.05), box(inset: 0pt)[
      #image("../../../../历年真题+参考解答/2011/assets/router-symbol.svg", width: 1.04cm, height: 0.73cm)
    ])
    content((7.20, 1.50), box(inset: 0pt)[
      #image("../../../../历年真题+参考解答/2011/assets/router-symbol.svg", width: 1.04cm, height: 0.73cm)
    ])

    content((6.50, 5.43), text(size: 0.82em)[R1])
    content((7.72, 4.48), text(size: 0.78em)[192.168.1.1], anchor: "west")
    content((7.20, 3.38), text(size: 0.84em)[192.168.1.0/24])
    content((6.48, 2.12), text(size: 0.82em)[R2])
    content((7.72, 2.42), text(size: 0.78em)[192.168.1.2], anchor: "west")
    content((2.15, 1.25), text(size: 0.84em)[192.168.2.0/25])
    content((12.25, 1.25), text(size: 0.84em)[192.168.2.128/25])
    content((5.35, 1.05), text(size: 0.78em)[192.168.2.1])
    content((9.05, 1.05), text(size: 0.78em)[192.168.2.130])
  })
]

#choices(
  [192.168.2.0，255.255.255.128，192.168.1.1],
  [192.168.2.0，255.255.255.0，192.168.1.1],
  [192.168.2.0，255.255.255.128，192.168.1.2],
  [192.168.2.0，255.255.255.0，192.168.1.2],
)
]

#question(label: n => [2013 47])[
（9分）假设Internet的两个自治系统构成的网络如题47图所示，自治系统AS1由路由器R1连接两个子网构成；自治系统AS2由路由器R2、R3互联并连接3个子网构成。各子网地址、R2的接口名、R1与R3的部分接口IP地址如题47图所示。

#figure(
  align(center)[
    #cetz.canvas({
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

      hide(rect((0, 0), (14.4, 5.70), stroke: none), bounds: true)

      // Links are drawn first so that the subnet and router symbols mask
      // their endpoints, as in the printed figure.
      line((3.70, 5.00), (10.70, 5.00), stroke: 0.065em)
      line((7.00, 2.82), (10.70, 2.82), stroke: 0.065em)
      line((3.70, 0.65), (10.70, 0.65), stroke: 0.065em)
      line((7.00, 0.65), (7.00, 5.00), stroke: 0.065em)

      circle((1.95, 5.00), radius: (1.75, 0.38), fill: white, stroke: 0.065em)
      circle((12.45, 5.00), radius: (1.75, 0.38), fill: white, stroke: 0.065em)
      circle((12.45, 2.82), radius: (1.75, 0.38), fill: white, stroke: 0.065em)
      circle((1.95, 0.65), radius: (1.75, 0.38), fill: white, stroke: 0.065em)
      circle((12.45, 0.65), radius: (1.75, 0.38), fill: white, stroke: 0.065em)

      content((7.00, 5.00), box(inset: 0pt)[
        #image("../../../../历年真题+参考解答/2013/assets/router-symbol.svg", width: 1.05cm, height: 0.75cm)
      ])
      content((7.00, 2.82), box(inset: 0pt)[
        #image("../../../../历年真题+参考解答/2013/assets/router-symbol.svg", width: 1.05cm, height: 0.75cm)
      ])
      content((7.00, 0.65), box(inset: 0pt)[
        #image("../../../../历年真题+参考解答/2013/assets/router-symbol.svg", width: 1.05cm, height: 0.75cm)
      ])

      content((1.95, 5.00), text(size: 0.90em)[153.14.5.0/25])
      content((12.45, 5.00), text(size: 0.90em)[153.14.5.128/25])
      content((12.45, 2.82), text(size: 0.90em)[194.17.20.128/25])
      content((1.95, 0.65), text(size: 0.90em)[194.17.20.0/25])
      content((12.45, 0.65), text(size: 0.90em)[194.17.21.0/24])

      content((0.28, 5.57), text(size: 0.90em, weight: "semibold")[AS1], anchor: "west")
      content((0.28, 1.63), text(size: 0.90em, weight: "semibold")[AS2], anchor: "west")
      content((6.50, 5.56), text(size: 0.90em, weight: "semibold")[R1])
      content((6.50, 3.38), text(size: 0.90em, weight: "semibold")[R2])
      content((6.50, 1.21), text(size: 0.90em, weight: "semibold")[R3])

      content((7.47, 4.35), text(size: 0.82em)[153.14.3.2], anchor: "west")
      content((7.24, 3.37), text(size: 0.82em)[S0])
      content((7.70, 3.12), text(size: 0.82em)[E0])
      content((7.24, 2.27), text(size: 0.82em)[S1])
      content((7.47, 1.70), text(size: 0.82em)[194.17.24.2], anchor: "west")
    })
  ],
  kind: image,
  caption: [题47图　网络拓扑结构],
  numbering: none,
)

请回答下列问题。

#subquestions[
+ 
  假设路由表结构如下表所示。请利用路由聚合技术，给出R2的路由表，要求包括到达题47图中所有子网的路由，且路由表中的路由项尽可能少。
  
  #figure(
    align(center)[#table(
      columns: (17fr, 13.5fr, 7fr),
      align: center + horizon,
      [目的网络], [下一跳], [接口],
    )]
    , kind: table
    )
  \
+ 
  若R2收到一个目的IP地址为194.17.20.200的IP分组，R2会通过哪个接口转发该IP分组？
  \
+ 
  R1与R2之间利用哪个路由协议交换路由信息？该路由协议的报文被封装到哪个协议的分组中进行传输？
    
]
]

#pagebreak(weak: true)

#question(label: n => [2014 43])[
原卷第42题的共用背景（仅附题干与图表，不收录其小问）：

某网络中的路由器运行OSPF路由协议，题42表是路由器R1维护的主要链路状态信息（LSI），题42图是根据题42表及R1的接口名构造出来的网络拓扑。

#{
  set figure.caption(position: top)
  figure(
    kind: table,
    caption: [题42表　R1所维护的LSI],
    numbering: none,
  )[
  #text(size: 0.8em)[
  #table(
    columns: (0.7fr, 0.75fr, 1.1fr, 1.1fr, 1.1fr, 1.1fr, 2.25fr),
    align: center + horizon,
    stroke: 0.6pt,
    table.cell(colspan: 2)[],
    [R1的LSI], [R2的LSI], [R3的LSI], [R4的LSI], [备注],

    table.cell(colspan: 2)[Router ID],
    [10.1.1.1], [10.1.1.2], [10.1.1.5], [10.1.1.6], [标识路由器的IP地址],

    table.cell(rowspan: 3)[Link1],
    [ID], [10.1.1.2], [10.1.1.1], [10.1.1.6], [10.1.1.5], [所连路由器的Router ID],
    [IP], [10.1.1.1], [10.1.1.2], [10.1.1.5], [10.1.1.6], [Link1的本地IP地址],
    [Metric], [3], [3], [6], [6], [Link1的费用],

    table.cell(rowspan: 3)[Link2],
    [ID], [10.1.1.5], [10.1.1.6], [10.1.1.1], [10.1.1.2], [所连路由器的Router ID],
    [IP], [10.1.1.9], [10.1.1.13], [10.1.1.10], [10.1.1.14], [Link2的本地IP地址],
    [Metric], [2], [4], [2], [4], [Link2的费用],

    table.cell(rowspan: 2)[Net1],
    [Prefix], [192.1.1.0/24], [192.1.6.0/24], [192.1.5.0/24], [192.1.7.0/24], [直连网络Net1的网络前缀],
    [Metric], [1], [1], [1], [1], [到达直连网络Net1的费用],
    )
  ]
  ]
}
#figure(
  align(center)[
    #cetz.canvas({
      import cetz.draw: *
      set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    
      let cloud-path(cx, cy, fill: white, stroke: 0.6pt) = merge-path({
        bezier((cx - 1.45, cy - 0.05), (cx - 1.18, cy + 0.32), (cx - 1.43, cy + 0.18), (cx - 1.35, cy + 0.34))
        bezier((cx - 1.18, cy + 0.32), (cx - 0.72, cy + 0.48), (cx - 1.02, cy + 0.50), (cx - 0.86, cy + 0.52))
        bezier((cx - 0.72, cy + 0.48), (cx - 0.15, cy + 0.56), (cx - 0.52, cy + 0.64), (cx - 0.30, cy + 0.63))
        bezier((cx - 0.15, cy + 0.56), (cx + 0.36, cy + 0.50), (cx + 0.02, cy + 0.70), (cx + 0.23, cy + 0.65))
        bezier((cx + 0.36, cy + 0.50), (cx + 0.86, cy + 0.46), (cx + 0.57, cy + 0.64), (cx + 0.76, cy + 0.60))
        bezier((cx + 0.86, cy + 0.46), (cx + 1.28, cy + 0.27), (cx + 1.10, cy + 0.52), (cx + 1.28, cy + 0.43))
        bezier((cx + 1.28, cy + 0.27), (cx + 1.46, cy - 0.06), (cx + 1.48, cy + 0.18), (cx + 1.50, cy + 0.04))
        bezier((cx + 1.46, cy - 0.06), (cx + 1.19, cy - 0.35), (cx + 1.45, cy - 0.25), (cx + 1.35, cy - 0.38))
        bezier((cx + 1.19, cy - 0.35), (cx + 0.72, cy - 0.43), (cx + 1.02, cy - 0.52), (cx + 0.84, cy - 0.52))
        bezier((cx + 0.72, cy - 0.43), (cx + 0.20, cy - 0.50), (cx + 0.51, cy - 0.57), (cx + 0.34, cy - 0.58))
        bezier((cx + 0.20, cy - 0.50), (cx - 0.35, cy - 0.50), (cx + 0.02, cy - 0.66), (cx - 0.18, cy - 0.64))
        bezier((cx - 0.35, cy - 0.50), (cx - 0.83, cy - 0.42), (cx - 0.56, cy - 0.60), (cx - 0.72, cy - 0.56))
        bezier((cx - 0.83, cy - 0.42), (cx - 1.24, cy - 0.33), (cx - 1.05, cy - 0.53), (cx - 1.23, cy - 0.47))
        bezier((cx - 1.24, cy - 0.33), (cx - 1.45, cy - 0.05), (cx - 1.43, cy - 0.30), (cx - 1.49, cy - 0.17))
      }, close: true, fill: fill, stroke: stroke)
    
      let cloud(cx, cy, label) = {
        cloud-path(cx + 0.10, cy - 0.13, fill: luma(55%), stroke: none)
        cloud-path(cx, cy, fill: luma(95%), stroke: 0.55pt)
        content((cx, cy), [#text(size: 0.82em, weight: "semibold")[#label]])
      }
    
      let router(x, y, label) = {
        content((x, y), box(fill: white, inset: 0pt)[
          #image("../../../../历年真题+参考解答/2014/assets/router-symbol.svg",
            width: 0.82cm, height: 0.82cm, fit: "stretch")
        ])
        content((x, y - 0.25), [#text(size: 0.86em)[#label]])
      }
    
      let label(x, y, body, anchor: "center") = content(
        (x, y), [#text(size: 0.72em)[#body]], anchor: anchor,
      )
    
      hide(rect((-0.2, -0.2), (14.2, 4.2), stroke: none), bounds: true)
      line((2.65, 3.55), (4.32, 3.55), stroke: 0.55pt)
      line((5.08, 3.55), (9.32, 3.55), stroke: 0.55pt)
      line((10.08, 3.55), (11.35, 3.55), stroke: 0.55pt)
      line((2.65, 0.45), (4.32, 0.45), stroke: 0.55pt)
      line((5.08, 0.45), (9.32, 0.45), stroke: 0.55pt)
      line((10.08, 0.45), (11.35, 0.45), stroke: 0.55pt)
      line((4.70, 3.19), (4.70, 0.81), stroke: 0.55pt)
      line((9.70, 3.19), (9.70, 0.81), stroke: 0.55pt)
    
      cloud(1.35, 3.55, [192.1.1.0/24])
      cloud(12.65, 3.55, [192.1.6.0/24])
      cloud(1.35, 0.45, [192.1.5.0/24])
      cloud(12.65, 0.45, [192.1.7.0/24])
      router(4.70, 3.55, [R1])
      router(9.70, 3.55, [R2])
      router(4.70, 0.45, [R3])
      router(9.70, 0.45, [R4])
    
      label(4.22, 3.94, [E0])
      label(4.97, 4.08, [L0])
      label(5.18, 3.78, [10.1.1.1], anchor: "west")
      label(9.24, 3.78, [10.1.1.2], anchor: "east")
      label(3.72, 3.28, [1])
      label(7.20, 3.28, [3])
      label(10.72, 3.78, [1])
    
      label(4.96, 3.02, [L1], anchor: "west")
      label(5.14, 2.72, [10.1.1.9], anchor: "west")
      label(4.48, 2.00, [2])
      label(10.14, 3.02, [10.1.1.13], anchor: "west")
      label(9.48, 2.00, [4])
    
      label(5.14, 0.98, [10.1.1.10], anchor: "west")
      label(5.16, 0.18, [10.1.1.5], anchor: "west")
      label(3.72, 0.18, [1])
      label(7.20, 0.78, [6])
      label(9.24, 0.18, [10.1.1.6], anchor: "east")
      label(10.14, 0.98, [10.1.1.14], anchor: "west")
      label(10.72, 0.18, [1])
    })
  ],
  kind: image,
  caption: [题42图　R1构造的网络拓扑],
  numbering: none,
)



（9分）请根据题42描述的网络，继续回答下列问题。

#subquestions[
+ 
  假设路由表结构如下表所示，请给出题42图中R1的路由表，要求包括到达题42图中子网192.1.x.x的路由，且路由表中的路由项尽可能少。
  
  #figure(
    align(center)[#table(
      columns: (17fr, 13.5fr, 7fr),
      align: center + horizon,
      [目的网络], [下一跳], [接口],
    )]
    , kind: table
    )
  \
+ 
  当主机192.1.1.130向主机192.1.7.211发送一个TTL=64的IP分组时，R1通过哪个接口转发该IP分组？主机192.1.7.211收到的IP分组的TTL是多少？
  \
+ 
  若R1增加一条Metric为10的链路连接Internet，则题42表中R1的LSI需要增加哪些信息？
  
    
]
]

#block(breakable: false)[#question(label: n => [2015 38])[
某路由器的路由表如下表所示：

#figure(
  kind: table,
  numbering: none,
  align(center)[#table(
    columns: (1.7fr, 1.5fr, 0.7fr),
    align: center + horizon,
    [目的网络], [下一跳], [接口],
    [169.96.40.0/23], [176.1.1.1], [S1],
    [169.96.40.0/25], [176.2.2.2], [S2],
    [169.96.40.0/27], [176.3.3.3], [S3],
    [0.0.0.0/0], [176.4.4.4], [S4],
  )]
)

若路由器收到一个目的地址为169.96.40.5的IP分组，则转发该IP分组的接口是

#choices([S1], [S2], [S3], [S4])
]]

#question(label: n => [2019 47])[
（9分）某网络拓扑如题47图所示，其中 R 为路由器，主机 H1～H4 的 IP 地址配置以及 R 的各接口 IP 地址配置如图中所示。现有若干台以太网交换机（无 VLAN 功能）和路由器两类网络互连设备可供选择。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.06em)
    line((6.4, 18), (15, 18), (15, 12.3))
    line((13.7, 11), (5, 11), (5, 6.3))
    line((16.3, 11), (25, 11), (25, 6.3))
    line((3.7, 4.9), (0, 1.6))
    line((6.3, 4.9), (10, 1.6))
    line((23.7, 4.9), (20, 1.6))
    line((26.3, 4.9), (30, 1.6))
    // Internet 云与路由器。
    merge-path({
      bezier((-0.8, 17.4), (-1.0, 19), (-2, 17.7), (-2, 18.8))
      bezier((-1.0, 19), (1, 19.7), (-0.8, 20), (0.3, 20.2))
      bezier((1, 19.7), (3.4, 19.6), (1.7, 20.4), (2.8, 20.1))
      bezier((3.4, 19.6), (5.6, 18.8), (4.6, 20.1), (5.8, 19.7))
      bezier((5.6, 18.8), (6.4, 17.7), (6.8, 18.8), (6.9, 18))
      bezier((6.4, 17.7), (4.5, 16.7), (6.2, 16.6), (5.3, 16.2))
      bezier((4.5, 16.7), (2.3, 16.5), (3.8, 16.1), (2.8, 16))
      bezier((2.3, 16.5), (-0.8, 17.4), (1, 16), (-0.5, 16.3))
    }, close: true, fill: luma(85%))
    content((2.3, 18), [Internet])
    merge-path({
      line((13.6, 18.5), (13.6, 17.2))
      bezier((13.6, 17.2), (16.4, 17.2), (13.6, 16.1), (16.4, 16.1))
      line((16.4, 17.2), (16.4, 18.5))
    }, close: true, fill: luma(85%))
    circle((15, 18.5), radius: (1.4, 0.75), fill: white)
    for (a, b) in (((14.1, 18.8), (15.1, 18.3)), ((15.1, 18.4), (16, 18.9)),
      ((15.9, 18.2), (15, 18.7)), ((14.9, 18.6), (14, 18.1))) {
      line(a, b, stroke: 0.11em, mark: (end: ">", fill: black, scale: 0.65))
    }
    content((15, 17.3), [R])
    content((13.2, 18.7), [101.1.2.10], anchor: "east")
    content((15.3, 15.7), [192.168.1.253/30], anchor: "west")
    for (x, y, i) in ((15, 11, 1), (5, 5.3, 2), (25, 5.3, 3)) {
      rect((x - 1.7, y - 1.3), (x + 1.7, y + 1.3), fill: luma(85%))
      content((x, y + 0.1), [设备#i])
      content((x + 0.25, y + 1.9), [IF1], anchor: "west")
      content((x - 1.9, y + 0.7), [IF2], anchor: "east")
      content((x + 1.9, y + 0.7), [IF3], anchor: "west")
    }
    for (i, x, ip, gw) in ((1, 0, [192.168.1.2/26], [192.168.1.1]),
      (2, 10, [192.168.1.3/26], [192.168.1.1]),
      (3, 20, [192.168.1.66/26], [192.168.1.65]),
      (4, 30, [192.168.1.67/26], [192.168.1.65])) {
      rect((x - 0.9, 0.35), (x + 0.9, 1.65), fill: white)
      rect((x - 0.7, 0.55), (x + 0.7, 1.45))
      rect((x - 0.95, -0.1), (x + 0.95, 0.3), fill: white)
      line((x - 1.15, -0.1), (x + 1.15, -0.1), (x + 1.45, -0.5), (x - 1.45, -0.5), close: true, fill: black)
      content((x + 1.3, 1), [H#i], anchor: "west")
      content((x, -1.4), text(size: 0.78em)[IP地址：#ip])
      content((x, -2.5), text(size: 0.78em)[默认网关：#gw])
    }
  }),
  caption: [题47图], numbering: none,
)

请回答下列问题。

#subquestions[
+ 设备1、设备2和设备3分别应选择什么类型网络设备？
+ 设备1、设备2和设备3中，哪几个设备的接口需要配置 IP 地址？并为对应的接口配置正确的 IP 地址。
+ 为确保主机 H1～H4 能够访问 Internet，R 需要提供什么服务？
+ 若主机 H3 发送一个目的地址为192.168.1.127的 IP 数据报，网络中哪几个主机会接收该数据报？

]
]

#question(label: n => [2026 37])[
某网络在 $t_0$ 时刻的网络拓扑以及 R1 的路由表如下图所示，R1～R4 为路由器，基于链路状态路由算法计算路由，S0～S4 为 R1 的接口，链路上的数值为链路费用。若 $t_1(t_1>t_0)$ 时刻 R1 检测到连接 R1 和 R2 的链路断开，则 R1 经过重新计算路由并进行充分路由聚合后的路由表中路由项（入口）的数量是
#align(center, image("../../../../历年真题+参考解答/2026/official-images/q37.png", width: 28em))
#figure(table(columns: (11em, 4em), align: center,
 [目的网络], [接口], [199.10.20.0/27], [S1], [199.10.20.32/27], [S2],
 [199.10.20.64/26], [S3], [199.10.20.128/25], [S3], [199.10.21.125/32], [S4], [0.0.0.0/0], [S0]), kind: table, caption: [R1路由表])
#choices([3], [4], [5], [6])
]

#question(label: n => [旧版题型示例])[
考虑某路由器具有下列路由表项：

#table(
  columns: (1.4fr, 1fr),
  align: center + horizon,
  [网络前缀], [下一跳],
  [142.150.64.0/24], [A],
  [142.150.71.128/28], [B],
  [142.150.71.128/30], [C],
  [142.150.0.0/16], [D],
)

#subquestions[
+ 假设路由器接收到一个目的地址为142.150.71.132的 IP 分组，请确定该路由器为该 IP 分组选择的下一跳，并解释说明。
+ 在上面的路由表中增加一条路由表项，该路由表项使以142.150.71.132为目的地址的 IP 分组选择“A”作为下一跳，而不影响其他目的地址的 IP 分组转发。
+ 在上面的路由表中增加一条路由表项，使所有目的地址与该路由表中任何路由表项都不匹配的 IP 分组被转发到下一跳“E”。
+ 将142.150.64.0/24划分为4个规模尽可能大的等长子网，给出子网掩码及每个子网的可分配地址范围。

]
]
