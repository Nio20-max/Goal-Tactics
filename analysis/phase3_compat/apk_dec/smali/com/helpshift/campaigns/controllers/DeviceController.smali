.class public Lcom/helpshift/campaigns/controllers/DeviceController;
.super Ljava/lang/Object;
.source "DeviceController.java"

# interfaces
.implements Lcom/helpshift/network/NetworkDataProvider;
.implements Lcom/helpshift/app/LifecycleListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "HelpshiftDebug"


# instance fields
.field private appInfoModel:Lcom/helpshift/model/AppInfoModel;

.field private campaignsPoller:Lcom/helpshift/campaigns/poller/CampaignsPoller;

.field private dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

.field public final deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

.field private sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

.field private switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

.field public final syncController:Lcom/helpshift/controllers/SyncController;

.field private syncSpecification:Lcom/helpshift/specifications/SyncSpecification;


# direct methods
.method protected constructor <init>(Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/controllers/SyncController;Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/specifications/SyncSpecification;Lcom/helpshift/model/SdkInfoModel;Lcom/helpshift/model/AppInfoModel;)V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    .line 68
    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    .line 69
    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    .line 70
    iput-object p5, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->syncSpecification:Lcom/helpshift/specifications/SyncSpecification;

    .line 71
    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    .line 72
    iput-object p6, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    .line 73
    iput-object p7, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    .line 75
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCampaignAppLifeCycleListener()Lcom/helpshift/app/CampaignAppLifeCycleListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 77
    invoke-virtual {p1, p0}, Lcom/helpshift/app/CampaignAppLifeCycleListener;->addLifecycleListener(Lcom/helpshift/app/LifecycleListener;)V

    .line 81
    :cond_0
    invoke-virtual {p4}, Lcom/helpshift/campaigns/models/DeviceModel;->getSyncingPropertiesUnsafe()Ljava/util/HashMap;

    move-result-object p1

    .line 82
    new-instance p2, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 83
    sget-object p1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-virtual {p4, p1, p2}, Lcom/helpshift/campaigns/models/DeviceModel;->setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V

    return-void
.end method

