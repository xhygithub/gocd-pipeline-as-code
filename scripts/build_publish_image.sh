#! /bin/bash

set -e

repository="xxxxxxxxxxxxxxxxxxxxx"

tag=${GO_PIPELINE_LABEL:-local}
app_image=${repository}/mysite/backend-dev:${tag}
app_test_image=${repository}/mysite/backend-test:${tag}
app_prod_image=${repository}/mysite/backend-prod:${tag}


docker build --build-arg dist=public -t ${app_image} .
docker push ${app_image}

docker build --build-arg dist=public -t ${app_test_image} .
docker push ${app_test_image}

docker build --build-arg dist=public -t ${app_prod_image} .
docker push ${app_prod_image}