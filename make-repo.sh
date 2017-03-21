#!/bin/bash
if [ $# -eq 0 ]; then
 echo "Usage: $0 repository_path";
 echo " "
 echo "example repository_path:  repos/project.git"
 exit 1;
fi



if [[ "$1" != *.git ]]; then
	echo "ERROR repository_path must ends with .git"
	exit 3;
fi
if [[ "$1" !=  repos/* ]]; then
	echo "ERROR repository_path must start with repos/"
	exit 3;
fi

source ./bbs.conf

if [ "x${FULL_HOSTNAME}" == "x" ]; then
	FULL_HOSTNAME=`hostname --fqdn`;
fi

if [ "x${GIT_HOME}" == "x" ];then
	GIT_HOME=${PWD}
fi

function print_info {

	REPO_PATH=${GIT_HOME}/$1
	REPO_URL="ssh://git@${FULL_HOSTNAME}://${REPO_PATH}"

	echo " "
	echo " "
	echo "------------------------------------------------------------"
	echo "NEW REPOSITORY PATH : ${REPO_PATH}"
	echo "NEW REPOSITORY URL  : ${REPO_URL}"
	echo "------------------------------------------------------------"
	echo "";
	echo "LOCAL MACHINE INSTRUCTIONS:"
	echo "";

	echo 'cd [my_project]'
	echo 'git init'
	echo 'git add *'
	echo 'git comit -m "My initial commit message"'
	echo "git remote add origin ${REPO_URL}"
	echo 'git push -u origin master'
	echo " "
}



if [ -e $1 ]; then
	echo $1 exists;
	print_info $1;
	exit 2;
fi

mkdir -p $1
cd $1
git init --bare
git update-server-info

print_info $1
