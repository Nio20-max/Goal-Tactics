package com.helpshift.views;

import android.content.Context;
import android.util.AttributeSet;
import androidx.appcompat.widget.SearchView;

/* JADX INFO: loaded from: classes2.dex */
public class HSSearchView extends SearchView {
    public HSSearchView(Context context) {
        super(context);
        init();
    }

    public HSSearchView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public HSSearchView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        FontApplier.apply(this);
    }
}
