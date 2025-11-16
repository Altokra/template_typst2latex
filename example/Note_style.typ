/*
Documentation:
File: Note_style.typ
Description: 演示 template.typ 中提供的各种块级样式函数 (blockx) 的用法示例
            包括定理、例子、证明、摘要、注释、提示、警告等多种语义化的块级元素
            
功能说明:
1. blockx() - 核心块级函数，支持多种主题样式:
   - "default": 默认样式，带边框和浮动标题
   - "boxed": 盒装样式，带背景色
   - "float": 浮动标题样式
   - "thickness": 左侧粗线样式
   - "dashed": 虚线边框样式

2. 预定义的语义化块函数 (基于 blockx):
   学术类:
   - Theorem(it, name: none) - 定理 (蓝色, rgb(0, 90, 239))
   - proof(it, name: none) - 证明 (灰色, rgb(120, 120, 120))
   - example(it, name: none) - 例子 (深灰, gray.darken(60%))
   - abstract(it, name: none) - 摘要 (青色, rgb(0, 133, 143))
   - summary(it, name: none) - 总结 (青色, rgb(0, 133, 143))
   - analysis(it, name: none) - 分析 (绿色, rgb(0, 133, 91))
   
   信息类:
   - info(it, name: none) - 信息 (蓝色, rgb(68, 115, 218))
   - note(it, name: none) - 注释 (蓝色, rgb(68, 115, 218))
   - tip(it, name: none) - 提示 (绿色, rgb(0, 133, 91))
   - hint(it, name: none) - 提示 (绿色, rgb(0, 133, 91))
   - help(it, name: none) - 帮助 (橙棕色, rgb(153, 110, 36))
   
   状态类:
   - success(it, name: none) - 成功 (绿色, rgb(62, 138, 0))
   - important(it, name: none) - 重要 (绿色, rgb(62, 138, 0))
   - warning(it, name: none) - 警告 (橙色, rgb(184, 95, 0))
   - attention(it, name: none) - 注意 (红色, rgb(216, 58, 49))
   - caution(it, name: none) - 小心 (红色, rgb(216, 58, 49))
   - failure(it, name: none) - 失败 (红色, rgb(216, 58, 49))
   - danger(it, name: none) - 危险 (红色, rgb(216, 58, 49))
   - error(it, name: none) - 错误 (红色, rgb(216, 58, 49))
   - bug(it, name: none) - Bug (紫红色, rgb(204, 51, 153))
   
   引用类:
   - quote(it, name: none) - 引用 (紫色, rgb(132, 90, 231))
   - Cite(it, name: none) - 引证 (紫色, rgb(132, 90, 231))
   - experiment(it, name: none) - 实验 (紫色, rgb(132, 90, 231))
   - question(it, name: none) - 问题 (紫色, rgb(132, 90, 231))

3. 行内样式函数:
   - c(content, lang: none, bg: rgb("#f3f4f4"), border: rgb("#d8dbde"))
     用于行内代码高亮显示
   - highlight(content, color: yellow.lighten(70%), stroke: none, radius: 2pt, inset: (x: 4pt, y: 2pt))
     用于文本高亮标记

使用方法:
1. 在 project.with() 中设置 block_theme 参数来全局控制所有块的样式
2. 各函数的 name 参数可自定义标题，为 none 时使用默认英文标题
3. 块函数支持自动继承全局 block_theme 设置

Author: Soleil
*/

#import "../template.typ":*
#show: project.with(
  theme: "lab",
  block_theme: "default",  // 设置块样式主题: default/boxed/float/thickness/dashed
  language: "cn",
  author: "Soleil",
  cover: false
)

= 块级样式演示

== 学术类块

#Theorem[
  对于任意实数 $a, b$，如果 $a > b$，则 $a + c > b + c$ 对任意实数 $c$ 成立。
]

#Theorem(name: "勾股定理")[
  在直角三角形中，斜边的平方等于两直角边的平方和。
  $ a^2 + b^2 = c^2 $
]

