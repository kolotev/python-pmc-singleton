#!/bin/bash

source $(dirname $0)/.init.rc


if [[ -e requirements/dev.txt ]] ; then 

  set -x
  pip install -r requirements/dev.txt -e . "$@" 

elif [[ -e requirements/dev.in ]] ; then

  set -x
  pip install -r requirements/dev.in -e . "$@"

else

  echo "No requirements/dev.txt nor requirements/dev.in available."
  echo "The following content of requirements/dev.in was generated."
  echo "
-r test.in
  
virtualenv
pip-compile-multi
devtools
" > requirements/dev.in
  echo "========================================="
  cat requirements/dev.in
  echo "========================================="

  echo "re-run this script $0"
fi