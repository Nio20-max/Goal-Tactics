package com.iab.omid.library.ironsrc.b;

import android.content.Context;
import android.os.Handler;
import com.iab.omid.library.ironsrc.b.b;
import com.iab.omid.library.ironsrc.walking.TreeWalker;
import java.util.Iterator;

/* JADX INFO: loaded from: classes2.dex */
public class e implements com.iab.omid.library.ironsrc.a.c, b.a {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private static e f15a;
    private float b = 0.0f;
    private final com.iab.omid.library.ironsrc.a.e c;
    private final com.iab.omid.library.ironsrc.a.b d;
    private com.iab.omid.library.ironsrc.a.d e;
    private a f;

    public e(com.iab.omid.library.ironsrc.a.e eVar, com.iab.omid.library.ironsrc.a.b bVar) {
        this.c = eVar;
        this.d = bVar;
    }

    public static e a() {
        if (f15a == null) {
            f15a = new e(new com.iab.omid.library.ironsrc.a.e(), new com.iab.omid.library.ironsrc.a.b());
        }
        return f15a;
    }

    private a e() {
        if (this.f == null) {
            this.f = a.a();
        }
        return this.f;
    }

    @Override // com.iab.omid.library.ironsrc.a.c
    public void a(float f) {
        this.b = f;
        Iterator<com.iab.omid.library.ironsrc.adsession.a> it = e().c().iterator();
        while (it.hasNext()) {
            it.next().getAdSessionStatePublisher().a(f);
        }
    }

    public void a(Context context) {
        this.e = this.c.a(new Handler(), context, this.d.a(), this);
    }

    @Override // com.iab.omid.library.ironsrc.b.b.a
    public void a(boolean z) {
        if (z) {
            TreeWalker.getInstance().a();
        } else {
            TreeWalker.getInstance().c();
        }
    }

    public void b() {
        b.a().a(this);
        b.a().b();
        if (b.a().d()) {
            TreeWalker.getInstance().a();
        }
        this.e.a();
    }

    public void c() {
        TreeWalker.getInstance().b();
        b.a().c();
        this.e.b();
    }

    public float d() {
        return this.b;
    }
}
