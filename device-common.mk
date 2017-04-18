#
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from common
$(call inherit-product, device/samsung/msm8916-common/msm8916.mk)

# Inherit from vendor
$(call inherit-product, vendor/samsung/j5-common/j5-common-vendor.mk)

DEVICE_PATH := device/samsung/j5-common

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_DENSITY := 320

# Common overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# FlipFlap
PRODUCT_PACKAGES += \
    FlipFlap

# Media configurations
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml

# Proprieties
include $(DEVICE_PATH)/system_prop.mk

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc

# RIL
PRODUCT_PACKAGES += \
    libril \
    librilutils \
    rild

# Inhert dalvik heap values from aosp
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
