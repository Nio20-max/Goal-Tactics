package com.helpshift.campaigns.storage;

import com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage;
import com.helpshift.storage.KeyValueStorage;
import java.io.Serializable;

/* JADX INFO: loaded from: classes.dex */
public class CampaignDownloaderKvStorage implements DownloaderKeyValueStorage {
    private final KeyValueStorage keyValueStorage;

    public CampaignDownloaderKvStorage(KeyValueStorage keyValueStorage) {
        this.keyValueStorage = keyValueStorage;
    }

    @Override // com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage
    public boolean set(String str, Serializable serializable) {
        return this.keyValueStorage.set(str, serializable);
    }

    @Override // com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage
    public Object get(String str) {
        return this.keyValueStorage.get(str);
    }
}
