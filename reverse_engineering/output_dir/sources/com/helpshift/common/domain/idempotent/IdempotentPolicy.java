package com.helpshift.common.domain.idempotent;

/* JADX INFO: loaded from: classes2.dex */
public interface IdempotentPolicy {
    boolean isRequestCompleted(int i);
}
