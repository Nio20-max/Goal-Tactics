package com.helpshift.widget;

/* JADX INFO: loaded from: classes2.dex */
public class BaseViewState extends HSBaseObservable {
    protected boolean isEnabled = true;
    protected boolean isVisible = true;

    public boolean isVisible() {
        return this.isVisible;
    }

    public boolean isEnabled() {
        return this.isEnabled;
    }

    @Override // com.helpshift.widget.HSBaseObservable
    protected void notifyInitialState() {
        notifyChange(this);
    }
}
