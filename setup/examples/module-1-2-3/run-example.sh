#!/bin/bash

pipeline_name_version="variant/1.3.1"

roslin-runner.sh \
    -v ${pipeline_name_version} \
    -w module-1-2-3.cwl \
    -i inputs.yaml \
    -b lsf
