#!/bin/bash
for i in `find -name *.git -exec readlink -f {} \;`;
do 
	echo "${i}"
done
