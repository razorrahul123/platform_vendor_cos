# Insert new variables inside the Cosmic structure
cosmic_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Cosmic": {'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false),'; \
	echo '    "Specific_camera_parameter_library": "$(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)",'; \
	echo '    "Target_shim_libs": "$(subst $(space),:,$(TARGET_LD_SHIM_LIBS))",'; \
	echo '    "Uses_generic_camera_parameter_library": $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),false,true),'; \
	echo '    "Uses_qcom_bsp_legacy": $(if $(filter true,$(TARGET_USES_QCOM_BSP_LEGACY)),true,false)'; \
	echo '    "Has_legacy_camera_hal1": $(if $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)),true,false),'; \
	echo '    "Uses_media_extensions": $(if $(filter true,$(TARGET_USES_MEDIA_EXTENSIONS)),true,false),'; \
	echo '    "BoardUsesQTIHardware":  $(if $(BOARD_USES_QTI_HARDWARE),true,false),'; \
	echo '    "Libart_img_base": "$(LIBART_IMG_BASE)",'; \
	echo '    "QTIAudioPath":  "$(call project-path-for,qcom-audio)",'; \
	echo '    "QTIDisplayPath":  "$(call project-path-for,qcom-display)",'; \
	echo '    "QTIMediaPath":  "$(call project-path-for,qcom-media)",';  \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)