
#---------------------HOMAI------------------------#
# Created on Sun May 3 2025
#
# Copyright (c) 2025 The Home Made AI (HOMAI)
# Author: Javad Rezaie
# License: Apache License 2.0
#---------------------HOMAI------------------------#

DATA_DIR="/mnt/SSD2/" # In the container, it is acceable as /data
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


docker run -it --rm \
    --gpus all \
    --mount type=bind,source=$DATA_DIR,target=/data \
    --shm-size 8g \
    mmdetection:latest \
    /bin/bash -c " wget https://conservancy.umn.edu/bitstreams/fffa78cc-3abf-42b9-b019-bc15a953a8e9/download && \
    mkdir -p /data/General_CV_Training_Data/TrashCan && \
    unzip download -d /data/General_CV_Training_Data/TrashCan"