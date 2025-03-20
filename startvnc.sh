#!/bin/bash

# 硬编码参数
DISPLAY=":1"
GEOMETRY="1280x720"
VNC_PORT=5901
WEB_PORT=9090

# 启动VNC服务器（绑定到本地）
vncserver ${DISPLAY} \
  -geometry ${GEOMETRY} \
  -depth 24 \
  -localhost yes \
  -rfbport ${VNC_PORT} \
  -SecurityTypes VncAuth

# 启动noVNC代理
/opt/noVNC/utils/novnc_proxy \
  --vnc localhost:${VNC_PORT} \
  --listen 0.0.0.0:${WEB_PORT} &

# 保持容器运行
tail -f /dev/null