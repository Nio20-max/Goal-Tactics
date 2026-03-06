package com.helpshift.common.domain.idempotent;

import com.helpshift.common.domain.network.NetworkErrorCodes;

/* JADX INFO: loaded from: classes2.dex */
public abstract class BaseIdempotentPolicy implements IdempotentPolicy {
    abstract boolean shouldMarkRequestCompleted(int i);

    @Override // com.helpshift.common.domain.idempotent.IdempotentPolicy
    public final boolean isRequestCompleted(int i) {
        if (i == NetworkErrorCodes.PROCESSING_REQUEST.intValue()) {
            return false;
        }
        return shouldMarkRequestCompleted(i);
    }
}
