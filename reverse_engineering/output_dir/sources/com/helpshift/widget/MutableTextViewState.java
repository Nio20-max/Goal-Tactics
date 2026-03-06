package com.helpshift.widget;

import com.helpshift.widget.TextViewState;

/* JADX INFO: loaded from: classes2.dex */
public class MutableTextViewState extends TextViewState {
    public MutableTextViewState(boolean z) {
        super(z);
    }

    public void setError(TextViewState.TextViewStatesError textViewStatesError) {
        this.error = textViewStatesError;
        notifyChange(this);
    }

    public void setText(String str) {
        if (getText().equals(str)) {
            return;
        }
        this.text = str;
        if (getError() != null) {
            setError(null);
        }
    }
}
