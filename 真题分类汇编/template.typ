#import "../template.typ": exam
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS
#let collection(title: "真题分类汇编", subject: "计算机网络", solutions: false, body) = {
  let first-year = sys.inputs.at("from-year", default: "2009")
  let last-year = sys.inputs.at("through-year", default: "2026")
  mode-state.update(HANDOUTS)
  exam(title: title, subject: subject, cover: false, wide-labels: true, solutions: solutions,
    page-size: (210mm, 297mm), page-margin: 17mm)[
    #text(size: 9pt, fill: luma(45%))[真题年份：#(first-year)—#(last-year)]
    #body
  ]
}
