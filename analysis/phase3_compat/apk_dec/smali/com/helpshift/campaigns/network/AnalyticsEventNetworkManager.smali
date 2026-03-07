.class public Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;
.super Lcom/helpshift/listeners/SyncListener;
.source "AnalyticsEventNetworkManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_AENewtork"


# instance fields
.field private connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

.field private dataProvider:Lcom/helpshift/network/NetworkDataProvider;

.field private dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

.field private requestQueue:Lcom/helpshift/network/request/RequestQueue;

.field private userController:Lcom/helpshift/campaigns/controllers/UserController;


# direct methods
.method public constructor <init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/network/request/RequestQueue;Lcom/helpshift/util/ConnectivityUtil;)V
    .locals 2

    const-string v0, "data_type_analytics_event"

    .line 28
    invoke-direct {p0, v0}, Lcom/helpshift/listeners/SyncListener;-><init>(Ljava/lang/String;)V

    .line 29
    iput-object p1, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    .line 30
    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/helpshift/listeners/SyncListener;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-virtual {p1, v0}, Lcom/helpshift/controllers/SyncController;->addSyncListeners([Lcom/helpshift/listeners/SyncListener;)V

    .line 31
    iput-object p2, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    .line 32
    iput-object p3, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    .line 33
    iput-object p4, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    .line 34
    iput-object p5, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

    return-void
.end method


# virtual methods
.method public isFullSyncEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public sync()V
    .locals 3

    .line 44
    iget-object v0, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    iget-object v1, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/controllers/DataSyncCoordinator;->canSyncUserProperties(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    iget-object v1, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

    invoke-virtual {v1}, Lcom/helpshift/util/ConnectivityUtil;->getBatchSize()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/network/NetworkDataProvider;->setBatchSize(Ljava/lang/Integer;)V

    .line 46
    iget-object v0, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    invoke-interface {v0}, Lcom/helpshift/network/NetworkDataProvider;->getRequest()Lcom/helpshift/network/request/Request;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "Helpshift_AENewtork"

    const-string v2, "Syncing analytics events properties"

    .line 48
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    iget-object v1, p0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/helpshift/network/request/RequestQueue;->add(Lcom/helpshift/network/request/Request;)Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method