.method private makeRequestForProperties(Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Ljava/lang/String;)Lcom/helpshift/network/request/Request;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;",
            "Lcom/helpshift/network/response/Response$Listener<",
            "Lorg/json/JSONArray;",
            ">;",
            "Lcom/helpshift/network/response/Response$ErrorListener;",
            "Ljava/lang/String;",
            ")",
            "Lcom/helpshift/network/request/Request;"
        }
    .end annotation

    .line 158
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 162
    :cond_0
    invoke-static {p1}, Lcom/helpshift/util/HSJSONUtils;->fromNestedMap(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    .line 163
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 164
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    const-string v2, "did"

    invoke-virtual {v4, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "uid"

    .line 165
    invoke-virtual {v4, v1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p4

    const-string v0, "p"

    invoke-virtual {v4, v0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    iget-object p4, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    sget-object v0, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p4, v0, v1}, Lcom/helpshift/campaigns/models/DeviceModel;->setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V

    .line 169
    new-instance p1, Lcom/helpshift/network/request/Request;

    const/4 v2, 0x1

    new-instance v7, Lcom/helpshift/network/response/JsonArrayResponseParser;

    invoke-direct {v7}, Lcom/helpshift/network/response/JsonArrayResponseParser;-><init>()V

    const-string v3, "/ma/dp/"

    move-object v1, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/network/request/Request;-><init>(ILjava/lang/String;Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Lcom/helpshift/network/response/ResponseParser;)V

    return-object p1
.end method


# virtual methods
.method public getDeviceInfoForPushAnalytics()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 224
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 225
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    const-string v2, "np"

    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getPropertyValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "p"

    .line 227
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    :cond_0
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    const-string v2, "cc"

    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getPropertyValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 231
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    :cond_1
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    const-string v2, "ln"

    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getPropertyValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 235
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    :cond_2
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v2, "did"

    .line 239
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    :cond_3
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    const-string v2, "os"

    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getPropertyValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    const-string v2, "osv"

    .line 243
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    :cond_4
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    const-string v2, "dm"

    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getPropertyValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 247
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    :cond_5
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    const-string v2, "av"

    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getPropertyValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 251
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    return-object v0
.end method

.method public getRequest()Lcom/helpshift/network/request/Request;
    .locals 5

    .line 96
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->getUnsyncedProperties()Ljava/util/HashMap;

    move-result-object v0

    .line 97
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 98
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 100
    new-instance v3, Lcom/helpshift/campaigns/controllers/DeviceController$1;

    invoke-direct {v3, p0, p0, v2, v1}, Lcom/helpshift/campaigns/controllers/DeviceController$1;-><init>(Lcom/helpshift/campaigns/controllers/DeviceController;Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 107
    new-instance v4, Lcom/helpshift/campaigns/controllers/DeviceController$2;

    invoke-direct {v4, p0, p0, v2}, Lcom/helpshift/campaigns/controllers/DeviceController$2;-><init>(Lcom/helpshift/campaigns/controllers/DeviceController;Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;)V

    .line 113
    invoke-direct {p0, v0, v3, v4, v1}, Lcom/helpshift/campaigns/controllers/DeviceController;->makeRequestForProperties(Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Ljava/lang/String;)Lcom/helpshift/network/request/Request;

    move-result-object v0

    return-object v0
.end method

.method public getRequestWithFullData()Lcom/helpshift/network/request/Request;
    .locals 6

    .line 119
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->getSyncedAndUnSyncedProperties()Ljava/util/HashMap;

    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 124
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getUnsyncedProperties()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 125
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 126
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v3

    iget-object v3, v3, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v3

    iget-object v3, v3, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 129
    new-instance v4, Lcom/helpshift/campaigns/controllers/DeviceController$3;

    invoke-direct {v4, p0, p0, v2, v3}, Lcom/helpshift/campaigns/controllers/DeviceController$3;-><init>(Lcom/helpshift/campaigns/controllers/DeviceController;Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 136
    new-instance v5, Lcom/helpshift/campaigns/controllers/DeviceController$4;

    invoke-direct {v5, p0, v2, v1, p0}, Lcom/helpshift/campaigns/controllers/DeviceController$4;-><init>(Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/helpshift/campaigns/controllers/DeviceController;)V

    .line 147
    invoke-direct {p0, v0, v4, v5, v3}, Lcom/helpshift/campaigns/controllers/DeviceController;->makeRequestForProperties(Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Ljava/lang/String;)Lcom/helpshift/network/request/Request;

    move-result-object v0

    return-object v0
.end method

.method handlePropertySyncFailure(Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Lcom/helpshift/network/errors/NetworkError;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/campaigns/controllers/DeviceController;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/helpshift/network/errors/NetworkError;",
            ")V"
        }
    .end annotation

    .line 215
    iget-object v0, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    sget-object v1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-virtual {v0, v1, p2}, Lcom/helpshift/campaigns/models/DeviceModel;->setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V

    .line 216
    iget-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    invoke-interface {p2}, Lcom/helpshift/controllers/DataSyncCoordinator;->isFirstDeviceSyncComplete()Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->syncSpecification:Lcom/helpshift/specifications/SyncSpecification;

    instance-of v0, p2, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;

    if-eqz v0, :cond_0

    .line 218
    check-cast p2, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;

    invoke-virtual {p2}, Lcom/helpshift/specifications/DecayingIntervalSyncSpecification;->decayElapsedTimeThreshold()V

    .line 220
    :cond_0
    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string p2, "data_type_device"

    invoke-virtual {p1, p2, p3}, Lcom/helpshift/controllers/SyncController;->dataSyncFailed(Ljava/lang/String;Lcom/helpshift/network/errors/NetworkError;)V

    return-void
.end method

.method handlePropertySyncSuccess(Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Ljava/lang/String;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/campaigns/controllers/DeviceController;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 179
    iget-object v0, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/helpshift/model/SdkInfoModel;->setDevicePropertiesSyncImmediately(Ljava/lang/Boolean;)V

    .line 180
    iget-object v0, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string v2, "data_type_device"

    invoke-virtual {v0, v2, p4}, Lcom/helpshift/controllers/SyncController;->dataSynced(Ljava/lang/String;Z)V

    .line 181
    iget-object p4, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {p4, p2}, Lcom/helpshift/campaigns/models/DeviceModel;->checkAndMarkPropertiesAsSynced(Ljava/util/List;)V

    .line 182
    iget-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    iget-object p4, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    .line 183
    invoke-virtual {p4}, Lcom/helpshift/campaigns/models/DeviceModel;->getUnsyncedProperties()Ljava/util/HashMap;

    move-result-object p4

    invoke-virtual {p4}, Ljava/util/HashMap;->size()I

    move-result p4

    .line 182
    invoke-virtual {p2, v2, p4}, Lcom/helpshift/controllers/SyncController;->setDataChangeCount(Ljava/lang/String;I)V

    .line 184
    iget-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    invoke-interface {p2}, Lcom/helpshift/controllers/DataSyncCoordinator;->isFirstDeviceSyncComplete()Z

    move-result p2

    if-nez p2, :cond_1

    .line 185
    iget-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    invoke-interface {p2}, Lcom/helpshift/controllers/DataSyncCoordinator;->firstDeviceSyncComplete()V

    .line 192
    iget-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    invoke-virtual {p2, p3}, Lcom/helpshift/campaigns/controllers/SwitchUserController;->doneSwitch(Ljava/lang/String;)V

    .line 199
    iget-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {p2}, Lcom/helpshift/model/SdkInfoModel;->getUserIdSyncedWithBackend()Ljava/lang/String;

    move-result-object p2

    .line 200
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_0

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_0

    .line 201
    iget-object p4, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    invoke-virtual {p4, p3, p2}, Lcom/helpshift/campaigns/controllers/SwitchUserController;->requestSwitch(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    :cond_0
    new-instance p2, Lcom/helpshift/specifications/DailyFrequencyBasedSyncSpecification;

    const/4 p3, 0x4

    invoke-direct {p2, p3, v2}, Lcom/helpshift/specifications/DailyFrequencyBasedSyncSpecification;-><init>(ILjava/lang/String;)V

    iput-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->syncSpecification:Lcom/helpshift/specifications/SyncSpecification;

    .line 207
    iget-object p2, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    iget-object p3, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->syncSpecification:Lcom/helpshift/specifications/SyncSpecification;

    invoke-virtual {p2, p3}, Lcom/helpshift/controllers/SyncController;->addSpecification(Lcom/helpshift/specifications/SyncSpecification;)V

    .line 208
    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 p2, 0x1

    new-array p2, p2, [Lcom/helpshift/listeners/SyncListener;

    .line 209
    invoke-static {}, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->getInstance()Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->devicePropertiesNetworkManager:Lcom/helpshift/campaigns/network/DevicePropertiesNetworkManager;

    aput-object p3, p2, v1

    invoke-virtual {p1, p2}, Lcom/helpshift/controllers/SyncController;->addSyncListeners([Lcom/helpshift/listeners/SyncListener;)V

    :cond_1
    return-void
.end method

.method public onBackground()V
    .locals 2

    .line 303
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/model/SdkInfoModel;->setFirstLaunch(Ljava/lang/Boolean;)V

    .line 304
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->campaignsPoller:Lcom/helpshift/campaigns/poller/CampaignsPoller;

    if-eqz v0, :cond_0

    .line 305
    invoke-virtual {v0}, Lcom/helpshift/campaigns/poller/CampaignsPoller;->shutdown()V

    :cond_0
    return-void
.end method

.method public onForeground()V
    .locals 3

    .line 267
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->rescanDevice()V

    .line 268
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->getUnsyncedProperties()Ljava/util/HashMap;

    move-result-object v0

    .line 269
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 270
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    const-string v2, "data_type_device"

    invoke-virtual {v1, v2, v0}, Lcom/helpshift/controllers/SyncController;->setDataChangeCount(Ljava/lang/String;I)V

    .line 272
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    iget-object v0, v0, Lcom/helpshift/model/AppInfoModel;->enableInboxPolling:Ljava/lang/Boolean;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 274
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 275
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->campaignsPoller:Lcom/helpshift/campaigns/poller/CampaignsPoller;

    if-nez v0, :cond_1

    .line 276
    new-instance v0, Lcom/helpshift/campaigns/poller/CampaignsPoller;

    invoke-static {}, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->getInstance()Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->inboxNetworkManager:Lcom/helpshift/campaigns/network/InboxNetworkManager;

    invoke-direct {v0, v1}, Lcom/helpshift/campaigns/poller/CampaignsPoller;-><init>(Ljava/util/concurrent/Callable;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->campaignsPoller:Lcom/helpshift/campaigns/poller/CampaignsPoller;

    .line 277
    invoke-virtual {v0}, Lcom/helpshift/campaigns/poller/CampaignsPoller;->start()V

    goto :goto_0

    .line 280
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/DeviceController;->resetPoller()V

    :goto_0
    const/4 v1, 0x1

    .line 285
    :cond_2
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v0}, Lcom/helpshift/model/SdkInfoModel;->getFirstLaunch()Ljava/lang/Boolean;

    move-result-object v0

    .line 287
    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v2}, Lcom/helpshift/model/SdkInfoModel;->getOneCampaignFetchSuccessful()Ljava/lang/Boolean;

    move-result-object v2

    if-nez v1, :cond_5

    if-eqz v0, :cond_3

    .line 289
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_3
    if-eqz v2, :cond_5

    .line 290
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_5

    .line 293
    :cond_4
    :try_start_0
    invoke-static {}, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->getInstance()Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->inboxNetworkManager:Lcom/helpshift/campaigns/network/InboxNetworkManager;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/network/InboxNetworkManager;->fetchCampaigns()Ljava/util/concurrent/Future;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "HelpshiftDebug"

    const-string v2, "Exception while fetching campaigns"

    .line 296
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    :goto_1
    return-void
.end method

.method public resetPoller()V
    .locals 2

    .line 310
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->campaignsPoller:Lcom/helpshift/campaigns/poller/CampaignsPoller;

    if-eqz v0, :cond_0

    .line 311
    invoke-virtual {v0}, Lcom/helpshift/campaigns/poller/CampaignsPoller;->shutdown()V

    .line 312
    new-instance v0, Lcom/helpshift/campaigns/poller/CampaignsPoller;

    invoke-static {}, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->getInstance()Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->inboxNetworkManager:Lcom/helpshift/campaigns/network/InboxNetworkManager;

    invoke-direct {v0, v1}, Lcom/helpshift/campaigns/poller/CampaignsPoller;-><init>(Ljava/util/concurrent/Callable;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->campaignsPoller:Lcom/helpshift/campaigns/poller/CampaignsPoller;

    .line 313
    invoke-virtual {v0}, Lcom/helpshift/campaigns/poller/CampaignsPoller;->start()V

    :cond_0
    return-void
.end method

.method public setBatchSize(Ljava/lang/Integer;)V
    .locals 0

    return-void
.end method

.method public setDevelopmentPlatform(Ljava/lang/String;)V
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/models/DeviceModel;->setDevelopmentPlatform(Ljava/lang/String;)V

    return-void
.end method

.method public setPushToken(Ljava/lang/String;)V
    .locals 2

    .line 257
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/models/DeviceModel;->setPushToken(Ljava/lang/String;)V

    .line 258
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/DeviceController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string v0, "data_type_device"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/helpshift/controllers/SyncController;->incrementDataChangeCount(Ljava/lang/String;I)V

    return-void
.end method
