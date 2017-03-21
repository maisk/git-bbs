#!/bin/bash

source ./bbs.conf


for i in `find ${GIT_HOME} -name *.git -exec readlink -f {} \;`;
do 
	echo "${i}"
done
