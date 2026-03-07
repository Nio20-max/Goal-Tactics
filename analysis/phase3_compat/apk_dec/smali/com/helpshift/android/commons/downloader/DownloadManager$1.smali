.class Lcom/helpshift/android/commons/downloader/DownloadManager$1;
.super Ljava/lang/Object;
.source "DownloadManager.java"

# interfaces
.implements Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/android/commons/downloader/DownloadManager;->getOnDownloadFinishListener(Lcom/helpshift/android/commons/downloader/DownloadConfig;)Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/android/commons/downloader/DownloadManager;

.field final synthetic val$downloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;


# direct methods
.method constructor <init>(Lcom/helpshift/android/commons/downloader/DownloadManager;Lcom/helpshift/android/commons/downloader/DownloadConfig;)V
    .locals 0

    .line 226
    iput-object p1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager$1;->this$0:Lcom/helpshift/android/commons/downloader/DownloadManager;

    iput-object p2, p0, Lcom/helpshift/android/commons/downloader/DownloadManager$1;->val$downloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadFinish(ZLjava/lang/String;Ljava/lang/Object;ILjava/lang/String;)V
    .locals 8

    if-eqz p1, :cond_0

    .line 230
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager$1;->val$downloadConfig:Lcom/helpshift/android/commons/downloader/DownloadConfig;

    iget-boolean v0, v0, Lcom/helpshift/android/commons/downloader/DownloadConfig;->writeToFile:Z

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager$1;->this$0:Lcom/helpshift/android/commons/downloader/DownloadManager;

    invoke-static {v0}, Lcom/helpshift/android/commons/downloader/DownloadManager;->access$000(Lcom/helpshift/android/commons/downloader/DownloadManager;)Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;

    move-result-object v0

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/helpshift/android/commons/downloader/storage/DownloadManagerCacheDbStorage;->insertFilePath(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/DownloadManager$1;->this$0:Lcom/helpshift/android/commons/downloader/DownloadManager;

    iget-object v0, v0, Lcom/helpshift/android/commons/downloader/DownloadManager;->activeDownloadFinishListeners:Ljava/util/concurrent/ConcurrentHashMap;

    .line 234
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 235
    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/DownloadManager$1;->this$0:Lcom/helpshift/android/commons/downloader/DownloadManager;

    iget-object v1, v1, Lcom/helpshift/android/commons/downloader/DownloadManager;->activeProgressChangeListeners:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v0, :cond_2

    .line 237
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 239
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 240
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;

    if-eqz v2, :cond_1

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move-object v7, p5

    .line 242
    invoke-interface/range {v2 .. v7}, Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;->onDownloadFinish(ZLjava/lang/String;Ljava/lang/Object;ILjava/lang/String;)V

    goto :goto_0

    :cond_2
    return-void
.end method
