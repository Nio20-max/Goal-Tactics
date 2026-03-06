package com.microsoft.appcenter.utils;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.util.DisplayMetrics;
import android.view.Display;
import com.microsoft.appcenter.ingestion.models.WrapperSdk;

/* JADX INFO: loaded from: classes2.dex */
public class DeviceInfoHelper {
    private static final String OS_NAME = "Android";
    private static String mCountryCode;
    private static WrapperSdk sWrapperSdk;

    public static PackageInfo getPackageInfo(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (Exception e) {
            AppCenterLog.error("AppCenter", "Cannot retrieve package info", e);
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0054 A[Catch: all -> 0x00f7, TryCatch #1 {, blocks: (B:4:0x0003, B:6:0x000e, B:7:0x0025, B:9:0x0037, B:10:0x003a, B:12:0x0044, B:16:0x0050, B:18:0x0054, B:19:0x0057, B:20:0x0084, B:24:0x0094, B:26:0x00b9, B:23:0x008d, B:15:0x0049, B:29:0x00ef, B:30:0x00f6), top: B:36:0x0003, inners: #0, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00b9 A[Catch: all -> 0x00f7, TRY_LEAVE, TryCatch #1 {, blocks: (B:4:0x0003, B:6:0x000e, B:7:0x0025, B:9:0x0037, B:10:0x003a, B:12:0x0044, B:16:0x0050, B:18:0x0054, B:19:0x0057, B:20:0x0084, B:24:0x0094, B:26:0x00b9, B:23:0x008d, B:15:0x0049, B:29:0x00ef, B:30:0x00f6), top: B:36:0x0003, inners: #0, #2 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static synchronized com.microsoft.appcenter.ingestion.models.Device getDeviceInfo(android.content.Context r5) throws com.microsoft.appcenter.utils.DeviceInfoHelper.DeviceInfoException {
        /*
            Method dump skipped, instruction units count: 250
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.microsoft.appcenter.utils.DeviceInfoHelper.getDeviceInfo(android.content.Context):com.microsoft.appcenter.ingestion.models.Device");
    }

    public static int getVersionCode(PackageInfo packageInfo) {
        return packageInfo.versionCode;
    }

    private static String getScreenSize(Context context) {
        int i;
        int i2;
        Point point = new Point();
        Display display = ((DisplayManager) context.getSystemService("display")).getDisplay(0);
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        point.x = displayMetrics.widthPixels;
        point.y = displayMetrics.heightPixels;
        int rotation = display.getRotation();
        if (rotation == 1 || rotation == 3) {
            int i3 = point.x;
            int i4 = point.y;
            i = i3;
            i2 = i4;
        } else {
            i2 = point.x;
            i = point.y;
        }
        return i2 + "x" + i;
    }

    public static synchronized void setWrapperSdk(WrapperSdk wrapperSdk) {
        sWrapperSdk = wrapperSdk;
    }

    public static void setCountryCode(String countryCode) {
        if (countryCode != null && countryCode.length() != 2) {
            AppCenterLog.error("AppCenter", "App Center accepts only the two-letter ISO country code.");
        } else {
            mCountryCode = countryCode;
            AppCenterLog.debug("AppCenter", String.format("Set country code: %s", countryCode));
        }
    }

    public static class DeviceInfoException extends Exception {
        public DeviceInfoException(String detailMessage) {
            super(detailMessage);
        }
    }
}
