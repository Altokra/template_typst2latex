/*
  i-figured 包使用示例
  
  i-figured 是一个用于改进 Typst 图表编号和引用的包。
  主要功能：
  - 自动按章节重置图表编号（如图 1.1, 图 1.2, 图 2.1...）
  - 提供图表目录生成功能
  - 支持图片、表格、代码清单的分类编号
  - 增强的交叉引用系统
  
  使用要点：
  1. 必须设置标题编号 #set heading(numbering: "1.")
  2. 应用 show 规则来重置计数器和格式化图表
  3. 引用时需要添加前缀：fig: (图片), tbl: (表格), lst: (代码)
  
  项目地址: https://github.com/RubixDev/typst-i-figured
*/

// 导入包
#import "@preview/i-figured:0.2.4"

// 确保设置了标题编号
#set heading(numbering: "1.")

// 应用显示规则（这些规则可以自定义）
#show heading: i-figured.reset-counters
#show figure: i-figured.show-figure

// 显示图表目录
#i-figured.outline()

= 你好世界
@fig:bye 显示了文本"你好"。
#figure([你好], caption: [再见世界。]) <bye>

// 引用时，标签名必须根据图表类型添加前缀 `fig:`、`tbl:` 或 `lst:`
@fig:bye 显示了文本"你好"。