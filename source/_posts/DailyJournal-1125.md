---
title: usage字段的 token 值包含tool_usage吗?---不包含
date: 2026-11-25 10:53:36
tags:
---
顶层 usage 只统计主模型的用量。OpenAI 对 tool_usage 的定义是 “Usage reported by hosted tools, separate from base model usage.” [OpenAI Responses API 文档](https://developers.openai.com/api/reference/python/resources/responses/methods/create)
