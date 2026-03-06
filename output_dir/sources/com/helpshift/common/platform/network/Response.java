package com.helpshift.common.platform.network;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class Response {
    public final List<KeyValuePair> headers;
    public final String responseString;
    public final int status;

    public Response(int i, String str, List<KeyValuePair> list) {
        this.status = i;
        this.responseString = str;
        this.headers = list;
    }
}
