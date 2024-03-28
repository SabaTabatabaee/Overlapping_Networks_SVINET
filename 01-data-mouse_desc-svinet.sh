#!/bin/bash

num_state=$1 
state=$2
file=$3
n=$4
k=$5

OUT_PATH=~/mice/data/roi/govinda_cortex/dynamic_nws/svinet_folders/${num_state}num_state/state${state}/k"${k}"
mkdir -p "${OUT_PATH}"

svinet \
-file "${file}" \
-n "${n}" -k "${k}" \
-link-sampling

cd n"${n}"-k"${k}"-mmsb-linksampling
svinet \
-file "${file}" \
-n "${n}" -k "${k}" \
-gml

cd ../

out_file=$(python -c "print('_'.join('${file}'.split('/')[-1].split('_')[:-1]))")_k${k}
rm -r "${OUT_PATH}/${out_file}"
mv n"${n}"-k"${k}"-mmsb-linksampling "${OUT_PATH}/${out_file}"