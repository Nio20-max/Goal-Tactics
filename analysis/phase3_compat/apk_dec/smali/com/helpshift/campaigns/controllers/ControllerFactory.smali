.class public Lcom/helpshift/campaigns/controllers/ControllerFactory;
.super Ljava/lang/Object;
.source "ControllerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/campaigns/controllers/ControllerFactory$LazyHolder;
    }
.end annotation


# instance fields
.field public final analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

.field public final deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

.field public inboxApi:Lcom/helpshift/campaigns/Inbox;

.field public final inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

.field public final sessionController:Lcom/helpshift/campaigns/controllers/SessionController;

.field public final switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

.field public final userController:Lcom/helpshift/campaigns/controllers/UserController;


# direct methods
.method constructor <init>()V
    .locals 22

    move-object/from16 v0, p0

    .line 42
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    .line 45
    invoke-static {}, Lcom/helpshift/controllers/ControllerFactory;->getInstance()Lcom/helpshift/controllers/ControllerFactory;

    move-result-object v2

    iget-object v4, v2, Lcom/helpshift/controllers/ControllerFactory;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    .line 46
    invoke-static {}, Lcom/helpshift/controllers/ControllerFactory;->getInstance()Lcom/helpshift/controllers/ControllerFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/controllers/ControllerFactory;->syncController:Lcom/helpshift/controllers/SyncController;

    .line 47
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v3

    iget-object v12, v3, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    .line 48
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v3

    iget-object v10, v3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    .line 50
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v3

    iget-object v11, v3, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->propertyStorage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    .line 55
    new-instance v3, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v13, 0x5

    const-string v6, "data_type_switch_user"

    invoke-direct {v3, v13, v5, v6}, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;-><init>(ILjava/util/concurrent/TimeUnit;Ljava/lang/String;)V

    .line 57
    invoke-virtual {v2, v3}, Lcom/helpshift/controllers/SyncController;->addSpecification(Lcom/helpshift/specifications/SyncSpecification;)V

    .line 58
    new-instance v14, Lcom/helpshift/campaigns/controllers/SwitchUserController;

    invoke-direct {v14, v4, v2, v1, v12}, Lcom/helpshift/campaigns/controllers/SwitchUserController;-><init>(Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/controllers/SyncController;Lcom/helpshift/storage/KeyValueStorage;Lcom/helpshift/model/SdkInfoModel;)V

    iput-object v14, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    .line 63
    invoke-interface {v4}, Lcom/helpshift/controllers/DataSyncCoordinator;->isFirstDeviceSyncComplete()Z

    move-result v3

    const-string v5, "data_type_device"

    if-eqz v3, :cond_0

    .line 64
    new-instance v3, Lcom/helpshift/specifications/DailyFrequencyBasedSyncSpecification;

    const/4 v6, 0x4

    invoke-direct {v3, v6, v5}, Lcom/helpshift/specifications/DailyFrequencyBasedSyncSpecification;-><init>(ILjava/lang/String;)V

    goto :goto_0

    .line 68
    :cond_0
    new-instance v3, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {v3, v13, v6, v5}, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;-><init>(ILjava/util/concurrent/TimeUnit;Ljava/lang/String;)V

    :goto_0
    move-object v8, v3

    .line 72
    invoke-virtual {v2, v8}, Lcom/helpshift/controllers/SyncController;->addSpecification(Lcom/helpshift/specifications/SyncSpecification;)V

    .line 73
    new-instance v7, Lcom/helpshift/campaigns/models/DeviceModel;

    new-instance v3, Lcom/helpshift/campaigns/models/AndroidDevice;

    invoke-direct {v3}, Lcom/helpshift/campaigns/models/AndroidDevice;-><init>()V

    .line 74
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v5

    iget-object v5, v5, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->propertyStorage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    new-instance v6, Lcom/helpshift/util/concurrent/DispatchQueue;

    const/4 v15, 0x0

    invoke-direct {v6, v15}, Lcom/helpshift/util/concurrent/DispatchQueue;-><init>(Z)V

    invoke-direct {v7, v3, v5, v6}, Lcom/helpshift/campaigns/models/DeviceModel;-><init>(Lcom/helpshift/campaigns/models/Device;Lcom/helpshift/campaigns/storage/PropertyStorage;Lcom/helpshift/util/concurrent/DispatchQueue;)V

    .line 76
    invoke-virtual {v7}, Lcom/helpshift/campaigns/models/DeviceModel;->init()V

    .line 77
    new-instance v9, Lcom/helpshift/campaigns/controllers/DeviceController;

    move-object v3, v9

    move-object v5, v2

    move-object v6, v14

    move-object v15, v9

    move-object v9, v12

    invoke-direct/range {v3 .. v10}, Lcom/helpshift/campaigns/controllers/DeviceController;-><init>(Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/controllers/SyncController;Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/specifications/SyncSpecification;Lcom/helpshift/model/SdkInfoModel;Lcom/helpshift/model/AppInfoModel;)V

    iput-object v15, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    .line 85
    new-instance v3, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-string v5, "data_type_analytics_event"

    invoke-direct {v3, v13, v4, v5}, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;-><init>(ILjava/util/concurrent/TimeUnit;Ljava/lang/String;)V

    .line 87
    invoke-virtual {v2, v3}, Lcom/helpshift/controllers/SyncController;->addSpecification(Lcom/helpshift/specifications/SyncSpecification;)V

    .line 88
    new-instance v3, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    new-instance v4, Lcom/helpshift/util/concurrent/DispatchQueue;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/helpshift/util/concurrent/DispatchQueue;-><init>(Z)V

    invoke-direct {v3, v1, v4, v2}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;-><init>(Lcom/helpshift/storage/KeyValueStorage;Lcom/helpshift/util/concurrent/DispatchQueue;Lcom/helpshift/controllers/SyncController;)V

    iput-object v3, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    .line 93
    new-instance v3, Lcom/helpshift/specifications/GenericSyncSpecification;

    const/16 v17, 0x1

    const-wide/16 v18, 0x18

    sget-object v20, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-string v21, "data_type_session"

    move-object/from16 v16, v3

    invoke-direct/range {v16 .. v21}, Lcom/helpshift/specifications/GenericSyncSpecification;-><init>(IJLjava/util/concurrent/TimeUnit;Ljava/lang/String;)V

    .line 97
    invoke-virtual {v2, v3}, Lcom/helpshift/controllers/SyncController;->addSpecification(Lcom/helpshift/specifications/SyncSpecification;)V

    .line 98
    new-instance v7, Lcom/helpshift/campaigns/controllers/SessionController;

    new-instance v3, Lcom/helpshift/util/concurrent/DispatchQueue;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/helpshift/util/concurrent/DispatchQueue;-><init>(Z)V

    .line 100
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v4

    iget-object v4, v4, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->sessionStorage:Lcom/helpshift/campaigns/storage/SessionStorage;

    sget v5, Lcom/helpshift/common/domain/network/NetworkConstants;->DEFAULT_REQUEST_MAX_SIZE:I

    .line 101
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v7, v2, v3, v4, v5}, Lcom/helpshift/campaigns/controllers/SessionController;-><init>(Lcom/helpshift/controllers/SyncController;Lcom/helpshift/util/concurrent/DispatchQueue;Lcom/helpshift/campaigns/storage/SessionStorage;Ljava/lang/Integer;)V

    iput-object v7, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->sessionController:Lcom/helpshift/campaigns/controllers/SessionController;

    .line 103
    new-instance v3, Lcom/helpshift/specifications/GenericSyncSpecification;

    sget-object v20, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-string v21, "data_type_user"

    move-object/from16 v16, v3

    invoke-direct/range {v16 .. v21}, Lcom/helpshift/specifications/GenericSyncSpecification;-><init>(IJLjava/util/concurrent/TimeUnit;Ljava/lang/String;)V

    .line 107
    invoke-virtual {v2, v3}, Lcom/helpshift/controllers/SyncController;->addSpecification(Lcom/helpshift/specifications/SyncSpecification;)V

    .line 108
    new-instance v3, Lcom/helpshift/campaigns/controllers/UserController;

    new-instance v9, Lcom/helpshift/util/concurrent/DispatchQueue;

    const/4 v4, 0x0

    invoke-direct {v9, v4}, Lcom/helpshift/util/concurrent/DispatchQueue;-><init>(Z)V

    sget v4, Lcom/helpshift/common/domain/network/NetworkConstants;->DEFAULT_REQUEST_MAX_SIZE:I

    .line 113
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object v5, v3

    move-object v6, v2

    move-object v8, v14

    move-object v10, v11

    move-object v11, v4

    invoke-direct/range {v5 .. v12}, Lcom/helpshift/campaigns/controllers/UserController;-><init>(Lcom/helpshift/controllers/SyncController;Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/util/concurrent/DispatchQueue;Lcom/helpshift/campaigns/storage/PropertyStorage;Ljava/lang/Integer;Lcom/helpshift/model/SdkInfoModel;)V

    iput-object v3, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    .line 115
    new-instance v2, Lcom/helpshift/campaigns/controllers/InboxSyncController;

    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v4

    iget-object v4, v4, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 116
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v5

    iget-object v5, v5, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignSyncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    invoke-direct {v2, v4, v5, v3, v1}, Lcom/helpshift/campaigns/controllers/InboxSyncController;-><init>(Lcom/helpshift/campaigns/storage/CampaignStorage;Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/storage/KeyValueStorage;)V

    iput-object v2, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    return-void
.end method

.method public static getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;
    .locals 1

    .line 122
    sget-object v0, Lcom/helpshift/campaigns/controllers/ControllerFactory$LazyHolder;->INSTANCE:Lcom/helpshift/campaigns/controllers/ControllerFactory;

    return-object v0
.end method
