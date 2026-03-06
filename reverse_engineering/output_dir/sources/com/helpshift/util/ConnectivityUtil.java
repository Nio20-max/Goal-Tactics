package com.helpshift.util;

import android.content.Context;
import com.helpshift.network.connectivity.HSConnectivityManager;
import com.helpshift.network.connectivity.HSConnectivityType;

/* JADX INFO: loaded from: classes2.dex */
public class ConnectivityUtil {
    private final Context context;
    private final int defaultBatchSize;
    private final int maximumBatchSize;

    public ConnectivityUtil(Context context, int i, int i2) {
        this.context = context;
        this.defaultBatchSize = i;
        this.maximumBatchSize = i2;
    }

    /* JADX INFO: renamed from: com.helpshift.util.ConnectivityUtil$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$network$connectivity$HSConnectivityType;

        static {
            int[] iArr = new int[HSConnectivityType.values().length];
            $SwitchMap$com$helpshift$network$connectivity$HSConnectivityType = iArr;
            try {
                iArr[HSConnectivityType.WIFI.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$network$connectivity$HSConnectivityType[HSConnectivityType.MOBILE_DATA.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$network$connectivity$HSConnectivityType[HSConnectivityType.UNKNOWN.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    public int getBatchSize() {
        int i;
        if (AnonymousClass1.$SwitchMap$com$helpshift$network$connectivity$HSConnectivityType[HSConnectivityManager.getInstance(this.context).getConnectivityType().ordinal()] == 1) {
            i = this.maximumBatchSize;
        } else {
            i = this.defaultBatchSize;
        }
        return Math.min(i, this.maximumBatchSize);
    }
}
