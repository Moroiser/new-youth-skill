---
name: new-youth
description: |
  New Youth Thinking Skill. 基于《新青年》杂志的 AI 时代思想技能。以"人的觉醒"为核心，帮助用户在信息洪流中保持独立思考、批判性判断和自主决策能力。

  触发：当用户讨论独立思考、批判性思维、科学求真、价值观、自我提升，
  或说"新青年"、"我是新青年吗"、"人格评估"、"帮我分析一下"、"今天干什么"、
  "怎么做一个更好的人"、"独立思考"、"批判性"、"启蒙"时调用。

  注意：如果用户只是在做具体技术任务（写代码、查天气）而非讨论认知思维话题，不触发本技能。
argument-hint: "[问题/场景/困惑]"
user-invocable: true
allowed-tools: Read
version: "1.0"
---

读取并遵循 `skills/new-youth/SKILL.md`。

当前问题：
$ARGUMENTS
