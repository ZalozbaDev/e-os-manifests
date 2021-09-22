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

