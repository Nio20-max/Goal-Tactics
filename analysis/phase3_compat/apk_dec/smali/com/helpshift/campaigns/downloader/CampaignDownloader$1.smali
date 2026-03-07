.class Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;
.super Ljava/lang/Object;
.source "CampaignDownloader.java"

# interfaces
.implements Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/downloader/CampaignDownloader;->startCampaignDownload(Lcom/helpshift/campaigns/models/CampaignSyncModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

.field final synthetic val$newCampaign:Lcom/helpshift/campaigns/models/CampaignSyncModel;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/downloader/CampaignDownloader;Lcom/helpshift/campaigns/models/CampaignSyncModel;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iput-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;->val$newCampaign:Lcom/helpshift/campaigns/models/CampaignSyncModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadFinish(ZLjava/lang/String;Ljava/lang/Object;ILjava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 86
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iget-object p1, p1, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->observer:Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;

    iget-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;->val$newCampaign:Lcom/helpshift/campaigns/models/CampaignSyncModel;

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;->campaignDownloadCompleted(Lcom/helpshift/campaigns/models/CampaignSyncModel;Ljava/lang/String;)V

    goto :goto_0

    .line 89
    :cond_0
    iget-object p1, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;->this$0:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    iget-object p1, p1, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->observer:Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;

    iget-object p2, p0, Lcom/helpshift/campaigns/downloader/CampaignDownloader$1;->val$newCampaign:Lcom/helpshift/campaigns/models/CampaignSyncModel;

    iget-object p2, p2, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;->campaignDownloadFailed(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
