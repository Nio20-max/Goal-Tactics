package com.ironsource.mediationsdk.utils;

import android.text.TextUtils;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class TokenSettings {
    private ArrayList<String> tokenOptInKeyParams = new ArrayList<>();

    TokenSettings() {
    }

    public ArrayList<String> getOptInKeyParamsTokenArray() {
        return this.tokenOptInKeyParams;
    }

    public void addOptInKeyParam(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.tokenOptInKeyParams.add(str);
    }
}
