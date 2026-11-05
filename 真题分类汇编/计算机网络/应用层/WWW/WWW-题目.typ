// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。
#import "../../../../template.typ": choices, subquestions, statements, inline-node
#import "@preview/ezexam:0.3.1": question, answer-state
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#answer-state.update(false)
#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)
= 真题分类汇编：WWW

== HTTP协议

#question(label: n => [2011 47])[
（9分）某主机的MAC地址为00-15-C5-C1-5E-28，IP地址为10.2.128.100（私有地址）。题47-a图是网络拓扑，题47-b图是该主机进行Web请求的1个以太网数据帧前80个字节的十六进制及ASCII码内容。

请参考图中的数据回答以下问题。

#figure(
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    // Original proportions: host at left, gateway on the link, Internet at right.
    line((1.1, 0), (26.4, 0), stroke: 0.55pt)
    content((1.1, 0), image("../../../../assets/network/visio-2003-pc.svg", width: 2.2em, height: 2.2em, fit: "stretch"))
    content((13.4, 0), image("../../../../assets/network/visio-2003-router.svg", width: 2.9em, height: 1.85em, fit: "stretch"))
    content((26.6, 0.2), image("../../../../assets/network/visio-2003-cloud.svg", width: 6.3em, height: 3.5em, fit: "stretch"))
    content((26.6, 0.2), text(fill: white, size: 0.95em)[Internet])
    content((5.1, 0.75), text(size: 0.78em)[10.2.128.100])
    content((10.0, 0.75), text(size: 0.78em)[10.2.128.1])
    content((13.4, 1.55), text(size: 0.9em)[R])
    content((17.7, 0.75), text(size: 0.78em)[101.12.123.15])
    content((21.7, 2.15), text(size: 0.85em)[MTU = 1500 B])
    line((21.7, 1.7), (21.7, 0.05), stroke: 0.55pt, mark: (end: ">"))
  }),
  kind: image,
  caption: [题47-a图　网络拓扑],
  numbering: none,
)

#figure(
  {
    // Fixed byte columns preserve alignment without imposing a code font.
    let rows = (
      ("0000", "00 21 27 21 51 ee 00 15 c5 c1 5e 28 08 00 45 00"),
      ("0010", "01 ef 11 3b 40 00 80 06 ba 9d 0a 02 80 64 40 aa"),
      ("0020", "62 20 04 ff 00 50 e0 e2 00 fa 7b f9 f8 05 50 18"),
      ("0030", "fa f0 1a c4 00 00 47 45 54 20 2f 72 66 63 2e 68"),
      ("0040", "74 6d 6c 20 48 54 54 50 2f 31 2e 31 0d 0a 41 63"),
    )
    let cells = ()
    for (offset, bytes) in rows {
      cells.push(offset)
      for byte in bytes.split(" ") { cells.push(byte) }
      for byte in bytes.split(" ") {
        let value = int(byte, base: 16)
        cells.push(if 32 <= value and value <= 126 { str.from-unicode(value) } else { "." })
      }
    }
    text(size: 0.8em, font: "FZShuSong-Z01S", top-edge: "ascender", bottom-edge: "descender")[
      #block(stroke: 0.5pt, inset: 0.25em, width: auto)[#grid(
        columns: (3em, ..(1.65em,) * 16, 1.1em, ..(0.68em,) * 15),
        inset: 0pt,
        row-gutter: 0.25em,
        align: center,
        ..cells,
      )]
    ]
  },
  kind: image,
  caption: [题47-b图　以太网数据帧（前80字节）],
  numbering: none,
)

#subquestions[
+ 
  Web服务器的IP地址是什么？该主机的默认网关的MAC地址是什么？
  \
+ 
  该主机在构造题47-b图的数据帧时，使用什么协议确定目的MAC地址？封装该
  协议请求报文的以太网帧的目的MAC地址是什么？
  \
+ 假设
  HTTP/1.1协议以持续的非流水线方式工作，一次请求-响应时间为RTT，rfc.html页面引用了5个JPEG小图像，则从发出题47-b图中的Web请求开始到浏览器收到全部内容为止，需要多少个RTT？
  \
