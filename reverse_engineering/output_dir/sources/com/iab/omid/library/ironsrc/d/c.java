package com.iab.omid.library.ironsrc.d;

import android.util.Log;

/* JADX INFO: loaded from: classes2.dex */
public final class c {
    public static void a(String str) {
    }

    public static void a(String str, Exception exc) {
        if (exc != null) {
            Log.e("OMIDLIB", str, exc);
        }
    }
}
