#!/bin/bash

echo "Install CUDA from https://developer.nvidia.com/cuda-downloads"

echo "Get VisualSFM from http://ccwu.me/vsfm/download/VisualSFM_linux_64bit.zip"

VISUALSFM_DEPS="build-essential libsdl1.2debian libsdl1.2-dev libgl1-mesa-dev libglu1-mesa-dev libsdl-image1.2 libsdl-image1.2-dev freeglut3-dev libxmu-dev libdevil1c2 libdevil-dev libglew-dev libgtk2.0-dev"

sudo apt-get install $VISUALSFM_DEPS

echo "Get SIFTGPU from http://cs.unc.edu/~ccwu/siftgpu/download.html"
SIFTGPU_DEPS="nvidia-cuda-dev nvidia-cuda-toolkit"

sudo apt-get install $SIFTGPU_DEPS


