#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/lge/e975/e975-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/e973/overlay

## common overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/ls970-common/overlay

# Inherit from ls970-common
$(call inherit-product, device/lge/ls970-common/ls970-common.mk)

# Enable for debugging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    persist.service.adb.enable=1

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# Telephony Properties
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=9 \
    ro.ril.def.preferred.network=9

# GPS configuration
PRODUCT_COPY_FILES += \
        device/lge/e973/configs/gps.conf:system/etc/gps.conf

# Ramdisk
PRODUCT_COPY_FILES += \
    device/lge/e973/ramdisk/init.e973.rc:root/init.e973.rc \
    device/lge/e973/ramdisk/ueventd.e973.rc:root/ueventd.e973.rc \
    device/lge/e973/ramdisk/fstab.e973:root/fstab.e973

# Lights Firmware
PRODUCT_COPY_FILES += \
    device/lge/e973/prebuilt/lights.msm8960.so:system/lib/hw/lights.msm8960.so

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

