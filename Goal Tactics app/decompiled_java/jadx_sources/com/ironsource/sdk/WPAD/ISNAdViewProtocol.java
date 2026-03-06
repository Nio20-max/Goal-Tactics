package com.ironsource.sdk.WPAD;

import android.webkit.WebView;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public interface ISNAdViewProtocol {

    public interface IErrorReportDelegate {
        void reportOnError(String str);
    }

    WebView getViewToPresent();

    void loadWithUrl(JSONObject jSONObject, String str, String str2);

    void performCleanup(String str, String str2);

    void sendIsExternalAdViewInitiated(String str);

    void sendMessageToAd(JSONObject jSONObject, String str, String str2) throws JSONException;
}
