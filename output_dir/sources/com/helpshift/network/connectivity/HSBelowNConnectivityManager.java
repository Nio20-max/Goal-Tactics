package com.helpshift.network.connectivity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.telephony.TelephonyManager;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes2.dex */
class HSBelowNConnectivityManager extends BroadcastReceiver implements HSAndroidConnectivityManager {
    private static final String TAG = "Helpshift_BelowNConnMan";
    private Context context;
    private HSNetworkConnectivityCallback networkListener;

    HSBelowNConnectivityManager(Context context) {
        this.context = context;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent == null || intent.getExtras() == null || this.networkListener == null) {
            return;
        }
        int i = AnonymousClass1.$SwitchMap$com$helpshift$network$connectivity$HSConnectivityStatus[getConnectivityStatus().ordinal()];
        if (i == 1) {
            this.networkListener.onNetworkAvailable();
        } else {
            if (i != 2) {
                return;
            }
            this.networkListener.onNetworkUnavailable();
        }
    }

    /* JADX INFO: renamed from: com.helpshift.network.connectivity.HSBelowNConnectivityManager$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$network$connectivity$HSConnectivityStatus;

        static {
            int[] iArr = new int[HSConnectivityStatus.values().length];
            $SwitchMap$com$helpshift$network$connectivity$HSConnectivityStatus = iArr;
            try {
                iArr[HSConnectivityStatus.CONNECTED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$network$connectivity$HSConnectivityStatus[HSConnectivityStatus.NOT_CONNECTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    @Override // com.helpshift.network.connectivity.HSAndroidConnectivityManager
    public void startListeningConnectivityChange(HSNetworkConnectivityCallback hSNetworkConnectivityCallback) {
        this.networkListener = hSNetworkConnectivityCallback;
        try {
            this.context.registerReceiver(this, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        } catch (Exception e) {
            HSLogger.e(TAG, "Exception while registering network receiver", e);
        }
    }

    @Override // com.helpshift.network.connectivity.HSAndroidConnectivityManager
    public void stopListeningConnectivityChange() {
        try {
            this.context.unregisterReceiver(this);
        } catch (Exception e) {
            HSLogger.e(TAG, "Exception while unregistering network receiver", e);
        }
    }

    @Override // com.helpshift.network.connectivity.HSAndroidConnectivityManager
    public HSConnectivityStatus getConnectivityStatus() {
        HSConnectivityStatus hSConnectivityStatus = HSConnectivityStatus.UNKNOWN;
        ConnectivityManager connectivityManager = getConnectivityManager();
        if (connectivityManager == null) {
            return hSConnectivityStatus;
        }
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo != null && activeNetworkInfo.isConnectedOrConnecting()) {
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
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo == null) {
            return HSConnectivityType.UNKNOWN;
        }
        HSConnectivityType hSConnectivityType = HSConnectivityType.UNKNOWN;
        int type = activeNetworkInfo.getType();
        if (type == 1) {
            return HSConnectivityType.WIFI;
        }
        return type == 0 ? HSConnectivityType.MOBILE_DATA : hSConnectivityType;
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
