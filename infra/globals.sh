#!/bin/bash
set -e

#git_repo_url=https://github.com/paulsbruce/neoload-ci-training.git
git_repo_url=https://github.com/vijeshv/neoload-ci-training1
git_branch=master

export git_repo_url=$git_repo_url
export git_branch=$git_branch

# safe defaults, can be overridden in environment-specific config (like orasilabs/startup.sh)
JENKINS_HTTP_PORT=8081
NLW_HOST=neoload-rest.saas.neotys.com
NLW_HOST_API_BASE=https://$NLW_HOST
export JENKINS_HTTP_PORT=$JENKINS_HTTP_PORT
export NLW_HOST_API_BASE=$NLW_HOST_API_BASE
export NLW_HOST=$NLW_HOST
