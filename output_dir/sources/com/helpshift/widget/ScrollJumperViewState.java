package com.helpshift.widget;

/* JADX INFO: loaded from: classes2.dex */
public class ScrollJumperViewState extends BaseViewState {
    protected boolean shouldShowUnreadMessagesIndicator;

    protected ScrollJumperViewState(boolean z, boolean z2) {
        this.isVisible = z;
        this.shouldShowUnreadMessagesIndicator = z2;
    }

    public boolean shouldShowUnreadMessagesIndicator() {
        return this.shouldShowUnreadMessagesIndicator;
    }
}
