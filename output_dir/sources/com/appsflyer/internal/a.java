package com.appsflyer.internal;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.google.firebase.analytics.FirebaseAnalytics;

/* JADX INFO: loaded from: classes.dex */
final class a {
    private IntentFilter valueOf = new IntentFilter("android.intent.action.BATTERY_CHANGED");

    /* JADX INFO: renamed from: com.appsflyer.internal.a$a, reason: collision with other inner class name */
    static final class C0006a {
        static final a valueOf = new a();
    }

    a() {
    }

    final d values(Context context) {
        String str = null;
        float f = 0.0f;
        try {
            Intent intentRegisterReceiver = context.registerReceiver(null, this.valueOf);
            if (intentRegisterReceiver != null) {
                if (2 == intentRegisterReceiver.getIntExtra("status", -1)) {
                    int intExtra = intentRegisterReceiver.getIntExtra("plugged", -1);
                    str = intExtra != 1 ? intExtra != 2 ? intExtra != 4 ? "other" : "wireless" : "usb" : "ac";
                } else {
                    str = "no";
                }
                int intExtra2 = intentRegisterReceiver.getIntExtra(FirebaseAnalytics.Param.LEVEL, -1);
                int intExtra3 = intentRegisterReceiver.getIntExtra("scale", -1);
                if (-1 != intExtra2 && -1 != intExtra3) {
                    f = (intExtra2 * 100.0f) / intExtra3;
                }
            }
        } catch (Throwable unused) {
        }
        return new d(f, str);
    }

    static final class d {
        final float AFInAppEventType;
        final String AFKeystoreWrapper;

        d(float f, String str) {
            this.AFInAppEventType = f;
            this.AFKeystoreWrapper = str;
        }
    }
}
