package com.helpshift.common.platform;

import com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage;
import java.io.Serializable;

/* JADX INFO: loaded from: classes2.dex */
public class SupportDownloaderKVStorage implements DownloaderKeyValueStorage {
    private final KVStore kvStore;

    public SupportDownloaderKVStorage(KVStore kVStore) {
        this.kvStore = kVStore;
    }

    @Override // com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage
    public boolean set(String str, Serializable serializable) {
        this.kvStore.setSerializable(str, serializable);
        return true;
    }

    @Override // com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage
    public Object get(String str) {
        return this.kvStore.getSerializable(str);
    }
}
