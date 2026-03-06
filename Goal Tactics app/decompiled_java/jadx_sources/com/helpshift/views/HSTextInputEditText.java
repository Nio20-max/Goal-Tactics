package com.helpshift.views;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.google.android.material.textfield.TextInputEditText;

/* JADX INFO: loaded from: classes2.dex */
public class HSTextInputEditText extends TextInputEditText {
    public HSTextInputEditText(Context context) {
        super(context);
        init();
    }

    public HSTextInputEditText(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public HSTextInputEditText(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        setGravity(51);
        FontApplier.apply((TextView) this);
    }
}
