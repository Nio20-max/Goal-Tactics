.class public Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;
.super Lcom/helpshift/listeners/SyncListener;
.source "DevicePropertiesNetworkManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_DPNetwork"


# instance fields
.field private dataProvider:Lcom/helpshift/network/NetworkDataProvider;

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
.method protected constructor <init>(Lcom/helpshift/campaigns/controllers/DeviceController;Lcom/helpshift/network/request/RequestQueue;)V
    .locals 3

    const-string v0, "data_type_device"

    .line 23
    invoke-direct {p0, v0}, Lcom/helpshift/listeners/SyncListener;-><init>(Ljava/lang/String;)V

    .line 24
    iget-object v0, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/helpshift/listeners/SyncListener;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1}, Lcom/helpshift/controllers/SyncController;->addSyncListeners([Lcom/helpshift/listeners/SyncListener;)V

    .line 25
    iput-object p1, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    .line 26
    iput-object p2, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    .line 27
    invoke-direct {p0}, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->initDependentChildDataTypesSet()V

    return-void
.end method

.method private initDependentChildDataTypesSet()V
    .locals 2

    .line 31
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->dependentChildDataTypes:Ljava/util/Set;

    const-string v1, "data_type_switch_user"

    .line 32
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 33
    iget-object v0, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->dependentChildDataTypes:Ljava/util/Set;

    const-string v1, "data_type_analytics_event"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 34
    iget-object v0, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->dependentChildDataTypes:Ljava/util/Set;

    const-string v1, "data_type_user"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public fullSync()V
    .locals 3

    .line 57
    iget-object v0, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    invoke-interface {v0}, Lcom/helpshift/network/NetworkDataProvider;->getRequestWithFullData()Lcom/helpshift/network/request/Request;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "Helpshift_DPNetwork"

    const-string v2, "Full sync device properties"

    .line 59
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    iget-object v1, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/helpshift/network/request/RequestQueue;->add(Lcom/helpshift/network/request/Request;)Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method

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

    .line 44
    iget-object v0, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->dependentChildDataTypes:Ljava/util/Set;

    return-object v0
.end method

.method public isFullSyncEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public sync()V
    .locals 3

    .line 48
    iget-object v0, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    invoke-interface {v0}, Lcom/helpshift/network/NetworkDataProvider;->getRequest()Lcom/helpshift/network/request/Request;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "Helpshift_DPNetwork"

    const-string v2, "Syncing device properties"

    .line 50
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    iget-object v1, p0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/helpshift/network/request/RequestQueue;->add(Lcom/helpshift/network/request/Request;)Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method
