package com.helpshift.campaigns.downloader;

import com.helpshift.android.commons.downloader.DownloadConfig;
import com.helpshift.android.commons.downloader.DownloadManager;
import com.helpshift.android.commons.downloader.contracts.DownloadDirType;
import com.helpshift.android.commons.downloader.contracts.DownloadRequestedFileInfo;
import com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.models.CampaignSyncModel;
import com.helpshift.campaigns.observers.CampaignDownloadObserver;
import com.helpshift.campaigns.observers.CampaignStorageObserver;
import com.helpshift.campaigns.observers.CampaignSyncModelStorageObserver;
import com.helpshift.campaigns.storage.CampaignDownloaderKvStorage;
import com.helpshift.campaigns.storage.CampaignsStorageFactory;
import com.helpshift.common.domain.HSThreadFactory;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.ImageUtil;
import com.helpshift.util.constants.KeyValueStorageKeys;
import java.io.File;
import java.util.HashMap;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class CampaignDownloader implements CampaignSyncModelStorageObserver, CampaignStorageObserver {
    private static final int CORE_POOL_SIZE = 5;
    private static final int KEEP_ALIVE_TIME = 1;
    private static final int MAXIMUM_POOL_SIZE = 5;
    private final DownloadConfig campaignDownloadConfig;
    private CampaignDownloaderKvStorage campaignDownloaderKvStorage;
    private HashMap<String, Integer> campaignsImageUrlRetryCounts;
    private final DownloadManager downloadManager;
    private final DownloadConfig imageDownloadConfig;
    CampaignDownloadObserver observer;
    private static final TimeUnit KEEP_ALIVE_TIME_UNIT = TimeUnit.SECONDS;
    private static final String DOWNLOAD_DIRECTORY_PATH = HelpshiftContext.getApplicationContext().getPackageName() + "/helpshift/images/";

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignCoverImageFilePathUpdated(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDeleted(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignIconImageFilePathUpdated(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignRead(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignSeen(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignSyncModelStorageObserver
    public void campaignSynced(String str) {
    }

    public CampaignDownloader(CampaignDownloadObserver campaignDownloadObserver) {
        this.observer = campaignDownloadObserver;
        CampaignDownloaderKvStorage campaignDownloaderKvStorage = new CampaignDownloaderKvStorage(CampaignsStorageFactory.getInstance().keyValueStorage);
        this.campaignDownloaderKvStorage = campaignDownloaderKvStorage;
        HashMap<String, Integer> map = (HashMap) campaignDownloaderKvStorage.get(KeyValueStorageKeys.CAMPAIGNS_IMAGE_URL_RETRY_COUNTS);
        this.campaignsImageUrlRetryCounts = map;
        if (map == null) {
            this.campaignsImageUrlRetryCounts = new HashMap<>();
        }
        this.downloadManager = new DownloadManager(HelpshiftContext.getApplicationContext(), this.campaignDownloaderKvStorage, new ThreadPoolExecutor(5, 5, 1L, KEEP_ALIVE_TIME_UNIT, new LinkedBlockingQueue(), new HSThreadFactory("cm-dwnld")));
        DownloadConfig.Builder writeToFile = new DownloadConfig.Builder().setUseCache(false).setIsNoMedia(false).setWriteToFile(false);
        String str = DOWNLOAD_DIRECTORY_PATH;
        this.campaignDownloadConfig = writeToFile.setExternalStorageDirectoryPath(str).create();
        this.imageDownloadConfig = new DownloadConfig.Builder().setUseCache(true).setIsNoMedia(true).setWriteToFile(true).setExternalStorageDirectoryPath(str).setDownloadDirType(DownloadDirType.EXTERNAL_OR_INTERNAL).create();
    }

    public void startCampaignDownload(final CampaignSyncModel campaignSyncModel) {
        OnDownloadFinishListener onDownloadFinishListener = new OnDownloadFinishListener() { // from class: com.helpshift.campaigns.downloader.CampaignDownloader.1
            @Override // com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener
            public void onDownloadFinish(boolean z, String str, Object obj, int i, String str2) {
                if (z) {
                    CampaignDownloader.this.observer.campaignDownloadCompleted(campaignSyncModel, obj.toString());
                } else {
                    CampaignDownloader.this.observer.campaignDownloadFailed(campaignSyncModel.campaignId);
                }
            }
        };
        this.downloadManager.startDownload(new DownloadRequestedFileInfo(campaignSyncModel.creativeUrl, false, null, null), this.campaignDownloadConfig, null, null, onDownloadFinishListener);
        this.observer.campaignDownloadStarted(campaignSyncModel.campaignId);
    }

    public void startIconImageDownload(final String str, final String str2) {
        if (canDownloadImage(str)) {
            OnDownloadFinishListener onDownloadFinishListener = new OnDownloadFinishListener() { // from class: com.helpshift.campaigns.downloader.CampaignDownloader.2
                @Override // com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener
                public void onDownloadFinish(boolean z, String str3, Object obj, int i, String str4) {
                    if (z) {
                        String string = obj.toString();
                        if (ImageUtil.isImageFileFormatSupported(string)) {
                            CampaignDownloader.this.observer.iconImageDownloadCompleted(str2, string);
                            return;
                        }
                        new File(string).delete();
                        CampaignDownloader.this.disableCorruptImageRetry(str);
                        CampaignDownloader.this.observer.iconImageDownloadFailed(str2);
                        return;
                    }
                    CampaignDownloader.this.decrementCorruptImageRetryCount(str);
                    CampaignDownloader.this.observer.iconImageDownloadFailed(str2);
                }
            };
            incrementCorruptImageRetryCount(str);
            this.downloadManager.startDownload(new DownloadRequestedFileInfo(str, false, null, null), this.imageDownloadConfig, null, null, onDownloadFinishListener);
        }
    }

    public void startCoverImageDownload(final String str, final String str2) {
        if (canDownloadImage(str)) {
            OnDownloadFinishListener onDownloadFinishListener = new OnDownloadFinishListener() { // from class: com.helpshift.campaigns.downloader.CampaignDownloader.3
                @Override // com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener
                public void onDownloadFinish(boolean z, String str3, Object obj, int i, String str4) throws Throwable {
                    if (z) {
                        String string = obj.toString();
                        if (ImageUtil.isImageFileFormatSupported(string)) {
                            ImageUtil.scaleDownAndSave(obj.toString(), 3);
                            CampaignDownloader.this.observer.coverImageDownloadCompleted(str2, obj.toString());
                            return;
                        } else {
                            new File(string).delete();
                            CampaignDownloader.this.disableCorruptImageRetry(str);
                            CampaignDownloader.this.observer.coverImageDownloadFailed(str2);
                            return;
                        }
                    }
                    CampaignDownloader.this.decrementCorruptImageRetryCount(str);
                    CampaignDownloader.this.observer.coverImageDownloadFailed(str2);
                }
            };
            incrementCorruptImageRetryCount(str);
            this.downloadManager.startDownload(new DownloadRequestedFileInfo(str, false, null, null), this.imageDownloadConfig, null, null, onDownloadFinishListener);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignSyncModelStorageObserver
    public void campaignAdded(CampaignSyncModel campaignSyncModel) {
        startCampaignDownload(campaignSyncModel);
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDetailModelAdded(CampaignDetailModel campaignDetailModel) {
        Boolean bool = InfoModelFactory.getInstance().appInfoModel.muteNotifications;
        if (bool == null || !bool.booleanValue()) {
            startIconImageDownload(campaignDetailModel.iconImageUrl, campaignDetailModel.getIdentifier());
        }
    }

    private void incrementCorruptImageRetryCount(String str) {
        Integer num = this.campaignsImageUrlRetryCounts.get(str);
        if (num == null) {
            this.campaignsImageUrlRetryCounts.put(str, 1);
        } else {
            this.campaignsImageUrlRetryCounts.put(str, Integer.valueOf(num.intValue() + 1));
        }
        this.campaignDownloaderKvStorage.set(KeyValueStorageKeys.CAMPAIGNS_IMAGE_URL_RETRY_COUNTS, this.campaignsImageUrlRetryCounts);
    }

    void decrementCorruptImageRetryCount(String str) {
        Integer num = this.campaignsImageUrlRetryCounts.get(str);
        if (num == null || num.intValue() <= 0) {
            return;
        }
        this.campaignsImageUrlRetryCounts.put(str, Integer.valueOf(num.intValue() - 1));
        this.campaignDownloaderKvStorage.set(KeyValueStorageKeys.CAMPAIGNS_IMAGE_URL_RETRY_COUNTS, this.campaignsImageUrlRetryCounts);
    }

    void disableCorruptImageRetry(String str) {
        this.campaignsImageUrlRetryCounts.put(str, 5);
        this.campaignDownloaderKvStorage.set(KeyValueStorageKeys.CAMPAIGNS_IMAGE_URL_RETRY_COUNTS, this.campaignsImageUrlRetryCounts);
    }

    public void enableCorruptImageRetry(String str) {
        this.campaignsImageUrlRetryCounts.put(str, 0);
        this.campaignDownloaderKvStorage.set(KeyValueStorageKeys.CAMPAIGNS_IMAGE_URL_RETRY_COUNTS, this.campaignsImageUrlRetryCounts);
    }

    private boolean canDownloadImage(String str) {
        Integer num = this.campaignsImageUrlRetryCounts.get(str);
        if (num == null) {
            this.campaignsImageUrlRetryCounts.put(str, 0);
            this.campaignDownloaderKvStorage.set(KeyValueStorageKeys.CAMPAIGNS_IMAGE_URL_RETRY_COUNTS, this.campaignsImageUrlRetryCounts);
        } else if (num.intValue() >= 5) {
            return false;
        }
        return true;
    }
}
