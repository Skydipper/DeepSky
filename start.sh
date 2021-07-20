#!/bin/bash
#docker build --rm -f Dockerfile -t deepsky . && docker run -v ~/Projects/DeepSky:/tf/deepsky  --rm -p 6868:8888 --gpus all -it --name mlnotebooks vizzuality/mlnotebooks
MYPATH=$(pwd)
set -e

case "$1" in
    gpu)
        echo "Running container with GPUs"
        docker-compose up --build
        ;;
    cpu)
        echo "Running container with CPU"
        docker build -t vizzuality/mlnotebooks . && docker run -v $MYPATH:/tf/deepsky  --rm -p 6868:8888 -it --name mlnotebooks vizzuality/mlnotebooks
        ;;
    *)
        echo "use gpu or cpu flag; exit with 0..."
        exec "$@"
esac
