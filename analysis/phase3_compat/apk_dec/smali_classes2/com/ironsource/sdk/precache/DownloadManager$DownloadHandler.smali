.class Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;
.super Landroid/os/Handler;
.source "DownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/sdk/precache/DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DownloadHandler"
.end annotation


# instance fields
.field mListener:Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 103
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 113
    iget-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;->mListener:Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;

    const-string v1, "DownloadManager"

    if-nez v0, :cond_0

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnPreCacheCompletion listener is null, msg: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/os/Message;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 119
    :cond_0
    :try_start_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v2, 0x3f8

    if-eq v0, v2, :cond_2

    const/16 v2, 0x3f9

    if-eq v0, v2, :cond_1

    goto :goto_0

    .line 125
    :cond_1
    iget-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;->mListener:Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ironsource/sdk/data/SSAFile;

    invoke-interface {v0, p1}, Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;->onFileDownloadFail(Lcom/ironsource/sdk/data/SSAFile;)V

    goto :goto_0

    .line 122
    :cond_2
    iget-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;->mListener:Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ironsource/sdk/data/SSAFile;

    invoke-interface {v0, p1}, Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;->onFileDownloadSuccess(Lcom/ironsource/sdk/data/SSAFile;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleMessage | Got exception: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    .line 140
    iput-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;->mListener:Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;

    return-void
.end method

.method setOnPreCacheCompletion(Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 108
    iput-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;->mListener:Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;

    return-void

    .line 107
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method
