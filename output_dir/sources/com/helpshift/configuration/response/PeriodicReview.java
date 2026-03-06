package com.helpshift.configuration.response;

/* JADX INFO: loaded from: classes2.dex */
public class PeriodicReview {
    public final int interval;
    public final boolean isEnabled;
    public final String type;

    public PeriodicReview(boolean z, int i, String str) {
        this.isEnabled = z;
        this.interval = i;
        this.type = str;
    }
}
