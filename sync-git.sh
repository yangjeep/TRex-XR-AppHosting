#!/bin/bash

REPO_NAME=TRex-XR-AppHosting.git
ORIGIN_URL=git@github.com:yangjeep/$REPO_NAME
REPO1_URL=git@wwwin-github.cisco.com:jiajyang/$REPO_NAME

rm -rf $REPO_NAME
git clone --bare $ORIGIN_URL
cd $REPO_NAME
git remote add --mirror=fetch repo1 $REPO1_URL
git fetch origin --tags ; git fetch repo1 --tags
git push origin --all ; git push origin --tags
git push repo1 --all ; git push repo1 --tags
