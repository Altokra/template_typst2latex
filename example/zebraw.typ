/*
Documentation:
File: zebraw.typ
Description: zebraw 包的使用示例 - 用于在 Typst 中美化代码块显示
            提供行号、代码高亮、注释、主题等功能，让代码展示更加专业美观
            
功能说明:
zebraw 是一个轻量级的代码美化库，支持代码块的行号显示、行高亮、注释标注等功能。

主要函数:
1. zebraw() - 核心代码美化函数
   参数:
   - numbering: 行号显示 (true/false/自定义数组)
   - numbering-offset: 行号起始偏移
   - numbering-separator: 是否显示行号分隔线
   - line-range: 代码行范围切片
   - highlight-lines: 高亮的行号 (单个数字或数组)
   - highlight-color: 高亮颜色
   - header: 代码块头部内容
   - footer: 代码块底部内容
   - lang: 语言标签显示
   - indentation: 缩进参考线 (空格数)
   - hanging-indent: 悬挂缩进
   - background-color: 背景颜色
   - comment-flag: 注释标记符号 (默认 ">")
   - theme: 主题样式

2. 使用方式:
   方式1: 全局应用 - #show: zebraw
   方式2: 手动调用 - #zebraw(参数..., 代码块)
   方式3: 全局初始化 - #show: zebraw-init.with(参数...)

3. 主题:
   - zebraw-themes.zebra: 斑马纹主题
   - zebraw-themes.zebra-reverse: 反色斑马纹

4. 高级功能:
   - 多颜色高亮: 不同行使用不同颜色
   - 行注释: 为高亮行添加解释性文字
   - 行号自定义: 使用自定义标记代替数字
   - 代码切片: 只显示部分代码行
   - 缩进线: 显示代码缩进层级

使用场景:
- 编程教程和技术文档
- 代码示例展示
- 算法说明
- 代码审查和注释

Package: @preview/zebraw:0.6.0
Author: Soleil (Documentation)
*/

#import "../template.typ": *
#import "@preview/zebraw:0.6.0": zebraw, zebraw-themes

#show: project.with(
  theme: "lab",
  language: "cn",
  author: "Soleil",
  cover: false
)

= Zebraw 代码美化示例

== 基本使用 - 带行号的代码块

#zebraw(
  ```typst
  #grid(
    columns: (1fr, 1fr),
    [Hello], [world!],
  )
  ```
)

== 关闭行号

#zebraw(
  numbering: false,
  ```python
  def fibonacci(n):
      if n <= 1:
          return n
      return fibonacci(n-1) + fibonacci(n-2)
  ```
)

== 自定义行号起始位置

#zebraw(
  numbering-offset: 10,
  ```rust
  fn main() {
      println!("Hello, world!");
  }
  ```
)

== 行号分隔线

#zebraw(
  numbering-separator: true,
  ```cpp
  #include <iostream>
  int main() {
      std::cout << "Hello World!" << std::endl;
      return 0;
  }
  ```
)

== 代码行切片

#let code = ```python
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

