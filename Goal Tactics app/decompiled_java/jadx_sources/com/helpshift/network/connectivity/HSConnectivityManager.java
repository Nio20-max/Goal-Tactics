package com.helpshift.network.connectivity;

import android.content.Context;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class HSConnectivityManager implements HSNetworkConnectivityCallback {
    private static HSConnectivityManager instance;
    private Context context;
    private HSAndroidConnectivityManager hsAndroidConnectivityManager;
    private Set<HSNetworkConnectivityCallback> connectivityCallbacks = Collections.synchronizedSet(new LinkedHashSet());
    private HSAndroidConnectivityManagerProvider hsAndroidConnectivityManagerProvider = new HSAndroidConnectivityManagerProvider();

    private HSConnectivityManager(Context context) {
        this.context = context;
    }

    public static HSConnectivityManager getInstance(Context context) {
        if (instance == null) {
            instance = new HSConnectivityManager(context);
        }
        return instance;
    }

    public synchronized void registerNetworkConnectivityListener(HSNetworkConnectivityCallback hSNetworkConnectivityCallback) {
        boolean zIsEmpty = this.connectivityCallbacks.isEmpty();
        this.connectivityCallbacks.add(hSNetworkConnectivityCallback);
        if (zIsEmpty) {
            startListenNetworkStatus();
        } else {
            int i = AnonymousClass1.$SwitchMap$com$helpshift$network$connectivity$HSConnectivityStatus[this.hsAndroidConnectivityManager.getConnectivityStatus().ordinal()];
            if (i == 1) {
                hSNetworkConnectivityCallback.onNetworkAvailable();
            } else if (i == 2) {
                hSNetworkConnectivityCallback.onNetworkUnavailable();
            }
        }
    }

    /* JADX INFO: renamed from: com.helpshift.network.connectivity.HSConnectivityManager$1, reason: invalid class name */
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

    public synchronized void unregisterNetworkConnectivityListener(HSNetworkConnectivityCallback hSNetworkConnectivityCallback) {
        this.connectivityCallbacks.remove(hSNetworkConnectivityCallback);
        if (this.connectivityCallbacks.isEmpty()) {
            stopListenNetworkStatus();
        }
    }

    private void startListenNetworkStatus() {
        if (this.hsAndroidConnectivityManager == null) {
            this.hsAndroidConnectivityManager = this.hsAndroidConnectivityManagerProvider.getOSConnectivityManager(this.context);
        }
        this.hsAndroidConnectivityManager.startListeningConnectivityChange(this);
    }

    private void stopListenNetworkStatus() {
        HSAndroidConnectivityManager hSAndroidConnectivityManager = this.hsAndroidConnectivityManager;
        if (hSAndroidConnectivityManager == null) {
            return;
        }
        hSAndroidConnectivityManager.stopListeningConnectivityChange();
        this.hsAndroidConnectivityManager = null;
    }

    @Override // com.helpshift.network.connectivity.HSNetworkConnectivityCallback
    public void onNetworkAvailable() {
        if (this.connectivityCallbacks.isEmpty()) {
            return;
        }
        Iterator<HSNetworkConnectivityCallback> it = this.connectivityCallbacks.iterator();
        while (it.hasNext()) {
            it.next().onNetworkAvailable();
        }
    }

    @Override // com.helpshift.network.connectivity.HSNetworkConnectivityCallback
    public void onNetworkUnavailable() {
        if (this.connectivityCallbacks.isEmpty()) {
            return;
        }
        Iterator<HSNetworkConnectivityCallback> it = this.connectivityCallbacks.iterator();
        while (it.hasNext()) {
            it.next().onNetworkUnavailable();
        }
    }

    public HSConnectivityType getConnectivityType() {
        if (this.hsAndroidConnectivityManager == null) {
            this.hsAndroidConnectivityManager = this.hsAndroidConnectivityManagerProvider.getOSConnectivityManager(this.context);
        }
        return this.hsAndroidConnectivityManager.getConnectivityType();
    }
}
