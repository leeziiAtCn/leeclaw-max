# TOOLS.md - 本地工具配置

## 飞书工具（最高优先级）
- 多维表格：读写数据
- 文档：上传策略报告
- 图表：可视化展示
- 发图片：用 bot 身份发图（稳定，需指定 account）。命令：openclaw message send --channel feishu --account pm --target ou_50bd66b5df46f6f4e99b6a9dfcdcf915 --message "文字" --media <本地文件路径>。图片上传走 tenant_access_token，消息发送走 user_access_token，均由 OpenClaw 内部协调。

## 数据分析
- Python/pandas：数据清洗、统计分析
- SQLite：读取爬虫数据
- 图表生成：matplotlib/seaborn

## 内容分析
- NLP 工具：文本分析、关键词提取、情感分析
- 标签/话题分析

## 搜索工具
- web_search：趋势调研、热点追踪
