#!/bin/bash
# 一键修复 VPS 环境脚本
echo "Fixing DNS..."
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

echo "Configuring Docker Proxy (192.168.31.162:7890)..."
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo cat > /etc/systemd/system/docker.service.d/proxy.conf << EOF
[Service]
Environment=\"HTTP_PROXY=http://192.168.31.162:7890\"
Environment=\"HTTPS_PROXY=http://192.168.31.162:7890\"
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
echo "VPS Environment Ready!"
