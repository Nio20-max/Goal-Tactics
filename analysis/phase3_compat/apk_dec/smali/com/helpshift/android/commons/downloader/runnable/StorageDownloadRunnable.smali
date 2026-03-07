.class public abstract Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;
.super Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;
.source "StorageDownloadRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_InterDownRun"


# instance fields
.field private downloadInProgressCacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;


# direct methods
.method constructor <init>(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p3, p4, p5}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;-><init>(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    .line 31
    iput-object p2, p0, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->downloadInProgressCacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;

    return-void
.end method

.method private checkAndCreateNoMediaFile(Ljava/io/File;)V
    .locals 2

    :try_start_0
    const-string v0, ".nomedia"

    .line 159
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 160
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    .line 161
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_InterDownRun"

    const-string v1, "Exception while creating no media file"

    .line 165
    invoke-static {v0, v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method private deleteFile(Ljava/io/File;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 128
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_InterDownRun"

    const-string v1, "Exception in deleting file "

    .line 131
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private generateFileName()Ljava/lang/String;
    .locals 4

    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Support_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v1, v1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v2, v2, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getFileToWriteResponseData()Ljava/io/File;
    .locals 3

    .line 97
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->getCachedFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 102
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 105
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 108
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->isNoMediaDir()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 109
    invoke-direct {p0, v0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->checkAndCreateNoMediaFile(Ljava/io/File;)V

    .line 112
    :cond_2
    invoke-direct {p0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->generateFileName()Ljava/lang/String;

    move-result-object v1

    .line 113
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 114
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->downloadInProgressCacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;->insertFilePath(Ljava/lang/String;)V

    return-object v2
.end method


# virtual methods
.method protected clearCache()V
    .locals 2

    .line 47
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->getCachedFile()Ljava/io/File;

    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->downloadInProgressCacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;

    invoke-virtual {v1}, Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;->removeFilePath()V

    .line 49
    invoke-direct {p0, v0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->deleteFile(Ljava/io/File;)V

    return-void
.end method

.method protected getAlreadyDownloadedBytes()J
    .locals 2

    .line 36
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->getCachedFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 41
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public abstract getCacheDir()Ljava/io/File;
.end method

.method public getCachedFile()Ljava/io/File;
    .locals 3

    .line 136
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->downloadInProgressCacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;

    invoke-virtual {v0}, Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;->getFilePath()Ljava/lang/String;

    move-result-object v0

    .line 137
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 141
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 142
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-eqz v0, :cond_1

    return-object v1

    .line 150
    :cond_1
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->downloadInProgressCacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;

    invoke-virtual {v0}, Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;->removeFilePath()V

    return-object v2
.end method

.method protected isGzipSupported()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract isNoMediaDir()Z
.end method

.method protected processHttpResponse(Ljava/io/InputStream;IILjava/lang/String;)V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object v1, p0

    .line 62
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->getAlreadyDownloadedBytes()J

    move-result-wide v2

    .line 63
    invoke-direct {p0}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->getFileToWriteResponseData()Ljava/io/File;

    move-result-object v0

    const/4 v4, 0x0

    .line 66
    :try_start_0
    new-instance v5, Ljava/io/FileOutputStream;

    const/4 v6, 0x1

    invoke-direct {v5, v0, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v4, 0x2000

    :try_start_1
    new-array v7, v4, [B

    const-wide/16 v8, 0x0

    :cond_0
    :goto_0
    const/4 v10, 0x0

    move-object/from16 v11, p1

    .line 70
    invoke-virtual {v11, v7, v10, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v12

    const/4 v13, -0x1

    if-eq v12, v13, :cond_2

    if-ltz v12, :cond_1

    .line 75
    invoke-virtual {v5, v7, v10, v12}, Ljava/io/FileOutputStream;->write([BII)V

    .line 76
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v12

    long-to-float v10, v12

    move/from16 v12, p2

    int-to-long v13, v12

    add-long/2addr v13, v2

    long-to-float v13, v13

    div-float/2addr v10, v13

    const/high16 v13, 0x42c80000    # 100.0f

    mul-float v10, v10, v13

    float-to-long v13, v10

    cmp-long v10, v13, v8

    if-eqz v10, :cond_0

    long-to-int v8, v13

    .line 80
    invoke-virtual {p0, v8}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->notifyProgressChange(I)V

    move-wide v8, v13

    goto :goto_0

    .line 72
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 85
    :cond_2
    iget-object v2, v1, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->downloadInProgressCacheDbStorage:Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;

    invoke-virtual {v2}, Lcom/helpshift/android/commons/downloader/storage/DownloadInProgressCacheDbStorage;->removeFilePath()V

    .line 87
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Helpshift_InterDownRun"

    .line 88
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Download finished : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v4, v4, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    move/from16 v2, p3

    move-object/from16 v3, p4

    .line 89
    invoke-virtual {p0, v6, v0, v2, v3}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    invoke-virtual {p0, v5}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->closeFileStream(Ljava/io/Closeable;)V

    return-void

    :catchall_0
    move-exception v0

    move-object v4, v5

    goto :goto_1

    :catchall_1
    move-exception v0

    :goto_1
    invoke-virtual {p0, v4}, Lcom/helpshift/android/commons/downloader/runnable/StorageDownloadRunnable;->closeFileStream(Ljava/io/Closeable;)V

    .line 93
    throw v0
.end method
