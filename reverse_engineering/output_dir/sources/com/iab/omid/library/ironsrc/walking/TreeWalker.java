package com.iab.omid.library.ironsrc.walking;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import com.iab.omid.library.ironsrc.c.a;
import com.iab.omid.library.ironsrc.d.d;
import com.iab.omid.library.ironsrc.d.f;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class TreeWalker implements a.InterfaceC0017a {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private static TreeWalker f25a = new TreeWalker();
    private static Handler b = new Handler(Looper.getMainLooper());
    private static Handler c = null;
    private static final Runnable j = new Runnable() { // from class: com.iab.omid.library.ironsrc.walking.TreeWalker.2
        @Override // java.lang.Runnable
        public void run() {
            TreeWalker.getInstance().h();
        }
    };
    private static final Runnable k = new Runnable() { // from class: com.iab.omid.library.ironsrc.walking.TreeWalker.3
        @Override // java.lang.Runnable
        public void run() {
            if (TreeWalker.c != null) {
                TreeWalker.c.post(TreeWalker.j);
                TreeWalker.c.postDelayed(TreeWalker.k, 200L);
            }
        }
    };
    private int e;
    private long i;
    private List<TreeWalkerTimeLogger> d = new ArrayList();
    private a g = new a();
    private com.iab.omid.library.ironsrc.c.b f = new com.iab.omid.library.ironsrc.c.b();
    private b h = new b(new com.iab.omid.library.ironsrc.walking.a.c());

    public interface TreeWalkerNanoTimeLogger extends TreeWalkerTimeLogger {
        void onTreeProcessedNano(int i, long j);
    }

    public interface TreeWalkerTimeLogger {
        void onTreeProcessed(int i, long j);
    }

    TreeWalker() {
    }

    private void a(long j2) {
        if (this.d.size() > 0) {
            for (TreeWalkerTimeLogger treeWalkerTimeLogger : this.d) {
                treeWalkerTimeLogger.onTreeProcessed(this.e, TimeUnit.NANOSECONDS.toMillis(j2));
                if (treeWalkerTimeLogger instanceof TreeWalkerNanoTimeLogger) {
                    ((TreeWalkerNanoTimeLogger) treeWalkerTimeLogger).onTreeProcessedNano(this.e, j2);
                }
            }
        }
    }

    private void a(View view, com.iab.omid.library.ironsrc.c.a aVar, JSONObject jSONObject, c cVar) {
        aVar.a(view, jSONObject, this, cVar == c.PARENT_VIEW);
    }

    private void a(String str, View view, JSONObject jSONObject) {
        com.iab.omid.library.ironsrc.c.a aVarB = this.f.b();
        String strA = this.g.a(str);
        if (strA != null) {
            JSONObject jSONObjectA = aVarB.a(view);
            com.iab.omid.library.ironsrc.d.b.a(jSONObjectA, str);
            com.iab.omid.library.ironsrc.d.b.b(jSONObjectA, strA);
            com.iab.omid.library.ironsrc.d.b.a(jSONObject, jSONObjectA);
        }
    }

    private boolean a(View view, JSONObject jSONObject) {
        String strA = this.g.a(view);
        if (strA == null) {
            return false;
        }
        com.iab.omid.library.ironsrc.d.b.a(jSONObject, strA);
        this.g.e();
        return true;
    }

    private void b(View view, JSONObject jSONObject) {
        ArrayList<String> arrayListB = this.g.b(view);
        if (arrayListB != null) {
            com.iab.omid.library.ironsrc.d.b.a(jSONObject, arrayListB);
        }
    }

    public static TreeWalker getInstance() {
        return f25a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void h() {
        i();
        d();
        j();
    }

    private void i() {
        this.e = 0;
        this.i = d.a();
    }

    private void j() {
        a(d.a() - this.i);
    }

    private void k() {
        if (c == null) {
            Handler handler = new Handler(Looper.getMainLooper());
            c = handler;
            handler.post(j);
            c.postDelayed(k, 200L);
        }
    }

    private void l() {
        Handler handler = c;
        if (handler != null) {
            handler.removeCallbacks(k);
            c = null;
        }
    }

    public void a() {
        k();
    }

    @Override // com.iab.omid.library.ironsrc.c.a.InterfaceC0017a
    public void a(View view, com.iab.omid.library.ironsrc.c.a aVar, JSONObject jSONObject) {
        c cVarC;
        if (f.d(view) && (cVarC = this.g.c(view)) != c.UNDERLYING_VIEW) {
            JSONObject jSONObjectA = aVar.a(view);
            com.iab.omid.library.ironsrc.d.b.a(jSONObject, jSONObjectA);
            if (!a(view, jSONObjectA)) {
                b(view, jSONObjectA);
                a(view, aVar, jSONObjectA, cVarC);
            }
            this.e++;
        }
    }

    public void addTimeLogger(TreeWalkerTimeLogger treeWalkerTimeLogger) {
        if (this.d.contains(treeWalkerTimeLogger)) {
            return;
        }
        this.d.add(treeWalkerTimeLogger);
    }

    public void b() {
        c();
        this.d.clear();
        b.post(new Runnable() { // from class: com.iab.omid.library.ironsrc.walking.TreeWalker.1
            @Override // java.lang.Runnable
            public void run() {
                TreeWalker.this.h.a();
            }
        });
    }

    public void c() {
        l();
    }

    void d() {
        this.g.c();
        long jA = d.a();
        com.iab.omid.library.ironsrc.c.a aVarA = this.f.a();
        if (this.g.b().size() > 0) {
            for (String str : this.g.b()) {
                JSONObject jSONObjectA = aVarA.a(null);
                a(str, this.g.b(str), jSONObjectA);
                com.iab.omid.library.ironsrc.d.b.a(jSONObjectA);
                HashSet<String> hashSet = new HashSet<>();
                hashSet.add(str);
                this.h.b(jSONObjectA, hashSet, jA);
            }
        }
        if (this.g.a().size() > 0) {
            JSONObject jSONObjectA2 = aVarA.a(null);
            a(null, aVarA, jSONObjectA2, c.PARENT_VIEW);
            com.iab.omid.library.ironsrc.d.b.a(jSONObjectA2);
            this.h.a(jSONObjectA2, this.g.a(), jA);
        } else {
            this.h.a();
        }
        this.g.d();
    }

    public void removeTimeLogger(TreeWalkerTimeLogger treeWalkerTimeLogger) {
        if (this.d.contains(treeWalkerTimeLogger)) {
            this.d.remove(treeWalkerTimeLogger);
        }
    }
}