#proof[
  由三角形面积公式可得...
  
  因此得证。
]

#example[
  设 $a = 3, b = 4$，则 $c = sqrt(3^2 + 4^2) = 5$
]

#example(name: "数列求和")[
  求等差数列 $1, 2, 3, ..., 100$ 的和。
  
  解：使用求和公式 $S_n = n(a_1 + a_n) / 2 = 100 times 101 / 2 = 5050$
]

#abstract[
  本文研究了 Typst 模板系统中的块级样式设计，提出了一种基于 `blockx` 的统一样式框架。
]

#summary[
  通过本文的学习，我们掌握了：
  - 块级函数的基本用法
  - 自定义标题的方法
  - 主题样式的切换技巧
]

#analysis[
  从实验数据可以看出，该方法在处理大规模数据时具有明显的性能优势。
]

== 信息类块

#info[
  本模板支持多种块级样式主题，可在 `project.with()` 中通过 `block_theme` 参数设置。
]

#note[
  注意：修改 `block_theme` 后需要重新编译文档才能生效。
]

#note(name: "使用提示")[
  建议在开发阶段使用 "default" 主题，发布时切换到 "float" 或 "boxed" 主题以获得更好的视觉效果。
]

#tip[
  可以使用 `strong()` 函数来强调标题中的关键词。
]

#hint[
  按 Ctrl+S 可以快速保存并触发自动编译。
]

#help[
  如果遇到编译错误，请检查：
  1. 是否正确导入了 template.typ
  2. 函数参数是否符合要求
  3. 是否有语法错误
]

== 状态类块

#success[
  恭喜！文档编译成功，所有测试通过。
]

#important[
  本节内容为考试重点，务必掌握！
]

#important(name: "截止日期")[
  作业提交截止时间：2025年11月20日 23:59
]

#warning[
  警告：该操作可能会覆盖现有文件，请谨慎操作。
]

#attention[
  注意：未保存的更改将会丢失！
]

#caution[
  小心：此函数在某些情况下可能产生意外结果。
]

#failure[
  编译失败：找不到指定的图片文件 `image.png`
]

#danger[
  危险：执行此命令将删除所有数据，无法恢复！
]

#error[
  错误：参数类型不匹配，期望 `string`，实际为 `int`
]

#bug[
  已知问题：在某些系统上中文字体可能无法正常显示。
  
  临时解决方案：手动安装思源宋体或更新系统字体库。
]

== 引用类块

#quote[
  "简洁是智慧的灵魂。" — 威廉·莎士比亚
]

#Cite[
  Smith, J. (2024). *Advanced Typst Templating*. Journal of Document Processing, 42(3), 123-145.
]

#experiment[
  实验目的：测试不同 `block_theme` 设置对文档排版的影响。
  
  实验步骤：
  1. 设置 `block_theme: "default"`
  2. 编译并观察效果
  3. 依次测试其他主题
  4. 记录并对比结果
]

#question[
  思考题：如何在不修改 template.typ 的情况下自定义块的颜色？
  
  提示：可以直接调用 `blockx()` 函数并传入自定义的 `color` 参数。
]

== 行内样式演示

使用 #c("inline code") 函数可以高亮显示行内代码，例如 #c("let x = 42", lang: "python")。

你也可以使用 #highlight[黄色高亮] 来强调重要内容，或者使用 #highlight(color: red.lighten(80%))[红色高亮] 表示警告信息。

自定义样式示例：#highlight(
  color: blue.lighten(90%), 
  stroke: 1pt + blue,
  radius: 3pt,
  inset: (x: 6pt, y: 3pt)
)[蓝色边框高亮]

== 不同主题效果对比

#info[
  当前使用的主题是: *default*
  
  要查看其他主题效果，请修改文档开头的 `block_theme` 参数为：
  - `"boxed"` - 盒装样式
  - `"float"` - 浮动标题样式  
  - `"thickness"` - 左侧粗线样式
  - `"dashed"` - 虚线边框样式
]