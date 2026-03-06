package com.helpshift.network.response;

/* JADX INFO: loaded from: classes2.dex */
public interface ResponseParser<T> {
    Response<T> parseResponse(NetworkResponse networkResponse);
}
