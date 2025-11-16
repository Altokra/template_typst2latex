/*
  MiTeX 在 Typst 中使用 LaTeX 公式示例
  
  MiTeX 是一个在 Typst 中使用 LaTeX 语法编写数学公式的包。
  
  主要功能：
  - mi() 或 mi[] - 行内公式，支持 LaTeX 数学语法
  - mitex() - 块级公式，支持复杂的 LaTeX 数学环境
  - mitext() - 文本模式，支持 LaTeX 文本命令和环境
  - mitex-convert() - 将 LaTeX 公式转换为 Typst 格式
  
  优势：
  - 对熟悉 LaTeX 的用户友好
  - 支持 LaTeX 宏定义和复杂公式
  - 可以混合使用 LaTeX 和 Typst 语法
  
  项目地址: https://github.com/mitex-rs/mitex
*/

#import "@preview/mitex:0.2.5": *

#assert.eq(mitex-convert("\alpha x"), "alpha  x ")

Write inline equations like #mi("x") or #mi[y].

Also block equations (this case is from #text(blue.lighten(20%), link("https://katex.org/")[katex.org])):

#mitex(`
  \newcommand{\f}[2]{#1f(#2)}
  \f\relax{x} = \int_{-\infty}^\infty
    \f\hat\xi\,e^{2 \pi i \xi x}
    \,d\xi
`)

We also support text mode (in development):

#mitext(`
  \iftypst
    #set math.equation(numbering: "(1)", supplement: "equation")
  \fi

  \section{Title}

  A \textbf{strong} text, a \emph{emph} text and inline equation $x + y$.

  Also block \eqref{eq:pythagoras}.

  \begin{equation}
    a^2 + b^2 = c^2 \label{eq:pythagoras}
  \end{equation}
`)