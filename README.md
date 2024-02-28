# How to build & install the customized /e/ OS onto the FairPhone 3(+) 
## Prepare phone

* Obtain a FairPhone 3(+)
* Install /e/ according to this description: https://doc.e.foundation/devices/FP3/install
 * Install the Google USB driver from Android SDK / Android Studio and force the "Android Bootloader Interface" driver once the phone is in fastboot mode.
 * A helper script "wipe_phone.bat" can be found here which needs just path adjustments.

## Build OTA image

* Obtain a powerful Linux PC / server
* Install Docker
* Run the "build.sh" script (possibly as root)

## Install image

* Put phone into recovery mode
* "adb sideload" the .zip file
* Reboot

## Tips & Tricks

### Show customizations for v0.17

git kdiff v0.17.1-q devel_fp3-q

### Show customizations for v1.3-q

git kdiff v1.3.1-devel-q v1.3.1-q

### Branch not supported

Check the repos 

origin	git@github.com:ZalozbaDev/e-os-docker-lineage-cicd (fetch)
origin	git@github.com:ZalozbaDev/e-os-docker-lineage-cicd (push)
upstream	https://gitlab.e.foundation/e/os/docker-lineage-cicd (fetch)
upstream	https://gitlab.e.foundation/e/os/docker-lineage-cicd (push)

file 

build-community.sh

it has a regex for branch names, if your custom branch is not matching, it won't be built :-(

