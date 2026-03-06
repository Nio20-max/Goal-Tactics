package com.ironsource.sdk.WPAD;

import android.webkit.JavascriptInterface;

/* JADX INFO: loaded from: classes2.dex */
public class ISNAdViewJSInterface {
    private ISNAdunitWebView mIsnAdView;

    ISNAdViewJSInterface(ISNAdunitWebView iSNAdunitWebView) {
        this.mIsnAdView = iSNAdunitWebView;
    }

    @JavascriptInterface
    public void receiveMessageFromExternal(String str) {
        this.mIsnAdView.handleMessageFromAd(str);
    }
}
