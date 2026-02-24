#!/bin/bash
# init-ritual.sh - 初始化马年开工仪式仓库
# 用法: ./init-ritual.sh [节点数量]
# 默认创建20个节点

# 获取节点数量参数，默认为20
NODE_COUNT=${1:-20}

mkdir -p start .github/workflows docs

# 清空现有文件
rm -f start/*.md

# 创建指定数量的节点文件
for i in $(seq -w 1 $NODE_COUNT); do
    echo "WAITING" > "start/${i}.md"
done

echo "Created $NODE_COUNT nodes in start/ directory"
echo "Ready for 2026 Horse Power ceremony!"
echo ""
echo "提示: 可以通过参数自定义节点数量"
echo "  例如: ./init-ritual.sh 15  # 创建15个节点"
