package com.helpshift.app;

/* JADX INFO: loaded from: classes.dex */
public class AppLifeCycleStateHolder {
    private static boolean isAppInForeground;

    public static void setAppInForeground(boolean z) {
        isAppInForeground = z;
    }

    public static boolean isAppInForeground() {
        return isAppInForeground;
    }
}
