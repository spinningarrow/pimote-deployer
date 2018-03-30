#!/usr/bin/env bash

tput setaf 3

app_name=$1
artifact_url=$2

echo deploying ${app_name} from ${artifact_url}

pushd $PIMOTE_DEPLOYMENT_DIR
curl -s -LO ${artifact_url} && echo new ${app_name} downloaded
popd

tput sgr0

sudo systemctl restart ${app_name}
