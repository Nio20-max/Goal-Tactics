package com.helpshift.views;

import android.content.Context;
import android.util.AttributeSet;
import com.google.android.material.tabs.TabLayout;

/* JADX INFO: loaded from: classes2.dex */
public class HSTabLayout extends TabLayout {
    public HSTabLayout(Context context) {
        super(context);
        init();
    }

    public HSTabLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public HSTabLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        FontApplier.apply(this);
    }
}
