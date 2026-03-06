package com.ironsource.sdk.controller;

import android.webkit.JavascriptInterface;

/* JADX INFO: loaded from: classes2.dex */
class SecureMessagingInterface {
    private boolean hasTokenBeenRequested = false;
    private SecureMessagingService mSecureMessagingService;

    SecureMessagingInterface(SecureMessagingService secureMessagingService) {
        this.mSecureMessagingService = secureMessagingService;
    }

    @JavascriptInterface
    public String getTokenForMessaging() {
        if (this.hasTokenBeenRequested) {
            return "";
        }
        this.hasTokenBeenRequested = true;
        return this.mSecureMessagingService.getTokenForMessaging();
    }
}
