
#---------------------HOMAI------------------------#
# Created on Sun May 3 2025
#
# Copyright (c) 2025 The Home Made AI (HOMAI)
# Author: Javad Rezaie
# License: Apache License 2.0
#---------------------HOMAI------------------------#

DATA_DIR="/home/javrez/Downloads/dataset/instance_version" # In the container, it is acceable as /data
#Data Structure on my local computer is as follows:
#/mnt/SSD2/General_CV_Training_Data/TrashCan/dataset/instance_version/
#├── train/
#├── val/
#├── instances_train_trashcan.json
#└── instances_val_trashcan.json

#It will be mapped to container, and it seems like:
#/data/
#├── train/
#├── val/
#├── instances_train_trashcan.json
#└── instances_val_trashcan.json

OUT_DIR="$PWD/out" # In the container, it is acceable as /out
CONFIG_DIR=$PWD/codes/ # In the container, it is acceable as /configs
NOTEBOOK_DIR=$PWD/notebooks/ # In the container, it is acceable as /notebooks

docker run -it --rm \
    --gpus all \
    --mount type=bind,source=$CONFIG_DIR,target=/configs \
    --mount type=bind,source=$DATA_DIR,target=/data \
    --mount type=bind,source=$OUT_DIR,target=/out \
    --mount type=bind,source=$NOTEBOOK_DIR,target=/notebooks \
    --shm-size 8g \
    -p 8888:8888 \
    mmdetection:latest \
    jupyter-lab  --ip 0.0.0.0 --port 8888 --allow-root /notebooks