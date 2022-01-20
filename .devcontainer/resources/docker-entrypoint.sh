#!/bin/bash
git lfs pull
export JFROG_APIKEY="$(cat /secrets/jfrog-api-key)"
exec /usr/local/share/docker-init.sh "$@"
