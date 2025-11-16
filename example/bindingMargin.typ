#import "../template.typ":*

#show: project.with(
  theme: "lab",
  language: "cn",
  cover: true,
  author: "Soleil",
  cover_name: "绑定边距背景示例",
  cover_subname: "Typst 报告模板示例文件",
  page_header: true,
  table_of_contents: false,
  school_id: "",
  course: "",
  college: "",
  teacher: "",
  major: "",
  ProjName: "Labs",
)

//zebraw实现代码块美化
#show: zebraw.with(
  ..zebraw-themes.zebra,
  hanging-indent: true,
  indentation:4,
  numbering-separator:false,
  )/*记得到时候修改*/

// // 文档设置
// #set document(title: "单精度浮点除法处理器设计报告", author: "")
// #set page(paper: "a4", margin: (x: 2.5cm, y: 3cm))
// #set text(font: ("Times New Roman", "SimSun"), size: 12pt, lang: "zh")
// #set par(justify: true, first-line-indent: 2em, leading: 1em)
// #show heading: set block(above: 1.5em, below: 1em)
// #show heading.where(level: 1): it => {
//   set align(center)
//   set text(size: 18pt, weight: "bold")
//   block(it.body)
// }
// #show heading.where(level: 2): it => {
//   set text(size: 14pt, weight: "bold")
//   block(it.body)
// }

#outline(depth: 3, indent: 2em)



// 绑定边距背景示例
#set page(background: binding_line_background())
= （一）引言
这是测试

这也是测试

== 项目概述与目标

== 测试
= （二） 结尾
== 测试
== 测试
= （三） 附录

