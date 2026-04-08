# new-youth-skill for Codex

按下面步骤接入：

1. 确认仓库已克隆到本地。
2. 新会话开始时先读取 `skills/new-youth/SKILL.md`，把它作为路由和方法论约束。
3. 如果宿主支持 Markdown commands，可额外加载 `commands/` 目录作为手动入口；不支持时，直接读取同名命令文件内容即可。
4. 在 Windows 上运行：

```powershell
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File tests/validate.ps1
```

完成后，手动验证两点：
- 会话起始时能够成功读取 new-youth skill
- 针对具体问题时，能够按需调用对应 command
