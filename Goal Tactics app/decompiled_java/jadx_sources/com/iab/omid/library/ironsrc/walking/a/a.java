package com.iab.omid.library.ironsrc.walking.a;

import com.iab.omid.library.ironsrc.walking.a.b;
import java.util.HashSet;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public abstract class a extends b {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    protected final HashSet<String> f28a;
    protected final JSONObject b;
    protected final long c;

    public a(b.InterfaceC0018b interfaceC0018b, HashSet<String> hashSet, JSONObject jSONObject, long j) {
        super(interfaceC0018b);
        this.f28a = new HashSet<>(hashSet);
        this.b = jSONObject;
        this.c = j;
    }
}
