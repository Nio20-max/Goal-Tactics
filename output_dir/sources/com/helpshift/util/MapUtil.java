package com.helpshift.util;

import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class MapUtil {
    public static <T> T getValue(Map<String, Object> map, String str, Class<T> cls, T t) {
        Object obj = map.get(str);
        return cls.isInstance(obj) ? cls.cast(obj) : t;
    }
}
