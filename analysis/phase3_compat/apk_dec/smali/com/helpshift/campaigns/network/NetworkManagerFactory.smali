.class public Lcom/helpshift/campaigns/network/NetworkManagerFactory;
.super Ljava/lang/Object;
.source "NetworkManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/campaigns/network/NetworkManagerFactory$LazyHolder;
    }
.end annotation


# instance fields
.field private analyticsEventNetworkManager:Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;

.field public devicePropertiesNetworkManager:Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;

.field public inboxNetworkManager:Lcom/helpshift/campaigns/network/InboxNetworkManager;

.field private sessionNetworkManager:Lcom/helpshift/campaigns/network/SessionNetworkManager;

.field private switchUserNetworkManager:Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;

.field private userPropertiesNetworkManager:Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;


# direct methods
.method constructor <init>()V
    .locals 10

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 28
    new-instance v1, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v2, "cmdat-sy"

    invoke-direct {v1, v2}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    .line 29
    new-instance v2, Lcom/helpshift/network/BasicNetwork;

    new-instance v3, Lcom/helpshift/network/HurlStack;

    invoke-direct {v3}, Lcom/helpshift/network/HurlStack;-><init>()V

    invoke-direct {v2, v3}, Lcom/helpshift/network/BasicNetwork;-><init>(Lcom/helpshift/network/HttpStack;)V

    sget-object v3, Lcom/helpshift/network/request/RequestQueue$DeliveryType;->ON_NEW_THREAD:Ljava/lang/Integer;

    invoke-static {v2, v3, v1}, Lcom/helpshift/network/request/RequestManager;->newRequestQueue(Lcom/helpshift/network/Network;Ljava/lang/Integer;Ljava/util/concurrent/ExecutorService;)Lcom/helpshift/network/request/RequestQueue;

    move-result-object v1

    .line 33
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v2

    .line 35
    new-instance v3, Lcom/helpshift/util/ConnectivityUtil;

    const/4 v4, 0x4

    const/16 v5, 0x8

    invoke-direct {v3, v0, v4, v5}, Lcom/helpshift/util/ConnectivityUtil;-><init>(Landroid/content/Context;II)V

    .line 36
    new-instance v0, Lcom/helpshift/campaigns/network/SessionNetworkManager;

    iget-object v5, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->sessionController:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object v6, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    .line 38
    invoke-static {}, Lcom/helpshift/controllers/ControllerFactory;->getInstance()Lcom/helpshift/controllers/ControllerFactory;

    move-result-object v4

    iget-object v7, v4, Lcom/helpshift/controllers/ControllerFactory;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    move-object v4, v0

    move-object v8, v1

    move-object v9, v3

    invoke-direct/range {v4 .. v9}, Lcom/helpshift/campaigns/network/SessionNetworkManager;-><init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/network/request/RequestQueue;Lcom/helpshift/util/ConnectivityUtil;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->sessionNetworkManager:Lcom/helpshift/campaigns/network/SessionNetworkManager;

    .line 42
    new-instance v0, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;

    iget-object v4, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    invoke-direct {v0, v4, v1}, Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;-><init>(Lcom/helpshift/campaigns/controllers/DeviceController;Lcom/helpshift/network/request/RequestQueue;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->devicePropertiesNetworkManager:Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;

    .line 45
    new-instance v0, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;

    iget-object v4, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    .line 47
    invoke-static {}, Lcom/helpshift/controllers/ControllerFactory;->getInstance()Lcom/helpshift/controllers/ControllerFactory;

    move-result-object v5

    iget-object v5, v5, Lcom/helpshift/controllers/ControllerFactory;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    invoke-direct {v0, v4, v5, v1, v3}, Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;-><init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/network/request/RequestQueue;Lcom/helpshift/util/ConnectivityUtil;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->userPropertiesNetworkManager:Lcom/helpshift/campaigns/network/UserPropertiesNetworkManager;

    .line 51
    new-instance v0, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;

    iget-object v4, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    .line 52
    invoke-static {}, Lcom/helpshift/controllers/ControllerFactory;->getInstance()Lcom/helpshift/controllers/ControllerFactory;

    move-result-object v5

    iget-object v5, v5, Lcom/helpshift/controllers/ControllerFactory;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    invoke-direct {v0, v4, v5, v1, v3}, Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;-><init>(Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/network/request/RequestQueue;Lcom/helpshift/util/ConnectivityUtil;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->switchUserNetworkManager:Lcom/helpshift/campaigns/network/SwitchUserNetworkManager;

    .line 56
    new-instance v0, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;

    iget-object v5, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    .line 58
    invoke-static {}, Lcom/helpshift/controllers/ControllerFactory;->getInstance()Lcom/helpshift/controllers/ControllerFactory;

    move-result-object v4

    iget-object v6, v4, Lcom/helpshift/controllers/ControllerFactory;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    iget-object v7, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    move-object v4, v0

    invoke-direct/range {v4 .. v9}, Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;-><init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/network/request/RequestQueue;Lcom/helpshift/util/ConnectivityUtil;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->analyticsEventNetworkManager:Lcom/helpshift/campaigns/network/AnalyticsEventNetworkManager;

    .line 63
    new-instance v0, Lcom/helpshift/campaigns/network/InboxNetworkManager;

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    invoke-direct {v0, v2, v1}, Lcom/helpshift/campaigns/network/InboxNetworkManager;-><init>(Lcom/helpshift/campaigns/controllers/InboxSyncController;Lcom/helpshift/network/request/RequestQueue;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->inboxNetworkManager:Lcom/helpshift/campaigns/network/InboxNetworkManager;

    return-void
.end method

.method public static getInstance()Lcom/helpshift/campaigns/network/NetworkManagerFactory;
    .locals 1

    .line 68
    sget-object v0, Lcom/helpshift/campaigns/network/NetworkManagerFactory$LazyHolder;->INSTANCE:Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    return-object v0
.end method
