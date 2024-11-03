CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
CUSTOM_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)-$(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)

CUSTOM_PLATFORM_VERSION := 15.0
CUSTOM_DISPLAY_VERSION := 1.0

# Guidelines for setting aosPB Build ID:
#  - VR1  = V Release 1
#  - 35   = API Level 35
#  - OSR  = Open Source Release
#  - DEV  = Dev Release
#  - RF00 = Production Release 00
#  - BETA00 = BETA Release 00
#  - JAN = Month placeholder

CUSTOM_BUILD_ID := VR1.35.DEV.OCT.BETA01

CUSTOM_BUILDTYPE ?= UNOFFICIAL

CUSTOM_VERSION := aosPB_$(CUSTOM_DISPLAY_VERSION)-$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILDTYPE)-$(CUSTOM_BUILD_DATE)
CUSTOM_VERSION_PROP := fifteen

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.custom.build.date=$(BUILD_DATE) \
    ro.custom.build.version=$(CUSTOM_DISPLAY_VERSION) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.fingerprint=$(ROM_FINGERPRINT) \
    ro.custom.releasetype=$(CUSTOM_BUILDTYPE) \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.modversion=$(CUSTOM_VERSION)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.custom.build.id=$(CUSTOM_BUILD_ID)

# Signing
-include vendor/lineage-priv/keys/keys.mk
