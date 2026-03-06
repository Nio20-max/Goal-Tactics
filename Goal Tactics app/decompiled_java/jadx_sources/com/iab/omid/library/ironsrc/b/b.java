package com.iab.omid.library.ironsrc.b;

import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import java.util.Iterator;

/* JADX INFO: loaded from: classes2.dex */
public class b {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private static b f10a = new b();
    private Context b;
    private BroadcastReceiver c;
    private boolean d;
    private boolean e;
    private a f;

    public interface a {
        void a(boolean z);
    }

    private b() {
    }

    public static b a() {
        return f10a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(boolean z) {
        if (this.e != z) {
            this.e = z;
            if (this.d) {
                g();
                a aVar = this.f;
                if (aVar != null) {
                    aVar.a(d());
                }
            }
        }
    }

    private void e() {
        this.c = new BroadcastReceiver() { // from class: com.iab.omid.library.ironsrc.b.b.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                KeyguardManager keyguardManager;
                if (intent == null) {
                    return;
                }
                if ("android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
                    b.this.a(true);
                } else {
                    if (!"android.intent.action.USER_PRESENT".equals(intent.getAction()) && (!"android.intent.action.SCREEN_ON".equals(intent.getAction()) || (keyguardManager = (KeyguardManager) context.getSystemService("keyguard")) == null || keyguardManager.inKeyguardRestrictedInputMode())) {
                        return;
                    }
                    b.this.a(false);
                }
            }
        };
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.SCREEN_OFF");
        intentFilter.addAction("android.intent.action.SCREEN_ON");
        intentFilter.addAction("android.intent.action.USER_PRESENT");
        this.b.registerReceiver(this.c, intentFilter);
    }

    private void f() {
        BroadcastReceiver broadcastReceiver;
        Context context = this.b;
        if (context == null || (broadcastReceiver = this.c) == null) {
            return;
        }
        context.unregisterReceiver(broadcastReceiver);
        this.c = null;
    }

    private void g() {
        boolean z = !this.e;
        Iterator<com.iab.omid.library.ironsrc.adsession.a> it = com.iab.omid.library.ironsrc.b.a.a().b().iterator();
        while (it.hasNext()) {
            it.next().getAdSessionStatePublisher().a(z);
        }
    }

    public void a(Context context) {
        this.b = context.getApplicationContext();
    }

    public void a(a aVar) {
        this.f = aVar;
    }

    public void b() {
        e();
        this.d = true;
        g();
    }

    public void c() {
        f();
        this.d = false;
        this.e = false;
        this.f = null;
    }

    public boolean d() {
        return !this.e;
    }
}
