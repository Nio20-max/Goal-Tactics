package com.iab.omid.library.ironsrc.walking;

import android.view.View;
import com.iab.omid.library.ironsrc.d.f;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: loaded from: classes2.dex */
public class a {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private final HashMap<View, String> f27a = new HashMap<>();
    private final HashMap<String, View> b = new HashMap<>();
    private final HashMap<View, ArrayList<String>> c = new HashMap<>();
    private final HashSet<View> d = new HashSet<>();
    private final HashSet<String> e = new HashSet<>();
    private final HashSet<String> f = new HashSet<>();
    private final HashMap<String, String> g = new HashMap<>();
    private boolean h;

    private void a(View view, com.iab.omid.library.ironsrc.adsession.a aVar) {
        ArrayList<String> arrayList = this.c.get(view);
        if (arrayList == null) {
            arrayList = new ArrayList<>();
            this.c.put(view, arrayList);
        }
        arrayList.add(aVar.getAdSessionId());
    }

    private void a(com.iab.omid.library.ironsrc.adsession.a aVar) {
        Iterator<com.iab.omid.library.ironsrc.e.a> it = aVar.a().iterator();
        while (it.hasNext()) {
            View view = (View) it.next().get();
            if (view != null) {
                a(view, aVar);
            }
        }
    }

    private String d(View view) {
        if (!view.hasWindowFocus()) {
            return "noWindowFocus";
        }
        HashSet hashSet = new HashSet();
        while (view != null) {
            String strE = f.e(view);
            if (strE != null) {
                return strE;
            }
            hashSet.add(view);
            Object parent = view.getParent();
            view = parent instanceof View ? (View) parent : null;
        }
        this.d.addAll(hashSet);
        return null;
    }

    public String a(View view) {
        if (this.f27a.size() == 0) {
            return null;
        }
        String str = this.f27a.get(view);
        if (str != null) {
            this.f27a.remove(view);
        }
        return str;
    }

    public String a(String str) {
        return this.g.get(str);
    }

    public HashSet<String> a() {
        return this.e;
    }

    public View b(String str) {
        return this.b.get(str);
    }

    public ArrayList<String> b(View view) {
        if (this.c.size() == 0) {
            return null;
        }
        ArrayList<String> arrayList = this.c.get(view);
        if (arrayList != null) {
            this.c.remove(view);
            Collections.sort(arrayList);
        }
        return arrayList;
    }

    public HashSet<String> b() {
        return this.f;
    }

    public c c(View view) {
        return this.d.contains(view) ? c.PARENT_VIEW : this.h ? c.OBSTRUCTION_VIEW : c.UNDERLYING_VIEW;
    }

    public void c() {
        com.iab.omid.library.ironsrc.b.a aVarA = com.iab.omid.library.ironsrc.b.a.a();
        if (aVarA != null) {
            for (com.iab.omid.library.ironsrc.adsession.a aVar : aVarA.c()) {
                View viewC = aVar.c();
                if (aVar.d()) {
                    String adSessionId = aVar.getAdSessionId();
                    if (viewC != null) {
                        String strD = d(viewC);
                        if (strD == null) {
                            this.e.add(adSessionId);
                            this.f27a.put(viewC, adSessionId);
                            a(aVar);
                        } else {
                            this.f.add(adSessionId);
                            this.b.put(adSessionId, viewC);
                            this.g.put(adSessionId, strD);
                        }
                    } else {
                        this.f.add(adSessionId);
                        this.g.put(adSessionId, "noAdView");
                    }
                }
            }
        }
    }

    public void d() {
        this.f27a.clear();
        this.b.clear();
        this.c.clear();
        this.d.clear();
        this.e.clear();
        this.f.clear();
        this.g.clear();
        this.h = false;
    }

    public void e() {
        this.h = true;
    }
}
