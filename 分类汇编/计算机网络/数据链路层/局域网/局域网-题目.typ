// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 分类汇编：局域网

== 局域网的基本概念与体系结构

#question(label: n => [2020 35])[
下图所示的网络中，冲突域和广播域的个数分别是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.065em)
  let device(x, y, hub: false) = {
    merge-path({line((x - 0.9,y), (x - 0.9,y - 0.6), (x,y - 1.1), (x+0.9,y - 0.6), (x+0.9,y))},close:true,fill:luma(92%))
    merge-path({line((x - 0.9,y), (x,y+0.5), (x+0.9,y), (x,y - 0.5), (x - 0.9,y))}, close: true, fill: luma(94%))
    line((x,y - 0.5), (x,y - 1.1))
    line((x - 0.45,y+0.12), (x+0.45,y - 0.12), mark: (end: ">", scale: 0.6))
    if not hub {line((x+0.45,y+0.22), (x - 0.45,y - 0.02), mark: (end: ">", scale: 0.6))}
  }
  let laptop(x,y) = {
    merge-path({line((x - 0.45,y+0.8),(x+0.4,y+0.5),(x+0.15,y - 0.25),(x - 0.7,y+0.05))},close:true,fill:white)
    merge-path({line((x - 0.7,y+0.05),(x+0.15,y - 0.25),(x+0.6,y - 0.8),(x - 0.35,y - 0.55))},close:true,fill:luma(90%))
  }
  line((3,0),(15,0)); line((3,-0.5),(0,-3)); line((3,-0.5),(6,-3))
  line((15,-0.5),(12,-3)); line((15,-0.5),(18,-3))
  for (x1,x2,x3) in ((0,-2,2),(6,4,8),(12,10,14),(18,16,20)) {
    line((x1,-3.5),(x2,-6)); line((x1,-3.5),(x3,-6))
    content((x2,-6.25), image("../../../../历年真题+参考解答/2012/assets/visio-2007-isometric-pc.png", width: 1.5em))
    laptop(x3,-6.2)
    device(x1,-3,hub:true)
  }
  device(3,0); device(15,0)
  merge-path({
    line((8.1,0.1),(8.1,-0.65))
    bezier((8.1,-0.65),(9.9,-0.65),(8.1,-1.2),(9.9,-1.2))
    line((9.9,-0.65),(9.9,0.1))
  },close:true,fill:white)
  circle((9,0.1),radius:(0.9,0.35),fill:white)
  line((8.5,0.2),(9.1,0.03),mark:(end:">",fill:black,scale:0.5))
  line((9.55,0.22),(9.1,0.1),mark:(end:">",fill:black,scale:0.5))
  line((8.8,-0.1),(8.6,0.12),mark:(end:">",fill:black,scale:0.5))
  line((9.25,0.07),(9.5,-0.12),mark:(end:">",fill:black,scale:0.5))
  content((3,1.3), text(size:0.8em)[以太网交换机])
  content((9,1.3), text(size:0.8em)[路由器])
  content((9,-2), text(size:0.8em)[100BaseT集线器])
}))

#choices([2，2], [2，4], [4，2], [4，4])
]

== 以太网与IEEE 802.3

#question(label: n => [2012 35])[
以太网的MAC协议提供的是

#choices(
  [无连接不可靠服务],
  [无连接可靠服务],
  [有连接不可靠服务],
  [有连接可靠服务],
)
]

#question(label: n => [2013 34])[
若下图为10BaseT网卡接收到的信号波形，则该网卡收到的比特串是

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))

    hide(rect((-0.18, 0), (8.18, 1.58), stroke: none), bounds: true)

    for x in range(9) {
      line(
        (x, 0),
        (x, 1.58),
        stroke: (paint: luma(55%), thickness: 0.035em, dash: "dashed"),
      )
    }

    line(
      (-0.16, 0.24),
      (0.50, 0.24),
      (0.50, 1.24),
      (1.00, 1.24),
      (1.00, 0.24),
      (1.50, 0.24),
      (1.50, 1.24),
      (2.50, 1.24),
      (2.50, 0.24),
      (3.00, 0.24),
      (3.00, 1.24),
      (3.50, 1.24),
      (3.50, 0.24),
      (4.50, 0.24),
      (4.50, 1.24),
      (5.50, 1.24),
      (5.50, 0.24),
      (6.00, 0.24),
      (6.00, 1.24),
      (6.50, 1.24),
      (6.50, 0.24),
      (7.50, 0.24),
      (7.50, 1.24),
      (8.16, 1.24),
      stroke: 0.115em,
    )
  })
]

#choices(
  [00110110],
  [10101101],
  [01010010],
  [11000101],
)
]

#question(label: n => [2018 37])[
路由器 R 通过以太网交换机 S1 和 S2 连接两个网络，R 的接口、主机 H1 和 H2 的 IP 地址与 MAC 地址如下图所示。若 H1 向 H2 发送1个 IP 分组 P，则 H1 发出的封装 P 的以太网帧的目的 MAC 地址、H2 收到的封装 P 的以太网帧的源 MAC 地址分别是

