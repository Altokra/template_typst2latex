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
   方式2: 手动调用 - #zebraw(参数..., ```代码```)
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

#zebraw(code)

#zebraw(
  line-range: (2, 5),
  code
)

#zebraw(
  line-range: (range: (2, 5), keep-offset: false),
  code
)

== 高亮代码行

#zebraw(
  highlight-lines: 2,
  ```python
  device = "cuda"
  model.to(device)
  optimizer = torch.optim.Adam(model.parameters())
  ```
)

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
  highlight-lines: (
    (2, 3, 4),
  ),
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

#zebraw(
  lang: true,
  ```typst
  #grid(
    columns: (1fr, 1fr),
    [Hello], [world!],
  )
  ```
)

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

#zebraw(
  background-color: luma(250),
  ```javascript
  const greeting = "Hello, World!";
  console.log(greeting);
  ```
)

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
    font: "IBM Plex Sans",
    style: "italic"
  ),
  lang-font-args: (
    font: "Buenard",
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

#zebraw(
  radius: 10pt,
  ```python
  print("圆角代码块")
  ```
)

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

#show: zebraw.with() // 重置主题

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
  1. 单独使用: `#zebraw(参数..., ``` ```)`
  2. 局部应用: `#show: zebraw.with(参数...)`
  3. 全局应用: `#show: zebraw-init.with(参数...)`
]

== 数字信号波形

#figure(
  wave((
    (name: "CLK", wave: "P........."),
    (name: "Enable", wave: "01........"),
    (name: "Data", wave: "x=.=.=.x.."),
    (name: "Ready", wave: "0..1.....0"),
    (name: "Valid", wave: "0...1..0.."),
  ), period: 0.8cm),
  caption: "典型的数字信号时序"
)

== 带数据标注的波形

#figure(
  wave((
    (name: "CLK", wave: "p......"),
    (name: "Addr", wave: "x=====x", data: ("A0", "A1", "A2", "A3", "A4")),
    (name: "Data", wave: "x..===x", data: ("D1", "D2", "D3")),
    (name: "WE", wave: "0.1...0"),
    (name: "CS", wave: "01....0"),
  ), period: 1cm),
  caption: "存储器写操作时序图"
)

== SPI 通信时序

#figure(
  wave((
    (name: "SCLK", wave: "p........"),
    (name: "CS", wave: "10.....01"),
    (name: "MOSI", wave: "x.======x", data: ("B7", "B6", "B5", "B4", "B3", "B2")),
    (name: "MISO", wave: "x..=====x", data: ("R7", "R6", "R5", "R4", "R3")),
  ), period: 0.7cm),
  caption: "SPI 串行通信协议时序"
)

== 状态机时序

#figure(
  wave((
    (name: "CLK", wave: "p........."),
    (name: "State", wave: "========..", data: ("IDLE", "S1", "S2", "S3", "S4", "S5", "S6", "S7")),
    (name: "Start", wave: "0.1.0....."),
    (name: "Busy", wave: "0..1....0."),
    (name: "Done", wave: "0.......10"),
  ), period: 0.8cm),
  caption: "状态机运行时序"
)

== UART 通信时序

#figure(
  wave((
    (name: "TX", wave: "1.0======.1", data: ("Start", "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "Stop")),
    (name: "RX", wave: "1..0======1", data: ("Start", "D0", "D1", "D2", "D3", "D4", "D5", "D6")),
    (name: "Baud CLK", wave: "p.........."),
  ), period: 0.6cm),
  caption: "UART 异步串行通信"
)

== 多电平信号

#figure(
  wave((
    (name: "Signal A", wave: "01x.z.01"),
    (name: "Signal B", wave: "0.1.x.z."),
    (name: "Signal C", wave: "x.=.=.x.", data: ("Val1", "Val2")),
  ), period: 1cm),
  caption: "包含高阻态和不定态的信号"
)

== I2C 总线时序

#figure(
  wave((
    (name: "SCL", wave: "1.p.......0"),
    (name: "SDA", wave: "1.0.======1", data: ("Start", "A6", "A5", "A4", "A3", "A2", "A1", "A0", "R/W")),
    (name: "ACK", wave: "1.......0.1"),
  ), period: 0.7cm),
  caption: "I2C 总线起始和地址传输"
)

== 流水线时序

#figure(
  wave((
    (name: "CLK", wave: "p........."),
    (name: "IF", wave: "x====.....", data: ("I1", "I2", "I3", "I4")),
    (name: "ID", wave: "x.====....", data: ("I1", "I2", "I3", "I4")),
    (name: "EX", wave: "x..====...", data: ("I1", "I2", "I3", "I4")),
    (name: "MEM", wave: "x...====..", data: ("I1", "I2", "I3", "I4")),
    (name: "WB", wave: "x....====.", data: ("I1", "I2", "I3", "I4")),
  ), period: 0.7cm),
  caption: "五级流水线执行时序"
)

== 复杂总线协议

#figure(
  wave((
    (name: "CLK", wave: "p.........."),
    (name: "ADDR", wave: "x==.......x", data: ("Addr", "Addr+1")),
    (name: "DATA", wave: "x...====..x", data: ("D0", "D1", "D2", "D3")),
    (name: "CS", wave: "01........0"),
    (name: "RD", wave: "0.1......0."),
    (name: "READY", wave: "0....1..0.."),
    (name: "BURST", wave: "0..1....0.."),
  ), period: 0.7cm),
  caption: "突发读操作总线时序"
)

== 使用技巧说明

#info[
  *波形符号说明:*
  - `p` / `P`: 正脉冲（时钟信号）
  - `n` / `N`: 负脉冲
  - `0`: 低电平
  - `1`: 高电平  
  - `x`: 不定态（未知状态）
  - `z`: 高阻态（三态门）
  - `=`: 数据状态（配合 data 参数显示具体值）
  - `.`: 保持上一个状态
  - `|`: 垂直分隔线
]

#tip[
  *绘制技巧:*
  1. 使用 `period` 参数调整波形的时间刻度宽度
  2. 使用 `data` 数组为总线信号添加数据标注
  3. 多个信号要对齐，确保 wave 字符串长度一致
  4. 可以用 `.` 符号延长信号的保持时间
]

#note[
  *常见应用场景:*
  - 硬件接口文档：SPI、I2C、UART 等
  - 数字电路设计：时序约束、状态转换
  - FPGA 项目：模块间通信协议
  - 处理器架构：流水线、总线操作
]
