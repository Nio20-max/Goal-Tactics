package com.helpshift.network.response;

import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;

/* JADX INFO: loaded from: classes2.dex */
public interface ResponseDelivery {
    void postError(Request request, NetworkError networkError);

    void postResponse(Request request, Response<?> response);
}
