#!/bin/bash
# Copyright 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -e
echo "Checking the tool version against latest tool..."
echo "RUN ROOT: $RUN_ROOT"
TOOL=$(echo "$TRAVIS_BRANCH" | sed 's/CID-latest-tools-//g')
echo "TOOL: $TOOL"
docker_file=$RUN_ROOT/docker_build/docker/$TOOL/Dockerfile
echo "Dockerfile: $docker_file"
tool_repo=$(grep "ARG ${TOOL^^}_REPO=" $docker_file | sed "s/ARG ${TOOL^^}_REPO=//g")
tool_commit=$(grep "ARG ${TOOL^^}_COMMIT=" $docker_file | sed "s/ARG ${TOOL^^}_COMMIT=//g")
echo "$tool_repo"
echo "$tool_commit"
latest_commit=$(bash $RUN_ROOT/travisCI/utils/get_commit.sh $tool_repo)
if [[ $latest_commit != $tool_commit ]]; then
  sed -i "s/$tool_commit/$latest_commit/" $docker_file;
  exit 0
else
  echo "latest $TOOL commit is identical to the current commit";
  exit 2
fi


