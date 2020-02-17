#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e4a4bf4509cf8001bb053dd/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e4a4bf4509cf8001bb053dd
curl -s -X POST https://api.stackbit.com/project/5e4a4bf4509cf8001bb053dd/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e4a4bf4509cf8001bb053dd/webhook/build/publish > /dev/null
