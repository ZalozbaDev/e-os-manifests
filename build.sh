#!/bin/bash

mkdir -p /srv/e/src /srv/e/zips /srv/e/logs /srv/e/ccache

# original
# docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" -e "BRANCH_NAME=v0.17.1-q" -e "DEVICE_LIST=FP3" -e "REPO=https://gitlab.e.foundation/e/os/releases.git"   registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community

# customized (v1.3.1)
docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1.3.1-devel-q" -e "DEVICE_LIST=FP3,starlte" -e "REPO=https://github.com/ZalozbaDev/e-os-manifests.git"  \
-e "OTA_URL=https://eosupdate.serbski-inkubator.de/api" \
docker-lineage-cicd-custom:latest

# customized (v1.17)
docker pull registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community
docker image tag registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community zalozbadev/e-os-docker-lineage-cicd:v1_17 


docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1.17-devel-q" -e "DEVICE_LIST=FP3" -e "REPO=https://github.com/ZalozbaDev/e-os-manifests.git"  \
-e "OTA_URL=https://eosupdate.serbski-inkubator.de/api" \
zalozbadev/e-os-docker-lineage-cicd:v1_17

# to run interactively w/o starting a build, add this:
docker run -it --entrypoint /bin/bash zalozbadev/e-os-docker-lineage-cicd:v1_17


