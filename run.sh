#!/bin/bash
vncserver -geometry 1280x800 -depth 24 -rfbport 5900 -localhost no
./noVNC/utils/novnc_proxy --vnc localhost:5900