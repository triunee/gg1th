# Tensorflow와 DNN, CNN 실습
# 가상환경 만들기
```
uv init --bare
```

# 라이브러리 설치
- GPU 드라브설치 확인(CLI 명령)
```
nvidia-smi
```
- GPU 테스트 환경 : RTX 4060
- WSL2 Ubuntu 24.04
- python 3.12
```
uv add "tensorflow[and-cuda]"  CNN GPU RTX 4060  <-- 2.21.0 최신버전(2026. 08. 30)
uv add "tensorflow[and-cuda]==2.20.0"   <-- CNN GPU RTX 3060
uv add "tensorflow[and-cuda]==2.17.1"   <-- CNN GPU GTX 1050

uv add seaborn pandas matplotlib scikit-learn
```

# 주피터 노트북과 가상환경 연동
- 라이브러러 설치
```
uv add ipykernel
```
- 가상환경 연동
```
uv run python -m ipykernel install --user --name .venv
```

# WSL2에서 GPU 인식 설정
- run_tf.sh 파일 작성
```
#!/bin/bash

export LD_LIBRARY_PATH=$(find .venv/lib/python*/site-packages/nvidia \
  -type d -name lib | tr '\n' ':'):$LD_LIBRARY_PATH

uv run "$@"
```
- 실행 권한으로 변경(CLI 명령)
```
chmod +x run_gpu_code.sh
```
- vs-code에서 GPU를 사용하기 위한 실행 명령 실행(CLI 명령)
```
./run_gpu_code.sh
```

# GPU와 TensorFlow/CUDA 조합
## 1. RTX 4060일 경우


## 2. RTX GTX 1050 또는 RTX 3060일 경우
### 방법1. 안정성 우선
```
uv add "tensorflow[and-cuda]==2.17.1"
```
```
Python        3.12
TensorFlow    2.17.1
CUDA          12.3
cuDNN         8.9
WSL2 Ubuntu
```
### 방법2. 최신 기능 활용
- RTX 3060일 경우
```
uv add "tensorflow[and-cuda]==2.20.0"
```
```
Python        3.12
TensorFlow    2.20.0
CUDA          12.5
cuDNN         9.3
WSL2 Ubuntu
```

# VRAM 실시간 모니터링 linux 명령어
```
watch -n 1 nvidia-smi
```