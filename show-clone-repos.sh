#!/bin/bash

. ./bbs.conf.sh

if [ "x${FULL_HOSTNAME}" == "x" ]; then
	FULL_HOSTNAME=`hostname --fqdn`;
fi

for i in `find -name *.git -exec readlink -f {} \;`;
do 
	echo "git clone ssh://git@${FULL_HOSTNAME}://${i}"
done
