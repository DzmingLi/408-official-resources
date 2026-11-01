#import "../template.typ": exam
#import "@preview/ezexam:0.3.1": mode-state, HANDOUTS
#let collection(title: "分类汇编", subject: "计算机网络", solutions: false, body) = {
  mode-state.update(HANDOUTS)
  exam(title: title, subject: subject, cover: false, wide-labels: true, solutions: solutions)[
    #set page(width: 210mm, height: 297mm)
    #body
  ]
}
