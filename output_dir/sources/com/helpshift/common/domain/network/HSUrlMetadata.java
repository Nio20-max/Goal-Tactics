package com.helpshift.common.domain.network;

/* JADX INFO: loaded from: classes2.dex */
public class HSUrlMetadata {
    public final String etag;
    public final boolean isLastFetchSuccessful;
    public final long lastFetchTimestamp;
    public final String url;

    public HSUrlMetadata(String str, String str2, long j, boolean z) {
        this.url = str;
        this.etag = str2;
        this.lastFetchTimestamp = j;
        this.isLastFetchSuccessful = z;
    }
}
