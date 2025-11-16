#import "../template.typ": *
// #import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/i-figured:0.2.4"
// #import "@preview/numbly:0.1.0": *
=== 如何插入表格？

#image("image.png")
这里是一个表格：

#figure(
  table(columns: 3,
    [这里是表头 1], [这里是表头 2], [这里是表头 3],
    [这里是内容 1], [这里是内容 2], [这里是内容 3],
    [这里是内容 4], [这里是内容 5], [这里是内容 6],
  ),
  caption: "这里是表格标题",
)<常规表格>

@常规表格 是一个常规表格，如果你想使用三线表，可以像 @三线表 那样做：

#figure(
  table(columns: 3, stroke: none,
  toprule(),
    [这里是表头 1], [这里是表头 2], [这里是表头 3],
  midrule(),
    [这里是内容 1], [这里是内容 2], [这里是内容 3],
    [这里是内容 4], [这里是内容 5], [这里是内容 6],
  bottomrule(),
  ),
  caption: "这里是表格标题",
)<三线表>


#[
  
#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if x == 0 or y == 0 { gray },
  inset: (right: 1.5em),
)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]
  } else {
    it
  }
}

#let a(A) = table.cell(
  fill: green.lighten(60%),
)[#A]
#let b = table.cell(
  fill: aqua.lighten(60%),
)[B]

#figure(
  table(
  columns: 4,
  [], [Exam 1], [Exam 2], [Exam 3],

  [John], [], a("a"), [],
  [Mary], [], a("12312123123123132132123"), a(a),
  [Robert], b, a(a), b,
)
)
]

#figure(
  table(
    columns: 3, 
    stroke: none,
    toprule(),
      [这里是表头 1], [这里是表头 2], [这里是表头 3],
    midrule(),
      [这里是内容 1], [这里是内容 2], [这里是内容 3],
      table.vline(start: 1,x: 2, stroke:  0.5pt + black),
      [这里是内容 4], [这里是内容 5], [这里是内容 6],
    bottomrule(),
  ),
  caption: "这里是表格标题",
)<三线表2>

= 作用域

This list is affected: #[
  #set list(marker: [--])
  - Dash
]

This one is not:
- Bullet
