package com.helpshift.android.commons.downloader;

import com.helpshift.android.commons.downloader.contracts.DownloadDirType;

/* JADX INFO: loaded from: classes.dex */
public class DownloadConfig {
    DownloadDirType downloadDirType;
    String externalStorageDirectoryPath;
    boolean isNoMedia;
    boolean useCache;
    boolean writeToFile;

    public static class Builder {
        private boolean useCache = true;
        private boolean isNoMedia = false;
        private boolean writeToFile = true;
        private DownloadDirType downloadDirType = DownloadDirType.INTERNAL_ONLY;
        private String externalStorageDirectoryPath = "";

        public Builder setUseCache(boolean z) {
            this.useCache = z;
            return this;
        }

        public Builder setIsNoMedia(boolean z) {
            this.isNoMedia = z;
            return this;
        }

        public Builder setWriteToFile(boolean z) {
            this.writeToFile = z;
            return this;
        }

        public Builder setExternalStorageDirectoryPath(String str) {
            this.externalStorageDirectoryPath = str;
            return this;
        }

        public Builder setDownloadDirType(DownloadDirType downloadDirType) {
            this.downloadDirType = downloadDirType;
            return this;
        }

        public DownloadConfig create() {
            DownloadConfig downloadConfig = new DownloadConfig();
            downloadConfig.useCache = this.useCache;
            downloadConfig.isNoMedia = this.isNoMedia;
            downloadConfig.writeToFile = this.writeToFile;
            downloadConfig.externalStorageDirectoryPath = this.externalStorageDirectoryPath;
            downloadConfig.downloadDirType = this.downloadDirType;
            return downloadConfig;
        }
    }
}
