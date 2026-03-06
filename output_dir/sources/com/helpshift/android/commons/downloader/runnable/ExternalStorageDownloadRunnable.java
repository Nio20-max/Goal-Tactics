package com.helpshift.android.commons.downloader.runnable;

import android.content.Context;
import android.os.Environment;
import android.text.TextUtils;
import com.helpshift.android.commons.downloader.contracts.DownloadRequestedFileInfo;
import com.helpshift.android.commons.downloader.contracts.NetworkAuthDataFetcher;
import com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener;
import com.helpshift.android.commons.downloader.contracts.OnProgressChangedListener;
import com.helpshift.android.commons.downloader.storage.DownloadInProgressCacheDbStorage;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public class ExternalStorageDownloadRunnable extends StorageDownloadRunnable {
    private Context context;
    private boolean isNoMediaDir;
    private String relativePath;

    public ExternalStorageDownloadRunnable(Context context, DownloadRequestedFileInfo downloadRequestedFileInfo, String str, boolean z, DownloadInProgressCacheDbStorage downloadInProgressCacheDbStorage, NetworkAuthDataFetcher networkAuthDataFetcher, OnProgressChangedListener onProgressChangedListener, OnDownloadFinishListener onDownloadFinishListener) {
        super(downloadRequestedFileInfo, downloadInProgressCacheDbStorage, networkAuthDataFetcher, onProgressChangedListener, onDownloadFinishListener);
        this.context = context;
        this.relativePath = str;
        this.isNoMediaDir = z;
    }

    @Override // com.helpshift.android.commons.downloader.runnable.StorageDownloadRunnable
    public File getCacheDir() {
        if (TextUtils.isEmpty(this.relativePath)) {
            return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
        }
        return Environment.getExternalStoragePublicDirectory(this.relativePath);
    }

    @Override // com.helpshift.android.commons.downloader.runnable.StorageDownloadRunnable
    public boolean isNoMediaDir() {
        if (this.relativePath != null) {
            return this.isNoMediaDir;
        }
        return false;
    }
}
