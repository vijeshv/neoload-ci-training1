#!/bin/sh
#set -e
set -x

. "`dirname $0`"/../globals.sh

if [ ! "$(which git)" ]; then
  sudo apt-get install -y -q git
fi
if [ ! "$(which jq)" ]; then
  sudo apt-get install -y -q jq
fi

HOME_DIR=/home/orasilabs

# create a separate directory for latest examples repo (includes startup config)
if [ ! -d "$HOME_DIR/startup" ]; then
  sudo mkdir -p $HOME_DIR/startup/
fi
echo $git_repo_url
# clone or pull latest example repo
if [ ! -d "$HOME_DIR/startup/neoload-ci-training" ]; then
  cd $HOME_DIR/startup/ &&  git clone $git_repo_url
else
  cd $HOME_DIR/startup/neoload-ci-training && git pull
fi

cd $HOME_DIR/startup/neoload-ci-training && git checkout $git_branch

export HOME_DIR=$HOME_DIR

cd $HOME_DIR/startup/neoload-ci-training && infra/ubuntu/start_after_git.sh $@
