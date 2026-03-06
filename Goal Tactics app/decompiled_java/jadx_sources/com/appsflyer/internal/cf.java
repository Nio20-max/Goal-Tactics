package com.appsflyer.internal;

import android.content.Context;
import android.os.Build;

/* JADX INFO: loaded from: classes.dex */
public final class cf {
    public static boolean values(Context context) {
        if (Build.VERSION.SDK_INT >= 26) {
            return context.getPackageManager().isInstantApp();
        }
        try {
            context.getClassLoader().loadClass("com.google.android.instantapps.supervisor.InstantAppsRuntime");
            return true;
        } catch (ClassNotFoundException unused) {
            return false;
        }
    }
}
