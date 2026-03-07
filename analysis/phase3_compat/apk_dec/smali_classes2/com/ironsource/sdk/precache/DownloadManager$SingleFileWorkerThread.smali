.class Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;
.super Ljava/lang/Object;
.source "DownloadManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/sdk/precache/DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SingleFileWorkerThread"
.end annotation


# instance fields
.field private final DEFAULT_CONNECTION_RETRIES:J

.field private mCacheRootDirectory:Ljava/lang/String;

.field private mConnectionRetries:J

.field mDownloadHandler:Landroid/os/Handler;

.field private mFile:Ljava/lang/String;

.field private mFileName:Ljava/lang/String;

.field private mPath:Ljava/lang/String;

.field private final mTempFilesDirectory:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/ironsource/sdk/data/SSAFile;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x3

    .line 189
    iput-wide v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->DEFAULT_CONNECTION_RETRIES:J

    .line 200
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getFile()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mFile:Ljava/lang/String;

    .line 201
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mPath:Ljava/lang/String;

    .line 203
    iget-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mFile:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->guessFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mFileName:Ljava/lang/String;

    .line 205
    iput-wide v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mConnectionRetries:J

    .line 206
    iput-object p3, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mCacheRootDirectory:Ljava/lang/String;

    .line 207
    iput-object p2, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mDownloadHandler:Landroid/os/Handler;

    .line 208
    iput-object p4, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mTempFilesDirectory:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method convertErrorCodeToMessage(I)Ljava/lang/String;
    .locals 2

    .line 292
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "not defined message for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x194

    if-eq p1, v1, :cond_2

    const/16 v1, 0x3fa

    if-eq p1, v1, :cond_1

    const/16 v1, 0x3fb

    if-eq p1, v1, :cond_0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    goto :goto_0

    :pswitch_0
    const-string v0, "http error code"

    goto :goto_0

    :pswitch_1
    const-string v0, "uri syntax exception"

    goto :goto_0

    :pswitch_2
    const-string v0, "io exception"

    goto :goto_0

    :pswitch_3
    const-string v0, "socket timeout exception"

    goto :goto_0

    :pswitch_4
    const-string v0, "http empty response"

    goto :goto_0

    :pswitch_5
    const-string v0, "malformed url exception"

    goto :goto_0

    :cond_0
    const-string v0, "out of memory exception"

    goto :goto_0

    :cond_1
    const-string v0, "file not found exception"

    goto :goto_0

    :cond_2
    :pswitch_6
    const-string v0, "http not found"

    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x3ec
        :pswitch_5
        :pswitch_6
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x3f0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getFileWorkerThread(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)Lcom/ironsource/sdk/precache/DownloadManager$FileWorkerThread;
    .locals 8

    .line 217
    new-instance v7, Lcom/ironsource/sdk/precache/DownloadManager$FileWorkerThread;

    move-object v0, v7

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/ironsource/sdk/precache/DownloadManager$FileWorkerThread;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    return-object v7
.end method

.method getMessage()Landroid/os/Message;
    .locals 1

    .line 226
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    return-object v0
.end method

.method guessFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 212
    iget-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/ironsource/sdk/utils/SDKUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method makeDir(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 230
    invoke-static {p1, p2}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->makeDir(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public run()V
    .locals 11

    .line 236
    new-instance v0, Lcom/ironsource/sdk/data/SSAFile;

    iget-object v1, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mFileName:Ljava/lang/String;

    iget-object v2, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mPath:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/ironsource/sdk/data/SSAFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    invoke-virtual {p0}, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->getMessage()Landroid/os/Message;

    move-result-object v1

    .line 239
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 240
    iget-object v2, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mCacheRootDirectory:Ljava/lang/String;

    iget-object v3, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mPath:Ljava/lang/String;

    invoke-virtual {p0, v2, v3}, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->makeDir(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/16 v2, 0x3f9

    if-nez v6, :cond_0

    .line 244
    iput v2, v1, Landroid/os/Message;->what:I

    const-string v2, "unable_to_create_folder"

    .line 245
    invoke-virtual {v0, v2}, Lcom/ironsource/sdk/data/SSAFile;->setErrMsg(Ljava/lang/String;)V

    .line 246
    iget-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mDownloadHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 250
    :cond_0
    iget-object v5, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mFile:Ljava/lang/String;

    .line 253
    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getFile()Ljava/lang/String;

    move-result-object v7

    iget-wide v8, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mConnectionRetries:J

    iget-object v10, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mTempFilesDirectory:Ljava/lang/String;

    move-object v4, p0

    .line 250
    invoke-virtual/range {v4 .. v10}, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->getFileWorkerThread(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)Lcom/ironsource/sdk/precache/DownloadManager$FileWorkerThread;

    move-result-object v3

    .line 257
    invoke-virtual {v3}, Lcom/ironsource/sdk/precache/DownloadManager$FileWorkerThread;->call()Lcom/ironsource/sdk/precache/DownloadManager$Result;

    move-result-object v3

    .line 258
    iget v3, v3, Lcom/ironsource/sdk/precache/DownloadManager$Result;->responseCode:I

    const/16 v4, 0xc8

    if-eq v3, v4, :cond_2

    const/16 v4, 0x194

    if-eq v3, v4, :cond_1

    const/16 v4, 0x3fa

    if-eq v3, v4, :cond_1

    const/16 v4, 0x3fb

    if-eq v3, v4, :cond_1

    packed-switch v3, :pswitch_data_0

    packed-switch v3, :pswitch_data_1

    goto :goto_0

    .line 273
    :cond_1
    :pswitch_0
    invoke-virtual {p0, v3}, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->convertErrorCodeToMessage(I)Ljava/lang/String;

    move-result-object v3

    .line 275
    iput v2, v1, Landroid/os/Message;->what:I

    .line 276
    invoke-virtual {v0, v3}, Lcom/ironsource/sdk/data/SSAFile;->setErrMsg(Ljava/lang/String;)V

    .line 277
    iget-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mDownloadHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :cond_2
    const/16 v0, 0x3f8

    .line 281
    iput v0, v1, Landroid/os/Message;->what:I

    .line 282
    iget-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;->mDownloadHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3ec
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x3f0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
