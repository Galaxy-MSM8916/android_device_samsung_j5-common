/*
 * Copyright (C) 2017-2021, The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <init_msm8916_base.h>

void vendor_load_properties()
{
	char *device = NULL;
	char *model = NULL;

	/* get the bootloader string */
	std::string bootloader = android::base::GetProperty("ro.bootloader", "");

	if (bootloader.find("J500FN") == 0) {
		device = (char *)"j5nltexx";
		model = (char *)"SM-J500FN";
		set_lte_properties();
	}
	else if (bootloader.find("J500F") == 0) {
		device = (char *)"j5ltexx";
		model = (char *)"SM-J500F";
		set_lte_properties();
	}
	else if (bootloader.find("J500H") == 0) {
		device = (char *)"j53gxx";
		model = (char *)"SM-J500H";
		set_gsm_properties();
	}
	else if (bootloader.find("J500M") == 0) {
		device = (char *)"j5lteub";
		model = (char *)"SM-J500M";
		set_lte_properties();
	}
	else if (bootloader.find("J500Y") == 0) {
		device = (char *)"j5ylte";
		model = (char *)"SM-J500Y";
		set_lte_properties();
	}
	else if (bootloader.find("J500G") == 0) {
		device = (char *)"j5ltedx";
		model = (char *)"SM-J500G";
		set_lte_properties();
	}
	else if (bootloader.find("J5008") == 0) {
		device = (char *)"j5ltechn";
		model = (char *)"SM-J5008";
		set_lte_properties();
	}
	else {
		return;
	}

	/* set the properties */
	set_target_properties(device, model);
}
