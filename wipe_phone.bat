rem adjust these, they are just examples
set FASTBOOT_PATH=c:\Users\daniel.sobe\AppData\Local\Android\Sdk\platform-tools\
set FIRMWARE_PATH=C:\Users\daniel.sobe\Downloads\IMG-e-0.18-q-20210827132306-stable-FP3\

rem to go into bootloader
rem %FASTBOOT_PATH%adb reboot bootloader

%FASTBOOT_PATH%fastboot -w

%FASTBOOT_PATH%fastboot flash system_a %FIRMWARE_PATH%system.img -S 522239K
%FASTBOOT_PATH%fastboot flash boot_a %FIRMWARE_PATH%boot.img
%FASTBOOT_PATH%fastboot flash vendor_a %FIRMWARE_PATH%vendor.img -S 522239K
%FASTBOOT_PATH%fastboot flash dtbo_a %FIRMWARE_PATH%dtbo.img
%FASTBOOT_PATH%fastboot flash vbmeta_a %FIRMWARE_PATH%vbmeta.img

%FASTBOOT_PATH%fastboot flash system_b %FIRMWARE_PATH%system.img -S 522239K
%FASTBOOT_PATH%fastboot flash boot_b %FIRMWARE_PATH%boot.img
%FASTBOOT_PATH%fastboot flash vendor_b %FIRMWARE_PATH%vendor.img -S 522239K
%FASTBOOT_PATH%fastboot flash dtbo_b %FIRMWARE_PATH%dtbo.img
%FASTBOOT_PATH%fastboot flash vbmeta_b %FIRMWARE_PATH%vbmeta.img

rem let's not re-lock the bootloader unless really really necessary
rem fastboot flashing lock

rem after booting up the modified firmware, override the path for the OTA
rem updates via ADB to point to the local server
rem
rem %FASTBOOT_PATH%adb root (might have to allow in developer settings first)
rem %FASTBOOT_PATH%adb shell
rem setprop lineage.updater.uri https://eosupdate.serbski-inkubator.de/api/v1/{device}/{type}/{incr}
rem
rem then go to settings and search for updated firmware
rem
rem and after updating with the custom firmware, "wipe data" via bootloader
rem

