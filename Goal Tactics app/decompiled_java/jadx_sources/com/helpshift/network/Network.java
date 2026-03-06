package com.helpshift.network;

import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import com.helpshift.network.response.NetworkResponse;

/* JADX INFO: loaded from: classes2.dex */
public interface Network {
    NetworkResponse performRequest(Request request) throws NetworkError;
}
