#!/bin/bash

source ./bbs.conf

if [ "x${GIT_HOME}" == "x" ];then
	GIT_HOME=${PWD}
fi

(
cd ${GIT_HOME}
find  -name *.git |sed "s/\.\///"
)
