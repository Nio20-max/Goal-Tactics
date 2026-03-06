package com.helpshift.common.platform.network;

import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class UploadRequest extends Request {
    public static final String BOUNDARY = "*****";
    public final Map<String, String> data;
    public final String mimeType;

    public UploadRequest(Method method, String str, Map<String, String> map, String str2, List<KeyValuePair> list, int i) {
        super(method, str, list, i);
        this.data = map;
        this.mimeType = str2;
    }
}
