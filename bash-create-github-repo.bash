#!/bin/bash

# put this function in .bash_aliases

function create_github_repo() {
  if [ "$1" == "" ]; then
    printf "Enter repo name: "
    read repo_name
  else
    repo_name=$1
  fi

  if [ "$2" == "" ]; then
    printf "Enter user name: "
    read user_name
  else
    user_name=$2
  fi

  mkdir -p $repo_name
  cd $repo_name
  echo $repo_name > README.md
  git init
  git add README.md
  git commit -m "First commit"
  git remote add origin https://github.com/$user_name/$repo_name.git
  
  echo "Create repo on Github"
  set -x
  curl -u $user_name https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
  set +x
  
  echo "Push repo"
  git push origin master
}


echo "to run: create_github_repo"

