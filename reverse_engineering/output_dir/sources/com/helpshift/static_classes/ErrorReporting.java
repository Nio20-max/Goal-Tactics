package com.helpshift.static_classes;

/* JADX INFO: loaded from: classes2.dex */
public class ErrorReporting {
    private static boolean enableErrorReporting;

    public static void shouldEnable(boolean z) {
        enableErrorReporting = z;
    }

    public static boolean isEnabled() {
        return enableErrorReporting;
    }
}
