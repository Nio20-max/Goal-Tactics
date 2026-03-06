package com.iab.omid.library.ironsrc.walking.a;

import com.iab.omid.library.ironsrc.walking.a.b;
import java.util.HashSet;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class e extends a {
    public e(b.InterfaceC0018b interfaceC0018b, HashSet<String> hashSet, JSONObject jSONObject, long j) {
        super(interfaceC0018b, hashSet, jSONObject, j);
    }

    private void b(String str) {
        com.iab.omid.library.ironsrc.b.a aVarA = com.iab.omid.library.ironsrc.b.a.a();
        if (aVarA != null) {
            for (com.iab.omid.library.ironsrc.adsession.a aVar : aVarA.b()) {
                if (this.f28a.contains(aVar.getAdSessionId())) {
                    aVar.getAdSessionStatePublisher().b(str, this.c);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(Object... objArr) {
        return this.b.toString();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.iab.omid.library.ironsrc.walking.a.b, android.os.AsyncTask
    /* JADX INFO: renamed from: a */
    public void onPostExecute(String str) {
        b(str);
        super.onPostExecute(str);
    }
}
