package com.helpshift.common.platform;

import com.helpshift.meta.dto.DeviceDiskSpaceDTO;
import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public interface Device {

    public enum PermissionState {
        AVAILABLE,
        UNAVAILABLE,
        REQUESTABLE
    }

    public enum PermissionType {
        READ_STORAGE,
        WRITE_STORAGE
    }

    void changeLocale(Locale locale);

    PermissionState checkPermission(PermissionType permissionType);

    String getAndroidId();

    String getApiVersion();

    String getAppIdentifier();

    String getAppName();

    String getAppVersion();

    String getBatteryLevel();

    String getBatteryStatus();

    String getCarrierName();

    String getDeviceId();

    String getDeviceModel();

    DeviceDiskSpaceDTO getDiskSpace();

    String getLanguage();

    Locale getLocale();

    String getNetworkType();

    String getOSVersion();

    int getOSVersionNumber();

    String getPlatformName();

    String getPushToken();

    String getRom();

    String getSDKVersion();

    String getSimCountryIso();

    String getTimeStamp();

    String getTimeZoneId();

    long getTimeZoneOffSet();

    boolean is24HourFormat();

    void setPushToken(String str);
}
