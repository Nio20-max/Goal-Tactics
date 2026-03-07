.class public Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;
.super Lcom/helpshift/listeners/SyncListener;
.source "UserPropertiesNetworkManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_UPNetwork"


# instance fields
.field private connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

.field private dataProvider:Lcom/helpshift/network/NetworkDataProvider;

.field private dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

.field private requestQueue:Lcom/helpshift/network/request/RequestQueue;


# direct methods
.method protected constructor <init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/network/request/RequestQueue;Lcom/helpshift/util/ConnectivityUtil;)V
    .locals 3

    const-string v0, "data_type_user"

    .line 25
    invoke-direct {p0, v0}, Lcom/helpshift/listeners/SyncListener;-><init>(Ljava/lang/String;)V

    .line 26
    iget-object v0, p1, Lcom/helpshift/campaigns/controllers/UserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/helpshift/listeners/SyncListener;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1}, Lcom/helpshift/controllers/SyncController;->addSyncListeners([Lcom/helpshift/listeners/SyncListener;)V

    .line 27
    iput-object p1, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    .line 28
    iput-object p2, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    .line 29
    iput-object p3, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    .line 30
    iput-object p4, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

    return-void
.end method

.method private shouldSync()Z
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    iget-object v1, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    check-cast v1, Lcom/helpshift/campaigns/controllers/UserController;

    .line 63
    invoke-virtual {v1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/controllers/DataSyncCoordinator;->canSyncUserProperties(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public fullSync()V
    .locals 3

    .line 51
    invoke-direct {p0}, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->shouldSync()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    iget-object v1, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

    invoke-virtual {v1}, Lcom/helpshift/util/ConnectivityUtil;->getBatchSize()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/network/NetworkDataProvider;->setBatchSize(Ljava/lang/Integer;)V

    .line 53
    iget-object v0, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    invoke-interface {v0}, Lcom/helpshift/network/NetworkDataProvider;->getRequestWithFullData()Lcom/helpshift/network/request/Request;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "Helpshift_UPNetwork"

    const-string v2, "Full sync user properties"

    .line 55
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v1, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/helpshift/network/request/RequestQueue;->add(Lcom/helpshift/network/request/Request;)Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method

.method public isFullSyncEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public sync()V
    .locals 3

    .line 39
    invoke-direct {p0}, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->shouldSync()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    iget-object v1, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

    invoke-virtual {v1}, Lcom/helpshift/util/ConnectivityUtil;->getBatchSize()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/network/NetworkDataProvider;->setBatchSize(Ljava/lang/Integer;)V

    .line 41
    iget-object v0, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    invoke-interface {v0}, Lcom/helpshift/network/NetworkDataProvider;->getRequest()Lcom/helpshift/network/request/Request;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "Helpshift_UPNetwork"

    const-string v2, "Syncing user properties"

    .line 43
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    iget-object v1, p0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/helpshift/network/request/RequestQueue;->add(Lcom/helpshift/network/request/Request;)Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method
