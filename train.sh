################## Environmental Variables
DATA_ROOT=/mnt/SSD2/General_CV_Training_Data/TrashCan/dataset/instance_version

OUT_DIR="$PWD/out"
CONFIG_DIR=$PWD/codes/

CONFIG="/configs/rtmdet-ins_s_8xb32-50e_coco.py"
BATCH_SIZE=16

#############################################################################

GPUS=2


docker run -it --rm \
    --gpus all \
    -e BATCH_SIZE=$BATCH_SIZE \
    --mount type=bind,source=$PWD/codes/,target=/configs \
    --mount type=bind,source=$DATA_ROOT,target=/data \
    --mount type=bind,source=$OUT_DIR,target=/out \
    --shm-size 8g \
    mmdetection:latest \
    torchrun --nnodes 1 --nproc_per_node=$GPUS  /configs/main_train_mmengine.py $CONFIG 