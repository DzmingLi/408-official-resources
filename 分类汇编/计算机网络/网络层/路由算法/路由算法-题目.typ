// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：路由算法

== 距离-向量路由算法

#question(label: n => [2021 37])[
某网络中的所有路由器均采用距离向量路由算法计算路由。若路由器 E 与邻居路由器 A、B、C 和 D 之间的直接链路距离分别是8、10、12和6，且 E 收到邻居路由器的距离向量如下表所示，则路由器 E 更新后的到达目的网络 Net1～Net4 的距离分别是

#align(center,table(columns:(auto,auto,auto,auto,auto),align:center,
  stroke:(x,y)=>if x == 0 or y == 0 {none} else {0.5pt},
  [目的网络],[A 的距离向量],[B 的距离向量],[C 的距离向量],[D 的距离向量],
  [Net1],[1],[23],[20],[22],
  [Net2],[12],[35],[30],[28],
  [Net3],[24],[18],[16],[36],
  [Net4],[36],[30],[8],[24],
))

#choices([9，10，12，6], [9，10，28，20], [9，20，12，20], [9，20，28，20])
]

== 链路状态路由算法

#question(label: n => [2014 42])[
（10分）某网络中的路由器运行OSPF路由协议，题42表是路由器R1维护的主要链路状态信息（LSI），题42图是根据题42表及R1的接口名构造出来的网络拓扑。

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

请回答下列问题。

#subquestions[
+ 本题中的网络可抽象为数据结构中的哪种逻辑结构？
  \
+ 
  针对题42表中的内容，设计合理的链式存储结构，以保存题42表中的链路状态信息（LSI）。要求给出链式存储结构的数据类型定义，并画出对应题42表的链式存储结构示意图（示意图中可仅以ID标识结点）。
  \
+ 
  按照迪杰斯特拉（Dijkstra）算法的策略，依次给出R1到达题42图中子网192.1.x.x的最短路径及费用。
  
    
]
]
