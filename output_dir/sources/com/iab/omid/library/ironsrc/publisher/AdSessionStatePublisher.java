package com.iab.omid.library.ironsrc.publisher;

import android.webkit.WebView;
import com.helpshift.constants.CommonSharedPrefrences;
import com.helpshift.util.ErrorReportProvider;
import com.iab.omid.library.ironsrc.adsession.AdEvents;
import com.iab.omid.library.ironsrc.adsession.AdSessionConfiguration;
import com.iab.omid.library.ironsrc.adsession.AdSessionContext;
import com.iab.omid.library.ironsrc.adsession.ErrorType;
import com.iab.omid.library.ironsrc.adsession.VerificationScriptResource;
import com.iab.omid.library.ironsrc.adsession.video.VideoEvents;
import com.iab.omid.library.ironsrc.b.c;
import com.iab.omid.library.ironsrc.b.d;
import com.microsoft.appcenter.crashes.utils.ErrorLogHelper;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public abstract class AdSessionStatePublisher {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    private com.iab.omid.library.ironsrc.e.b f21a;
    private AdEvents b;
    private VideoEvents c;
    private a d;
    private long e;

    enum a {
        AD_STATE_IDLE,
        AD_STATE_VISIBLE,
        AD_STATE_NOTVISIBLE
    }

    public AdSessionStatePublisher() {
        h();
        this.f21a = new com.iab.omid.library.ironsrc.e.b(null);
    }

    public void a() {
    }

    public void a(float f) {
        d.a().a(getWebView(), f);
    }

    void a(WebView webView) {
        this.f21a = new com.iab.omid.library.ironsrc.e.b(webView);
    }

    public void a(AdEvents adEvents) {
        this.b = adEvents;
    }

    public void a(AdSessionConfiguration adSessionConfiguration) {
        d.a().a(getWebView(), adSessionConfiguration.toJsonObject());
    }

    public void a(ErrorType errorType, String str) {
        d.a().a(getWebView(), errorType, str);
    }

    public void a(com.iab.omid.library.ironsrc.adsession.a aVar, AdSessionContext adSessionContext) {
        a(aVar, adSessionContext, null);
    }

    protected void a(com.iab.omid.library.ironsrc.adsession.a aVar, AdSessionContext adSessionContext, JSONObject jSONObject) {
        String adSessionId = aVar.getAdSessionId();
        JSONObject jSONObject2 = new JSONObject();
        com.iab.omid.library.ironsrc.d.b.a(jSONObject2, "environment", "app");
        com.iab.omid.library.ironsrc.d.b.a(jSONObject2, "adSessionType", adSessionContext.getAdSessionContextType());
        com.iab.omid.library.ironsrc.d.b.a(jSONObject2, ErrorLogHelper.DEVICE_INFO_FILE, com.iab.omid.library.ironsrc.d.a.d());
        JSONArray jSONArray = new JSONArray();
        jSONArray.put("clid");
        jSONArray.put("vlid");
        com.iab.omid.library.ironsrc.d.b.a(jSONObject2, "supports", jSONArray);
        JSONObject jSONObject3 = new JSONObject();
        com.iab.omid.library.ironsrc.d.b.a(jSONObject3, "partnerName", adSessionContext.getPartner().getName());
        com.iab.omid.library.ironsrc.d.b.a(jSONObject3, "partnerVersion", adSessionContext.getPartner().getVersion());
        com.iab.omid.library.ironsrc.d.b.a(jSONObject2, "omidNativeInfo", jSONObject3);
        JSONObject jSONObject4 = new JSONObject();
        com.iab.omid.library.ironsrc.d.b.a(jSONObject4, CommonSharedPrefrences.LIBRARY_VERSION, "1.2.22-Ironsrc");
        com.iab.omid.library.ironsrc.d.b.a(jSONObject4, ErrorReportProvider.KEY_APP_ID, c.a().b().getApplicationContext().getPackageName());
        com.iab.omid.library.ironsrc.d.b.a(jSONObject2, "app", jSONObject4);
        if (adSessionContext.getCustomReferenceData() != null) {
            com.iab.omid.library.ironsrc.d.b.a(jSONObject2, "customReferenceData", adSessionContext.getCustomReferenceData());
        }
        JSONObject jSONObject5 = new JSONObject();
        for (VerificationScriptResource verificationScriptResource : adSessionContext.getVerificationScriptResources()) {
            com.iab.omid.library.ironsrc.d.b.a(jSONObject5, verificationScriptResource.getVendorKey(), verificationScriptResource.getVerificationParameters());
        }
        d.a().a(getWebView(), adSessionId, jSONObject2, jSONObject5, jSONObject);
    }

    public void a(VideoEvents videoEvents) {
        this.c = videoEvents;
    }

    public void a(String str) {
        d.a().a(getWebView(), str, (JSONObject) null);
    }

    public void a(String str, long j) {
        if (j >= this.e) {
            this.d = a.AD_STATE_VISIBLE;
            d.a().b(getWebView(), str);
        }
    }

    public void a(String str, JSONObject jSONObject) {
        d.a().a(getWebView(), str, jSONObject);
    }

    public void a(boolean z) {
        if (e()) {
            d.a().c(getWebView(), z ? "foregrounded" : "backgrounded");
        }
    }

    public void b() {
        this.f21a.clear();
    }

    public void b(String str, long j) {
        if (j < this.e || this.d == a.AD_STATE_NOTVISIBLE) {
            return;
        }
        this.d = a.AD_STATE_NOTVISIBLE;
        d.a().b(getWebView(), str);
    }

    public AdEvents c() {
        return this.b;
    }

    public VideoEvents d() {
        return this.c;
    }

    public boolean e() {
        return this.f21a.get() != null;
    }

    public void f() {
        d.a().a(getWebView());
    }

    public void g() {
        d.a().b(getWebView());
    }

    public WebView getWebView() {
        return (WebView) this.f21a.get();
    }

    public void h() {
        this.e = com.iab.omid.library.ironsrc.d.d.a();
        this.d = a.AD_STATE_IDLE;
    }
}
