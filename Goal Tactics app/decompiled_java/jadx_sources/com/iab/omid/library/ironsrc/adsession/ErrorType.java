package com.iab.omid.library.ironsrc.adsession;

import com.facebook.internal.AnalyticsEvents;

/* JADX INFO: loaded from: classes2.dex */
public enum ErrorType {
    GENERIC("generic"),
    VIDEO(AnalyticsEvents.PARAMETER_SHARE_DIALOG_CONTENT_VIDEO);

    private final String errorType;

    ErrorType(String str) {
        this.errorType = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.errorType;
    }
}
