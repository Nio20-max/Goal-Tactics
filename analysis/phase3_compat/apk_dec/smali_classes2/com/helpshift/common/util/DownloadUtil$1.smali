.class final Lcom/helpshift/common/util/DownloadUtil$1;
.super Ljava/lang/Object;
.source "DownloadUtil.java"

# interfaces
.implements Lcom/helpshift/downloader/SupportDownloadStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/common/util/DownloadUtil;->downloadFileInternal(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/downloader/AdminFileInfo;Ljava/lang/String;Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$listener:Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;


# direct methods
.method constructor <init>(Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;Ljava/lang/String;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/helpshift/common/util/DownloadUtil$1;->val$listener:Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;

    iput-object p2, p0, Lcom/helpshift/common/util/DownloadUtil$1;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/String;I)V
    .locals 2

    .line 55
    iget-object v0, p0, Lcom/helpshift/common/util/DownloadUtil$1;->val$listener:Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;

    if-eqz v0, :cond_0

    .line 56
    iget-object v1, p0, Lcom/helpshift/common/util/DownloadUtil$1;->val$key:Ljava/lang/String;

    invoke-interface {v0, p1, p2, v1}, Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;->onFileDownloadFailure(Ljava/lang/String;ILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onProgressChange(Ljava/lang/String;I)V
    .locals 0

    return-void
.end method

.method public onSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/helpshift/common/util/DownloadUtil$1;->val$listener:Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;

    if-eqz v0, :cond_0

    .line 63
    iget-object v1, p0, Lcom/helpshift/common/util/DownloadUtil$1;->val$key:Ljava/lang/String;

    invoke-interface {v0, p1, p2, p3, v1}, Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;->onFileDownloadSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
