package com.helpshift.support;

import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class Metadata {
    private String[] issueTags;
    private Map<String, Object> metadata;

    public Metadata(Map<String, Object> map) {
        this(map, null);
    }

    public Metadata(Map<String, Object> map, String[] strArr) {
        if (map != null) {
            this.metadata = map;
        }
        if (strArr == null || strArr.length <= 0) {
            return;
        }
        this.issueTags = strArr;
    }

    public Map<String, Object> toMap() {
        HashMap map = new HashMap();
        Map<String, Object> map2 = this.metadata;
        if (map2 != null) {
            map.putAll(map2);
        }
        String[] strArr = this.issueTags;
        if (strArr != null) {
            map.put(Support.TagsKey, strArr);
        }
        return map;
    }
}
