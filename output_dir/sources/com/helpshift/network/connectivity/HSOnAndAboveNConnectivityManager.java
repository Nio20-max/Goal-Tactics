package com.helpshift.network.connectivity;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.telephony.TelephonyManager;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes2.dex */
class HSOnAndAboveNConnectivityManager extends ConnectivityManager.NetworkCallback implements HSAndroidConnectivityManager {
    private static final String TAG = "Helpshift_AboveNConnMan";
    private Context context;
    private HSNetworkConnectivityCallback networkListener;

    HSOnAndAboveNConnectivityManager(Context context) {
        this.context = context;
    }

    @Override // com.helpshift.network.connectivity.HSAndroidConnectivityManager
    public void startListeningConnectivityChange(HSNetworkConnectivityCallback hSNetworkConnectivityCallback) {
        this.networkListener = hSNetworkConnectivityCallback;
        ConnectivityManager connectivityManager = getConnectivityManager();
        if (connectivityManager != null) {
            try {
                connectivityManager.registerDefaultNetworkCallback(this);
            } catch (Exception e) {
                HSLogger.e(TAG, "Exception while registering network callback", e);
            }
        }
        if (getConnectivityStatus() == HSConnectivityStatus.NOT_CONNECTED) {
            hSNetworkConnectivityCallback.onNetworkUnavailable();
        }
    }

    @Override // com.helpshift.network.connectivity.HSAndroidConnectivityManager
    public void stopListeningConnectivityChange() {
        ConnectivityManager connectivityManager = getConnectivityManager();
        if (connectivityManager != null) {
            try {
                connectivityManager.unregisterNetworkCallback(this);
            } catch (Exception e) {
                HSLogger.e(TAG, "Exception while unregistering network callback", e);
            }
        }
        this.networkListener = null;
    }

    @Override // com.helpshift.network.connectivity.HSAndroidConnectivityManager
    public HSConnectivityStatus getConnectivityStatus() {
        HSConnectivityStatus hSConnectivityStatus = HSConnectivityStatus.UNKNOWN;
        ConnectivityManager connectivityManager = getConnectivityManager();
        if (connectivityManager == null) {
            return hSConnectivityStatus;
        }
        if (connectivityManager.getActiveNetwork() != null) {
            return HSConnectivityStatus.CONNECTED;
        }
        return HSConnectivityStatus.NOT_CONNECTED;
    }

    @Override // com.helpshift.network.connectivity.HSAndroidConnectivityManager
    public HSConnectivityType getConnectivityType() {
        ConnectivityManager connectivityManager = getConnectivityManager();
        if (connectivityManager == null) {
            return HSConnectivityType.UNKNOWN;
        }
        Network activeNetwork = connectivityManager.getActiveNetwork();
        if (activeNetwork == null) {
            return HSConnectivityType.UNKNOWN;
        }
        NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork);
        if (networkCapabilities == null) {
            return HSConnectivityType.UNKNOWN;
        }
        HSConnectivityType hSConnectivityType = HSConnectivityType.UNKNOWN;
        if (networkCapabilities.hasTransport(1)) {
            return HSConnectivityType.WIFI;
        }
        return networkCapabilities.hasTransport(0) ? HSConnectivityType.MOBILE_DATA : hSConnectivityType;
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onAvailable(Network network) {
        HSNetworkConnectivityCallback hSNetworkConnectivityCallback = this.networkListener;
        if (hSNetworkConnectivityCallback != null) {
            hSNetworkConnectivityCallback.onNetworkAvailable();
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onLost(Network network) {
        HSNetworkConnectivityCallback hSNetworkConnectivityCallback = this.networkListener;
        if (hSNetworkConnectivityCallback != null) {
            hSNetworkConnectivityCallback.onNetworkUnavailable();
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onUnavailable() {
        HSNetworkConnectivityCallback hSNetworkConnectivityCallback = this.networkListener;
        if (hSNetworkConnectivityCallback != null) {
            hSNetworkConnectivityCallback.onNetworkUnavailable();
        }
    }

    private ConnectivityManager getConnectivityManager() {
        try {
            return (ConnectivityManager) this.context.getSystemService("connectivity");
        } catch (Exception e) {
            HSLogger.e(TAG, "Exception while getting connectivity manager", e);
            return null;
        }
    }

    private TelephonyManager getTelephonyManager() {
        try {
            return (TelephonyManager) this.context.getSystemService("phone");
        } catch (Exception e) {
            HSLogger.e(TAG, "Exception while getting telephony manager", e);
            return null;
        }
    }
}
