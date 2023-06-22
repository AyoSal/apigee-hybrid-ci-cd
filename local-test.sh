#!/bin/bash

npm run unit-test
mvn -f cloudbuild-pom.xml  install -Pdev -Dorg=$PROJECT_ID -Duser.name=$GITHUB_USER -Dbearer="${TOKEN}"
npm run integration-test 
