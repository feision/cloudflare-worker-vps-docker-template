# Cloudflare Worker VPS Docker Deployment Template

一套通用的将 Cloudflare Worker 运行在本地局域网 VPS Docker 容器中的方案。

## 🛠 核心解决的问题
1. **环境兼容性**：解决 workerd 运行时在 Alpine 等镜像下的 glibc 报错。
2. **网络隔离**：一键修复 VPS DNS 及 Docker 拉取镜像难的问题。
3. **运行稳定性**：规避 wrangler dev 在非交互式容器内的 esbuild 死锁 Bug。

## 🚀 快速开始

### 1. 修复 VPS 环境
将 setup-vps.sh 上传到 VPS 并执行：
bash setup-vps.sh

### 2. 部署项目
1. 将你的 Worker 源码放入当前目录。
2. 启动容器：
docker compose up -d

## 📋 编排要点
- **镜像**：必须使用 node:xx-slim (Debian 基础)。
- **参数**：必须包含 --live-reload=false 以防死锁。
- **模式**：开启 CI=true 环境变量。