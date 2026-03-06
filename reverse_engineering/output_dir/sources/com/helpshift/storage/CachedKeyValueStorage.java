package com.helpshift.storage;

import java.io.Serializable;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class CachedKeyValueStorage implements KeyValueStorage {
    private HashMap<String, Object> cacheMap = new HashMap<>();
    private Set<String> cacheWhitelistKeys;
    private KeyValueStorage storage;

    public CachedKeyValueStorage(KeyValueStorage keyValueStorage, Set<String> set) {
        this.storage = keyValueStorage;
        this.cacheWhitelistKeys = new HashSet(set);
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized boolean set(String str, Serializable serializable) {
        boolean z;
        this.cacheMap.remove(str);
        z = this.storage.set(str, serializable);
        if (z) {
            setInCache(str, serializable);
        }
        return z;
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public boolean setKeyValues(Map<String, Serializable> map) {
        removeFromCache(map.keySet());
        boolean keyValues = this.storage.setKeyValues(map);
        if (keyValues) {
            setInCache(map);
        }
        return keyValues;
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized Object get(String str) {
        if (this.cacheMap.containsKey(str)) {
            return this.cacheMap.get(str);
        }
        Object obj = this.storage.get(str);
        setInCache(str, obj);
        return obj;
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized void removeKey(String str) {
        this.storage.removeKey(str);
        this.cacheMap.remove(str);
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized void removeAllKeys() {
        this.storage.removeAllKeys();
        this.cacheMap.clear();
    }

    private void setInCache(String str, Object obj) {
        if (this.cacheWhitelistKeys.contains(str)) {
            this.cacheMap.put(str, obj);
        }
    }

    private void setInCache(Map<String, Serializable> map) {
        if (map != null) {
            for (Map.Entry<String, Serializable> entry : map.entrySet()) {
                if (this.cacheWhitelistKeys.contains(entry.getKey())) {
                    this.cacheMap.put(entry.getKey(), entry.getValue());
                }
            }
        }
    }

    private void removeFromCache(Set<String> set) {
        if (set != null) {
            Iterator<String> it = set.iterator();
            while (it.hasNext()) {
                this.cacheMap.remove(it.next());
            }
        }
    }
}
