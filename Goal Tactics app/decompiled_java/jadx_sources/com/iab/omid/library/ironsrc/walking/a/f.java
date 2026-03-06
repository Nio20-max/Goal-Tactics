package com.iab.omid.library.ironsrc.walking.a;

import android.text.TextUtils;
import com.iab.omid.library.ironsrc.walking.a.b;
import java.util.HashSet;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class f extends a {
    public f(b.InterfaceC0018b interfaceC0018b, HashSet<String> hashSet, JSONObject jSONObject, long j) {
        super(interfaceC0018b, hashSet, jSONObject, j);
    }

    private void b(String str) {
        com.iab.omid.library.ironsrc.b.a aVarA = com.iab.omid.library.ironsrc.b.a.a();
        if (aVarA != null) {
            for (com.iab.omid.library.ironsrc.adsession.a aVar : aVarA.b()) {
                if (this.f28a.contains(aVar.getAdSessionId())) {
                    aVar.getAdSessionStatePublisher().a(str, this.c);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(Object... objArr) {
        if (com.iab.omid.library.ironsrc.d.b.b(this.b, this.d.b())) {
            return null;
        }
        this.d.a(this.b);
        return this.b.toString();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.iab.omid.library.ironsrc.walking.a.b, android.os.AsyncTask
    /* JADX INFO: renamed from: a */
    public void onPostExecute(String str) {
        if (!TextUtils.isEmpty(str)) {
            b(str);
        }
        super.onPostExecute(str);
    }
}
