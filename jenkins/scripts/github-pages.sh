#!/usr/bin/env sh

set -x
# just to ensure the build
ls build
# set the user, I just use Github Actions. hahaha
git config --global user.email "bagusaldycky@gmail.com"
git config --global user.name "aldybw"
# set the target repo
git remote set-url origin https://git:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git
# run gh-pages, please ensure the jenkins have the permission
npx gh-pages --message '[skip ci] Updates' --dist build