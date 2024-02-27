#!/bin/bash

# if clean WA is requested
rm -rf /srv/e/src /srv/e/zips /srv/e/logs /srv/e/ccache

mkdir -p /srv/e/src /srv/e/zips /srv/e/logs /srv/e/ccache

# original
# docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" -e "BRANCH_NAME=v0.17.1-q" -e "DEVICE_LIST=FP3" -e "REPO=https://gitlab.e.foundation/e/os/releases.git"   registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community

# customized (v1.3.1)
docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1.3.1-devel-q" -e "DEVICE_LIST=FP3,starlte" -e "REPO=https://github.com/ZalozbaDev/e-os-manifests.git"  \
-e "OTA_URL=https://eosupdate.serbski-inkubator.de/api" \
docker-lineage-cicd-custom:latest

# original v1.17
docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1.17-q" -e "DEVICE_LIST=FP3" -e "REPO=https://gitlab.e.foundation/e/os/releases.git"  \
zalozbadev/e-os-docker-lineage-cicd:v1_17_1538


####################################

# customized (v1.17-q)
docker pull registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community
docker image tag registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:community zalozbadev/e-os-docker-lineage-cicd:v1_17 

docker pull registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:1538-create-tags-community
docker image tag registry.gitlab.e.foundation:5000/e/os/docker-lineage-cicd:1538-create-tags-community zalozbadev/e-os-docker-lineage-cicd:v1_17_1538


docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1.17-q-devel-q" -e "DEVICE_LIST=FP3" -e "REPO=https://github.com/ZalozbaDev/e-os-manifests.git"  \
-e "INCLUDE_PROPRIETARY=true" \
-e "OTA_URL=https://eosupdate.serbski-inkubator.de/api" \
zalozbadev/e-os-docker-lineage-cicd:v1_17_1538

# wait for failure, then start a build manually

docker run -it --entrypoint /bin/bash -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1.17-q-devel-q" -e "DEVICE_LIST=FP3" -e "REPO=https://github.com/ZalozbaDev/e-os-manifests.git"  \
-e "INCLUDE_PROPRIETARY=true" \
-e "OTA_URL=https://eosupdate.serbski-inkubator.de/api" \
zalozbadev/e-os-docker-lineage-cicd:v1_17_1538

cd /srv/src/Q/
source build/envsetup.sh 
brunch FP3

####################################

# customized (v1.18-r)

docker run -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1.18-r-devel-r" -e "DEVICE_LIST=FP3" -e "REPO=https://github.com/ZalozbaDev/e-os-manifests.git"  \
-e "INCLUDE_PROPRIETARY=true" \
-e "OTA_URL=https://eosupdate.serbski-inkubator.de/api" \
zalozbadev/e-os-docker-lineage-cicd:v1_17_1538

# wait for failure, then start a build manually

docker run -it --entrypoint /bin/bash -v "/srv/e/src:/srv/src" -v "/srv/e/zips:/srv/zips" -v "/srv/e/logs:/srv/logs" -v "/srv/e/ccache:/srv/ccache" \
-e "BRANCH_NAME=v1.18-r-devel-r" -e "DEVICE_LIST=FP3" -e "REPO=https://github.com/ZalozbaDev/e-os-manifests.git"  \
-e "INCLUDE_PROPRIETARY=true" \
-e "OTA_URL=https://eosupdate.serbski-inkubator.de/api" \
zalozbadev/e-os-docker-lineage-cicd:v1_17_1538

cd /srv/src/R/
source build/envsetup.sh 
brunch FP3



#################################

# to run interactively w/o starting a build, add this:
docker run -it --entrypoint /bin/bash zalozbadev/e-os-docker-lineage-cicd:v1_17_1538


