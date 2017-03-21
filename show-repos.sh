#!/bin/bash

if [ "x${GIT_HOME}" == "x" ];then
	GIT_HOME=${PWD}
fi

for i in `find ${GIT_HOME} -name *.git -exec readlink -f {} \;`;
do 
	echo "${i}"
done
