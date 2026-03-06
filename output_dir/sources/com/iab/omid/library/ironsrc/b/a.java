package com.iab.omid.library.ironsrc.b;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

/* JADX INFO: loaded from: classes2.dex */
public class a {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private static a f9a = new a();
    private final ArrayList<com.iab.omid.library.ironsrc.adsession.a> b = new ArrayList<>();
    private final ArrayList<com.iab.omid.library.ironsrc.adsession.a> c = new ArrayList<>();

    private a() {
    }

    public static a a() {
        return f9a;
    }

    public void a(com.iab.omid.library.ironsrc.adsession.a aVar) {
        this.b.add(aVar);
    }

    public Collection<com.iab.omid.library.ironsrc.adsession.a> b() {
        return Collections.unmodifiableCollection(this.b);
    }

    public void b(com.iab.omid.library.ironsrc.adsession.a aVar) {
        boolean zD = d();
        this.c.add(aVar);
        if (zD) {
            return;
        }
        e.a().b();
    }

    public Collection<com.iab.omid.library.ironsrc.adsession.a> c() {
        return Collections.unmodifiableCollection(this.c);
    }

    public void c(com.iab.omid.library.ironsrc.adsession.a aVar) {
        boolean zD = d();
        this.b.remove(aVar);
        this.c.remove(aVar);
        if (!zD || d()) {
            return;
        }
        e.a().c();
    }

    public boolean d() {
        return this.c.size() > 0;
    }
}
