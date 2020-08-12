#!/usr/bin/env bash

# https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/exporting_models.md
# Usage:
# ./export_model.sh <model_dir> <step> <out_dir>

API_PATH=/home/ruslan/projects/models/research


MODEL_DIR=$1
STEP=$2
INPUT_TYPE=image_tensor # one of ['image_tensor', 'encoded_image_string_tensor', 'tf_example']
PIPELINE_CONFIG_PATH=${MODEL_DIR}/pipeline.config
TRAINED_CKPT_PREFIX=${MODEL_DIR}/model.ckpt-${STEP}
OUT_DIR=$3


python ${API_PATH}/object_detection/export_inference_graph.py \
    --input_type=${INPUT_TYPE} \
    --pipeline_config_path=${PIPELINE_CONFIG_PATH} \
    --trained_checkpoint_prefix=${TRAINED_CKPT_PREFIX} \
    --output_directory=${OUT_DIR}
