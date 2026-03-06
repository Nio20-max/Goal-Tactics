package com.helpshift.android.commons.downloader.storage;

import com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public abstract class BaseCacheDbStorage {
    private DownloaderKeyValueStorage keyValueStorage;

    abstract String getStorageKey();

    public BaseCacheDbStorage(DownloaderKeyValueStorage downloaderKeyValueStorage) {
        this.keyValueStorage = downloaderKeyValueStorage;
    }

    public String getFilePath(String str) {
        HashMap map = (HashMap) this.keyValueStorage.get(getStorageKey());
        if (map == null) {
            return null;
        }
        return (String) map.get(str);
    }

    public void insertFilePath(String str, String str2) {
        HashMap map = (HashMap) this.keyValueStorage.get(getStorageKey());
        if (map == null) {
            map = new HashMap();
        }
        map.put(str, str2);
        this.keyValueStorage.set(getStorageKey(), map);
    }

    public void removeFilePath(String str) {
        HashMap map = (HashMap) this.keyValueStorage.get(getStorageKey());
        if (map != null) {
            map.remove(str);
            this.keyValueStorage.set(getStorageKey(), map);
        }
    }
}
