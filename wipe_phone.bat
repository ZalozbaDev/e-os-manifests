rem adjust these, they are just examples
set FASTBOOT_PATH=c:\Users\USERNAME\AppData\Local\Android\Sdk\platform-tools\
set FIRMWARE_PATH=C:\Users\USERNAME\Downloads\IMG-e-0.18-q-20210827132306-stable-FP3\

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
