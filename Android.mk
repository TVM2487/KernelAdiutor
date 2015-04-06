LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := KernelAdiutor
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PROGUARD_FLAG_FILES := proguard.flags

LOCAL_SRC_FILES := $(call all-java-files-under, app/src/main)
LOCAL_SRC_FILES += $(call all-java-files-under, ../FloatingActionButton/library/src/main)

LOCAL_RESOURCE_DIR := packages/apps/KernelAdiutor/app/src/main/res
LOCAL_RESOURCE_DIR += packages/apps/FloatingActionButton/library/src/main/res
LOCAL_RESOURCE_DIR += frameworks/support/v7/appcompat/res
LOCAL_RESOURCE_DIR += frameworks/support/v7/cardview/res

LOCAL_AAPT_INCLUDE_ALL_RESOURCES := true
LOCAL_AAPT_FLAGS := --auto-add-overlay
LOCAL_AAPT_FLAGS += --extra-packages com.getbase.floatingactionbutton
LOCAL_AAPT_FLAGS += --extra-packages android.support.v7.appcompat
LOCAL_AAPT_FLAGS += --extra-packages android.support.v7.cardview
LOCAL_AAPT_FLAGS += --extra-packages android.support.v7.recyclerview
LOCAL_AAPT_FLAGS += --extra-packages android.support.annotations

LOCAL_ASSET_DIR := packages/apps/KernelAdiutor/app/src/main/assets

LOCAL_STATIC_JAVA_LIBRARIES +=  android-support-v4 \
                                android-support-v7-cardview \
                                android-support-v7-recyclerview \
                                android-support-v7-appcompat \
                                android-support-annotations

LOCAL_STATIC_JAVA_LIBRARIES += libdashclock

include $(BUILD_PACKAGE)

include $(CLEAR_VARS)

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := libdashclock:lib/dashclock-api-r2.0.jar

include $(BUILD_MULTI_PREBUILT)
