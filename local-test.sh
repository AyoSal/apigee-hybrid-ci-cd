#!/bin/bash

if [ -z "${PROJECT_ID}" ] ; then
  echo "PROJECT_ID is requried"
  exit 1
fi

if [ "$(gcloud config list account --format 'value(core.account)')" = "" ] ; then
  gcloud auth login
fi


export TOKEN="$(gcloud auth print-access-token --project "${PROJECT_ID}" )"


npm run unit-test
mvn -f cloudbuild-pom.xml  install -Pdev -Dorg=$PROJECT_ID -Duser.name=$GITHUB_USER -Dbearer="${TOKEN}"
npm run integration-test 