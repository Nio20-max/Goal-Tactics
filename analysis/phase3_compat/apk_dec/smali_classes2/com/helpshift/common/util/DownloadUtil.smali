.class public Lcom/helpshift/common/util/DownloadUtil;
.super Ljava/lang/Object;
.source "DownloadUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static downloadFile(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;)V
    .locals 3

    .line 29
    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 32
    :cond_0
    new-instance v0, Lcom/helpshift/downloader/AdminFileInfo;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p2, p2, v1, v2}, Lcom/helpshift/downloader/AdminFileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 33
    invoke-static {p0, p1, v0, p3, p4}, Lcom/helpshift/common/util/DownloadUtil;->downloadFileInternal(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/downloader/AdminFileInfo;Ljava/lang/String;Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;)V

    return-void
.end method

.method public static downloadFile(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;)V
    .locals 8

    .line 39
    invoke-static {p4}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 42
    :cond_0
    new-instance v0, Lcom/helpshift/downloader/AdminFileInfo;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, v0

    move-object v2, p4

    move-object v3, p4

    move-object v6, p5

    move v7, p2

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/downloader/AdminFileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Z)V

    .line 43
    invoke-static {p0, p1, v0, p3, p6}, Lcom/helpshift/common/util/DownloadUtil;->downloadFileInternal(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/downloader/AdminFileInfo;Ljava/lang/String;Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;)V

    return-void
.end method

.method private static downloadFileInternal(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/downloader/AdminFileInfo;Ljava/lang/String;Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;)V
    .locals 4

    .line 49
    invoke-interface {p0}, Lcom/helpshift/common/platform/Platform;->getDownloader()Lcom/helpshift/downloader/SupportDownloader;

    move-result-object v0

    sget-object v1, Lcom/helpshift/downloader/SupportDownloader$StorageDirType;->INTERNAL_ONLY:Lcom/helpshift/downloader/SupportDownloader$StorageDirType;

    new-instance v2, Lcom/helpshift/common/domain/network/AuthDataProvider;

    iget-object v3, p2, Lcom/helpshift/downloader/AdminFileInfo;->url:Ljava/lang/String;

    invoke-direct {v2, p1, p0, v3}, Lcom/helpshift/common/domain/network/AuthDataProvider;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    new-instance p0, Lcom/helpshift/common/util/DownloadUtil$1;

    invoke-direct {p0, p4, p3}, Lcom/helpshift/common/util/DownloadUtil$1;-><init>(Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;Ljava/lang/String;)V

    invoke-interface {v0, p2, v1, v2, p0}, Lcom/helpshift/downloader/SupportDownloader;->startDownload(Lcom/helpshift/downloader/AdminFileInfo;Lcom/helpshift/downloader/SupportDownloader$StorageDirType;Lcom/helpshift/common/domain/network/AuthDataProvider;Lcom/helpshift/downloader/SupportDownloadStateChangeListener;)V

    return-void
.end method
