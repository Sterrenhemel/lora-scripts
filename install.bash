python3 -m venv venv
source venv/bin/activate

echo "Installing deps..."
cd ./sd-scripts
pip install torch==1.12.1+cu116 torchvision==0.13.1+cu116 --extra-index-url https://download.pytorch.org/whl/cu116
pip install --upgrade -r requirements.txt
pip install git+https://github.com/facebookresearch/xformers.git@0bad001ddd56c080524d37c84ff58d9cd030ebfd
pip install triton==2.0.0.dev20221202
pip install --upgrade lion-pytorch locon

# curl -Lo sd-models/AsiaFacemix-pruned-fp16.safetensors https://huggingface.co/next-social/sd-model/blob/main/AsiaFacemix/AsiaFacemix-pruned-fp16.safetensors
# curl -Lo sd-models/Chilloutmix-Ni-pruned-fp16-fix.safetensors https://huggingface.co/next-social/sd-explore/resolve/main/SD/Chilloutmix-Ni-pruned-fp16-fix.safetensors
# curl -Lo sd-models/Chilloutmix-Ni-pruned-fp32-fix.safetensors https://huggingface.co/next-social/sd-explore/resolve/main/SD/Chilloutmix-Ni-pruned-fp32-fix.safetensors
# curl -Lo sd-models/RealDosMix.safetensors https://huggingface.co/next-social/sd-model/resolve/main/RealDosMix/RealDosMix.safetensors

echo "Install completed"
