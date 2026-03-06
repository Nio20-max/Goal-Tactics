package com.ironsource.sdk.service.Connectivity;

import android.content.Context;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public interface IConnectivity {
    JSONObject getConnectivityInfo(Context context);

    void release();

    void startListenToNetworkChanges(Context context);

    void stopListenToNetworkChanges(Context context);
}
