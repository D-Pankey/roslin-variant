#!/bin/bash

prism_request_to_yaml.py \
    -m Proj_DEV_0002_sample_mapping.txt \
    -p Proj_DEV_0002_sample_pairing.txt \
    -g Proj_DEV_0002_sample_grouping.txt \
    -r Proj_DEV_0002_request.txt \
    -o . \
    -f inputs.yaml

nohup prism-runner.sh \
	-w project-workflow.cwl \
	-i inputs.yaml \
	-b lsf &

# roslin_submit.py \
#    --id Proj_DEV_0002 \
#    --path . \
#    --workflow project-workflow.cwl