+ 
  该帧所封装的IP分组经过路由器R转发时，需修改IP分组头中的哪些字段？注：以太网数据帧结构和IP分组头结构分别如题47-c图、题47-d图所示。
  
  #figure(
    align(center)[#box(width: 77%)[
      #text(size: 0.94em)[
        #stack(
          dir: ttb,
          spacing: 0.16em,
          grid(
            columns: (6fr, 6fr, 2.8fr, 4.4fr, 4.5fr),
            align: center,
            [6 B], [6 B], [2 B], [46-1500 B], [4 B],
          ),
          table(
            columns: (6fr, 6fr, 2.8fr, 4.4fr, 4.5fr),
            align: center + horizon,
            inset: (x: 0.24em, y: 0.50em),
            stroke: 0.55pt,
            [目的MAC地址], [源MAC地址], [类型], [数据], [CRC],
          ),
        )
      ]
    ]],
    kind: image,
    caption: [题47-c图　以太网帧结构],
    numbering: none,
  )
  
  #figure(
    align(center)[
      #cetz.canvas(length: 0.33cm, {
        import cetz.draw: *
        set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  
        let rule = 0.55pt
        hide(rect((-2.15, 0.35), (32.15, 15.70), stroke: none), bounds: true)
  
        // Bit ruler. Major ticks mark byte boundaries; the right label is bit 31.
        line((0, 14.10), (32, 14.10), stroke: rule)
        for i in range(33) {
          let major = i == 0 or i == 8 or i == 16 or i == 24 or i == 32
          line((i, 14.10), (i, if major { 15.10 } else { 14.60 }), stroke: rule)
        }
        content((-0.8, 15.32), text(size: 0.84em)[比特], anchor: "east")
        content((0, 15.32), text(size: 0.84em)[0])
        content((8, 15.32), text(size: 0.84em)[8])
        content((16, 15.32), text(size: 0.84em)[16])
        content((24, 15.32), text(size: 0.84em)[24])
        content((32, 15.32), text(size: 0.84em)[31], anchor: "east")
  
        // Five 32-bit rows of the IPv4 header.
        rect((0, 0.50), (32, 13.50), fill: white, stroke: rule)
        line((0, 10.90), (32, 10.90), stroke: rule)
        line((0, 8.30), (32, 8.30), stroke: rule)
        line((0, 5.70), (32, 5.70), stroke: rule)
        line((0, 3.10), (32, 3.10), stroke: rule)
  
        line((4, 10.90), (4, 13.50), stroke: rule)
        line((8, 10.90), (8, 13.50), stroke: rule)
        line((16, 10.90), (16, 13.50), stroke: rule)
        line((16, 8.30), (16, 10.90), stroke: rule)
        line((19, 8.30), (19, 10.90), stroke: rule)
        line((8, 5.70), (8, 8.30), stroke: rule)
        line((16, 5.70), (16, 8.30), stroke: rule)
  
        content((2, 12.20), text(size: 0.95em)[版本])
        content((6, 12.20), text(size: 0.90em)[#stack(dir: ttb, spacing: 0pt, [头部], [长度])])
        content((12, 12.20), text(size: 0.95em)[服务类型])
        content((24, 12.20), text(size: 0.95em)[总长度])
  
        content((8, 9.60), text(size: 0.95em)[标识])
        content((17.5, 9.60), text(size: 0.95em)[标志])
        content((25.5, 9.60), text(size: 0.95em)[片偏移])
  
        content((4, 7.00), text(size: 0.90em)[生存时间 (TTL)])
        content((12, 7.00), text(size: 0.95em)[协议])
        content((24, 7.00), text(size: 0.95em)[头部校验和])
        content((16, 4.40), text(size: 0.95em)[源IP地址])
        content((16, 1.80), text(size: 0.95em)[目的IP地址])
      })
    ],
    kind: image,
    caption: [题47-d图　IP分组头结构],
    numbering: none,
  )
    
]
]

#block(breakable: false)[#question(label: n => [2014 40])[
使用浏览器访问某大学Web网站主页时，不可能使用到的协议是

#choices(
  [PPP],
  [ARP],
  [UDP],
  [SMTP],
)
]]

#question(label: n => [2015 40])[
某浏览器发出的HTTP请求报文如下：

```http
GET /index.html HTTP/1.1
Host: www.test.edu.cn
Connection: Close
Cookie: 123456
```

下列叙述中，错误的是

#choices(
  [该浏览器请求浏览index.html],
  [index.html存放在www.test.edu.cn上],
  [该浏览器请求使用持续连接],
  [该浏览器曾经浏览过www.test.edu.cn],
)
]

#question(label: n => [2020 40])[
假设下图所示网络中的本地域名服务器只提供递归查询服务，其他域名服务器均只提供迭代查询服务；局域网内主机访问 Internet 上各服务器的往返时间（RTT）均为10 ms，忽略其他各种时延。若主机 H 通过超链接 http://www.abc.com/index.html 请求浏览纯文本 Web 页 index.html，则从点击超链接开始到浏览器接收到 index.html 页面为止，所需的最短时间与最长时间分别是

