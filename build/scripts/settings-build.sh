#!/bin/bash

script_dir_relative=`dirname "$0"`
script_dir=`python -c "import os; print os.path.abspath('${script_dir_relative}')"`
SETUP_DIRECTORY=`python -c "import os; print os.path.abspath(os.path.join(os.path.dirname('${script_dir}'),os.path.pardir,'setup'))"`
BUILD_DIRECTORY=`python -c "import os; print os.path.abspath(os.path.join(os.path.dirname('${script_dir}'),os.path.pardir,'build'))"`
TMP_DIRECTORY=`python -c "import tempfile; print tempfile.mkdtemp()"`
# directory where Dockerfile, Singularity, and images are stored
CONTAINER_DIRECTORY="${BUILD_DIRECTORY}/containers"

CWL_DIRECTORY="${SETUP_DIRECTORY}/cwl"

IMG_DIRECTORY="${SETUP_DIRECTORY}/img"