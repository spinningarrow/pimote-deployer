#!/usr/bin/env bash

app_name=$1
artifact_url=$2

echo deploying ${app_name} from ${artifact_url}

pushd $PIMOTE_DEPLOYMENT_PATH
curl -LO ${artifact_url}
popd

sudo systemctl restart ${app_name}
