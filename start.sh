#!/bin/bash
#docker build --rm -f Dockerfile -t deepsky . && docker run -v ~/Projects/DeepSky:/tf/deepsky  --rm -p 6868:8888 --gpus all -it --name mlnotebooks vizzuality/mlnotebooks

set -e

case "$1" in
    gpu)
        echo "Running container with GPUs"
        docker build --rm -f Dockerfile -t vizzuality/mlnotebooks . && docker run -u $(id -u):$(id -g) --env-file=.env -v ~/Projects/DeepSky:/tf/deepsky  --rm -p $2:8888 --gpus all -it --name mlnotebooks vizzuality/mlnotebooks
        ;;
    cpu)
        echo "Running container with CPU"
        docker build -t vizzuality/mlnotebooks . && docker run -v ~/Projects/DeepSky:/tf/deepsky  --rm -p 6868:8888 -it --name mlnotebooks vizzuality/mlnotebooks
        ;;
    *)
        echo "use gpu or cpu flag; exit with 0..."
        exec "$@"
esac
