#!/bin/bash

source $(dirname $0)/.init.rc

set -x
# pip-compile-multi --no-upgrade when you changed base.in
pip-compile-multi --no-upgrade --use-cache "$@"
# pip-compile --no-header --verbose --upgrade --rebuild --no-index --output-file requirements/base.txt requirements/base.in

