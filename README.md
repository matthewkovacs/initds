# INITDS

This is a bash script that initializes a standard data science python project structure.  The following structure will be created automatically.

```
/home/user/code/test_project/
├── data
├── main.py
├── notebooks
├── README.md
├── results
├── .gitignore
└── src
    ├── __init__.py
    ├── make_dataset.py
    ├── make_features.py
    ├── make_models.py
    ├── make_plots.py
    ├── password.py
    └── sql
```

The script is easy to modify to fit any personal preferences.  I wrote this because I noticed that I was repeating the same steps everytime I started a new project.  I wanted a turnkey solution that made this process faster.

## Install

Clone this repo.  You can make the bash script executable if you like.

```bash
chmod +x initds/initds.sh
```

## Instructions

Execute the bash script and type in the location of the new project you want to start.

```bash
$ bash initds.sh
New project directory: ~/code/test_project
```

The file and directory structure will be populated at the target location.
