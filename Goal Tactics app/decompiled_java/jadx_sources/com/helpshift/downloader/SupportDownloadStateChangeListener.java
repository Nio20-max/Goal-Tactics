package com.helpshift.downloader;

/* JADX INFO: loaded from: classes2.dex */
public interface SupportDownloadStateChangeListener {
    void onFailure(String str, int i);

    void onProgressChange(String str, int i);

    void onSuccess(String str, String str2, String str3);
}
