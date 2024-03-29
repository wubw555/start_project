#!/bin/bash
mkdir $1
cd $1
git init
git secrets --install
git secrets --add 'private_key'
git secrets --add 'private_key_id'
touch .gitignore
read -p "project_id: " project_id
gcloud config set project $project_id
read -p "std/flex: " sf
mkdir appengine{,/$sf}
if [ $sf = "flex" ]; then
    touch appengine/$sf/gunicorn.conf.py
fi
touch appengine/$sf/{app.yaml,main.py,requirements.txt}
echo "successfully created initial project files"
