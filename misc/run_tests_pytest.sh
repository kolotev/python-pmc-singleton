#!/bin/bash
# export DJANGO_SETTINGS_MODULE=project.settings_test
source $(dirname $0)/.init.rc

set -x
py.test \
	--durations=5 \
	-v \
    --cov project \
    --cov tests \
    --cov-report term-missing \
    --cov-report html \
    --cov-report xml:coverage.xml \
	"$@"

py.test src/ README.md --doctest-glob=*.md --doctest-modules

FLAKE_ARGS=(src tests)
flake8 ${FLAKE_ARGS[*]}
