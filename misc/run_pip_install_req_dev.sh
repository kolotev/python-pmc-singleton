#!/bin/bash

source $(dirname $0)/.init.rc

######## take care of requirements/base.in
if [[ ! -e requirements/base.in ]] ; then

  echo "No requirements/base.in available."
  echo "An empty default content was generated."
  echo > requirements/base.in
fi

######## take care of requirements/test.in
if [[ ! -e requirements/test.in ]] ; then

  echo "No requirements/test.in available."
  echo "The following content was generated."
  echo "
-r base.txt

pytest~=3.7
pytest-cov~=2.5
" > requirements/test.in

  echo "========================================="
  cat requirements/test.in
  echo "========================================="
fi

######## take care of requirements/dev.in
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