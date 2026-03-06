package com.helpshift.downloader;

import com.helpshift.common.domain.network.AuthDataProvider;

/* JADX INFO: loaded from: classes2.dex */
public interface SupportDownloader {

    public enum StorageDirType {
        INTERNAL_ONLY,
        EXTERNAL_ONLY,
        EXTERNAL_OR_INTERNAL
    }

    void startDownload(AdminFileInfo adminFileInfo, StorageDirType storageDirType, AuthDataProvider authDataProvider, SupportDownloadStateChangeListener supportDownloadStateChangeListener);
}
