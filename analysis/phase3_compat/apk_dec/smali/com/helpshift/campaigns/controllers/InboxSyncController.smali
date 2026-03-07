.class public Lcom/helpshift/campaigns/controllers/InboxSyncController;
.super Ljava/lang/Object;
.source "InboxSyncController.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;
.implements Lcom/helpshift/app/LifecycleListener;
.implements Lcom/helpshift/network/NetworkDataProvider;


# static fields
.field private static final CURSOR_KEY_PREFIX:Ljava/lang/String; = "hs__campaigns_inbox_cursor"

.field private static final TAG:Ljava/lang/String; = "Helpshift_ISControl"


# instance fields
.field private campaignDownloader:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

.field private campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

.field keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

.field syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

.field private userController:Lcom/helpshift/campaigns/controllers/UserController;


# direct methods
.method public constructor <init>(Lcom/helpshift/campaigns/storage/CampaignStorage;Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/storage/KeyValueStorage;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 46
    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    .line 47
    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    .line 48
    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    .line 50
    new-instance p1, Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    invoke-direct {p1, p0}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;-><init>(Lcom/helpshift/campaigns/observers/CampaignDownloadObserver;)V

    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignDownloader:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    .line 51
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    invoke-interface {p2, p1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->addObserver(Lcom/helpshift/campaigns/observers/CampaignSyncModelStorageObserver;)V

    .line 52
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignDownloader:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    invoke-interface {p1, p2}, Lcom/helpshift/campaigns/storage/CampaignStorage;->addObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    .line 53
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    invoke-virtual {p3}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object p2

    iget-object p2, p2, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->cleanUpSyncingModels(Ljava/lang/String;)V

    .line 54
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCampaignAppLifeCycleListener()Lcom/helpshift/app/CampaignAppLifeCycleListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 56
    invoke-virtual {p1, p0}, Lcom/helpshift/app/CampaignAppLifeCycleListener;->addLifecycleListener(Lcom/helpshift/app/LifecycleListener;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public campaignDownloadCompleted(Lcom/helpshift/campaigns/models/CampaignSyncModel;Ljava/lang/String;)V
    .locals 7

    .line 68
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 69
    new-instance p2, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    iget-object v1, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    iget-wide v3, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->timeStamp:J

    iget-wide v5, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    move-object v0, p2

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/campaigns/models/CampaignDetailModel;-><init>(Ljava/lang/String;Lorg/json/JSONObject;JJ)V

    .line 73
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    iget-object v1, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->markCampaignAsSynced(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p2}, Lcom/helpshift/campaigns/storage/CampaignStorage;->addCampaign(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V

    .line 75
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object p2

    iget-object p2, p2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    sget-object v0, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->DELIVERY:Ljava/lang/Integer;

    iget-object p1, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    const/4 v1, 0x0

    .line 76
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p2, v0, p1, v1}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_ISControl"

    const-string v0, "Exception while parsing json string of campaign detail object"

    .line 79
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public campaignDownloadFailed(Ljava/lang/String;)V
    .locals 2

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Campaign download failed : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ISControl"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, p1, v1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->markCampaignAsUnSynced(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public campaignDownloadStarted(Ljava/lang/String;)V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, p1, v1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->markCampaignAsSyncing(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public coverImageDownloadCompleted(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Campaign cover image download complete : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", File path : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ISControl"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/campaigns/storage/CampaignStorage;->updateCampaignWIthCoverImageFilePath(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public coverImageDownloadFailed(Ljava/lang/String;)V
    .locals 2

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Campaign cover image download failed : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Helpshift_ISControl"

    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public getRequest()Lcom/helpshift/network/request/Request;
    .locals 8

    .line 142
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 143
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    const-string v1, "did"

    invoke-virtual {v3, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    const-string/jumbo v1, "uid"

    .line 145
    invoke-virtual {v3, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "hs__campaigns_inbox_cursor"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 147
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "cursor"

    .line 148
    invoke-virtual {v3, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    :cond_0
    new-instance v4, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;

    invoke-direct {v4, p0, v0}, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;-><init>(Lcom/helpshift/campaigns/controllers/InboxSyncController;Ljava/lang/String;)V

    .line 186
    new-instance v5, Lcom/helpshift/campaigns/controllers/InboxSyncController$2;

    invoke-direct {v5, p0}, Lcom/helpshift/campaigns/controllers/InboxSyncController$2;-><init>(Lcom/helpshift/campaigns/controllers/InboxSyncController;)V

    .line 192
    new-instance v7, Lcom/helpshift/network/request/Request;

    const/4 v1, 0x0

    new-instance v6, Lcom/helpshift/network/response/JsonObjectResponseParser;

    invoke-direct {v6}, Lcom/helpshift/network/response/JsonObjectResponseParser;-><init>()V

    const-string v2, "/ma/inbox/"

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/network/request/Request;-><init>(ILjava/lang/String;Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Lcom/helpshift/network/response/ResponseParser;)V

    return-object v7
.end method

.method public getRequestWithFullData()Lcom/helpshift/network/request/Request;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public iconImageDownloadCompleted(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Campaign icon image download complete : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ISControl"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/campaigns/storage/CampaignStorage;->updateCampaignWithIconImageFilePath(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public iconImageDownloadFailed(Ljava/lang/String;)V
    .locals 2

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Campaign icon download failed : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Helpshift_ISControl"

    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onBackground()V
    .locals 0

    return-void
.end method

.method public onForeground()V
    .locals 4

    .line 117
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    .line 118
    invoke-virtual {v1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->getAllUnsyncedCampaigns(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 119
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    const-string v2, "Helpshift_ISControl"

    const-string v3, "Starting unsynced campaign download"

    .line 120
    invoke-static {v2, v3}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignDownloader:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    invoke-virtual {v2, v1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->startCampaignDownload(Lcom/helpshift/campaigns/models/CampaignSyncModel;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public resetCorruptImageDownloadRetryCount(Ljava/lang/String;)V
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignDownloader:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->enableCorruptImageRetry(Ljava/lang/String;)V

    return-void
.end method

.method public setBatchSize(Ljava/lang/Integer;)V
    .locals 0

    return-void
.end method

.method public startCoverImageDownload(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Campaign cover image download start : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", URL : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ISControl"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignDownloader:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->startCoverImageDownload(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public startIconImageDownload(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Campaign icon image download start : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", URL : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ISControl"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController;->campaignDownloader:Lcom/helpshift/campaigns/downloader/CampaignDownloader;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/downloader/CampaignDownloader;->startIconImageDownload(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
