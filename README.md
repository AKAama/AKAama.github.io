# Astro Starter Kit: Blog

```sh
npm create astro@latest -- --template blog
```

> 🧑‍🚀 **Seasoned astronaut?** Delete this file. Have fun!

# my-hexo-blog

这是一个使用 Hexo 生成的个人博客。下面是日常写文章、预览、构建和部署时最常用的命令。

## 初始化

```bash
npm install                 # 安装依赖
```

## 新建文章

```bash
npm run new -- "文章标题"
```

文章会创建在 `source/_posts/`，内容会根据 `scaffolds/post.md` 自动生成。也可以直接使用 Hexo 命令：

```bash
npx hexo new post "文章标题"
```

## 本地预览

```bash
npm run server
```

启动后访问 <http://localhost:4000>。这个命令会先清理缓存，并使用 `_config.local.yml`，适合日常预览。

常用参数：

```bash
# 指定端口
npx hexo server --config _config.yml,_config.local.yml -p 8080

# 启动后自动打开浏览器，并监听文件变化
npx hexo server --config _config.yml,_config.local.yml --open --livereload
```

## 构建与部署

```bash
npm run clean                 # 清理 Hexo 缓存
npm run build                 # 生成静态文件到 public/
npm run deploy                # 构建并部署到配置的远程仓库
```

`npm run deploy` 只负责 Hexo 部署。如果还需要把源代码提交到 `source` 分支，并同步主题子模块，请使用：

```bash
./deploy_with_backup.sh
```

这个脚本会交互式询问提交信息，并执行“提交源代码 + 部署博客”的完整流程；日常只想发布博客时使用 `npm run deploy` 即可。

如果只是检查线上构建结果，可以按顺序执行：

```bash
npm run clean && npm run build
```

## 直接使用 Hexo CLI

```bash
npx hexo list post            # 列出文章
npx hexo generate             # 生成静态文件
npx hexo version              # 查看 Hexo 版本
npx hexo --help               # 查看所有命令
```

## 目录速查

```text
source/_posts/       Markdown 文章
scaffolds/post.md    新文章模板
themes/              博客主题
public/              Hexo 生成的静态文件
_config.yml          线上配置
_config.local.yml    本地预览配置
```

## 日常工作流

```bash
npm run new -- "今天的标题"
npm run server
# 编辑 source/_posts/ 下的新文章
npm run clean && npm run build
npm run deploy
```
