
#let todo-data = (
  (done: false, content: "写报告", priority: "Medium", due: "2024-12-30"),
  (done: true, content: "买菜", priority: "Low", due: "2024-12-20"),
  (done: false, content: "修复bug", priority: "High", due: "2024-12-25"),
  (done: false, content: "开会", priority: "High", due: "2024-12-22"),
  (done: true, content: "锻炼", priority: "Medium", due: "2024-12-21"),
)

#let priority-order = ("High": 1, "Medium": 2, "Low": 3)

#let sorted-todos = todo-data.sorted(key: item => (
  priority-order.at(item.priority),
  if item.done { 1 } else { 0 }
))


#for item in sorted-todos {
  let checkbox = if item.done { "☑" } else { "☐" }
  let priority-color = if item.priority == "High" { red } else if item.priority == "Medium" { orange } else { green }
  let style = if item.done { text.with(fill: gray) } else { text }
  
  // 修正：使用 upper() 函数而不是 .upper() 方法
  [- #checkbox #text(fill: priority-color, weight: "bold")[#item.priority] #style(item.content) (#item.due)]
}
