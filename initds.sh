#!/bin/bash

printf "New project directory: "
read RESPONSE

resolve_path() {
	if [ ${RESPONSE:P:2} == "~/" ]; then
		local BASE=`realpath ~/`
		local LEN=${#RESPONSE}
		PROJECT_DIR=$BASE/${RESPONSE:2:LEN}
	else
		PROJECT_DIR=$RESPONSE
	fi
}

init_directories() {
	echo "Initializing project at $PROJECT_DIR"
	resolve_path
	declare -a folders=("src" "results" "data" "notebooks")
	mkdir -p $PROJECT_DIR
	for f in ${folders[@]}; do
		mkdir "$PROJECT_DIR/$f"
	done
	mkdir "$PROJECT_DIR/src/sql"
	}

boilerplate_files() {
	echo "Adding boilerplate files."
	touch $PROJECT_DIR/src/__init__.py
	echo "# Project_Readme" > $PROJECT_DIR/README.md
	printf "username=\npassword=\n" > $PROJECT_DIR/src/password.py
	printf "import pandas as pd\n" > $PROJECT_DIR/main.py
	printf "import pandas as pd\n" > $PROJECT_DIR/src/make_models.py
	declare -a WITH_NP=("make_dataset.py" "make_features.py")
	for f in ${WITH_NP[@]}; do
		printf "import pandas as pd\nimport numpy as np\n" > $PROJECT_DIR/src/$f
	done
	printf "import matplotlib.pyplot as plt\nimport seaborn as sns\n" > $PROJECT_DIR/src/make_plots.py
}

git_ignore() {
	declare -a IGNORE=(
		"__pycache__" 
		"*.py[cod]" 
		".eggs/" 
		"*.egg-info/"
		"*.egg"
		"profile_default/"
		".pynb_checkpoints" 
		".env" 
		".venv" 
		".mypy_cache"
		".dmypy.json"
		"dmypy.json"
		"data/"
	)
	for f in ${IGNORE[@]}; do
		printf "$f\n" >> $PROJECT_DIR/.gitignore
	done
}

git_init() {
	echo "Initializing as git repo."
	git_ignore
	git init $PROJECT_DIR
}

init_directories
boilerplate_files
git_init

echo "Done!"
