package com.helpshift.network.response;

import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class NetworkResponse {
    public final byte[] data;
    public final Map<String, String> headers;
    public final boolean notModified;
    public final Integer requestIdentifier;
    public final int statusCode;

    public NetworkResponse(int i, byte[] bArr, Map<String, String> map, boolean z, Integer num) {
        this.statusCode = i;
        this.data = bArr;
        this.headers = map;
        this.notModified = z;
        this.requestIdentifier = num;
    }
}
