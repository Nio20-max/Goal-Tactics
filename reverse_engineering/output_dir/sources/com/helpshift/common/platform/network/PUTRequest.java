package com.helpshift.common.platform.network;

import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class PUTRequest extends Request {
    public final String query;

    public PUTRequest(String str, String str2, List<KeyValuePair> list, int i) {
        super(Method.PUT, str, list, i);
        this.query = str2;
    }
}
