#!/bin/bash

cd /models/im2txt

# Inception v3 checkpoint file.
INCEPTION_CHECKPOINT="${INCEPTION_DIR}/inception_v3.ckpt"

# Build the model.
bazel build -c opt im2txt/...

# Run the training script.
bazel-bin/im2txt/train \
  --input_file_pattern="${MSCOCO_DIR}/train-?????-of-00256" \
  --inception_checkpoint_file="${INCEPTION_CHECKPOINT}" \
  --train_dir="${MODEL_DIR}/train" \
  --train_inception=false \
  --number_of_steps=1000000
