# 2026 Horse Power - 马年开工仪式

一个极客风格的线上开工仪式系统，基于 Git Push + GitHub Actions 实现分布式节点共识。

## 🎯 核心概念

20 名技术人员同时向 GitHub 仓库 Push Commit，触发 CI Pipeline，实时展示节点上线状态。当 20/20 节点全部在线时，触发 Matrix 代码雨 + 几何马 ASCII 艺术动画。

## 🏗️ 技术架构

```
┌─────────────┐     Push      ┌─────────────────┐
│  参与者 x20  │ ─────────────>│  GitHub 仓库    │
│  (Git操作)   │               │  (20个md文件)   │
└─────────────┘               └────────┬────────┘
                                       │
                                       │ Trigger
                                       ▼
                              ┌─────────────────┐
                              │  GitHub Action  │
                              │  (生成status)   │
                              └────────┬────────┘
                                       │
                                       ▼
                              ┌─────────────────┐
                              │  GitHub Pages   │
                              │  (静态网站)      │
                              └────────┬────────┘
                                       │
                    ┌──────────────────┴──────────────────┐
                    │                                     │
                    ▼                                     ▼
            ┌─────────────┐                      ┌─────────────┐
            │  仪式大屏    │                      │  参与者设备  │
            │  (飞书投屏)  │                      │  (手机/电脑) │
            └─────────────┘                      └─────────────┘
```

## 🚀 快速部署

### 1. 创建仓库

在 GitHub 创建 Public 仓库 `2026-horse-start`

### 2. 初始化文件

```bash
# 克隆仓库
git clone https://github.com/your-org/2026-horse-start.git
cd 2026-horse-start

# 运行初始化脚本（默认创建20个节点）
chmod +x init-ritual.sh
./init-ritual.sh

# 或者自定义节点数量（例如15人）
# ./init-ritual.sh 15

# 提交到仓库
git add .
git commit -m "Initial commit: ready for ceremony"
git push origin main
```

#### 🔧 动态节点配置

本系统支持**动态节点数量**，无需修改代码：

1. **初始化时指定数量**：`./init-ritual.sh 15`
2. **后续增减节点**：直接在 `start/` 目录添加或删除 `.md` 文件
3. **自动识别**：系统会自动扫描 `start/` 目录中的所有 `.md` 文件

节点文件命名规则：
- `001.md`, `002.md`, `003.md` ... `020.md`（推荐）
- 或 `1.md`, `2.md`, `3.md` ...（也支持）

### 3. 启用 GitHub Pages

进入仓库 Settings > Pages：
- Source 选择 **GitHub Actions**

### 4. 测试

修改一个文件 Push，访问 `https://your-org.github.io/2026-horse-start/`

## 📋 仪式流程（15分钟）

| 时间 | 环节 | 内容 |
|------|------|------|
| 00:00-01:00 | 系统自检 | 主持人介绍仪式背景，展示终端等待界面 |
| 01:00-03:00 | 分发密钥 | 分发节点编号，发送仓库地址和操作指南 |
| 03:00-08:00 | 并发写入 | 全员同时 Push，大屏实时显示节点变绿 |
| 08:00-10:00 | 压力测试 | 等待最后节点，进度条冲刺 |
| 10:00-13:00 | 系统觉醒 | 触发 Matrix 代码雨 + ASCII 马动画 |
| 13:00-15:00 | 归档纪念 | 下载开工纪念卡，仪式结束 |

## 🎮 参与者操作指南

```bash
# 1. 克隆仓库
git clone https://github.com/your-org/2026-horse-start.git

# 2. 认领节点（你的编号是 00X）
# 对应文件 start/00X.md

# 3. 编辑宣言
echo "2026 Horse Power by [你的名字]" > start/00X.md

# 4. 提交上线
git add start/00X.md
git commit -m "start: node 00X online"
git push origin main

# 5. 观察大屏，等待你的节点变绿！
```

### Web IDE 方案（无需命令行）

直接访问：`https://github.com/your-org/2026-horse-start/edit/main/start/001.md`

## 🎨 双版本大屏

本项目提供两种风格的大屏页面，可根据场合切换：

### 版本一：极客硬核风（默认）
- **地址**：`https://your-org.github.io/2026-horse-start/`
- **风格**：终端控制台风格
- **特点**：深色背景 + 绿色代码风，Matrix 代码雨，几何马 ASCII
- **适用**：技术团队内部，极客氛围

### 版本二：喜庆吉祥版 ⭐
- **地址**：`https://your-org.github.io/2026-horse-start/festive.html`
- **风格**：中国红 + 金色喜庆风
- **特点**：
  - 🏮 红色渐变背景 + 祥云装饰
  - 🧧 马年吉祥话轮播
  - 🎊 金币红包飘落特效
  - 🐴 每个节点上线显示专属祝福语
  - 📜 喜庆开工纪念卡
- **适用**：对外展示、领导观摩、正式场合

### 吉祥话列表

每个节点上线时会显示对应的祝福语：

| 节点 | 祝福语 | 节点 | 祝福语 |
|------|--------|------|--------|
| 001 | 一马当先 | 011 | 百事亨通 |
| 002 | 二龙腾飞 | 012 | 千事吉祥 |
| 003 | 三羊开泰 | 013 | 万事如意 |
| 004 | 四季平安 | 014 | 心想事成 |
| 005 | 五福临门 | 015 | 步步高升 |
| 006 | 六六大顺 | 016 | 前程似锦 |
| 007 | 七星高照 | 017 | 财运亨通 |
| 008 | 八方来财 | 018 | 吉祥如意 |
| 009 | 九九同心 | 019 | 喜气洋洋 |
| 010 | 十全十美 | 020 | 开工大吉 |

## 📁 文件结构

```
2026-horse-start/
├── .github/
│   └── workflows/
│       └── ritual.yml      # GitHub Action 配置
├── docs/
│   ├── index.html          # 仪式主页面（极客硬核风）
│   └── festive.html        # 喜庆吉祥版（中国红主题）⭐
├── start/
│   ├── 001.md              # 20个待填充文件
│   ├── 002.md
│   └── ... 020.md
├── init-ritual.sh          # 初始化脚本
├── README.md               # 本文件
└── HOST_SCRIPT.md          # 主持人逐字稿
```

## 🔧 技术细节

- **前端**：纯 HTML/CSS/JS，无框架依赖
- **实时同步**：轮询 status.json（3秒间隔）
- **数据存储**：Git 历史 + GitHub Actions 生成状态文件
- **部署**：GitHub Pages 免费托管

## 📝 自定义配置

### 修改节点数量

编辑 `init-ritual.sh` 和 `docs/index.html` 中的 `TOTAL_NODES`

### 修改 ASCII 艺术

编辑 `docs/index.html` 中的 `HORSE_ASCII` 变量

### 修改颜色主题

编辑 `docs/index.html` 中的 CSS 变量

## 🎤 主持人逐字稿

详见 [HOST_SCRIPT.md](./HOST_SCRIPT.md)

## 📄 License

MIT License - 自由使用和修改

---

**2026 Horse Power** - 分布式系统启动仪式 🐴⚡
