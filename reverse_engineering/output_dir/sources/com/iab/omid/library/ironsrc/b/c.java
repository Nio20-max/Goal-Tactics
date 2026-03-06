package com.iab.omid.library.ironsrc.b;

import android.content.Context;

/* JADX INFO: loaded from: classes2.dex */
public class c {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private static c f12a = new c();
    private Context b;

    private c() {
    }

    public static c a() {
        return f12a;
    }

    public void a(Context context) {
        this.b = context != null ? context.getApplicationContext() : null;
    }

    public Context b() {
        return this.b;
    }
}
