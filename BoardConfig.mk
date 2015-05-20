#
# Copyright (C) 2015 The CyanogenMod Project
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

# inherit from the proprietary version
-include vendor/lge/v700/BoardConfigVendor.mk

TARGET_OTA_ASSERT_DEVICE := v700,e9,e9wifi

LOCAL_PATH := device/lge/v700

# Platform
TARGET_BOARD_PLATFORM := msm8226

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/v700/bluetooth

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_PREBUILT_KERNEL := device/lge/v700/kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 earlyprintk androidboot.console=ttyHSL0 user_debug=31 msm_rtb.filter=0x37 androidboot.hardware=e9wifi androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --dt device/lge/v700/dt.img --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --tags_offset 0x00000100
BOARD_CUSTOM_BOOTIMG_MK := device/lge/v700/mkbootimg.mk
BOARD_CUSTOM_BOOTIMG := true

# Audio
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DLG_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND=' \
    { "persist.data.sensor_name", AID_CAMERA, 0 }, \
    { "camera.4k2k.enable", AID_MEDIA, 0 }, \
    { "persist.data.rear.minfps", AID_MEDIA, 0 }, \
    { "persist.data.front.minfps", AID_MEDIA, 0 }, \
    { "persist.data.rear.minfps", AID_MEDIA, 0 }, \
    '

# CMHW
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

HAVE_ADRENO_SOURCE:= false
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Include
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Malloc
MALLOC_IMPL := dlmalloc

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 25165824    # 24M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824    # 24M
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2147483648  # 2048M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12197036032 # 11632M
BOARD_CACHEIMAGE_PARTITION_SIZE    := 947912704   # 904M
BOARD_FLASH_BLOCK_SIZE             := 131072      # (BOARD_KERNEL_PAGESIZE * 64)

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Radio
TARGET_RELEASE_CPPFLAGS += -DNEEDS_LGE_RIL_SYMBOLS

# Recovery
TARGET_RECOVERY_FSTAB := device/lge/v700/rootdir/etc/fstab.e9wifi
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/lge/v700/sepolicy
BOARD_SEPOLICY_UNION += \
  file_contexts \
  file.te \
  init_shell.te \
  mpdecision.te \
  mediaserver.te \
  property.te \
  property_contexts \
  rmt_storage.te \
  sensors.te \
  system_server.te \
  tee.te \
  thermal-engine.te \
  vold.te \
  wcnss_service.te

# Time services
# TODO (needs libtime_genoff)
# BOARD_USES_QC_TIME_SERVICES := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
TARGET_USES_QCOM_WCNSS_QMI := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
