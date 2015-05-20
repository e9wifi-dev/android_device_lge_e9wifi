$(call inherit-product, device/lge/e9wifi/full_e9wifi.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := cm_e9wifi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="e9wifi" \
    PRODUCT_NAME="e9wifi_open_com" \
    BUILD_FINGERPRINT="lge/e9wifi_open_com/e9wifi:5.0.2/LRX22G/150801447d5e2:user/release-keys" \
    PRIVATE_BUILD_DESC="e9wifi_open_com-user 5.0.2 LRX22G 150801447d5e2 release-keys"
