// 各试卷直接导入；同步数学仓库 历年真题+参考解答/template.typ，保留 408 的 MPS 字体及图表规则。
#import "@preview/ezexam:0.3.1" as ezexam
// 2026 考纲的正文、选项中心距约为汉字宽度的 2 倍。
// leading / r-gap 是两行之间的空隙，而不是整个行中心距。
// 书宋 bounds 行盒实测约 0.9em，再留 1.1em 空隙，中心距约 2em。
// 选项区不另加前后留白。
#let exam-line-gap = 1.1em
// 单项选择题的答案矩阵整体居中；格内对齐和边距由原表格参数保留。
#let answer-key(..args) = align(center, table(..args))
// 行内链表/树节点：统一字形度量，不按 p/g 等字母的包围盒分别居中。
// 字号继承正文；宽度可按原图指定，基线和内边距集中管理。
#let inline-node(columns: auto, ..fields) = {
  let cells = fields.pos()
  box(baseline: 30%)[
    #set text(top-edge: "ascender", bottom-edge: "descender")
    #set par(leading: 0pt, spacing: 0pt, justify: false)
    #show par: it => it
    #show table: it => it
    #table(
      columns: if columns == auto { cells.len() } else { columns },
      inset: (x: 0.4em, y: 0.08em),
      align: center + horizon, stroke: 0.5pt, ..cells,
    )
  ]
}
// 行首含 A./Ⅰ 等西文字形时，bounds 行盒略矮；补 0.1em，
// 保证题干到选项/陈述列表的中心距不短于普通正文行距。
#let choices(..args) = {
  block(above: exam-line-gap + 0.1em, below: 0pt, breakable: true,
    ezexam.choices(r-gap: exam-line-gap, ..args))
}
#let statements(columns: 1, ..args) = {
  block(above: exam-line-gap + 0.1em, below: 0pt, breakable: true,
    grid(columns: if type(columns) == int { (1fr,) * columns } else { columns },
      row-gutter: exam-line-gap, ..args.named(),
      ..args.pos().map(body => block(breakable: false, body))))
}
// 小问使用原生 + 列表；每项整体不跨页，整个列表允许跨页。
#let subquestions(start: 1, allow-oversize: false, body) = {
  set enum(numbering: "（1）", start: start)
  show enum: it => {
    let next-number = if it.start == auto { 1 } else { it.start }
    for item in it.children {
      let explicit = item.fields().at("number", default: none)
      let n = if explicit in (none, auto) { next-number } else { explicit }
      let marker = box(text(font: "FZShuSong-Z01S", numbering(it.numbering, n)))
      let content = [#h(-measure(marker).width - 0.3em)#marker#h(0.3em)#item.body]
      layout(size => {
        // 仅超过整页正文高度（250mm - 2 × 17mm）的答案小问可分页。
        // 剩余页高不足的普通小问仍整体移到下一页。
        let oversize = allow-oversize and measure(
          block(width: size.width, inset: (left: 2em), content)).height > 216mm
        block(breakable: oversize, above: exam-line-gap, below: 0pt,
          inset: (left: 2em), content)
      })
      next-number = n + 1
    }
  }
  // layout 内首项的 above 会在布局边界消失，显式保留列表前的正文行距。
  v(exam-line-gap, weak: false)
  body
}
#let paper-margin = 17mm
#let exam(
  year: none,
  title: none,
  subject: "计算机学科专业基础",
  code: "408",
  cover: auto,
  solutions: false,
  sample: false,
  hide-source-headings: 0,
  wide-labels: false,
  body,
) = {
  let title = if title != none { title } else { str(year) + "年全国硕士研究生招生考试" }
  let cover = if cover == auto { not solutions } else { cover }
  set document(title: title + " " + subject, date: none)
  set page(width: 176mm, height: 250mm, margin: paper-margin,
    header: none, footer: none)
  set text(font: ("FZShuSong-Z01S", "FZSTS_MPS"), size: 10.5pt,
    lang: "zh", top-edge: "bounds", bottom-edge: "bounds")
  set par(justify: true, leading: exam-line-gap, spacing: exam-line-gap)
  show math.equation: set text(font: ("FZSTS_MPS Math", "FZShuSong-Z01S", "TeX Gyre Termes Math"))
  show math.equation: it => {
    show "e": math.upright
    show "π": math.upright
    it
  }
  show math.equation: it => math.display(it)
  show math.equation.where(block: false): it => h(0.25em, weak: true) + it + h(0.25em, weak: true)
  show math.equation.where(block: true): set block(above: exam-line-gap, below: exam-line-gap)
  set math.cases(gap: 0.65em)
  show math.cases: it => {
    show $&$.body.func(): point => point + h(0.8em)
    it
  }
  set math.mat(align: center, row-gap: 0.65em)
  let numeric-sequence = regex("[−+-]?[0-9]+(?:\\s*[,，]\\s*[−+-]?[0-9]+)+")
  show numeric-sequence: it => {
    it.text.split(regex("\\s*[,，]\\s*")).map(text).join(h(0.25em) + [,] + h(0.25em))
  }
  // IPv4（含题目中的 x 通配写法）在每个点后留一个普通空格宽度。
  let ipv4 = regex("[0-9]{1,3}(?:\\.\\s*(?:[0-9]{1,3}|[xX])){3}")
  show ipv4: it => {
    it.text.split(regex("\\.\\s*")).map(text).join([.] + h(0.25em))
  }
  // 代码保留逐字空白，不使用等宽字体、缩小字号或语法高亮。
  // 英文字母、数字与中文使用书宋，其余符号优先使用 MPS。
  set raw(theme: none)
  // raw 默认额外缩到 0.8em，抵消它，字号才真正继承所在正文/表格。
  show raw: set text(font: ("FZSTS_MPS", "FZShuSong-Z01S"), size: 1em / 0.8)
  show raw: it => {
    // 数字序列的标点规则不改动程序原文。
    show numeric-sequence: it => it
    show regex("[A-Za-z0-9]"): set text(font: "FZShuSong-Z01S")
    it
  }
  // 扫描版的普通单行表格约高 1.8～2 个格内字号；不能沿用正文行距。
  // 行内节点结构已有独立 inset，继续由题内覆盖。
  set table(inset: (x: 0.45em, y: 0.45em))
  set figure(numbering: none, supplement: none)
  // ezexam 的题号使用 question figure 计数，不能一同禁用 numbering。
  show figure.where(kind: "question"): set figure(numbering: "1.")
  set enum(indent: 0.5em, body-indent: 1.8em)

  if cover {
    text(font: "FZHei-B01", size: 12pt)[绝密★启用前]
    v(40pt)
    align(center)[
      #text(size: 13pt)[#title]
      #v(15pt)
      #text(font: "FZHei-B01", size: 20pt)[#subject]
      #if code != none { v(10pt); text(size: 12pt)[（科目代码：#code）] }
      #if sample { v(10pt); text(size: 11pt)[样卷] }
    ]
    v(28pt)
    align(center, text(font: "FZHei-B01", size: 13pt)[考生注意事项])
    v(24pt)
    {
      set enum(numbering: "1.", indent: 0pt, body-indent: 0.55em)
      set par(leading: 1.3em, spacing: 0.9em)
      enum(
        [答题前，考生须在试题册指定位置上填写考生编号和考生姓名；在答题卡指定位置上填写报考单位、考生姓名和考生编号，并涂写考生编号信息点。],
        [选择题的答案必须涂写在答题卡相应题号的选项上，非选择题的答案必须书写在答题卡指定位置的边框区域内。超出答题区域书写的答案无效；在草稿纸、试题册上答题无效。],
        [填（书）写部分必须使用黑色字迹的签字笔书写，字迹工整、笔迹清楚；涂写部分必须使用 2B 铅笔填涂。],
        [考试结束，将答题卡和试题册按规定交回。],
      )
    }
    v(1fr)
    align(center)[（以下信息考生必须认真填写）]
    v(8pt)
    align(center, table(
      columns: (62pt,) + (17pt,) * 15,
      rows: (23pt, 23pt),
      stroke: 0.5pt, inset: 3pt, align: center + horizon,
      [考生编号], ..range(15).map(_ => []),
      [考生姓名], table.cell(colspan: 15)[],
    ))
    v(45pt)
    pagebreak()
    // 阅读版封面后直接进入正文；封面背页补白只由打印版拼版插入。
    counter(page).update(1)
  }

  set page(footer-descent: 17pt,
    footer: {
      // 正文居中图表的外部留白不应改变页脚位置。
      show align: it => it
      align(center + top, text(font: "FZKai-Z03S", size: 9pt)[
      #subject #if sample [题型示例] else if solutions [参考答案] else [试题]　
      第 #context counter(page).display() 页（共 #context counter(page).at(<exam-body-end>).first() 页）
      ])
    })
  let plain(c) = {
    let f = c.fields()
    if "text" in f { if type(f.text) == str { f.text } else { plain(f.text) } }
    else if "children" in f { f.children.map(plain).join() }
    else if "body" in f { plain(f.body) }
    else { "" }
  }
  // 题目可以跨页；正文、选项和答案的每个段落不拆页。
  show par: it => block(breakable: false, above: exam-line-gap, below: 0pt,
    sticky: plain(it.body).trim() == "请回答下列问题。", it)
  let flatten-sequence(c) = {
    if c.func() == [].func() {
      c.children.map(flatten-sequence).flatten()
    } else { (c,) }
  }
  show math.lr: it => {
    let value = plain(it.body)
    if value.contains(regex("[,，]")) and value.match(regex("^[()\\[\\]{}0-9−+.,，\\s]+$")) != none {
      let compact = flatten-sequence(it.body).map(part => {
        if "text" in part.fields() and part.text in (",", "，") {
          h(0.25em) + math.class("normal", ",") + h(0.25em)
        } else { part }
      }).join()
      // 纯数字序列没有高公式，不需要重新构造伸缩定界符。
      compact
    } else { it }
  }
  // 图表的外部留白独立于题目外层 block，避免继承题号容器的零间距。
  // 只在正文区启用；行内 box 内首尾的弱留白不会撑高节点结构。
  show figure: it => {
    if it.kind == "question" { it }
    else {
      set block(above: exam-line-gap, below: exam-line-gap)
      // figure 已管理外部留白，内部居中图形不再重复加列表级留白。
      show align: it => it
      it
    }
  }
  show image: set block(above: exam-line-gap, below: exam-line-gap)
  // 无框代码块也要与题干分开，不能继承题号容器的零块间距。
  show raw.where(block: true): set block(above: exam-line-gap, below: exam-line-gap)
  // 表格的紧凑行距不能传到多列程序中；代码行距仍由正文模板统一管理。
  show raw.where(block: true): set par(leading: exam-line-gap, spacing: 0pt)
  // CeTZ/Fletcher 常返回行内 canvas；单纯 set block 不会给它创建外部留白。
  show align: it => {
    // ezexam 将题内空行转成 linebreak，canvas 前的弱块间距会被吃掉。
    // 页脚显式使用 center + top，不属于正文图表。
    if it.alignment == center { v(exam-line-gap, weak: false) }
    it
  }
  // 代码外框本身需要留白；只给框内 raw 设置间距无法分开外框与题干。
  show block: it => {
    if it.stroke != none and it.stroke != (:) {
      block(above: exam-line-gap, below: exam-line-gap, breakable: it.breakable, it)
    } else { it }
  }
  show heading.where(level: 1): it => context {
    if hide-source-headings == 0 or counter(heading).at(it.location()).first() > hide-source-headings {
      // 旧年答案以标题写出的题号同样使用书宋英文，中文标题仍用黑体。
      let title-body = if solutions and plain(it.body).match(regex("^[0-9]+[.．]")) != none {
        show regex("^[0-9]+[.．]"): set text(font: "FZShuSong-Z01S")
        it.body
      } else { it.body }
      block(above: 1.3em, below: 1.3em, sticky: true,
        text(font: "FZHei-B01", size: 10.5pt, title-body))
    }
  }
  // 不照搬数学模板的全局 show grid：408 的图表和自动选项也使用 grid。
  let question-item(term, description) = {
    set text(font: "FZShuSong-Z01S")
    // 真正缩进整个内容区，而不只是段落；选项、代码和图表随正文悬挂。
    set par(hanging-indent: 0em, first-line-indent: 0em, spacing: exam-line-gap)
    if wide-labels {
      [#box(text(font: "FZShuSong-Z01S", term))#h(0.75em)#description]
    } else {
      block(inset: (left: 2.3em), above: 0pt, below: 0pt, breakable: true)[#h(-1.8em)#box(width: 1.8em, align(left, text(font: "FZShuSong-Z01S", term)))#description]
    }
  }
  show terms: it => {
    for item in it.children {
      layout(size => {
        let b = question-item(item.term, item.description)
        block(width: 100%, breakable: true, b)
      })
      parbreak()
    }
  }
  show regex("[一二三四五]、[^\\n]*"): t => text(font: "FZHei-B01", t)
  show table: it => {
    // 换行只增加紧凑的一行，不继承正文的 1.3em leading / spacing。
    set par(leading: 0.25em, spacing: 0em, justify: false)
    show par: it => it
    block(breakable: false, above: exam-line-gap, below: exam-line-gap, it)
  }
  show figure.where(kind: "question"): it => {
    set block(breakable: true)
    layout(size => {
      let b = align(left, it.body)
      block(width: 100%, breakable: true, b)
    })
  }
  body
  // PDF 在正文结束处终止；打印时需要的补白由小册子拼版处理。
  [#metadata(none)<exam-body-end>]
}
