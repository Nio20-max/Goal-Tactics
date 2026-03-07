.class public Lcom/helpshift/support/imageloader/URLBitmapProvider;
.super Ljava/lang/Object;
.source "URLBitmapProvider.java"

# interfaces
.implements Lcom/helpshift/support/imageloader/BitmapProvider;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_URLBtmpPrvdr"


# instance fields
.field private domain:Lcom/helpshift/common/domain/Domain;

.field private downloader:Lcom/helpshift/downloader/SupportDownloader;

.field private imgUrl:Ljava/lang/String;

.field private platform:Lcom/helpshift/common/platform/Platform;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/helpshift/downloader/SupportDownloader;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->imgUrl:Ljava/lang/String;

    .line 29
    iput-object p2, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->downloader:Lcom/helpshift/downloader/SupportDownloader;

    .line 30
    iput-object p3, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->domain:Lcom/helpshift/common/domain/Domain;

    .line 31
    iput-object p4, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->platform:Lcom/helpshift/common/platform/Platform;

    return-void
.end method


# virtual methods
.method public getBitmap(IZLcom/helpshift/util/Callback;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Lcom/helpshift/util/Callback<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 37
    new-instance p2, Lcom/helpshift/downloader/AdminFileInfo;

    iget-object v0, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->imgUrl:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p2, v0, v0, v1, v2}, Lcom/helpshift/downloader/AdminFileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 38
    iget-object v0, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->downloader:Lcom/helpshift/downloader/SupportDownloader;

    sget-object v1, Lcom/helpshift/downloader/SupportDownloader$StorageDirType;->EXTERNAL_ONLY:Lcom/helpshift/downloader/SupportDownloader$StorageDirType;

    new-instance v2, Lcom/helpshift/common/domain/network/AuthDataProvider;

    iget-object v3, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v4, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v5, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->imgUrl:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Lcom/helpshift/common/domain/network/AuthDataProvider;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    new-instance v3, Lcom/helpshift/support/imageloader/URLBitmapProvider$1;

    invoke-direct {v3, p0, p3, p1}, Lcom/helpshift/support/imageloader/URLBitmapProvider$1;-><init>(Lcom/helpshift/support/imageloader/URLBitmapProvider;Lcom/helpshift/util/Callback;I)V

    invoke-interface {v0, p2, v1, v2, v3}, Lcom/helpshift/downloader/SupportDownloader;->startDownload(Lcom/helpshift/downloader/AdminFileInfo;Lcom/helpshift/downloader/SupportDownloader$StorageDirType;Lcom/helpshift/common/domain/network/AuthDataProvider;Lcom/helpshift/downloader/SupportDownloadStateChangeListener;)V

    return-void
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider;->imgUrl:Ljava/lang/String;

    return-object v0
.end method
