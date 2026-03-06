package com.microsoft.appcenter.http;

/* JADX INFO: loaded from: classes2.dex */
public interface ServiceCallback {
    void onCallFailed(Exception e);

    void onCallSucceeded(HttpResponse httpResponse);
}
