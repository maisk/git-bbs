#!/bin/bash


#tmp="/tmp/bbstmp-$$";
#BBS_TITLE="git bbs";

source ./bbs.conf

COLOR_RED="\e[31m";
COLOR_GREEN="\e[32m";
COLOR_BLUE="\e[34m";
COLOR_YELLOW="\e[93m";
COLOR_MAGENTA="\e[95m";
COLOR_WHITE="\e[97m"
#COLOR_DEFAULT="\e[39m";
COLOR_DEFAULT=$COLOR_WHITE;

BGCOLOR="\e[40m";


COLOR_TITLE=$COLOR_MAGENTA
COLOR_BANNER=$COLOR_YELLOW


bbs_init(){
	echo -e "$BGCOLOR";
	echo -e "$COLOR_DEFAULT";
	clear;
}
bbs_shell(){
	echo "Be careful with your bash prompt!";
	echo "at the end of your session  type exit";
	echo ""
	bash
	bbs_init;
	echo -e "${COLOR_MAGENTA}welcome back to our BBS!${COLOR_DEFAULT}";
	echo "";
}

bbs_show_repos(){
	./show-repos.sh
}

bbs_show_clone_repos(){
	./show-clone-repos.sh
}
bbs_show_projects(){
	./show-projects.sh  
}

bbs_create_project(){
	NEW_REPO_PATH='';
	FIN_FLAG="0";
	while [ $FIN_FLAG = "0" ] ; do
	echo "create repo wizard";
	echo "give the repository_path,  example path:  project.git"
	echo ""
	#read -p "path: " -e -i $NEW_REPO_PATH NEW_REPO_PATH
	read -p "path: " -e  NEW_REPO_PATH
	echo "-----------------------------------------";
	echo "REPO_PATH  : $NEW_REPO_PATH"
	echo "-----------------------------------------";
	RESPONSE=y;
	read -p "IS THIS INFORMATION OK? [type y to continue]: " -e -i 'y' RESPONSE
	if [[ "$RESPONSE" = 'y' ]]; then
		FIN_FLAG="1";
		./make-repo.sh $NEW_REPO_PATH;
		echo "";
	fi
	done
	
}

bbs_help() {
	echo "";
	echo "----------------------------------------------------";
	echo "1: help";
	echo "2: show git repos directory path";
	echo "3: show clone commands";
	echo "4: show git repos directory path from git home";
	echo "5: create new project";
	echo "6: enter bash shell";
	echo "----------------------------------------------------";
	echo "";
}


bbs_exit() {
	#rm -f "$tmp";
	echo -e "\e[49m";
	echo -e "\e[39m";
	echo "bye bye!";
	exit;
}


bbs_welcome_banner() {
	if [ -f "bbs-banner.txt" ];then
		echo -e "${COLOR_BANNER}";
		cat bbs-banner.txt;
		echo -e "${COLOR_DEFAULT}";
	fi
	echo -e "welcome $USER to ${COLOR_TITLE}${BBS_TITLE}!${COLOR_DEFAULT}";
	echo "";
	echo "";
}



bbs_menu(){
	PS3="Enter your choice: "
	options=("help" "show-repos" "show-clone-repos" "show-projects" "create-project" "shell" "Quit")
	select opt in "${options[@]}"
	do
		  case $opt in
		      "help")
							bbs_help
							echo "";
		          ;;
		      "show-repos")
							bbs_show_repos
							echo "";
		          ;;
		      "show-clone-repos")
							bbs_show_clone_repos
							echo "";
		          ;;
		      "show-projects")
							bbs_show_projects
							echo "";
		          ;;
		      "create-project")
							bbs_create_project
							echo "";
		          ;;
					"shell")
							bbs_shell
							echo ""
							;;
		      "Quit")
		          break
		          ;;
		      *) echo invalid option;;
		  esac
	done
}


bbs_init
bbs_welcome_banner
bbs_menu
bbs_exit



