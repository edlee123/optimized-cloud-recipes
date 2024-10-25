#!/bin/bash

export host_ip=$(hostname -I | awk '{print $1}')
export public_ip=$(curl -s ifconfig.me)

export LLM_MODEL_ID="Intel/neural-chat-7b-v3-3"
export TGI_LLM_ENDPOINT="http://${host_ip}:8008"
export MEGA_SERVICE_HOST_IP=${host_ip}
export LLM_SERVICE_HOST_IP=${host_ip}
export BACKEND_SERVICE_ENDPOINT="http://${host_ip}:8888/v1/docsum"
#export HUGGINGFACEHUB_API_TOKEN="YourHuggingfaceToken"
