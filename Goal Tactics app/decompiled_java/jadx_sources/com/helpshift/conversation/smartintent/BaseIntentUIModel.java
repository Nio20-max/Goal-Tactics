package com.helpshift.conversation.smartintent;

/* JADX INFO: loaded from: classes2.dex */
public abstract class BaseIntentUIModel {
    public final String label;
    public final long localId;

    public abstract SmartIntentType getType();

    public BaseIntentUIModel(long j, String str) {
        this.localId = j;
        this.label = str;
    }
}
