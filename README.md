# Typst Report Template

Soleil 的 Typst 实验报告模板，基于 mem 和 Sydney257 的模版进行改进（缝合怪bushi）。

项目地址链接

[memset0](https://github.com/memset0/ZJU-Project-Report-Template)

 [Sydney257](https://github.com/CrossStar/ZJU-simpleLabReport-Typst)

## 效果概览

### 个人报告

![PixPin_2025-11-16_23-50-57](https://phenthu-1321233386.cos.ap-nanjing.myqcloud.com/img/PixPin_2025-11-16_23-50-57.png)

![image-20251117000519811](https://phenthu-1321233386.cos.ap-nanjing.myqcloud.com/img/image-20251117000519811.png)

![6C5A2F69-5995-45B1-BA0E-626805CD9E6B](https://phenthu-1321233386.cos.ap-nanjing.myqcloud.com/img/6C5A2F69-5995-45B1-BA0E-626805CD9E6B.png)

### 源于前两个项目

Memset0

![image-20251117000804758](https://phenthu-1321233386.cos.ap-nanjing.myqcloud.com/img/image-20251117000804758.png)

Sydney257

![img](https://phenthu-1321233386.cos.ap-nanjing.myqcloud.com/img/202411301600214.jpg)

> [!Important]
> 装订线这个可能会因为使用了`#pagebreak()`产生bug，解决办法就是删掉最近的一处break hhhhhh （不过这个装订线其实也是最近新搞的， 其实感觉老师也没那么在意装订线这种东西，之前本人也没怎么用装订线（电设2的时候几乎没用））

## 项目结构

```
├── template.typ          # 主模板文件
├── example/              # 功能示例
│   ├── algo_try.typ      # 轻量代码排版示例
│   ├── bindingMargin.typ # 装订线示例
│   ├── highlight.typ     # 代码高亮示例
│   ├── mitexInTypst.typ  # LaTeX 数学公式示例
│   ├── table.typ         # 表格样式示例
│   ├── zebraw.typ        # 代码美化示例
│   └── ...               # 其他功能示例
├── ReportExample/        # 完整报告示例
│   ├── Soleil_Example/   # Soleil 的实验报告示例
│   │   └── Arduino_MOOCTwo.typ  # 电子电路设计实验报告
│   └── memExample/       # mem 模板示例
└── images/               # 图片资源
```



## 使用方法

1. 引入模板：
```typst
#import "template.typ": *
```

2. 配置文档：

**快速开始**

> [!important]
>
> 事实上这一版才是最常用的，对于电设实验来说

```typst
#show: project.with(
  theme: "lab",
  language: "cn",
  cover: true,
  author: "Soleil",
  school_id: "323010xxxx",
  course: "电子电路设计实验II",
  college: "信息与电子工程学院",
  date: "2025年4月6日",
  teacher: "施红军、叶险峰、邓婧婧",
  major: "微电子科学与工程",
  page_header: true
)
```

![PixPin_2025-11-16_23-41-26](https://phenthu-1321233386.cos.ap-nanjing.myqcloud.com/img/PixPin_2025-11-16_23-41-26.png)

### 使用示例

**完整配置示例**

```typst
#show: project.with(
  // 主题
  theme: "lab",
  block_theme: "default",
  language: "cn",
  
  // 封面
  cover: true,
  cover_name: "本科实验报告",
  cover_subname: "Undergraduate Lab Report",
  
  // 文档信息
  title: "Arduino 基础实验",
  course: "微机原理与接口技术",
  semester: "2025-2026学年第一学期",
  
  // 个人信息
  author: "张三",
  school_id: "2021123456",
  college: "信息科学与电子工程学院",
  major: "电子信息工程",
  
  // 实验信息
  teacher: "李教授",
  place: "东四216",
  date: datetime.today().display("[year]年[month]月[day]日"),
  ProjName: "Arduino基本实验_header",
  
  // 页面设置
  page_header: true,
  table_of_contents: true,
  
  // 文本设置
  text_size: 12pt,
  text_Paragraphspace: 0.75em,
)
```

**实验表头配置**

**注意：这一块的参数如果名字和前面`#show: project.with`重合了的话，`#show: project.with`的优先级会高一点，会覆盖掉`ISEE_Header`中的参数**

```typst
#ISEE_Header(ProjName: "Arduino基本实验", type: "设计型实验", groupmate: "my Partner", place: "东四216")
// 这东西决定了电设实验的表头
```

![PixPin_2025-11-16_23-47-10](https://phenthu-1321233386.cos.ap-nanjing.myqcloud.com/img/PixPin_2025-11-16_23-47-10.png)

### 参数详解

> 这一个小标题大部分是ai的，没仔细审核，大致看一下就可以了，可能不会特别严谨 欢迎纠错QAQ **（事实上这部分功能可以自己慢慢分析源码，然后就可以在此基础上进行魔改了）**

#### 主题和语言设置

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `theme` | string | `"project"` | 主题选择，可选 `"project"`, `"lab"` 等 |
| `block_theme` | string | `"default"` | "Note. Important块"主题 |
| `language` | string | `none` | 语言设置，如 `"cn"` 中文（主要是行间距的区别） |

"Note. Important块"主题

![PixPin_2025-11-16_23-46-48](https://phenthu-1321233386.cos.ap-nanjing.myqcloud.com/img/PixPin_2025-11-16_23-46-48.png)

#### 封面设置

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `cover` | boolean | `true` | 是否显示封面 |
| `cover_name` | string | `"本科实验报告"` | 封面主标题 |
| `cover_subname` | string | `"Project Report"` | 封面副标题 |
| `cover_image_padding` | length | `1em` | 封面图片内边距**（取默认值就好）** |
| `cover_image_size` | length | `none` | 封面图片尺寸**（取默认值就好）** |
| `cover_comments` | content | `none` | 封面备注信息**（取默认值就好）** |
| `cover_comments_size` | length | `1.25em` | 封面备注字体大小**（取默认值就好）** |

#### 文档信息

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `title` | string | `"<title>"` | 报告标题 |
| `title_size` | length | `3em` | 标题字体大小 |
| `course` | string | `none` | 课程名称 |
| `semester` | string | `"<semester>"` | 学期信息 |
| `date` | datetime/string | `none` | 日期 |

#### 个人信息

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `name` | string | `none` | 姓名（别名：`author`） |
| `author` | string | `none` | 作者姓名 |
| `school_id` | string | `none` | 学号 |
| `college` | string | `none` | 学院 |
| `major` | string | `none` | 专业 |

#### 实验信息

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `teacher` | string | `none` | 指导教师 |
| `place` | string | `none` | 实验地点 |
| `ProjName` | string | `none` | 项目/实验名称 |

#### 页面设置

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `page_header` | boolean | `false` | 是否显示页眉 |
| `table_of_contents` | boolean | `不同主题默认值不同` | 目录设置 |

#### 字体设置

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `font_serif` | array | 见源码 | 衬线字体列表（含中文支持） |
| `font_sans_serif` | array | 见源码 | 无衬线字体列表（含中文支持） |
| `font_mono` | array | `("Consolas", "Monaco")` | 等宽字体（代码） |

#### 文本排版

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `text_size` | length | `12pt` | 正文字体大小 |
| `text_Paragraphspace` | length | `0.75em` | 段落间距 |

## 功能示例

- `algo_try.typ` - 轻量代码排版
- `table.typ` - 表格样式
- `highlight.typ` - 代码高亮
- `mitexInTypst.typ` - LaTeX 数学公式
- `zebraw.typ` - 代码美化管理（可支持代码量较大）
- `bindingMargin.typ` - 装订线

## 完整示例

参考以下完整报告示例：
- `ReportExample/Soleil_Example/Arduino_MOOCTwo.typ` - Arduino 实验报告示例
- `ReportExample/memExample/` - mem 原始模板示例集

## 依赖

- tablex
- showybox
- i-figured
- mitex
- zebraw
- algo
