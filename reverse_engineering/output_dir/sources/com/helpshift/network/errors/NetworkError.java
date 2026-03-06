package com.helpshift.network.errors;

import com.helpshift.common.domain.network.NetworkErrorCodes;

/* JADX INFO: loaded from: classes2.dex */
public class NetworkError extends Exception {
    private Integer reason;

    public NetworkError(Integer num) {
        this.reason = NetworkErrorCodes.GENERIC_NETWORK_ERROR;
        this.reason = num;
    }

    public NetworkError(Integer num, String str) {
        super(str);
        this.reason = NetworkErrorCodes.GENERIC_NETWORK_ERROR;
        this.reason = num;
    }

    public NetworkError(String str, Throwable th) {
        super(str, th);
        this.reason = NetworkErrorCodes.GENERIC_NETWORK_ERROR;
    }

    public NetworkError(Integer num, Throwable th) {
        super(th);
        this.reason = NetworkErrorCodes.GENERIC_NETWORK_ERROR;
        this.reason = num;
    }

    public NetworkError(Throwable th) {
        super(th);
        this.reason = NetworkErrorCodes.GENERIC_NETWORK_ERROR;
    }

    public Integer getReason() {
        return this.reason;
    }
}
