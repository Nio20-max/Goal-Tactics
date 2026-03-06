package com.helpshift.network.connectivity;

/* JADX INFO: loaded from: classes2.dex */
public interface HSAndroidConnectivityManager {
    HSConnectivityStatus getConnectivityStatus();

    HSConnectivityType getConnectivityType();

    void startListeningConnectivityChange(HSNetworkConnectivityCallback hSNetworkConnectivityCallback);

    void stopListeningConnectivityChange();
}
