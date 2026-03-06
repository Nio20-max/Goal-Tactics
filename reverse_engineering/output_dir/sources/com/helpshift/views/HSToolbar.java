package com.helpshift.views;

import android.content.Context;
import android.util.AttributeSet;
import androidx.appcompat.widget.Toolbar;

/* JADX INFO: loaded from: classes2.dex */
public class HSToolbar extends Toolbar {
    public HSToolbar(Context context) {
        super(context);
        init();
    }

    public HSToolbar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public HSToolbar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        FontApplier.apply(this);
    }
}
