# TOOLS.md - 本地工具配置

## 飞书工具（最高优先级）
- 完整飞书 IM/文档/多维表格工具（用于上传报告）
- 发图片：用 bot 身份发图（稳定，需指定 account）。命令：openclaw message send --channel feishu --account cto --target <open_id> --message "文字" --media <本地文件路径>。图片上传走 tenant_access_token，消息发送走 user_access_token，均由 OpenClaw 内部协调。
- ⚠️ 文件存放规则：所有待发送的图片、截图、文件必须放在 `~/.openclaw/media/` 目录下，再引用该路径发送。系统路径（如 /System、/Library）下的文件会被飞书拦截。

## 开发工具
- exec：执行所有 shell 命令、脚本、安装依赖
- read/edit/write：读写代码文件

## 浏览器自动化
- Playwright（Node.js）：浏览器控制、XHR 拦截、截图
- 截图工具：peekaboo

## 数据处理
- Python：Cookie 提取、数据分析
- SQLite：本地存储
- Node.js：爬虫脚本

## 网络工具
- curl：HTTP 请求测试
- 浏览器 DevTools：手动抓包
