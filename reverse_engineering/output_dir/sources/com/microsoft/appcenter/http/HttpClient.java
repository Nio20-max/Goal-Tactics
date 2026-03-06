package com.microsoft.appcenter.http;

import java.io.Closeable;
import java.net.URL;
import java.util.Map;
import org.json.JSONException;

/* JADX INFO: loaded from: classes2.dex */
public interface HttpClient extends Closeable {

    public interface CallTemplate {
        String buildRequestBody() throws JSONException;

        void onBeforeCalling(URL url, Map<String, String> headers);
    }

    ServiceCall callAsync(String url, String method, Map<String, String> headers, CallTemplate callTemplate, ServiceCallback serviceCallback);

    void reopen();
}
