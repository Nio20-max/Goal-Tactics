package com.helpshift.common.platform;

import android.content.Context;
import com.helpshift.android.commons.downloader.DownloadConfig;
import com.helpshift.android.commons.downloader.DownloadManager;
import com.helpshift.android.commons.downloader.contracts.DownloadDirType;
import com.helpshift.android.commons.downloader.contracts.DownloadRequestedFileInfo;
import com.helpshift.android.commons.downloader.contracts.NetworkAuthDataFetcher;
import com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener;
import com.helpshift.android.commons.downloader.contracts.OnProgressChangedListener;
import com.helpshift.common.domain.HSThreadFactory;
import com.helpshift.common.domain.network.AuthDataProvider;
import com.helpshift.common.platform.network.Method;
import com.helpshift.downloader.AdminFileInfo;
import com.helpshift.downloader.SupportDownloadStateChangeListener;
import com.helpshift.downloader.SupportDownloader;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidSupportDownloader implements SupportDownloader {
    private static final int CORE_POOL_SIZE = 5;
    private static final int KEEP_ALIVE_TIME = 1;
    private static final TimeUnit KEEP_ALIVE_TIME_UNIT = TimeUnit.SECONDS;
    private static final int MAXIMUM_POOL_SIZE = 5;
    private Map<String, Set<SupportDownloadStateChangeListener>> callbackManager = new HashMap();
    private Context context;
    private final DownloadManager downloadManager;

    public AndroidSupportDownloader(Context context, KVStore kVStore) {
        this.context = context;
        this.downloadManager = new DownloadManager(context, new SupportDownloaderKVStorage(kVStore), new ThreadPoolExecutor(5, 5, 1L, KEEP_ALIVE_TIME_UNIT, new LinkedBlockingQueue(), new HSThreadFactory("sp-dwnld")));
    }

    /* JADX INFO: renamed from: com.helpshift.common.platform.AndroidSupportDownloader$4, reason: invalid class name */
    static /* synthetic */ class AnonymousClass4 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$downloader$SupportDownloader$StorageDirType;

        static {
            int[] iArr = new int[SupportDownloader.StorageDirType.values().length];
            $SwitchMap$com$helpshift$downloader$SupportDownloader$StorageDirType = iArr;
            try {
                iArr[SupportDownloader.StorageDirType.INTERNAL_ONLY.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$downloader$SupportDownloader$StorageDirType[SupportDownloader.StorageDirType.EXTERNAL_ONLY.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$downloader$SupportDownloader$StorageDirType[SupportDownloader.StorageDirType.EXTERNAL_OR_INTERNAL.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    private DownloadConfig buildDownloadConfig(SupportDownloader.StorageDirType storageDirType, boolean z) {
        DownloadDirType downloadDirType;
        int i = AnonymousClass4.$SwitchMap$com$helpshift$downloader$SupportDownloader$StorageDirType[storageDirType.ordinal()];
        boolean z2 = false;
        if (i == 1) {
            downloadDirType = DownloadDirType.INTERNAL_ONLY;
            z2 = true;
        } else if (i == 2) {
            downloadDirType = DownloadDirType.EXTERNAL_ONLY;
        } else if (i == 3) {
            downloadDirType = DownloadDirType.EXTERNAL_OR_INTERNAL;
        } else {
            throw new IllegalStateException("Unsupported download Dir type");
        }
        return new DownloadConfig.Builder().setUseCache(z).setIsNoMedia(z2).setWriteToFile(true).setDownloadDirType(downloadDirType).create();
    }

    @Override // com.helpshift.downloader.SupportDownloader
    public void startDownload(AdminFileInfo adminFileInfo, SupportDownloader.StorageDirType storageDirType, final AuthDataProvider authDataProvider, SupportDownloadStateChangeListener supportDownloadStateChangeListener) {
        addCallback(adminFileInfo.url, supportDownloadStateChangeListener);
        this.downloadManager.startDownload(new DownloadRequestedFileInfo(adminFileInfo.url, adminFileInfo.isSecureAttachment, adminFileInfo.contentType, adminFileInfo.etag), buildDownloadConfig(storageDirType, !adminFileInfo.skipCaching), new NetworkAuthDataFetcher() { // from class: com.helpshift.common.platform.AndroidSupportDownloader.1
            @Override // com.helpshift.android.commons.downloader.contracts.NetworkAuthDataFetcher
            public Map<String, String> getAuthData(Map<String, String> map) throws GeneralSecurityException {
                return authDataProvider.getAuthData(Method.GET, map);
            }
        }, new OnProgressChangedListener() { // from class: com.helpshift.common.platform.AndroidSupportDownloader.2
            @Override // com.helpshift.android.commons.downloader.contracts.OnProgressChangedListener
            public void onProgressChanged(String str, int i) {
                AndroidSupportDownloader.this.handleProgressChange(str, i);
            }
        }, new OnDownloadFinishListener() { // from class: com.helpshift.common.platform.AndroidSupportDownloader.3
            @Override // com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener
            public void onDownloadFinish(boolean z, String str, Object obj, int i, String str2) {
                if (z) {
                    AndroidSupportDownloader.this.handleDownloadSuccess(str, obj.toString(), str2);
                } else {
                    AndroidSupportDownloader.this.handleDownloadFailure(str, i);
                }
            }
        });
    }

    void handleDownloadSuccess(String str, String str2, String str3) {
        Iterator<SupportDownloadStateChangeListener> it = getAndRemoveCallbacks(str).iterator();
        while (it.hasNext()) {
            it.next().onSuccess(str, str2, str3);
        }
    }

    void handleProgressChange(String str, int i) {
        Iterator<SupportDownloadStateChangeListener> it = getCallbacks(str).iterator();
        while (it.hasNext()) {
            it.next().onProgressChange(str, i);
        }
    }

    void handleDownloadFailure(String str, int i) {
        Iterator<SupportDownloadStateChangeListener> it = getAndRemoveCallbacks(str).iterator();
        while (it.hasNext()) {
            it.next().onFailure(str, i);
        }
    }

    private synchronized void addCallback(String str, SupportDownloadStateChangeListener supportDownloadStateChangeListener) {
        if (supportDownloadStateChangeListener == null) {
            return;
        }
        Set<SupportDownloadStateChangeListener> hashSet = this.callbackManager.get(str);
        if (hashSet == null) {
            hashSet = new HashSet<>();
        }
        hashSet.add(supportDownloadStateChangeListener);
        this.callbackManager.put(str, hashSet);
    }

    private synchronized void removeCallbacks(String str) {
        this.callbackManager.remove(str);
    }

    private synchronized Set<SupportDownloadStateChangeListener> getCallbacks(String str) {
        HashSet hashSet;
        Set<SupportDownloadStateChangeListener> set = this.callbackManager.get(str);
        if (set == null) {
            hashSet = new HashSet();
        } else {
            hashSet = new HashSet(set);
        }
        return hashSet;
    }

    private synchronized Set<SupportDownloadStateChangeListener> getAndRemoveCallbacks(String str) {
        Set<SupportDownloadStateChangeListener> callbacks;
        callbacks = getCallbacks(str);
        removeCallbacks(str);
        return callbacks;
    }
}
