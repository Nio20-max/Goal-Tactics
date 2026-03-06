package com.helpshift.storage;

import java.io.Serializable;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface KeyValueStorage {
    Object get(String str);

    void removeAllKeys();

    void removeKey(String str);

    boolean set(String str, Serializable serializable);

    boolean setKeyValues(Map<String, Serializable> map);
}
