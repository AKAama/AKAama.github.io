#!/bin/bash

# Hexo博客一键部署脚本
# 功能：提交源代码到source分支，同时部署博客到main分支

set -e

echo "========================================"
echo "Hexo博客一键部署工具"
echo "========================================"

# 获取提交信息
read -p "请输入提交信息 (默认: 站点更新)：" commit_msg
commit_msg=${commit_msg:-"站点更新"}

# 检查git环境
echo "检查Git环境..."
git status > /dev/null 2>&1 || {
    echo "错误：当前目录不是有效的Git仓库！"
    exit 1
}

# 检查本地更改
echo "检查本地更改..."
if git diff-index --quiet HEAD --; then
    echo "警告：没有检测到本地更改，是否继续？(y/N)"
    read -r response
    [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]] && {
        echo "操作已取消"
        exit 0
    }
fi

# 切换到main分支并同步
echo "切换到main分支..."
git checkout main > /dev/null

echo "同步最新更改..."
git pull origin main > /dev/null 2>&1 || echo "注意：无法从远程拉取更改，可能远程没有main分支或没有网络连接"

# 提交源代码到source分支
echo "提交源代码到source分支..."
git add .
git commit -m "$commit_msg"
git push origin main:source > /dev/null
echo "✅ 源代码已成功提交到source分支！"

# 部署Hexo博客
echo "开始部署Hexo博客..."
echo "清理缓存..."
npx hexo clean > /dev/null
echo "生成静态文件..."
npx hexo generate > /dev/null
echo "部署到GitHub Pages..."
npx hexo deploy > /dev/null
echo "✅ 博客已成功部署到main分支！"

echo "========================================"
echo "✅ 操作完成！"
echo "📝 源代码已备份到 source 分支"
echo "🚀 博客已部署到 main 分支"
echo "🌐 访问地址: https://hexo.ismyh.cn"
echo "========================================"