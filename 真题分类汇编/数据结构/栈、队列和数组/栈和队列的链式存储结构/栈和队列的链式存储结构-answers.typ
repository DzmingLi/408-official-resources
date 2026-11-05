// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。
#import "../../../../template.typ": subquestions, statements, inline-node
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= 真题分类汇编：栈和队列的链式存储结构

=== 2019 42

#subquestions(allow-oversize: true)[
+ 采用链式存储结构（两段式单向循环链表），队头指针为 front，队尾指针为 rear。
+ 初始时，创建只有一个空闲结点的两段式单向循环链表，头指针 front 与尾指针 rear 均指向空闲结点。如下图所示。
  
  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em)
    merge-path({
      line((-1.3, 0.7), (1.3, 0.7))
      bezier((1.3, 0.7), (1.3, -0.7), (2.6, 0.7), (2.6, -0.7))
      line((1.3, -0.7), (-1.3, -0.7))
      bezier((-1.3, -0.7), (-1.3, 0.7), (-2.6, -0.7), (-2.6, 0.7))
    }, close: true)
    line((0, -0.7), (0, 0.7))
    circle((1.25, 0), radius: 0.13, fill: black)
    bezier((1.25, 0), (-2.25, 0), (7, -1.7), (-9, -1.7),
      mark: (end: ">", fill: black, scale: 0.75))
    for (x, label, side) in ((-0.7, [front], "east"), (0.5, [rear], "west")) {
      rect((x - 0.35, 2.05), (x + 0.35, 2.65))
      circle((x, 2.35), radius: 0.1, fill: black)
      line((x, 2.35), (0, 0.7), mark: (end: ">", fill: black, scale: 0.75))
      content((x + if side == "east" { -0.5 } else { 0.5 }, 2.35), label, anchor: side)
    }
  }))
  
  队空的判定条件：`front == rear`。 \
  队满的判定条件：`front == rear->next`。 \
+ 插入第一个元素后的队列状态：
  
  #align(center, cetz.canvas(length: 1em, {
    import cetz.draw: *
    set-style(content: (wrap: body => box(text(top-edge: "bounds", bottom-edge: "bounds", body))))
    set-style(stroke: 0.065em)
    for x in (0, 7) {
      merge-path({
        line((x - 1.3, 0.7), (x + 1.3, 0.7))
        bezier((x + 1.3, 0.7), (x + 1.3, -0.7), (x + 2.6, 0.7), (x + 2.6, -0.7))
        line((x + 1.3, -0.7), (x - 1.3, -0.7))
        bezier((x - 1.3, -0.7), (x - 1.3, 0.7), (x - 2.6, -0.7), (x - 2.6, 0.7))
      }, close: true)
      line((x, -0.7), (x, 0.7))
      circle((x + 1.25, 0), radius: 0.13, fill: black)
    }
    content((-0.9, 0), [1])
    line((1.25, 0), (4.75, 0), mark: (end: ">", fill: black, scale: 0.75))
    bezier((8.25, 0), (-2.25, 0), (19, -1.7), (-15, -1.7),
      mark: (end: ">", fill: black, scale: 0.75))
    for (x, label, side) in ((-0.7, [front], "east"), (7.7, [rear], "west")) {
      rect((x - 0.35, 2.05), (x + 0.35, 2.65))
      circle((x, 2.35), radius: 0.1, fill: black)
      line((x, 2.35), (if x < 0 { 0 } else { 7 }, 0.7),
        mark: (end: ">", fill: black, scale: 0.75))
      content((x + if side == "east" { -0.5 } else { 0.5 }, 2.35), label, anchor: side)
    }
  }))
  
+ 操作的基本过程：
  
  #table(
    columns: (1fr,), stroke: 0.065em,
    table.cell(fill: luma(85%))[入队操作：],
    [若（`front == rear->next`）#h(2em)`// 队满` \
    #h(2em)则在 rear 后面插入一个新的空闲结点； \
    入队元素保存到 rear 所指结点中；`rear = rear->next;` 返回。],
    [出队操作：],
    [若（`front == rear`）#h(2em)`// 队空` \
    #h(2em)则出队失败，返回； \
    取 front 所指结点中的元素 e；`front = front->next;` 返回 e。],
  )

]
