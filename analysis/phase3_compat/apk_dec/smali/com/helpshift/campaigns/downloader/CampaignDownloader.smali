.class public Lcom/helpshift/campaigns/downloader/CampaignDownloader;
.super Ljava/lang/Object;
.source "CampaignDownloader.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignSyncModelStorageObserver;
.implements Lcom/helpshift/campaigns/observers/CampaignStorageObserver;


# static fields
.field private static final CORE_POOL_SIZE:I = 0x5

.field private static final DOWNLOAD_DIRECTORY_PATH:Ljava/lang/String;

.field private static final KEEP_ALIVE_TIME:I = 0x1

.field private static final KEEP_ALIVE_TIME_UNIT:Ljava/util/concurrent/TimeUnit;

.field private static final MAXIMUM_POOL_SIZE:I = 0x5


# instance fields
.field private final campaignDownloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

.field private campaignDownloaderKvStorage:Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

.field private campaignsImageUrlRetryCounts:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final downloadManager:Lcom/helpshift/android/commons/downloader/DownloadManager;

.field private final imageDownloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

.field observer:Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 33
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sput-object v0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->KEEP_ALIVE_TIME_UNIT:Ljava/util/concurrent/TimeUnit;

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 37
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/helpshift/images/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->DOWNLOAD_DIRECTORY_PATH:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;)V
    .locals 8

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->observer:Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;

    .line 48
    new-instance p1, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-direct {p1, v0}, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;-><init>(Lcom/helpshift/storage/KeyValueStorage;)V

    iput-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloaderKvStorage:Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

    const-string v0, "hs__campaigns_icon_image_retry_counts"

    .line 50
    invoke-virtual {p1, v0}, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    iput-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    if-nez p1, :cond_0

    .line 52
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    .line 55
    :cond_0
    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 56
    new-instance p1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x5

    const/4 v2, 0x5

    const-wide/16 v3, 0x1

    sget-object v5, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->KEEP_ALIVE_TIME_UNIT:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v0, "cm-dwnld"

    invoke-direct {v7, v0}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    move-object v0, p1

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 62
    new-instance v0, Lcom/helpshift/android/commons/downloader/DownloadManager;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloaderKvStorage:Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

    invoke-direct {v0, v1, v2, p1}, Lcom/helpshift/android/commons/downloader/DownloadManager;-><init>(Landroid/content/Context;Lcom/helpshift/android/commons/downloader/contracts/DownloaderKeyValueStorage;Ljava/util/concurrent/ThreadPoolExecutor;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->downloadManager:Lcom/helpshift/android/commons/downloader/DownloadManager;

    .line 65
    new-instance p1, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    invoke-direct {p1}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;-><init>()V

    const/4 v0, 0x0

    .line 66
    invoke-virtual {p1, v0}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setUseCache(Z)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    .line 67
    invoke-virtual {p1, v0}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setIsNoMedia(Z)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    .line 68
    invoke-virtual {p1, v0}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setWriteToFile(Z)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    sget-object v0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->DOWNLOAD_DIRECTORY_PATH:Ljava/lang/String;

    .line 69
    invoke-virtual {p1, v0}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setExternalStorageDirectoryPath(Ljava/lang/String;)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    .line 70
    invoke-virtual {p1}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->create()Lcom/helpshift/android/commons/downloader/DownloadConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

    .line 71
    new-instance p1, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    invoke-direct {p1}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;-><init>()V

    const/4 v1, 0x1

    .line 72
    invoke-virtual {p1, v1}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setUseCache(Z)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    .line 73
    invoke-virtual {p1, v1}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setIsNoMedia(Z)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    .line 74
    invoke-virtual {p1, v1}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setWriteToFile(Z)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    .line 75
    invoke-virtual {p1, v0}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setExternalStorageDirectoryPath(Ljava/lang/String;)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    sget-object v0, Lcom/helpshift/android/commons/downloader/contracts/DownloadDirType;->EXTERNAL_OR_INTERNAL:Lcom/helpshift/android/commons/downloader/contracts/DownloadDirType;

    .line 76
    invoke-virtual {p1, v0}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->setDownloadDirType(Lcom/helpshift/android/commons/downloader/contracts/DownloadDirType;)Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;

    move-result-object p1

    .line 77
    invoke-virtual {p1}, Lcom/helpshift/android/commons/downloader/DownloadConfig$Builder;->create()Lcom/helpshift/android/commons/downloader/DownloadConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->imageDownloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

    return-void
.end method

.method private canDownloadImage(Ljava/lang/String;)Z
    .locals 2

    .line 258
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 261
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloaderKvStorage:Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    const-string v1, "hs__campaigns_icon_image_retry_counts"

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    goto :goto_0

    .line 265
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x5

    if-lt p1, v0, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method private incrementCorruptImageRetryCount(Ljava/lang/String;)V
    .locals 3

    .line 225
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 230
    :cond_0
    iget-object v2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    :goto_0
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloaderKvStorage:Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    const-string v1, "hs__campaigns_icon_image_retry_counts"

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    return-void
.end method


# virtual methods
.method public campaignAdded(Lcom/helpshift/campaigns/models/CampaignSyncModel;)V
    .locals 0

    .line 182
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->startCampaignDownload(Lcom/helpshift/campaigns/models/CampaignSyncModel;)V

    return-void
.end method

.method public campaignCoverImageFilePathUpdated(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignDeleted(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignDetailModelAdded(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V
    .locals 1

    .line 192
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    iget-object v0, v0, Lcom/helpshift/model/AppInfoModel;->muteNotifications:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 194
    :cond_0
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->startIconImageDownload(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public campaignIconImageFilePathUpdated(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignRead(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignSeen(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignSynced(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method decrementCorruptImageRetryCount(Ljava/lang/String;)V
    .locals 2

    .line 237
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 238
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lez v1, :cond_0

    .line 239
    iget-object v1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloaderKvStorage:Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    const-string v1, "hs__campaigns_icon_image_retry_counts"

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    :cond_0
    return-void
.end method

.method disableCorruptImageRetry(Ljava/lang/String;)V
    .locals 2

    .line 246
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloaderKvStorage:Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    const-string v1, "hs__campaigns_icon_image_retry_counts"

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    return-void
.end method

.method public enableCorruptImageRetry(Ljava/lang/String;)V
    .locals 2

    .line 252
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloaderKvStorage:Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;

    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignsImageUrlRetryCounts:Ljava/util/HashMap;

    const-string v1, "hs__campaigns_icon_image_retry_counts"

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/campaigns/storage/CampaignDownloaderKvStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    return-void
.end method

.method public startCampaignDownload(Lcom/helpshift/campaigns/models/CampaignSyncModel;)V
    .locals 6

    .line 81
    new-instance v5, Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;

    invoke-direct {v5, p0, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;-><init>(Lcom/helpshift/campaigns/downloader/CampaignDownloader;Lcom/helpshift/campaigns/models/CampaignSyncModel;)V

    .line 94
    new-instance v1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->creativeUrl:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v3, v3}, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->downloadManager:Lcom/helpshift/android/commons/downloader/DownloadManager;

    iget-object v2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->campaignDownloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/helpshift/android/commons/downloader/DownloadManager;->startDownload(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/DownloadConfig;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    .line 102
    iget-object v0, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->observer:Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;

    iget-object p1, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;->campaignDownloadStarted(Ljava/lang/String;)V

    return-void
.end method

.method public startCoverImageDownload(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 143
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->canDownloadImage(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    new-instance v6, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;

    invoke-direct {v6, p0, p2, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;-><init>(Lcom/helpshift/campaigns/downloader/CampaignDownloader;Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->incrementCorruptImageRetryCount(Ljava/lang/String;)V

    .line 169
    new-instance v2, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    const/4 p2, 0x0

    const/4 v0, 0x0

    invoke-direct {v2, p1, p2, v0, v0}, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-object v1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->downloadManager:Lcom/helpshift/android/commons/downloader/DownloadManager;

    iget-object v3, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->imageDownloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/helpshift/android/commons/downloader/DownloadManager;->startDownload(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/DownloadConfig;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    :cond_0
    return-void
.end method

.method public startIconImageDownload(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 106
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->canDownloadImage(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    new-instance v6, Lcom/helpshift/campaigns/downloader/CampaignDownloader$2;

    invoke-direct {v6, p0, p2, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader$2;-><init>(Lcom/helpshift/campaigns/downloader/CampaignDownloader;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->incrementCorruptImageRetryCount(Ljava/lang/String;)V

    .line 131
    new-instance v2, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    const/4 p2, 0x0

    const/4 v0, 0x0

    invoke-direct {v2, p1, p2, v0, v0}, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 134
    iget-object v1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->downloadManager:Lcom/helpshift/android/commons/downloader/DownloadManager;

    iget-object v3, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->imageDownloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/helpshift/android/commons/downloader/DownloadManager;->startDownload(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/DownloadConfig;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    :cond_0
    return-void
.end method
