.class Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;
.super Ljava/lang/Object;
.source "CampaignDownloader.java"

# interfaces
.implements Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/downloader/CampaignDownloader;->startCoverImageDownload(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

.field final synthetic val$campaignId:Ljava/lang/String;

.field final synthetic val$coverImageUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/downloader/CampaignDownloader;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 144
    iput-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iput-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->val$campaignId:Ljava/lang/String;

    iput-object p3, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->val$coverImageUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadFinish(ZLjava/lang/String;Ljava/lang/Object;ILjava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_1

    .line 149
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 150
    invoke-static {p1}, Lcom/helpshift/util/ImageUtil;->isImageFileFormatSupported(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 151
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x3

    invoke-static {p1, p2}, Lcom/helpshift/util/ImageUtil;->scaleDownAndSave(Ljava/lang/String;I)V

    .line 152
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iget-object p1, p1, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->observer:Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;

    iget-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->val$campaignId:Ljava/lang/String;

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;->coverImageDownloadCompleted(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 156
    :cond_0
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 157
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iget-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->val$coverImageUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->disableCorruptImageRetry(Ljava/lang/String;)V

    .line 158
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iget-object p1, p1, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->observer:Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;

    iget-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->val$campaignId:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;->coverImageDownloadFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 162
    :cond_1
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iget-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->val$coverImageUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->decrementCorruptImageRetryCount(Ljava/lang/String;)V

    .line 163
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iget-object p1, p1, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->observer:Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;

    iget-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$3;->val$campaignId:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;->coverImageDownloadFailed(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
