/*
  文本高亮函数库
  
  本文件提供了多种文本高亮和标记的实用函数，适用于：
  - 强调重要内容
  - 标记代码片段
  - 创建视觉提示
  - 美化文档排版
  
  包含的高亮函数：
  1. highlight() - 基础高亮函数，可自定义颜色和样式
  2. mark() - 预设7种颜色的快速标记
  3. code_hl() - 代码片段专用高亮
  4. important() - 带图标的重要提示框
  5. underline_hl() - 下划线强调
  6. border_hl() - 边框高亮
  7. gradient_hl() - 渐变色高亮
  
  使用示例见文件末尾的演示部分
*/

// ===== 改进版本的通用高亮函数 =====

// 1. 基础高亮函数 - 更好的默认设置
#let highlight(
  content,
  color: yellow.lighten(70%),
  stroke: none,
  radius: 2pt,
  inset: (x: 4pt, y: 2pt)
) = {
  box(
    fill: color,
    stroke: stroke,
    radius: radius,
    inset: inset,
    baseline: 20%,  // 调整基线对齐
    content
  )
}

// 2. 彩色标记函数 - 预设多种颜色
#let mark(content, type: "yellow") = {
  let colors = (
    yellow: rgb("#fff3cd"),
    blue: rgb("#cce7ff"), 
    green: rgb("#d4edda"),
    red: rgb("#f8d7da"),
    purple: rgb("#e7d4f0"),
    orange: rgb("#ffe4b3"),
    gray: rgb("#f8f9fa")
  )
  
  box(
    fill: colors.at(type, default: colors.yellow),
    inset: (x: 3pt, y: 1.5pt),
    radius: 3pt,
    baseline: 15%,
    content
  )
}

// 3. 代码高亮函数 - 专为代码设计
#let code_hl(
  content,
  lang: none,
  bg: rgb("#f3f4f4"),
  border: rgb("#d1d9e0")
) = {
  box(
    fill: bg,
    stroke: (paint: border, thickness: 0.5pt),
    inset: (x: 6pt, y: 3pt),
    radius: 4pt,
    baseline: 20%,
    text(
      font: "Fira Code",
      weight: "medium",
      content
    )
  )
}

// 4. 重要提示高亮 - 带图标的高亮
#let important(content, icon: "⚠", color: rgb("#fff3cd")) = {
  box(
    fill: color,
    stroke: (paint: rgb("#ffeaa7"), thickness: 1pt),
    inset: (x: 8pt, y: 4pt),
    radius: 4pt,
    baseline: 20%,
    [#text(weight: "bold")[#icon] #content]
  )
}

// 5. 下划线高亮 - 不改变背景
#let underline_hl(content, color: blue) = {
  underline(content, stroke: (paint: color, thickness: 2pt))
}

// 6. 边框高亮 - 只有边框无背景
#let border_hl(content, color: blue, thickness: 1.5pt) = {
  box(
    stroke: (paint: color, thickness: thickness),
    inset: (x: 4pt, y: 2pt),
    radius: 3pt,
    baseline: 15%,
    content
  )
}

// 7. 渐变高亮 - 现代感
#let gradient_hl(content, start: blue.lighten(80%), end: blue.lighten(90%)) = {
  box(
    fill: gradient.linear(start, end, angle: 45deg),
    inset: (x: 5pt, y: 2pt),
    radius: 4pt,
    baseline: 18%,
    content
  )
}

// 8. 键盘按键样式 - 适合按键名称
#let kbd(content) = {
  box(
    fill: rgb("#f8f9fa"),
    stroke: (paint: rgb("#d1d9e0"), thickness: 1pt),
    inset: (x: 6pt, y: 3pt),
    radius: 3pt,
    baseline: 15%,
    text(
      weight: "bold",
      font: "Monaco",
      size: 0.9em,
      content
    )
  )
}

// 9. 变量名高亮 - 适合变量和信号名
#let var(content) = {
  box(
    fill: rgb("#f0f8ff"),
    inset: (x: 3pt, y: 1pt),
    radius: 2pt,
    baseline: 12%,
    text(
      font: "Fira Code",
      weight: "medium",
      fill: rgb("#0066cc"),
      content
    )
  )
}

// 10. 数值高亮 - 适合数字和计算结果
#let num(content, unit: none) = {
  let text_content = if unit != none [#content #unit] else [#content]
  box(
    fill: rgb("#f0fff0"),
    stroke: (paint: rgb("#90ee90"), thickness: 0.5pt),
    inset: (x: 4pt, y: 2pt),
    radius: 2pt,
    baseline: 15%,
    text(
      font: "Fira Code",
      weight: "bold",
      fill: rgb("#006400"),
      text_content
    )
  )
}

// ===== 使用示例 =====

= 高亮函数使用示例

== 基础高亮
这是 #highlight[普通高亮文本] 的效果。

== 彩色标记
- #mark("黄色标记") (默认)
- #mark("蓝色标记", type: "blue")
- #mark("绿色标记", type: "green")
- #mark("红色标记", type: "red")
- #mark("紫色标记", type: "purple")

== 代码高亮
行内代码：#code_hl[printf("hello")] 和 #code_hl[reset_play]

== 重要提示
#important[这是一个重要的注意事项]


== 其他样式
- 下划线高亮：#underline_hl[重要内容]
- 边框高亮：#border_hl[边框样式]  
- 渐变高亮：#gradient_hl[现代渐变]
- 键盘按键：按下 #kbd[Ctrl+C] 复制
- 变量名：#var[reset_play] 信号
- 数值显示：频率为 #num[16.60, unit: "MHz"]

== 文档中的应用

当 #var[reset] 信号产生高电平脉冲时，#var[reset_play] 信号在时钟上升沿到来后被置为 #num[1]。

系统的分辨率为 #num[0.05, unit: "mV"]，理论频率为 #num[242.16, unit: "kHz"]。

按下 #kbd[play_Pause] 按键可以控制播放状态。

#important[注意：仿真结果与理论计算存在差异，需要进一步分析系统级配置。]
