$(call inherit-product, device/lge/v700/full_v700.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := cm_v700

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="v700" \
    PRODUCT_NAME="e9wifi"
