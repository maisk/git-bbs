#!/bin/bash

source ./bbs.conf


if [ "x${FULL_HOSTNAME}" == "x" ]; then
	FULL_HOSTNAME=`hostname --fqdn`;
fi

for i in `find ${GIT_HOME} -name *.git -exec readlink -f {} \;`;
do 
	echo "git clone ssh://git@${FULL_HOSTNAME}://${i}"
done
