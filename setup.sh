#!/bin/bash

setup_dir_and_virtualenv() {
	read -e -p "Enter workspace directory path and press [ENTER]: " WORKSPACE
	if [ -d $WORKSPACE ]; then
		read -p "Enter project name and press [ENTER]: " DIR_NAME
		PROJ_DIR=${WORKSPACE%%/}/$DIR_NAME
		if [ -d $PROJ_DIR ]; then
			echo "Directory already exists"
		else
			echo "Changing Directory to : $WORKSPACE"
			cd $WORKSPACE
			echo "Making new directory : %DIR_NAME"
			mkdir $DIR_NAME
			echo "Changing Directory to : $PROJ_DIR"
			cd $PROJ_DIR
			# setting up virtualenv
			virtualenv .
			echo "Activating virtual environment"
		fi
	else
		echo "workspace directory does not exists"
	fi
}

main() {
	setup_dir_and_virtualenv
}

main $@
