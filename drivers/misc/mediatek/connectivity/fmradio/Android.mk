LOCAL_PATH := $(call my-dir)

ifeq ($(MTK_FM_SUPPORT),yes)

include $(CLEAR_VARS)
LOCAL_MODULE := fmradio_drv.ko
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
LOCAL_INIT_RC := init.fmradio_drv.rc
ifeq ($(BUILD_CONNAC2), true)
LOCAL_REQUIRED_MODULES := conninfra.ko
else
LOCAL_REQUIRED_MODULES := wmt_drv.ko
endif

ifeq ($(strip $(CONFIG_FEATURE_J19COMMON)),true)
LOCAL_CFLAGS += -DTARGET_PRODUCT_J19COMMON
endif

FM_OPTS := CONFIG_FM_USER_LOAD=1

FM_OPTS += CFG_BUILD_CONNAC2=$(BUILD_CONNAC2) CFG_FM_CHIP_ID=$(FM_CHIP_ID)

include $(MTK_KERNEL_MODULE)

$(linked_module): OPTS += $(FM_OPTS)

endif
