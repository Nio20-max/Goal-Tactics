package com.helpshift.common.util;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.network.AuthDataProvider;
import com.helpshift.common.platform.Platform;
import com.helpshift.downloader.AdminFileInfo;
import com.helpshift.downloader.SupportDownloadStateChangeListener;
import com.helpshift.downloader.SupportDownloader;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class DownloadUtil {

    public interface OnFileDownloadFinishListener {
        void onFileDownloadFailure(String str, int i, String str2);

        void onFileDownloadSuccess(String str, String str2, String str3, String str4);
    }

    public static void downloadFile(Platform platform, Domain domain, String str, String str2, OnFileDownloadFinishListener onFileDownloadFinishListener) {
        if (StringUtils.isEmpty(str)) {
            return;
        }
        downloadFileInternal(platform, domain, new AdminFileInfo(str, str, null, false), str2, onFileDownloadFinishListener);
    }

    public static void downloadFile(Platform platform, Domain domain, boolean z, String str, String str2, String str3, OnFileDownloadFinishListener onFileDownloadFinishListener) {
        if (StringUtils.isEmpty(str2)) {
            return;
        }
        downloadFileInternal(platform, domain, new AdminFileInfo(str2, str2, null, false, str3, z), str, onFileDownloadFinishListener);
    }

    private static void downloadFileInternal(Platform platform, Domain domain, AdminFileInfo adminFileInfo, final String str, final OnFileDownloadFinishListener onFileDownloadFinishListener) {
        platform.getDownloader().startDownload(adminFileInfo, SupportDownloader.StorageDirType.INTERNAL_ONLY, new AuthDataProvider(domain, platform, adminFileInfo.url), new SupportDownloadStateChangeListener() { // from class: com.helpshift.common.util.DownloadUtil.1
            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onProgressChange(String str2, int i) {
            }

            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onFailure(String str2, int i) {
                OnFileDownloadFinishListener onFileDownloadFinishListener2 = onFileDownloadFinishListener;
                if (onFileDownloadFinishListener2 != null) {
                    onFileDownloadFinishListener2.onFileDownloadFailure(str2, i, str);
                }
            }

            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onSuccess(String str2, String str3, String str4) {
                OnFileDownloadFinishListener onFileDownloadFinishListener2 = onFileDownloadFinishListener;
                if (onFileDownloadFinishListener2 != null) {
                    onFileDownloadFinishListener2.onFileDownloadSuccess(str2, str3, str4, str);
                }
            }
        });
    }
}
