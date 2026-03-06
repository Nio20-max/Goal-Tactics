package com.iab.omid.library.ironsrc.d;

import android.text.TextUtils;
import com.iab.omid.library.ironsrc.Omid;
import com.iab.omid.library.ironsrc.adsession.Owner;

/* JADX INFO: loaded from: classes2.dex */
public class e {
    public static void a() {
        if (!Omid.isActive()) {
            throw new IllegalStateException("Method called before OM SDK activation");
        }
    }

    public static void a(Owner owner) {
        if (owner.equals(Owner.NONE)) {
            throw new IllegalArgumentException("Impression owner is none");
        }
    }

    public static void a(com.iab.omid.library.ironsrc.adsession.a aVar) {
        if (aVar.e()) {
            throw new IllegalStateException("AdSession is started");
        }
    }

    public static void a(Object obj, String str) {
        if (obj == null) {
            throw new IllegalArgumentException(str);
        }
    }

    public static void a(String str, int i, String str2) {
        if (str.length() > i) {
            throw new IllegalArgumentException(str2);
        }
    }

    public static void a(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException(str2);
        }
    }

    public static void b(com.iab.omid.library.ironsrc.adsession.a aVar) {
        if (aVar.f()) {
            throw new IllegalStateException("AdSession is finished");
        }
    }

    public static void c(com.iab.omid.library.ironsrc.adsession.a aVar) {
        h(aVar);
        b(aVar);
    }

    public static void d(com.iab.omid.library.ironsrc.adsession.a aVar) {
        if (aVar.getAdSessionStatePublisher().c() != null) {
            throw new IllegalStateException("AdEvents already exists for AdSession");
        }
    }

    public static void e(com.iab.omid.library.ironsrc.adsession.a aVar) {
        if (aVar.getAdSessionStatePublisher().d() != null) {
            throw new IllegalStateException("VideoEvents already exists for AdSession");
        }
    }

    public static void f(com.iab.omid.library.ironsrc.adsession.a aVar) {
        if (!aVar.g()) {
            throw new IllegalStateException("Impression event is not expected from the Native AdSession");
        }
    }

    public static void g(com.iab.omid.library.ironsrc.adsession.a aVar) {
        if (!aVar.h()) {
            throw new IllegalStateException("Cannot create VideoEvents for JavaScript AdSession");
        }
    }

    private static void h(com.iab.omid.library.ironsrc.adsession.a aVar) {
        if (!aVar.e()) {
            throw new IllegalStateException("AdSession is not started");
        }
    }
}
