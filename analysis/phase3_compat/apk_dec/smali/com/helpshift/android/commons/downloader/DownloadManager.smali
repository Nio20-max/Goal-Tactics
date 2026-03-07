.class public Lcom/helpshift/android/commons/downloader/DownloadManager;
.super Ljava/lang/Object;
.source "DownloadManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_DownloadMngr"


# instance fields
.field activeDownloadFinishListeners:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;",
            ">;>;"
        }
    .end annotation
.end field

.field activeProgressChangeListeners:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private cacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;

.field private context:Landroid/content/Context;

.field private downloadExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private storage:Lcom/helpshift/android/commons/downloader/contracts/DownloaderKeyValueStorage;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/helpshift/android/commons/downloader/contracts/DownloaderKeyValueStorage;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    .line 45
    iput-object p2, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->storage:Lcom/helpshift/android/commons/downloader/contracts/DownloaderKeyValueStorage;

    .line 46
    iput-object p3, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->downloadExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 47
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->activeDownloadFinishListeners:Ljava/util/concurrent/ConcurrentHashMap;

    .line 48
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->activeProgressChangeListeners:Ljava/util/concurrent/ConcurrentHashMap;

    .line 50
    new-instance p1, Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;

    invoke-direct {p1, p2}, Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;-><init>(Lcom/helpshift/android/commons/downloader/contracts/DownloaderKeyValueStorage;)V

    iput-object p1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->cacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/android/commons/downloader/DownloadManager;)Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->cacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;

    return-object p0
.end method

