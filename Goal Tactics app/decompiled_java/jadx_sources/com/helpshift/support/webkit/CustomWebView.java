package com.helpshift.support.webkit;

import android.content.Context;
import android.util.AttributeSet;
import android.webkit.WebView;

/* JADX INFO: loaded from: classes2.dex */
public class CustomWebView extends WebView {
    public CustomWebView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (isInEditMode()) {
            return;
        }
        configureWebView();
    }

    private void configureWebView() {
        getSettings().setJavaScriptEnabled(true);
    }
}
