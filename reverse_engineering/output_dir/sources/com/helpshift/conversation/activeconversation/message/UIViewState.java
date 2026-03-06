package com.helpshift.conversation.activeconversation.message;

import com.helpshift.util.HSCloneable;

/* JADX INFO: loaded from: classes2.dex */
public class UIViewState implements HSCloneable {
    private boolean isFooterVisible;
    private boolean isRoundedBackground;

    public UIViewState() {
        this(false, false);
    }

    public UIViewState(boolean z, boolean z2) {
        this.isFooterVisible = z;
        this.isRoundedBackground = z2;
    }

    public UIViewState(UIViewState uIViewState) {
        this.isFooterVisible = uIViewState.isFooterVisible;
        this.isRoundedBackground = uIViewState.isRoundedBackground;
    }

    public boolean isFooterVisible() {
        return this.isFooterVisible;
    }

    public boolean isRoundedBackground() {
        return this.isRoundedBackground;
    }

    public void updateViewState(UIViewState uIViewState) {
        if (uIViewState == null) {
            return;
        }
        this.isFooterVisible = uIViewState.isFooterVisible;
        this.isRoundedBackground = uIViewState.isRoundedBackground;
    }

    public boolean equals(Object obj) {
        UIViewState uIViewState = (UIViewState) obj;
        return uIViewState != null && uIViewState.isFooterVisible() == this.isFooterVisible && uIViewState.isRoundedBackground() == this.isRoundedBackground;
    }

    @Override // com.helpshift.util.HSCloneable
    public UIViewState deepClone() {
        return new UIViewState(this);
    }
}
