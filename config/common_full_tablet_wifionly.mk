# Inherit mobile full common Custom stuff
$(call inherit-product, vendor/aosp/config/common_mobile_full.mk)

# Inherit tablet common Custom stuff
$(call inherit-product, vendor/aosp/config/tablet.mk)

$(call inherit-product, vendor/aosp/config/wifionly.mk)
