package com.helpshift.android.commons.downloader.storage;

import com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage;

/* JADX INFO: loaded from: classes.dex */
public class DownloadManagerCacheDbStorage extends BaseCacheDbStorage {
    private static final String KEY_CACHED_DOWNLOADS = "hs-cached-downloads";

    @Override // com.helpshift.android.commons.downloader.storage.BaseCacheDbStorage
    String getStorageKey() {
        return KEY_CACHED_DOWNLOADS;
    }

    public DownloadManagerCacheDbStorage(DownloaderKeyValueStorage downloaderKeyValueStorage) {
        super(downloaderKeyValueStorage);
    }
}
