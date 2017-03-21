#!/bin/bash

source ./bbs.conf


(
cd ${GIT_HOME}
find  . -name "*.git" |sed "s/\.\///"
)
