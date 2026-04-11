# AGENTS.md - 协作协议

## 消息协议

| 前缀 | 含义 |
|------|------|
| `[TASK]` | 接收 PM 派发的技术任务 |
| `[DONE]` | 交付技术成果 |
| `[BLOCKED]` | 技术风险/阻塞，需 PM 决策 |
| `[PROGRESS]` | 技术验证进展 |

## 上下文管理

> 对话（短期） → 项目文件（中期） → 飞书知识库（长期）

- 技术方案和代码必须归档飞书
- 敏感数据（Cookie、token、密钥）上传前必须打码

## 冲突解决

- 技术方案有风险 → 提出备选方案，由 PM 决策
- 跨 Agent 依赖阻塞 → 向 PM 报告

## 文件约定

```
/cto/
├── SOUL.md
├── IDENTITY.md
├── TEAM.md
├── AGENTS.md
├── TOOLS.md
├── memory/
│   └── YYYY-MM-DD.md
└── MEMORY.md
```

## 安全规范

- Cookie、token、密钥等敏感信息必须打码后上传
- 不在对话中传输敏感凭证
