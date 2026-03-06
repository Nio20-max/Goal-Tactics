package com.helpshift.delegate;

/* JADX INFO: loaded from: classes2.dex */
public enum AuthenticationFailureReason {
    AUTH_TOKEN_NOT_PROVIDED(0),
    INVALID_AUTH_TOKEN(1);

    private int value;

    AuthenticationFailureReason(int i) {
        this.value = i;
    }

    public int getValue() {
        return this.value;
    }
}
