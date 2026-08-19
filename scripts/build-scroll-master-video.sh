#!/usr/bin/env bash
set -euo pipefail

# D1 → C1 → D2 → C2 → D3 → C3 → D4 → C4 → D5를 하나의 시간축으로 합친다.
# GOP=1은 어느 프레임에서나 빠르고 정확하게 seek할 수 있도록 모든 프레임을 키프레임으로 만든다.
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VIDEO_DIR="$ROOT_DIR/assets/videos"

ffmpeg -y \
  -i "$VIDEO_DIR/d1.mp4" -i "$VIDEO_DIR/c1.mp4" -i "$VIDEO_DIR/d2.mp4" \
  -i "$VIDEO_DIR/c2.mp4" -i "$VIDEO_DIR/d3.mp4" -i "$VIDEO_DIR/c3.mp4" \
  -i "$VIDEO_DIR/d4.mp4" -i "$VIDEO_DIR/c4.mp4" -i "$VIDEO_DIR/d5.mp4" \
  -filter_complex "[0:v][1:v][2:v][3:v][4:v][5:v][6:v][7:v][8:v]concat=n=9:v=1:a=0,fps=24,format=yuv420p[v]" \
  -map "[v]" -c:v libx264 -crf 16 -preset medium -g 1 -keyint_min 1 -sc_threshold 0 \
  -movflags +faststart "$VIDEO_DIR/scroll-master.mp4"
