#!/bin/bash

if [ "x${GIT_HOME}" == "x" ];then
	GIT_HOME=${PWD}
fi

find ${GIT_HOME} -name *.git |sed "s/\.\///"
