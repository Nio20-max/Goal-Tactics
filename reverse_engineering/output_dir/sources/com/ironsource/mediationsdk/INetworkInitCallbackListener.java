package com.ironsource.mediationsdk;

/* JADX INFO: loaded from: classes2.dex */
public interface INetworkInitCallbackListener {
    void onNetworkInitCallbackFailed(String str);

    void onNetworkInitCallbackLoadSuccess(String str);

    void onNetworkInitCallbackSuccess();
}
