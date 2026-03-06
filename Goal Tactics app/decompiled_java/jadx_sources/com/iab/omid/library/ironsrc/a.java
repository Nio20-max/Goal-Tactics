package com.iab.omid.library.ironsrc;

import android.content.Context;
import com.iab.omid.library.ironsrc.b.c;
import com.iab.omid.library.ironsrc.d.e;

/* JADX INFO: loaded from: classes2.dex */
public class a {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private boolean f5a;

    private void b(Context context) {
        e.a(context, "Application Context cannot be null");
    }

    String a() {
        return "1.2.22-Ironsrc";
    }

    void a(Context context) {
        b(context);
        if (b()) {
            return;
        }
        a(true);
        com.iab.omid.library.ironsrc.b.e.a().a(context);
        com.iab.omid.library.ironsrc.b.b.a().a(context);
        com.iab.omid.library.ironsrc.d.b.a(context);
        c.a().a(context);
    }

    void a(boolean z) {
        this.f5a = z;
    }

    boolean a(String str) {
        return true;
    }

    boolean b() {
        return this.f5a;
    }
}