result = factorial(5)
print(f"5! = {result}")
```

完整代码：
#zebraw(code)

只显示第2-5行：
#zebraw(
  line-range: (2, 5),
  code
)

切片并重置行号：
#zebraw(
  line-range: (range: (2, 5), keep-offset: false),
  code
)

== 高亮代码行

高亮单行：
#zebraw(
  highlight-lines: 2,
  ```python
  device = "cuda"
  model.to(device)
  optimizer = torch.optim.Adam(model.parameters())
  ```
)

高亮多行：
#zebraw(
  highlight-lines: (1, 3, 5),
  ```python
  import numpy as np
  import pandas as pd
  import matplotlib.pyplot as plt
  
  data = pd.read_csv('data.csv')
  plt.plot(data)
  plt.show()
  ```
)

== 多颜色高亮

#zebraw(
  highlight-lines: (
    (1, rgb("#edb4b0").lighten(50%)),
    (2, rgb("#a4c9a6").lighten(50%)),
  ),
  ```python
  - device = "cuda"
  + device = accelerator.device
    model.to(device)
  ```
)

== 添加行注释

#zebraw(
  highlight-lines: (
    (1, rgb("#edb4b0").lighten(50%), [删除的行]),
    (2, rgb("#a4c9a6").lighten(50%), [新增的行]),
  ),
  ```python
  - device = "cuda"
  + device = accelerator.device
    model.to(device)
  ```
)

== 自定义注释标记

#zebraw(
  highlight-lines: (
    (2, [计算斐波那契数列]),
  ),
  comment-flag: "~~>",
  ```python
  def fibonacci(n):
      return n if n <= 1 else fibonacci(n-1) + fibonacci(n-2)
  
  print(fibonacci(10))
  ```
)

== 禁用注释标记（无缩进）

#zebraw(
  highlight-lines: (
    (2, [这是一个递归函数]),
  ),
  comment-flag: "",
  ```python
  def fibonacci(n):
      return n if n <= 1 else fibonacci(n-1) + fibonacci(n-2)
  ```
)

== 添加 Header 和 Footer

#zebraw(
  highlight-lines: (2, 3, 4),
  header: [*斐波那契数列计算*],
  footer: [斐波那契数列定义: $F_n = F_(n-1) + F_(n-2)$],
  ```python
  def fibonacci(n):
      if n <= 1:
          return n
      return fibonacci(n-1) + fibonacci(n-2)
  
  result = [fibonacci(i) for i in range(10)]
  print(result)
  ```
)

== 显示语言标签

默认语言标签：
#zebraw(
  lang: true,
  ```typst
  #grid(
    columns: (1fr, 1fr),
    [Hello], [world!],
  )
  ```
)

自定义语言标签：
#zebraw(
  lang: strong[Python 3.11],
  ```python
  print("Hello, World!")
  ```
)

== 缩进参考线

#zebraw(
  indentation: 2,
  ```python
  def nested_example():
      for i in range(10):
          if i % 2 == 0:
              print(f"{i} is even")
          else:
              print(f"{i} is odd")
  ```
)

== 悬挂缩进

#zebraw(
  hanging-indent: true,
  ```python
  result = very_long_function_name(argument1, argument2, argument3, argument4, argument5)
  
  data = {"key1": "value1", "key2": "value2", "key3": "value3", "key4": "value4"}
  ```
)

== 自定义背景颜色

单色背景：
#zebraw(
  background-color: luma(250),
  ```javascript
  const greeting = "Hello, World!";
  console.log(greeting);
  ```
)

斑马纹背景：
#zebraw(
  background-color: (luma(235), luma(245), luma(255), luma(245)),
  ```javascript
  function fibonacci(n) {
      return n <= 1 ? n : fibonacci(n-1) + fibonacci(n-2);
  }
  console.log(fibonacci(10));
  ```
)

== 自定义高亮颜色

#zebraw(
  highlight-lines: (1, 2),
  highlight-color: blue.lighten(90%),
  ```text
  这是第一行
  这是第二行
  这是第三行
  ```
)

== 自定义注释颜色

#zebraw(
  highlight-lines: (
    (1, [第一行注释]),
    (2, [第二行注释]),
  ),
  comment-color: yellow.lighten(90%),
  ```text
  Line 1
  Line 2
  Line 3
  ```
)

== 自定义语言标签颜色

#zebraw(
  lang: true,
  lang-color: teal,
  ```typst
  #grid(
    columns: (1fr, 1fr),
    [Hello], [world!],
  )
  ```
)

== 自定义字体

#zebraw(
  highlight-lines: (
    (2, [这是注释]),
  ),
  lang: true,
  comment-color: white,
  comment-font-args: (
    font: "Helvetica",
    style: "italic"
  ),
  lang-font-args: (
    font: "Helvetica",
    weight: "bold",
    fill: white,
  ),
  lang-color: eastern,
  ```typst
  #grid(
    columns: (1fr, 1fr),
    [Hello], [world!],
  )
  ```
)

== 自定义圆角

圆角代码块：
#zebraw(
  radius: 10pt,
  ```python
  print("圆角代码块")
  ```
)

直角代码块：
#zebraw(
  radius: 0pt,
  ```python
  print("直角代码块")
  ```
)

== 主题样式 - Zebra

#show: zebraw.with(..zebraw-themes.zebra)

```rust
pub fn fibonacci_recursive(n: i32) -> u64 {
    if n < 0 {
        panic!("{} is negative!", n);
    }
    match n {
        0 => panic!("zero is not a right argument!"),
        1 | 2 => 1,
        3 => 2,
        _ => fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2),
    }
}
```

#show: zebraw.with() 

#v(1em)
（已重置主题）

== 使用技巧总结

#info[
  *Zebraw 核心功能:*
  - `numbering`: 控制行号显示
  - `highlight-lines`: 高亮特定行
  - `header` / `footer`: 添加标题和注脚
  - `lang`: 显示语言标签
  - `indentation`: 显示缩进参考线
  - `background-color` / `highlight-color`: 自定义颜色
]

#tip[
  *使用建议:*
  1. 代码教程: 使用 `highlight-lines` + 注释解释关键代码
  2. 代码对比: 使用多颜色高亮显示差异
  3. 长代码: 使用 `line-range` 只显示关键部分
  4. 美观展示: 使用主题或自定义颜色
]

#note[
  *三种应用方式:*
  1. 单独使用: `#zebraw(参数, 代码块)`
  2. 局部应用: `#show: zebraw.with(参数)`
  3. 全局应用: `#show: zebraw-init.with(参数)`
]
