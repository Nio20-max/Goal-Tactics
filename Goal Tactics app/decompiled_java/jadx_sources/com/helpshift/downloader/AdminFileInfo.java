package com.helpshift.downloader;

/* JADX INFO: loaded from: classes2.dex */
public class AdminFileInfo {
    public final String contentType;
    public String etag;
    public final String fileName;
    public final boolean isSecureAttachment;
    public boolean skipCaching;
    public final String url;

    public AdminFileInfo(String str, String str2, String str3, boolean z) {
        this.url = str;
        this.fileName = str2;
        this.contentType = str3;
        this.isSecureAttachment = z;
    }

    public AdminFileInfo(String str, String str2, String str3, boolean z, String str4, boolean z2) {
        this.url = str;
        this.fileName = str2;
        this.contentType = str3;
        this.isSecureAttachment = z;
        this.etag = str4;
        this.skipCaching = z2;
    }
}
