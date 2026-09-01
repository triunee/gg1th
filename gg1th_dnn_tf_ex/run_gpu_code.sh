#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export LD_LIBRARY_PATH=$(find "$SCRIPT_DIR"/.venv/lib/python*/site-packages/nvidia \
  -type d -name lib | tr '\n' ':')$LD_LIBRARY_PATH

# gg1th 리포지토리 전체를 워크스페이스로 열어서 git 추적 유지
code "$SCRIPT_DIR/.."