# 408 计算机统考真题（Typst 版）

2009–2025 年全国硕士研究生招生考试 408 计算机学科专业基础综合真题，共 17 卷，转写为 **Typst** 排版格式。一年一个文件夹。

## 目录结构

```
2009/  2009.typ  images/
2010/  2010.typ  images/
...
2025/  2025.typ  images/
```

每个年份文件夹内：

- `<年份>.typ` —— 该卷真题的 Typst 源文件
- `images/` —— 试卷中的配图（原生分辨率）

## 编译

需要 [Typst](https://typst.app) ≥ 0.13 及网络（首次编译自动下载 `@preview/taskize` 包）：

```bash
cd 2009
typst compile 2009.typ
```

生成同目录下的 `2009.pdf`。

## 格式说明

- 每题用 `#block(breakable: false)[...]` 包裹，避免跨页/跨栏断开
- 选择题选项用 [taskize](https://typst.app/universe/package/taskize) 自动分栏（短选项 4 列横排，长选项纵排）
- 配图以 `#figure(image(...), caption: [...])` 呈现，中文图注编号
- 试卷开头的「考生须知」条目、综合题（41–47 题）均按原文保留

## 来源与校对

- **OCR**：智谱 GLM-OCR（`glm-ocr`，模型 `glm-ocr`）识别原始 PDF
- **打磨**：DeepSeek（`deepseek-chat`）修复数学公式、恢复代码块、修正 OCR 错字
- **校对**：与以下仓库交叉核对，补齐漏题、去除页眉/答案速查等 OCR 杂质，并修正题号缺失
  - [tiankai-333/master408](https://github.com/tiankai-333/master408)（2011–2024 选择题题库）
  - [neville-studio/408-exam-paper](https://github.com/neville-studio/408-exam-paper)（2009–2025 重构版真题）

## 工具

- `glm_ocr.nu` —— OCR → Typst 转换脚本（nushell，依赖 `pandoc`）
- `pdf_images.py` —— 从原始 PDF 抽取原生分辨率配图（依赖 `poppler-utils`）

## 免责声明

本仓库仅用于学习交流，真题版权归教育部考试中心/命题组所有。
