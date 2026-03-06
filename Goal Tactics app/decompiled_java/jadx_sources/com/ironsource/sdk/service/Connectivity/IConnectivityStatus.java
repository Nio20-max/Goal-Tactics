package com.ironsource.sdk.service.Connectivity;

import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public interface IConnectivityStatus {
    void onConnected(String str, JSONObject jSONObject);

    void onDisconnected();

    void onStatusChanged(String str, JSONObject jSONObject);
}
