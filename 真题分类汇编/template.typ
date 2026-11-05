#import "../template.typ": exam
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS
#let collection(title: "真题分类汇编", subject: "计算机网络", solutions: false, body) = {
  let paper = sys.inputs.at("collection-size", default: "A4")
  let sizes = (A4: (210mm, 297mm), A5: (148mm, 210mm))
  assert(paper in sizes, message: "collection-size must be A4 or A5")
  let first-year = sys.inputs.at("from-year", default: "2009")
  let last-year = sys.inputs.at("through-year", default: "2026")
  mode-state.update(HANDOUTS)
  exam(title: title, subject: subject, cover: false, wide-labels: true, solutions: solutions,
    page-size: sizes.at(paper), page-margin: if paper == "A5" { 12mm } else { 17mm },
    fit-wide-content: paper == "A5")[
    #text(size: 9pt, fill: luma(45%))[真题年份：#(first-year)—#(last-year) · #paper]
    #body
  ]
}
