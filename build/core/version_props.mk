# Copyright (C) 2018-20 Project dotOS
# Copyright (C) 2022 NaikaOS Project
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

ADDITIONAL_SYSTEM_PROPERTIES += \
  ro.naika.version=$(NAIKA_VERSION) \
  ro.naika.releasetype=$(NAIKA_BUILD_TYPE) \
  ro.modversion=$(NAIKA_MOD_VERSION)

NAIKA_DISPLAY_VERSION := NaikaOS-$(NAIKA_MOD_VERSION)-$(NAIKA_BUILD_TYPE)

ADDITIONAL_SYSTEM_PROPERTIES += \
  ro.naika.display.version=$(NAIKA_DISPLAY_VERSION)\
  ro.naika.fingerprint=$(NAIKA_FINGERPRINT)
