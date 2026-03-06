package com.helpshift.android.commons.downloader.contracts;

/* JADX INFO: loaded from: classes.dex */
public class DownloadRequestedFileInfo {
    public final String contentType;
    public final String etag;
    public final boolean isSecured;
    public final String url;

    public DownloadRequestedFileInfo(String str, boolean z, String str2, String str3) {
        this.url = str;
        this.isSecured = z;
        this.contentType = str2;
        this.etag = str3;
    }
}
