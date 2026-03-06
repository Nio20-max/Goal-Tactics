package com.helpshift.common.domain.idempotent;

import com.helpshift.common.domain.network.NetworkErrorCodes;

/* JADX INFO: loaded from: classes2.dex */
public class SuccessOrNonRetriableStatusCodeIdempotentPolicy extends BaseIdempotentPolicy {
    @Override // com.helpshift.common.domain.idempotent.BaseIdempotentPolicy
    boolean shouldMarkRequestCompleted(int i) {
        if (i < 200 || i >= 300) {
            return NetworkErrorCodes.NOT_RETRIABLE_STATUS_CODES.contains(Integer.valueOf(i));
        }
        return true;
    }
}
