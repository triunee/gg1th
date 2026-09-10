# Hugging Face Hub 멀티모달 실습 노트북 세트

목적: 파인튜닝 전에 Hugging Face Hub의 사전학습 모델을 활용하여 다양한 AI 서비스를 빠르게 체험한다.

## 실습 환경 
- Python 3.12
- JupyterLab / VS Code Jupyter
- NVIDIA RTX 4060 8GB 수준 또는 Colab GPU
- CPU에서도 일부 실습 가능하나 속도가 느릴 수 있음
- Hugging Face transformers가 5.x 계열로 본격 전환된 시점은 2025년 말~2026년 초

## 구성
1. 상품 사진 → 설명·태그·검색 키워드
2. Zero-shot 이미지 분류
3. Visual Question Answering
4. Document Question Answering
5. Whisper STT
6. 한국어 TTS
7. CLIP 이미지-텍스트 검색
8. 이미지 캡션 → 한국어 번역
9. Depth Estimation
10. DETR 객체 탐지
11. Image Segmentation
12. Video Classification

# 환경구성
## 작업폴더
```
mkdir hf_pytorch_ex
cd hf_pytorch_ex
```

## 가상환경
```
uv init --bare --python 3.12
uv python pin 3.12
```

## torch 설치
- pyproject.toml 파일에 아래 내용 추가
```
[[tool.uv.index]]
name = "pytorch-cu126"
url = "https://download.pytorch.org/whl/cu126"
explicit = true

[tool.uv.sources]
torch = { index = "pytorch-cu126" }
torchvision = { index = "pytorch-cu126" }
```
- torch 설치 하기
```
uv add torch torchvision
```
- torch 테스트
```
uv run python -c "import torch; print(torch.__version__); print(torch.cuda.is_available()); print(torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'CPU')"
```

## Hugging Face 기본 패키지 설치
```
uv add transformers
uv add accelerate
uv add datasets
uv add huggingface-hub
uv add safetensors
uv add sentencepiece
uv add pillow
uv add requests
uv add matplotlib
uv add pandas
uv add protobuf
```
## 멀티모달 실습용 추가 패키지
```
uv add scipy
uv add librosa
uv add soundfile
uv add av
uv add timm
```
- Whisper 및 오디오 처리
```
uv add librosa soundfile scipy
```
- VideoMAE 영상 처리
```
uv add av
```
- DETR 일부 모델
```
uv add timm
```

## jupyter 설치
```
uv add jupyter ipykernel
```

## 커널 등록
```
uv run python -m ipykernel install \
  --user \
  --name .venv
```