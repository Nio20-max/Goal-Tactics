package com.helpshift.network.connectivity;

import android.content.Context;
import android.os.Build;

/* JADX INFO: loaded from: classes2.dex */
public class HSAndroidConnectivityManagerProvider {
    public HSAndroidConnectivityManager getOSConnectivityManager(Context context) {
        if (Build.VERSION.SDK_INT >= 24) {
            return new HSOnAndAboveNConnectivityManager(context);
        }
        return new HSBelowNConnectivityManager(context);
    }
}
