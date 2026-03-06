package com.iab.omid.library.ironsrc;

import android.content.Context;

/* JADX INFO: loaded from: classes2.dex */
public final class Omid {
    private static a INSTANCE = new a();

    private Omid() {
    }

    public static boolean activateWithOmidApiVersion(String str, Context context) {
        INSTANCE.a(context.getApplicationContext());
        return true;
    }

    public static String getVersion() {
        return INSTANCE.a();
    }

    public static boolean isActive() {
        return INSTANCE.b();
    }

    public static boolean isCompatibleWithOmidApiVersion(String str) {
        return INSTANCE.a(str);
    }
}
