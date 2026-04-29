<!--
 * @Author: ka1shu1 cwh979946@163.com
 * @Date: 2026-04-29 14:47:19
 * @LastEditors: ka1shu1 cwh979946@163.com
 * @LastEditTime: 2026-04-29 16:21:17
 * @FilePath: \template_typst2latex\README.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# ZJU LaTeX 实验报告模板

这是一个浙江大学实验报告 LaTeX 模板，已迁移自原 Typst 实验报告样式。模板包含封面、目录、页眉、信息与电子工程学院实验表头、装订线、提示框、代码块、图片、表格和参考文献示例。

## 文件结构

```text
├── main.tex          # 报告正文入口
├── zjureport.sty     # 模板样式文件
├── reference.bib     # BibTeX 参考文献
├── images/           # 封面与实验表头图片
└── figures/          # 正文示例图片
```

## 使用方法

在 `main.tex` 顶部修改 `\zjusetup{...}` 中的课程、姓名、学号、学院、专业、教师、地点、实验名称等字段，然后编写正文即可。

常用命令：

- `\cover`：生成封面。
- `\tableofcontents`：生成目录。
- `\ISEEHeader`：生成实验报告表头，并从正文开始显示装订线。
- `\disablebindingline` / `\enablebindingline`：手动关闭或开启装订线。
- `\importantbox{...}`、`\notebox{...}`、`\warningbox{...}`：提示框。
- `lstlisting`：代码块。
- `\reference`：生成 BibTeX 参考文献。

## 编译

推荐使用 XeLaTeX：

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```


## 参考

[typst版本](https://github.com/xw-Soleil/ReportTemplate_Soleil) 

[cc98](https://www.cc98.org/topic/6346287)
---
[latex报告模板](https://cn.overleaf.com/latex/templates/zhe-jiang-da-xue-ke-cheng-lun-wen-mo-ban/mjpzqvgsmdzn)

## 声明

仅供参考