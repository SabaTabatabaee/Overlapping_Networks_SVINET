#!/bin/bash

num_state=$1 
state=$2
START_NUM_COMMS=$3
END_NUM_COMMS=$4


FILE_path=/home/saba/mice/data/roi/govinda_cortex/dynamic_nws/nws/6_states/demeaned/edges/state${num_state}/s${state}

roi_labels=/home/saba/mice/data/allen_atlas_ccfv3/govinda_parcellation/type-spatial_size-112_symm-True_braindiv-ctx_nrois-100_desc-labels.txt
NUM_ROIS=$(python -c "import numpy as np; print(len(np.loadtxt('${roi_labels}')))")


run_svinet() {
    for file in $(ls "${FILE_path}")
    do 
        echo "${file}"
        echo "----------"
        bash 01-data-mouse_desc-svinet.sh "${num_state}" "${state}" "${FILE_path}/${file}" "${NUM_ROIS}" "${NUM_COMMS}"
        echo "----------"
    done
}

for NUM_COMMS in $(seq ${START_NUM_COMMS} ${END_NUM_COMMS})
do
    echo NOW RUNNING FOR ${NUM_COMMS} COMMUNITIES 
    echo ========================================
    run_svinet
done