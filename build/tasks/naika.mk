# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2021 The dotOS Project
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

# -----------------------------------------------------------------
# naikaOS OTA update package

NAIKA_TARGET_PACKAGE := $(PRODUCT_OUT)/$(NAIKA_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: naika
naika: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(NAIKA_TARGET_PACKAGE)
	$(hide) $(SHA256) $(NAIKA_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(NAIKA_TARGET_PACKAGE).sha256sum
	echo -e ${CL_RED}"░▒█▄░▒█░█▀▀▄░▀█▀░▒█░▄▀░█▀▀▄░░░▒█▀▀▀█░▒█▀▀▀█"${CL_RED}
	echo -e ${CL_CYN}"░▒█▒█▒█▒█▄▄█░▒█░░▒█▀▄░▒█▄▄█░░░▒█░░▒█░░▀▀▀▄▄"${CL_CYN}
	echo -e ${CL_RED}"░▒█░░▀█▒█░▒█░▄█▄░▒█░▒█▒█░▒█░░░▒█▄▄▄█░▒█▄▄▄█"${CL_RED}
	@echo -e ""
	@echo -e "      naikaOS           "
	@echo -e "Bringing Web3 to mobile!"
	@echo -e ""
	@echo -e ${CL_YLW} " Grab Some Cookies and Flash!!" ${CL_YLW}
	@echo -e ${CL_BLD}${CL_RED}"===============================-Package complete-==============================="${CL_RED}
	@echo -e ${CL_BLD}${CL_YLW}"Zip: "${CL_YLW} $(NAIKA_TARGET_PACKAGE)${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"SHA256: "${CL_YLW}" `cat $(NAIKA_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Size:"${CL_YLW}" `du -sh $(NAIKA_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Size in Int:"${CL_YLW}" `wc -c $(NAIKA_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"TimeStamp:"${CL_YLW}" `cat $(PRODUCT_OUT)/system/build.prop | grep ro.build.date.utc | cut -d'=' -f2 | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_RED}"================================================================================"${CL_RED}
