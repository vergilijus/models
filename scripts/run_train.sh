#!/usr/bin/env bash

# https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/running_locally.md
# Usage:
# run_train.sh <config_path> <model_dir> <num_train_steps>

API_PATH=/home/ruslan/projects/models/research

PIPELINE_CONFIG_PATH=$1
MODEL_DIR=$2
NUM_TRAIN_STEPS=$3
SAMPLE_1_OF_N_EVAL_EXAMPLES=1

mkdir ${MODEL_DIR}
cp ${PIPELINE_CONFIG_PATH} ${MODEL_DIR}/pipeline.config

python ${API_PATH}/object_detection/model_main.py \
    --pipeline_config_path=${PIPELINE_CONFIG_PATH} \
    --model_dir=${MODEL_DIR} \
    --num_train_steps=${NUM_TRAIN_STEPS} \
    --sample_1_of_n_eval_examples=${SAMPLE_1_OF_N_EVAL_EXAMPLES} \
    --alsologtostderr
