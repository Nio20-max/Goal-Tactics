.class public Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;
.super Lcom/helpshift/listeners/SyncListener;
.source "SwitchUserNetworkManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SUNetwork"


# instance fields
.field private connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

.field private dataProvider:Lcom/helpshift/network/NetworkDataProvider;

.field private dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

.field private dependentChildDataTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private requestQueue:Lcom/helpshift/network/request/RequestQueue;


# direct methods
.method protected constructor <init>(Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/network/request/RequestQueue;Lcom/helpshift/util/ConnectivityUtil;)V
    .locals 3

    const-string v0, "data_type_switch_user"

    .line 30
    invoke-direct {p0, v0}, Lcom/helpshift/listeners/SyncListener;-><init>(Ljava/lang/String;)V

    .line 31
    iget-object v0, p1, Lcom/helpshift/campaigns/controllers/SwitchUserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/helpshift/listeners/SyncListener;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1}, Lcom/helpshift/controllers/SyncController;->addSyncListeners([Lcom/helpshift/listeners/SyncListener;)V

    .line 32
    iput-object p1, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    .line 33
    iput-object p2, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    .line 34
    iput-object p3, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    .line 35
    iput-object p4, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

    .line 36
    invoke-direct {p0}, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->initDependentChildDataTypesSet()V

    return-void
.end method

.method private initDependentChildDataTypesSet()V
    .locals 2

    .line 40
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->dependentChildDataTypes:Ljava/util/Set;

    const-string v1, "data_type_analytics_event"

    .line 41
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 42
    iget-object v0, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->dependentChildDataTypes:Ljava/util/Set;

    const-string v1, "data_type_user"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public getDependentChildDataTypes()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->dependentChildDataTypes:Ljava/util/Set;

    return-object v0
.end method

.method public isFullSyncEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public sync()V
    .locals 3

    .line 58
    iget-object v0, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    invoke-interface {v0}, Lcom/helpshift/controllers/DataSyncCoordinator;->isFirstDeviceSyncComplete()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    iget-object v1, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->connectivityUtil:Lcom/helpshift/util/ConnectivityUtil;

    invoke-virtual {v1}, Lcom/helpshift/util/ConnectivityUtil;->getBatchSize()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/network/NetworkDataProvider;->setBatchSize(Ljava/lang/Integer;)V

    .line 60
    iget-object v0, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    invoke-interface {v0}, Lcom/helpshift/network/NetworkDataProvider;->getRequest()Lcom/helpshift/network/request/Request;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "Helpshift_SUNetwork"

    const-string v2, "Syncing switch user"

    .line 62
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    iget-object v1, p0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/helpshift/network/request/RequestQueue;->add(Lcom/helpshift/network/request/Request;)Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method
