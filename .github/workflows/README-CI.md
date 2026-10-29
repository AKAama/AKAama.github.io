# Hexo CI（source → main）

- 工作流：`deploy.yml`，在推送到 `source` 且 `source/_posts` 等相关路径变更时构建，并用 `peaceiris/actions-gh-pages` 发布到 **`main`**。
- GitHub Pages 继续从 **`main` /** 提供站点（已有设置，无需改 Pages source）。
- **主题坑**：`themes/hexo-theme-ZenMind` 历史上是 **gitlink（mode 160000）且没有 `.gitmodules`**。CI 无法 `submodules: recursive` 拉到主题。
  - 本机草稿已把主题**实体文件 vendoring**进仓库（替换 gitlink）。推送前请确认 `themes/hexo-theme-ZenMind/_config.yml` 存在。
  - 若不想 vendor，需自备可访问的主题仓库并补 `.gitmodules`，再改 checkout 步骤。
- 不需要额外 Secrets：使用默认 `GITHUB_TOKEN`（`contents: write`）即可写 `main`。
- diary-relay 只写 `source/_posts`；本工作流负责生成并更新线上 `hexo.ismyh.cn`。
