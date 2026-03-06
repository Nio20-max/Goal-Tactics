package com.helpshift.support.webkit;

import android.R;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import androidx.core.view.ViewCompat;

/* JADX INFO: loaded from: classes2.dex */
public class CustomWebChromeClient extends WebChromeClient {
    private WebChromeClient.CustomViewCallback callback;
    private View customView;
    private final View decorView;
    private final ViewGroup fullScreenContainer;
    private final View webviewContentView;

    public CustomWebChromeClient(View view, View view2) {
        this.decorView = view;
        this.webviewContentView = view2;
        this.fullScreenContainer = (ViewGroup) view.findViewById(R.id.content);
    }

    @Override // android.webkit.WebChromeClient
    public void onShowCustomView(View view, WebChromeClient.CustomViewCallback customViewCallback) {
        if (this.customView != null) {
            customViewCallback.onCustomViewHidden();
            return;
        }
        this.fullScreenContainer.addView(view);
        this.customView = view;
        view.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        this.callback = customViewCallback;
        this.webviewContentView.setVisibility(8);
        enableFullScreen();
    }

    @Override // android.webkit.WebChromeClient
    public void onHideCustomView() {
        View view = this.customView;
        if (view == null) {
            return;
        }
        view.setVisibility(8);
        this.fullScreenContainer.removeView(this.customView);
        this.customView = null;
        WebChromeClient.CustomViewCallback customViewCallback = this.callback;
        if (customViewCallback != null) {
            customViewCallback.onCustomViewHidden();
        }
        this.webviewContentView.setVisibility(0);
        disableFullScreen();
    }

    private void enableFullScreen() {
        int systemUiVisibility = this.decorView.getSystemUiVisibility();
        if (Build.VERSION.SDK_INT >= 14) {
            systemUiVisibility |= 2;
        }
        if (Build.VERSION.SDK_INT >= 16) {
            systemUiVisibility |= 4;
        }
        if (Build.VERSION.SDK_INT >= 18) {
            systemUiVisibility |= 4096;
        }
        this.decorView.setSystemUiVisibility(systemUiVisibility);
    }

    private void disableFullScreen() {
        int systemUiVisibility = this.decorView.getSystemUiVisibility();
        if (Build.VERSION.SDK_INT >= 14) {
            systemUiVisibility &= -3;
        }
        if (Build.VERSION.SDK_INT >= 16) {
            systemUiVisibility &= -5;
        }
        if (Build.VERSION.SDK_INT >= 18) {
            systemUiVisibility &= -4097;
        }
        this.decorView.setSystemUiVisibility(systemUiVisibility);
    }
}