#align(center, cetz.canvas(length:1em, {
  import cetz.draw: *
  set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
  set-style(stroke:0.065em)
  merge-path({
    bezier((9,0),(9,4),(6.8,1),(7,3))
    bezier((9,4),(14,5.5),(10,6),(12,6))
    bezier((14,5.5),(19,3.5),(16,7),(19,6))
    bezier((19,3.5),(17,-1),(21,1),(20,-1))
    bezier((17,-1),(12,-1.4),(16,-3),(13,-3))
    bezier((12,-1.4),(9,0),(9,-2),(7,-1))
  },close:true,fill:luma(97%))
  line((0,0),(5.5,0),stroke:0.35em)
  line((1,0),(1,2)); line((4.5,0),(4.5,2))
  line((2.6,0),(2.6,-1.4))
  line((5.3,2),(6.5,1.7),(6,1.3),(7.2,1),(8,1.4))
  content((1,2.3),image("../../../../assets/network/visio-2007-isometric-server.png",width:1.4em))
  merge-path({
    line((3.6,2.65),(3.6,1.9))
    bezier((3.6,1.9),(5.4,1.9),(3.6,1.35),(5.4,1.35))
    line((5.4,1.9),(5.4,2.65))
  },close:true,fill:white)
  circle((4.5,2.65),radius:(0.9,0.35),fill:white)
  line((4,2.75),(4.6,2.58),mark:(end:">",fill:black,scale:0.5))
  line((5.05,2.77),(4.6,2.65),mark:(end:">",fill:black,scale:0.5))
  line((4.3,2.45),(4.1,2.67),mark:(end:">",fill:black,scale:0.5))
  line((4.75,2.62),(5,2.43),mark:(end:">",fill:black,scale:0.5))
  content((2.6,-2),image("../../../../assets/network/visio-2007-isometric-pc.png",width:1.7em))
  content((1,4.25),text(size:0.8em)[本地域名])
  content((1,3.4),text(size:0.8em)[服务器])
  content((4.5,3.7),text(size:0.8em)[路由器])
  content((0.1,-0.8),text(size:0.8em)[局域网],anchor:"west")
  content((3.8,-2),[H]); content((10.7,4.65),text(size:0.8em)[Internet])
  for (x,y) in ((8.8,2.5),(14,4.6),(14.8,2),(12.5,-0.5)) {
    content((x,y),image("../../../../assets/network/visio-2007-isometric-server.png",width:1.4em))
  }
  for (x,y,label) in ((9.8,3,[com顶级]),(9.8,2.1,[域名服务器]),(15,5.1,[根域名]),
    (15,4.2,[服务器]),(15.8,2.5,[abc.com]),(15.8,1.6,[域名服务器]),(13.5,-0.5,[www.abc.com])) {
    content((x,y),text(size:0.8em,label),anchor:"west")
  }
}))

#choices([10 ms，40 ms], [10 ms，50 ms], [20 ms，40 ms], [20 ms，50 ms])
]

#question(label: n => [2022 40])[
假设主机 H 通过 HTTP/1.1 请求浏览某 Web 服务器 S 上的 Web 页 news408.html，news408.html 引用了同目录下1个图像，news408.html 文件大小为1 MSS（最大段长），图像文件大小为3 MSS，H 访问 S 的往返时间 RTT = 10 ms，忽略 HTTP 响应报文的首部开销和 TCP 段传输时延。若 H 已完成域名解析，则从 H 请求与 S 建立 TCP 连接时刻起，到接收到全部内容止，所需的时间至少是

#choices([30 ms], [40 ms], [50 ms], [60 ms])
]

#question(label: n => [2024 40])[
若浏览器不支持并行 TCP 连接，使用非持久的 HTTP/1.0 协议请求浏览1个 Web 页。该页中引用同一网站上7个小图像文件，则从浏览器为传输 Web 页请求建立 TCP 连接开始，到接收完所有内容为止，所需要的往返时间 RTT 数至少是

#choices([4], [9], [14], [16])
]

#question(label: n => [2026 40])[
电子商务类 Web 应用通常采用 Cookie 技术解决 HTTP 协议无状态的问题。下列叙述中，#emphasis[不属于] Cookie 技术典型用途的是
#choices([用户跟踪], [个性化推荐], [构建虚拟购物车], [缩短 Web 对象响应时间])
]