#align(center, cetz.canvas(length: 1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke: 0.06em)
  line((3, 6.5), (29, 6.5))
  line((3, 6.5), (3, 1.6))
  line((29, 6.5), (29, 1.6))
  let switch(x) = {
    line((x - 1.7, 6.7), (x, 5.7), (x, 4.65), (x - 1.7, 5.65), close: true, fill: luma(92%))
    line((x, 5.7), (x + 1.7, 6.7), (x + 1.7, 5.65), (x, 4.65), close: true, fill: luma(86%))
    line((x - 1.7, 6.7), (x, 7.65), (x + 1.7, 6.7), (x, 5.7), close: true, fill: white)
    for (a, b) in (((x - 1, 6.8), (x, 6.2)), ((x - 0.1, 7.2), (x + 1, 6.55)),
      ((x - 0.9, 6.2), (x + 0.1, 6.8)), ((x, 5.95), (x + 1.05, 6.55))) {
      line(a, b, stroke: 0.10em, mark: (end: ">", fill: black, scale: 0.7))
    }
  }
  switch(3)
  switch(29)
  merge-path({
    line((14.4, 6.7), (14.4, 5.2))
    bezier((14.4, 5.2), (17.6, 5.2), (14.4, 4.3), (17.6, 4.3))
    line((17.6, 5.2), (17.6, 6.7))
  }, close: true, fill: white)
  circle((16, 6.7), radius: (1.6, 0.9), fill: white)
  for (a, b) in (((15, 7.15), (16, 6.65)), ((16.1, 6.7), (17.1, 7.2)),
    ((17.1, 6.3), (16.1, 6.8)), ((16, 6.7), (15, 6.2))) {
    line(a, b, stroke: 0.13em, mark: (end: ">", fill: black, scale: 0.7))
  }
  content((16, 5.4), [R])
  for x in (3, 29) {
    rect((x - 1.05, 0.9), (x + 1.05, 2.65), fill: white)
    rect((x - 0.83, 1.15), (x + 0.83, 2.42))
    rect((x - 0.4, 0.55), (x + 0.4, 0.9), fill: white)
    line((x - 1.25, 0.55), (x + 1.25, 0.55), (x + 1.5, 0.05), (x - 1.5, 0.05), close: true, fill: luma(90%))
    for y in (0.17, 0.30, 0.43) { line((x - 1.1, y), (x + 1.1, y), stroke: 0.035em) }
  }
  content((0.5, 7.5), [S1])
  content((31.4, 7.5), [S2])
  content((0.75, 1.7), [H1])
  content((26.75, 1.7), [H2])
  content((14.05, 7.25), text(size: 0.85em)[192.168.3.1], anchor: "east")
  content((14.05, 5.8), text(size: 0.85em)[00-1a-2b-3c-4d-51], anchor: "east")
  content((17.95, 7.25), text(size: 0.85em)[192.168.4.1], anchor: "west")
  content((17.95, 5.8), text(size: 0.85em)[00-a1-b2-c3-d4-61], anchor: "west")
  content((3, -0.65), text(size: 0.85em)[192.168.3.2])
  content((3, -1.7), text(size: 0.85em)[00-1a-2b-3c-4d-52])
  content((29, -0.65), text(size: 0.85em)[192.168.4.2])
  content((29, -1.7), text(size: 0.85em)[00-a1-b2-c3-d4-62])
}))

#choices(
  [00-a1-b2-c3-d4-62，00-1a-2b-3c-4d-52],
  [00-a1-b2-c3-d4-62，00-a1-b2-c3-d4-61],
  [00-1a-2b-3c-4d-51，00-1a-2b-3c-4d-52],
  [00-1a-2b-3c-4d-51，00-a1-b2-c3-d4-61],
)
]

#question(label: n => [2019 34])[
100BaseT 快速以太网使用的导向传输介质是

#choices([双绞线], [单模光纤], [多模光纤], [同轴电缆])
]

== IEEE 802.11无线局域网

#question(label: n => [2017 35])[
在下图所示的网络中，若主机 H 发送一个封装访问 Internet 的 IP 分组的 IEEE 802.11 数据帧 F，则帧 F 的地址1、地址2和地址3分别是
#align(center, image("../../../../历年真题+参考解答/2017/official-images/q35.png", width: 28em))
#choices(
 [00-12-34-56-78-9a，00-12-34-56-78-9b，00-12-34-56-78-9c],
 [00-12-34-56-78-9b，00-12-34-56-78-9a，00-12-34-56-78-9c],
 [00-12-34-56-78-9b，00-12-34-56-78-9c，00-12-34-56-78-9a],
 [00-12-34-56-78-9a，00-12-34-56-78-9c，00-12-34-56-78-9b])
]
