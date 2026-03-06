package com.iab.omid.library.ironsrc.adsession;

import android.view.View;
import com.iab.omid.library.ironsrc.d.e;
import com.iab.omid.library.ironsrc.publisher.AdSessionStatePublisher;
import com.iab.omid.library.ironsrc.publisher.b;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public class a extends AdSession {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private final AdSessionContext f7a;
    private final AdSessionConfiguration b;
    private com.iab.omid.library.ironsrc.e.a d;
    private AdSessionStatePublisher e;
    private boolean i;
    private final List<com.iab.omid.library.ironsrc.e.a> c = new ArrayList();
    private boolean f = false;
    private boolean g = false;
    private String h = UUID.randomUUID().toString();

    a(AdSessionConfiguration adSessionConfiguration, AdSessionContext adSessionContext) {
        this.b = adSessionConfiguration;
        this.f7a = adSessionContext;
        c(null);
        this.e = adSessionContext.getAdSessionContextType() == AdSessionContextType.HTML ? new com.iab.omid.library.ironsrc.publisher.a(adSessionContext.getWebView()) : new b(adSessionContext.getInjectedResourcesMap(), adSessionContext.getOmidJsScriptContent());
        this.e.a();
        com.iab.omid.library.ironsrc.b.a.a().a(this);
        this.e.a(adSessionConfiguration);
    }

    private com.iab.omid.library.ironsrc.e.a a(View view) {
        for (com.iab.omid.library.ironsrc.e.a aVar : this.c) {
            if (aVar.get() == view) {
                return aVar;
            }
        }
        return null;
    }

    private void b(View view) {
        if (view == null) {
            throw new IllegalArgumentException("FriendlyObstruction is null");
        }
    }

    private void c(View view) {
        this.d = new com.iab.omid.library.ironsrc.e.a(view);
    }

    private void d(View view) {
        Collection<a> collectionB = com.iab.omid.library.ironsrc.b.a.a().b();
        if (collectionB == null || collectionB.size() <= 0) {
            return;
        }
        for (a aVar : collectionB) {
            if (aVar != this && aVar.c() == view) {
                aVar.d.clear();
            }
        }
    }

    private void i() {
        if (this.i) {
            throw new IllegalStateException("Impression event can only be sent once");
        }
    }

    public List<com.iab.omid.library.ironsrc.e.a> a() {
        return this.c;
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public void addFriendlyObstruction(View view) {
        if (this.g) {
            return;
        }
        b(view);
        if (a(view) == null) {
            this.c.add(new com.iab.omid.library.ironsrc.e.a(view));
        }
    }

    void b() {
        i();
        getAdSessionStatePublisher().g();
        this.i = true;
    }

    public View c() {
        return (View) this.d.get();
    }

    public boolean d() {
        return this.f && !this.g;
    }

    public boolean e() {
        return this.f;
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public void error(ErrorType errorType, String str) {
        if (this.g) {
            throw new IllegalStateException("AdSession is finished");
        }
        e.a(errorType, "Error type is null");
        e.a(str, "Message is null");
        getAdSessionStatePublisher().a(errorType, str);
    }

    public boolean f() {
        return this.g;
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public void finish() {
        if (this.g) {
            return;
        }
        this.d.clear();
        removeAllFriendlyObstructions();
        this.g = true;
        getAdSessionStatePublisher().f();
        com.iab.omid.library.ironsrc.b.a.a().c(this);
        getAdSessionStatePublisher().b();
        this.e = null;
    }

    public boolean g() {
        return this.b.isNativeImpressionOwner();
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public String getAdSessionId() {
        return this.h;
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public AdSessionStatePublisher getAdSessionStatePublisher() {
        return this.e;
    }

    public boolean h() {
        return this.b.isNativeVideoEventsOwner();
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public void registerAdView(View view) {
        if (this.g) {
            return;
        }
        e.a(view, "AdView is null");
        if (c() == view) {
            return;
        }
        c(view);
        getAdSessionStatePublisher().h();
        d(view);
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public void removeAllFriendlyObstructions() {
        if (this.g) {
            return;
        }
        this.c.clear();
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public void removeFriendlyObstruction(View view) {
        if (this.g) {
            return;
        }
        b(view);
        com.iab.omid.library.ironsrc.e.a aVarA = a(view);
        if (aVarA != null) {
            this.c.remove(aVarA);
        }
    }

    @Override // com.iab.omid.library.ironsrc.adsession.AdSession
    public void start() {
        if (this.f) {
            return;
        }
        this.f = true;
        com.iab.omid.library.ironsrc.b.a.a().b(this);
        this.e.a(com.iab.omid.library.ironsrc.b.e.a().d());
        this.e.a(this, this.f7a);
    }
}
