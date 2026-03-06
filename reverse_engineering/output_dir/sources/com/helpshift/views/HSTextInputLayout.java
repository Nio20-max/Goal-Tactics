package com.helpshift.views;

import android.content.Context;
import android.util.AttributeSet;
import com.google.android.material.textfield.TextInputLayout;

/* JADX INFO: loaded from: classes2.dex */
public class HSTextInputLayout extends TextInputLayout {
    public HSTextInputLayout(Context context) {
        super(context);
        init();
    }

    public HSTextInputLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public HSTextInputLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        FontApplier.apply(this);
    }
}
