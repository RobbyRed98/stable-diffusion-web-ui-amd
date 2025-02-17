#!/bin/bash
# This file is part of sygil-webui (https://github.com/Sygil-Dev/sygil-webui/).

# Copyright 2022 Sygil-Dev team.
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>. 
#
# Starts the webserver inside the docker container
#

# set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
export PYTHONPATH=$SCRIPT_DIR

if ! grep TRANSFORMERS_CACHE --quiet ~/.bashrc; then
    echo "export HF_HOME=${MODEL_DIR}" >> ~/.bashrc
    echo "export XDG_CACHE_HOME=${MODEL_DIR}" >> ~/.bashrc
    echo "export TRANSFORMERS_CACHE=${MODEL_DIR}" >> ~/.bashrc
fi
source ~/.bashrc
cd $SCRIPT_DIR
launch_command="streamlit run ${SCRIPT_DIR}/scripts/webui_streamlit.py"

$launch_command

sleep infinity
