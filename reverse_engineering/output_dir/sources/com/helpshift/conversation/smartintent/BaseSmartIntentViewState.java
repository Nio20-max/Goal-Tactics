package com.helpshift.conversation.smartintent;

/* JADX INFO: loaded from: classes2.dex */
public abstract class BaseSmartIntentViewState {
    public final boolean enforceIntentSelection;
    public final String promptTitle;

    protected BaseSmartIntentViewState(String str, boolean z) {
        this.promptTitle = str;
        this.enforceIntentSelection = z;
    }
}
