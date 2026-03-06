package com.helpshift.common.platform.network;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class Request {
    public final List<KeyValuePair> headers;
    public final Method method;
    public final int timeout;
    public final String url;

    public Request(Method method, String str, List<KeyValuePair> list, int i) {
        this.method = method;
        this.url = str;
        this.headers = list;
        this.timeout = i;
    }
}