.method private buildDownloadRunnable(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/DownloadConfig;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;)Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;
    .locals 10

    .line 137
    invoke-direct {p0}, Lcom/helpshift/android/commons/downloader/DownloadManager;->getOnProgressChangedListener()Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;

    move-result-object v7

    .line 138
    invoke-direct {p0, p2}, Lcom/helpshift/android/commons/downloader/DownloadManager;->getOnDownloadFinishListener(Lcom/helpshift/android/commons/downloader/DownloadConfig;)Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;

    move-result-object v8

    .line 140
    iget-boolean v0, p2, Lcom/helpshift/android/commons/downloader/DownloadConfig;->writeToFile:Z

    if-nez v0, :cond_0

    .line 141
    new-instance p2, Lcom/helpshift/android/commons/downloader/runnable/RawResponseDownloadRunnable;

    invoke-direct {p2, p1, p3, v7, v8}, Lcom/helpshift/android/commons/downloader/runnable/RawResponseDownloadRunnable;-><init>(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    return-object p2

    .line 147
    :cond_0
    new-instance v5, Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;

    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->storage:Lcom/helpshift/android/commons/downloader/contracts/DownloaderKeyValueStorage;

    invoke-direct {v5, p1, v0}, Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;-><init>(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/contracts/DownloaderKeyValueStorage;)V

    .line 149
    sget-object v0, Lcom/helpshift/android/commons/downloader/DownloadManager$3;->$SwitchMap$com$helpshift$android$commons$downloader$contracts$DownloadDirType:[I

    iget-object v1, p2, Lcom/helpshift/android/commons/downloader/DownloadConfig;->downloadDirType:Lcom/helpshift/android/commons/downloader/contracts/DownloadDirType;

    invoke-virtual {v1}, Lcom/helpshift/android/commons/downloader/contracts/DownloadDirType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_7

    const/4 v1, 0x2

    if-eq v0, v1, :cond_4

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 190
    invoke-direct {p0}, Lcom/helpshift/android/commons/downloader/DownloadManager;->isScopedStorageEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 191
    new-instance p2, Lcom/helpshift/android/commons/downloader/runnable/FilteredViewExternalStorageDownloadRunnable;

    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    move-object v0, p2

    move-object v2, p1

    move-object v3, v5

    move-object v4, p3

    move-object v5, v7

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/android/commons/downloader/runnable/FilteredViewExternalStorageDownloadRunnable;-><init>(Landroid/content/Context;Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    return-object p2

    .line 199
    :cond_1
    invoke-direct {p0}, Lcom/helpshift/android/commons/downloader/DownloadManager;->isExternalStoragePermissionGranted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 201
    new-instance v9, Lcom/helpshift/android/commons/downloader/runnable/ExternalStorageDownloadRunnable;

    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    iget-object v3, p2, Lcom/helpshift/android/commons/downloader/DownloadConfig;->externalStorageDirectoryPath:Ljava/lang/String;

    iget-boolean v4, p2, Lcom/helpshift/android/commons/downloader/DownloadConfig;->isNoMedia:Z

    move-object v0, v9

    move-object v2, p1

    move-object v6, p3

    invoke-direct/range {v0 .. v8}, Lcom/helpshift/android/commons/downloader/runnable/ExternalStorageDownloadRunnable;-><init>(Landroid/content/Context;Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Ljava/lang/String;ZLcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    return-object v9

    .line 212
    :cond_2
    new-instance p2, Lcom/helpshift/android/commons/downloader/runnable/InternalStorageDownloadRunnable;

    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    move-object v0, p2

    move-object v2, p1

    move-object v3, v5

    move-object v4, p3

    move-object v5, v7

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/android/commons/downloader/runnable/InternalStorageDownloadRunnable;-><init>(Landroid/content/Context;Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    return-object p2

    .line 221
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Unsupported download Dir type"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 162
    :cond_4
    invoke-direct {p0}, Lcom/helpshift/android/commons/downloader/DownloadManager;->isScopedStorageEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 163
    new-instance p2, Lcom/helpshift/android/commons/downloader/runnable/MediaStoreDownloadRunnable;

    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    move-object v0, p2

    move-object v2, p1

    move-object v3, v5

    move-object v4, p3

    move-object v5, v7

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/android/commons/downloader/runnable/MediaStoreDownloadRunnable;-><init>(Landroid/content/Context;Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    return-object p2

    .line 171
    :cond_5
    invoke-direct {p0}, Lcom/helpshift/android/commons/downloader/DownloadManager;->isExternalStoragePermissionGranted()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 176
    new-instance v9, Lcom/helpshift/android/commons/downloader/runnable/ExternalStorageDownloadRunnable;

    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    iget-object v3, p2, Lcom/helpshift/android/commons/downloader/DownloadConfig;->externalStorageDirectoryPath:Ljava/lang/String;

    iget-boolean v4, p2, Lcom/helpshift/android/commons/downloader/DownloadConfig;->isNoMedia:Z

    move-object v0, v9

    move-object v2, p1

    move-object v6, p3

    invoke-direct/range {v0 .. v8}, Lcom/helpshift/android/commons/downloader/runnable/ExternalStorageDownloadRunnable;-><init>(Landroid/content/Context;Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Ljava/lang/String;ZLcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    return-object v9

    .line 186
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "External storage permission is not granted on below Android-Q device"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 155
    :cond_7
    new-instance p2, Lcom/helpshift/android/commons/downloader/runnable/InternalStorageDownloadRunnable;

    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    move-object v0, p2

    move-object v2, p1

    move-object v3, v5

    move-object v4, p3

    move-object v5, v7

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/android/commons/downloader/runnable/InternalStorageDownloadRunnable;-><init>(Landroid/content/Context;Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    return-object p2
.end method

.method private getAvailableCacheFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 107
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->cacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;

    invoke-virtual {v0, p1}, Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 108
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 112
    :cond_0
    invoke-static {v0}, Lcom/helpshift/android/commons/downloader/HsUriUtils;->isValidUriPath(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 115
    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/helpshift/android/commons/downloader/HsUriUtils;->canReadFileAtUri(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 117
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->cacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;

    invoke-virtual {v0, p1}, Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;->removeFilePath(Ljava/lang/String;)V

    goto :goto_0

    .line 122
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 124
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v1

    if-nez v1, :cond_3

    .line 126
    :cond_2
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->cacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;

    invoke-virtual {v0, p1}, Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;->removeFilePath(Ljava/lang/String;)V

    :goto_0
    move-object v0, v2

    :cond_3
    return-object v0
.end method

.method private getOnDownloadFinishListener(Lcom/helpshift/android/commons/downloader/DownloadConfig;)Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;
    .locals 1

    .line 226
    new-instance v0, Lcom/helpshift/android/commons/downloader/DownloadManager$1;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/android/commons/downloader/DownloadManager$1;-><init>(Lcom/helpshift/android/commons/downloader/DownloadManager;Lcom/helpshift/android/commons/downloader/DownloadConfig;)V

    return-object v0
.end method

.method private getOnProgressChangedListener()Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;
    .locals 1

    .line 251
    new-instance v0, Lcom/helpshift/android/commons/downloader/DownloadManager$2;

    invoke-direct {v0, p0}, Lcom/helpshift/android/commons/downloader/DownloadManager$2;-><init>(Lcom/helpshift/android/commons/downloader/DownloadManager;)V

    return-object v0
.end method

.method private isExternalStoragePermissionGranted()Z
    .locals 5

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    const/4 v1, 0x0

    .line 274
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 275
    iget-object v3, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 276
    invoke-virtual {v3, v0, v2}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :catch_0
    move-exception v2

    .line 279
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error checking for permission : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "Helpshift_DownloadMngr"

    invoke-static {v3, v0, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1
.end method

.method private isScopedStorageEnabled()Z
    .locals 2

    .line 286
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 287
    invoke-static {}, Landroid/os/Environment;->isExternalStorageLegacy()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public startDownload(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/DownloadConfig;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V
    .locals 7

    .line 60
    iget-boolean v0, p2, Lcom/helpshift/android/commons/downloader/DownloadConfig;->useCache:Z

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/helpshift/android/commons/downloader/DownloadManager;->getAvailableCacheFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 63
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v2, 0x1

    .line 64
    iget-object v3, p1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    const/16 v5, 0xc8

    const-string v6, ""

    move-object v1, p5

    invoke-interface/range {v1 .. v6}, Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;->onDownloadFinish(ZLjava/lang/String;Ljava/lang/Object;ILjava/lang/String;)V

    return-void

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->activeDownloadFinishListeners:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    .line 70
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 71
    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->activeProgressChangeListeners:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v2, p1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    .line 72
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    if-eqz p5, :cond_1

    .line 78
    invoke-virtual {v0, p5}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :cond_1
    if-eqz p4, :cond_2

    .line 81
    invoke-virtual {v1, p4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :cond_2
    return-void

    .line 87
    :cond_3
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 88
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    if-eqz p5, :cond_4

    .line 90
    invoke-virtual {v0, p5}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :cond_4
    if-eqz p4, :cond_5

    .line 93
    invoke-virtual {v1, p4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 95
    :cond_5
    iget-object p4, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->activeDownloadFinishListeners:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object p5, p1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-virtual {p4, p5, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-object p4, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->activeProgressChangeListeners:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object p5, p1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-virtual {p4, p5, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/android/commons/downloader/DownloadManager;->buildDownloadRunnable(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/DownloadConfig;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;)Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;

    move-result-object p1

    .line 103
    iget-object p2, p0, Lcom/helpshift/android/commons/downloader/DownloadManager;->downloadExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
