package com.helpshift.redaction;

/* JADX INFO: loaded from: classes2.dex */
public class RedactionDetail {
    public final RedactionState redactionState;
    public final RedactionType redactionType;
    public final long userLocalId;

    public RedactionDetail(long j, RedactionState redactionState, RedactionType redactionType) {
        this.userLocalId = j;
        this.redactionState = redactionState;
        this.redactionType = redactionType;
    }
}
