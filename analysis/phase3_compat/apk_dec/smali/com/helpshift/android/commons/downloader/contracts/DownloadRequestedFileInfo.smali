.class public Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;
.super Ljava/lang/Object;
.source "DownloadRequestedFileInfo.java"


# instance fields
.field public final contentType:Ljava/lang/String;

.field public final etag:Ljava/lang/String;

.field public final isSecured:Z

.field public final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    .line 11
    iput-boolean p2, p0, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->isSecured:Z

    .line 12
    iput-object p3, p0, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->contentType:Ljava/lang/String;

    .line 13
    iput-object p4, p0, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->etag:Ljava/lang/String;

    return-void
.end method
