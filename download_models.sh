#/bin/sh
mkdir pretrained_models/
cd pretrained_models/

mkdir outpainting_ckpt/
curl "https://drive.usercontent.google.com/download?id=1CIiEYxo6Sfe0NSTr14_W9gSKePVsyIlQ&confirm=xxx" -o outpainting_ckpt/checkpoint-40000.ckpt

curl "https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth" -o sam_vit_b_01ec64.pth

git lfs install
git clone https://huggingface.co/stabilityai/stable-diffusion-2-1
git clone https://huggingface.co/Qwen/Qwen-VL-Chat
cd ..
