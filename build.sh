#!/bin/bash

mkdir -p /srv/e/src /srv/e/zips /srv/e/logs /srv/e/ccache

# original
# docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" -e "BRANCH_NAME=v0.17.1-q" -e "DEVICE_LIST=FP3" -e "REPO=https://gitlab.e.foundation/e/os/releases.git"   registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community

# customized
docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=devel_fp3-q" -e "DEVICE_LIST=FP3" -e "REPO=https://github.com/ZalozbaDev/e-os-manifests.git"  \
-e "OTA_URL=https://eosupdate.serbski-inkubator.de/api" \
registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community

# to build with a known-good container, use this one
## zalozbadev/e_os_docker-lineage-cicd:v0_17_1_q

