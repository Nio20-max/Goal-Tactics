package com.helpshift.util;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import androidx.core.content.ContextCompat;

/* JADX INFO: loaded from: classes2.dex */
public final class ApplicationUtil {
    private static final int NOTIFICATION_ID = 1;
    private static final String TAG = "Helpshift_AppUtil";

    public static String getApplicationVersion(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Exception e) {
            HSLogger.d(TAG, "Error getting app version", e);
            return null;
        }
    }

    public static int getTargetSDKVersion(Context context) {
        try {
            return context.getApplicationInfo().targetSdkVersion;
        } catch (Exception e) {
            HSLogger.d(TAG, "Target SDK version not found", e);
            return 0;
        }
    }

    public static String getApplicationName(Context context) {
        String string;
        try {
            string = context.getPackageManager().getApplicationLabel(context.getApplicationInfo()).toString();
        } catch (Exception e) {
            HSLogger.d(TAG, "Error getting application name", e);
            string = null;
        }
        return string == null ? "Support" : string;
    }

    public static boolean isPermissionGranted(Context context, String str) {
        try {
            return ContextCompat.checkSelfPermission(context, str) == 0;
        } catch (Exception e) {
            HSLogger.d(TAG, "Error checking for permission : " + str, e);
            return false;
        }
    }

    public static void showNotification(Context context, String str, Notification notification) {
        if (notification == null) {
            return;
        }
        HSLogger.d(TAG, "Showing notification : Tag : " + str);
        NotificationManager notificationManager = getNotificationManager(context);
        if (notificationManager != null) {
            notificationManager.notify(str, 1, notification);
        }
    }

    public static void cancelNotification(Context context, String str) {
        HSLogger.d(TAG, "Cancelling notification : Tag : " + str);
        cancelNotification(context, str, 1);
    }

    public static void cancelNotification(Context context, String str, int i) {
        HSLogger.d(TAG, "Cancelling notification : Tag : " + str + ", id : " + i);
        NotificationManager notificationManager = getNotificationManager(context);
        if (notificationManager != null) {
            notificationManager.cancel(str, i);
        }
    }

    public static NotificationManager getNotificationManager(Context context) {
        try {
            return (NotificationManager) context.getSystemService("notification");
        } catch (Exception e) {
            HSLogger.e(TAG, "Unable to get notification manager from System service", e);
            return null;
        }
    }

    public static Intent getLaunchIntent(Context context, String str) {
        try {
            return context.getPackageManager().getLaunchIntentForPackage(str);
        } catch (Exception e) {
            HSLogger.d(TAG, "Error getting launch activity for package : " + str, e);
            return null;
        }
    }

    public static String getSupportLibVersion(Context context) {
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (applicationInfo.metaData != null) {
                return applicationInfo.metaData.getString("android.support.VERSION");
            }
            return null;
        } catch (Exception e) {
            HSLogger.d(TAG, "Error getting SupportLib version : ", e);
            return null;
        }
    }

    public static boolean isSupportLibVersionEqualAndAbove(Context context, int i) {
        try {
            String supportLibVersion = getSupportLibVersion(context);
            if (supportLibVersion != null) {
                return Integer.parseInt(supportLibVersion.split("\\.")[0]) >= i;
            }
        } catch (Exception e) {
            HSLogger.d(TAG, "Error in doing comparison check for supportLib version : ", e);
        }
        return false;
    }

    public static boolean isApplicationDebuggable(Context context) {
        return (context.getApplicationInfo().flags & 2) != 0;
    }

    public static int getLogoResourceValue(Context context) {
        int i = context.getApplicationInfo().logo;
        return i == 0 ? context.getApplicationInfo().icon : i;
    }

    public static int getResourceIdFromName(Context context, String str, String str2, String str3) {
        return context.getResources().getIdentifier(str, str2, str3);
    }

    public static int getScreenHeight(Context context) {
        return context.getResources().getDisplayMetrics().heightPixels;
    }
}
