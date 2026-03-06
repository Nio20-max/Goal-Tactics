package com.helpshift.android.commons.downloader.storage;

import com.helpshift.android.commons.downloader.contracts.DownloadRequestedFileInfo;
import com.helpshift.android.commons.downloader.contracts.DownloaderKeyValueStorage;

/* JADX INFO: loaded from: classes.dex */
public class DownloadInProgressCacheDbStorage extends BaseCacheDbStorage {
    private static final String DOWNLOAD_MANAGER_DB_KEY = "kDownloadManagerCachedFiles";
    private DownloadRequestedFileInfo requestInfo;

    @Override // com.helpshift.android.commons.downloader.storage.BaseCacheDbStorage
    String getStorageKey() {
        return DOWNLOAD_MANAGER_DB_KEY;
    }

    public DownloadInProgressCacheDbStorage(DownloadRequestedFileInfo downloadRequestedFileInfo, DownloaderKeyValueStorage downloaderKeyValueStorage) {
        super(downloaderKeyValueStorage);
        this.requestInfo = downloadRequestedFileInfo;
    }

    public String getFilePath() {
        return getFilePath(this.requestInfo.url);
    }

    public void insertFilePath(String str) {
        insertFilePath(this.requestInfo.url, str);
    }

    public void removeFilePath() {
        removeFilePath(this.requestInfo.url);
    }
}
