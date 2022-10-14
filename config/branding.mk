#NaikaOS Versioning :
NAIKA_MOD_VERSION = BETA

NAIKA_BUILD_TYPE ?= UNOFFICIAL
ifeq ($(WITH_GAPPS), true)
	NAIKA_BUILD_TYPE := UNOFFICIAL_GAPPS
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

NAIKA_BUILD_DATE_UTC := $(shell date -u '+%Y%m%d')

ifeq ($(NAIKA_OFFICIAL), true)
   LIST = $(shell cat vendor/naika/naika.devices)
   FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      NAIKA_BUILD_TYPE := OFFICIAL
      ifeq ($(WITH_GAPPS), true)
	      NAIKA_BUILD_TYPE := GAPPS
      endif
    endif
    ifneq ($(IS_OFFICIAL), true)
       NAIKA_BUILD_TYPE := UNOFFICIAL
       ifeq ($(WITH_GAPPS), true)
	      NAIKA_BUILD_TYPE := UNOFFICIAL_GAPPS
       endif
       $(error Device is not official "$(FOUND)")
    endif

endif

TARGET_PRODUCT_SHORT := $(subst naika_,,$(NAIKA_BUILD))

NAIKA_VERSION := NaikaOS-$(NAIKA_MOD_VERSION)-$(CURRENT_DEVICE)-$(NAIKA_BUILD_TYPE)-$(NAIKA_BUILD_DATE_UTC)

NAIKA_FINGERPRINT := NaikaOS/$(NAIKA_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(NAIKA_BUILD_DATE_UTC)