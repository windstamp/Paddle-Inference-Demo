#!/bin/bash
set +x
set -e

work_path=$(dirname $(readlink -f $0))

# 1. compile
bash ${work_path}/compile.sh

# 2. download model
if [ ! -d infer_model ]; then
    echo -e "\033[31m Cannot find infer model, please download and rename it into infer_model dir. \033[0m"
    exit 0
fi

# 3. run
./build/ocr_predict --model_file infer_model/inference.pdmodel --params_file infer_model/inference.pdiparams --use_gpu true
