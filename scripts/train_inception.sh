#!/bin/bash

cd /models/im2txt

# Build the model.
bazel build -c opt im2txt/...

# Restart the training script with --train_inception=true.
bazel-bin/im2txt/train \
  --input_file_pattern="${MSCOCO_DIR}/train-?????-of-00256" \
  --train_dir="${MODEL_DIR}/train" \
  --train_inception=true \
  --number_of_steps=3000000  # Additional 2M steps (assuming 1M in initial training).
