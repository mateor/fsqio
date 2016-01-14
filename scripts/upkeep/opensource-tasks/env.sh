#!/bin/bash
# Copyright 2015 Foursquare Labs Inc. All Rights Reserved.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PANTS_CONFIG_OVERRIDE="['pants.ini']"
export FSQIO_HOME="$DIR"
# The script below runs the pants bootstrap task and exports PANTSBINARY. Basically a noop if the pants_version
# hasn't changed. This could be hooked more properly into upkeep but we are waiting on the need to arise.
source scripts/upkeep/opensource-tasks/opensource-pants-env.sh
