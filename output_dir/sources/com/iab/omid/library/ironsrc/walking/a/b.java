package com.iab.omid.library.ironsrc.walking.a;

import android.os.AsyncTask;
import java.util.concurrent.ThreadPoolExecutor;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public abstract class b extends AsyncTask<Object, Void, String> {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private a f29a;
    protected final InterfaceC0018b d;

    public interface a {
        void a(b bVar);
    }

    /* JADX INFO: renamed from: com.iab.omid.library.ironsrc.walking.a.b$b, reason: collision with other inner class name */
    public interface InterfaceC0018b {
        void a(JSONObject jSONObject);

        JSONObject b();
    }

    public b(InterfaceC0018b interfaceC0018b) {
        this.d = interfaceC0018b;
    }

    public void a(a aVar) {
        this.f29a = aVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public void onPostExecute(String str) {
        a aVar = this.f29a;
        if (aVar != null) {
            aVar.a(this);
        }
    }

    public void a(ThreadPoolExecutor threadPoolExecutor) {
        executeOnExecutor(threadPoolExecutor, new Object[0]);
    }
}
