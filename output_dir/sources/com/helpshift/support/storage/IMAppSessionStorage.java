package com.helpshift.support.storage;

import com.helpshift.storage.KeyValueStorage;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* JADX INFO: loaded from: classes2.dex */
public class IMAppSessionStorage implements KeyValueStorage {
    private Lock readLock;
    private Map<String, Serializable> sessionStorage = new HashMap();
    private Lock writeLock;

    IMAppSessionStorage() {
        ReentrantReadWriteLock reentrantReadWriteLock = new ReentrantReadWriteLock();
        this.readLock = reentrantReadWriteLock.readLock();
        this.writeLock = reentrantReadWriteLock.writeLock();
    }

    public static IMAppSessionStorage getInstance() {
        return LazyHolder.INSTANCE;
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public boolean set(String str, Serializable serializable) {
        if (str == null) {
            return false;
        }
        this.writeLock.lock();
        this.sessionStorage.put(str, serializable);
        this.writeLock.unlock();
        return true;
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public boolean setKeyValues(Map<String, Serializable> map) {
        if (map == null || map.size() == 0) {
            return false;
        }
        this.writeLock.lock();
        this.sessionStorage.putAll(map);
        this.writeLock.unlock();
        return true;
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public Serializable get(String str) {
        if (str == null) {
            return null;
        }
        this.readLock.lock();
        Serializable serializable = this.sessionStorage.get(str);
        this.readLock.unlock();
        return serializable;
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public void removeKey(String str) {
        if (str == null) {
            return;
        }
        this.writeLock.lock();
        this.sessionStorage.remove(str);
        this.writeLock.unlock();
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public void removeAllKeys() {
        this.writeLock.lock();
        this.sessionStorage.clear();
        this.writeLock.unlock();
    }

    private static class LazyHolder {
        static final IMAppSessionStorage INSTANCE = new IMAppSessionStorage();

        private LazyHolder() {
        }
    }
}
