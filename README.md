# Issues I found

1. tensorflow/tensorflow:latest-gpu-py3-jupyter has certificate issues and doesn't want to apt update anymore. I changed it to tensorflow/tensorflow:latest-gpu-py3-jupyter

2. Dependencies have conflicts in:
```
   Collecting tensorboard==2.1.1
  Downloading tensorboard-2.1.1-py3-none-any.whl (3.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.8/3.8 MB 44.2 MB/s eta 0:00:00
ERROR: Could not find a version that satisfies the requirement tensorflow==2.1.0 (from deepsky) (from versions: 2.2.0, 2.2.1, 2.2.2, 2.2.3, 2.3.0, 2.3.1, 2.3.2, 2.3.3, 2.3.4, 2.4.0, 2.4.1, 2.4.2, 2.4.3, 2.4.4, 2.5.0, 2.5.1, 2.5.2, 2.5.3, 2.6.0rc0, 2.6.0rc1, 2.6.0rc2, 2.6.0, 2.6.1, 2.6.2, 2.6.3, 2.6.4, 2.7.0rc0, 2.7.0rc1, 2.7.0, 2.7.1, 2.7.2, 2.8.0rc0, 2.8.0rc1, 2.8.0, 2.8.1, 2.9.0rc0, 2.9.0rc1, 2.9.0rc2, 2.9.0)
ERROR: No matching distribution found for tensorflow==2.1.0
```

# DeepSky

Python Deep Learning library for Skydipper

# Development:

`sh start.sh gpu <port>`
`docker exec -it mlnotebooks /bin/bash`