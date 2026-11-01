#import "../template.typ": exam, subquestions
#import "@preview/ezexam:0.3.1": question, mode-state, HANDOUTS, answer-state
#let textbook(topic: "计算机网络", body) = {
  set document(title: "计算机网络与信息安全：" + topic + "习题")
  mode-state.update(HANDOUTS)
  answer-state.update(false)
  exam(title: topic + "习题", subject: "计算机网络与信息安全", cover: false, wide-labels: true)[
    #set page(width: 210mm, height: 297mm)
    #body
  ]
}
