.class public Lcom/helpshift/campaigns/controllers/SwitchUserController;
.super Ljava/lang/Object;
.source "SwitchUserController.java"

# interfaces
.implements Lcom/helpshift/network/NetworkDataProvider;
.implements Lcom/helpshift/app/LifecycleListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SUControl"


# instance fields
.field currentUser:Ljava/lang/String;

.field private dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

.field private prevUser:Ljava/lang/String;

.field sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

.field private storage:Lcom/helpshift/storage/KeyValueStorage;

.field public final syncController:Lcom/helpshift/controllers/SyncController;


# direct methods
.method protected constructor <init>(Lcom/helpshift/controllers/DataSyncCoordinator;Lcom/helpshift/controllers/SyncController;Lcom/helpshift/storage/KeyValueStorage;Lcom/helpshift/model/SdkInfoModel;)V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 35
    iput-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    .line 51
    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->syncController:Lcom/helpshift/controllers/SyncController;

    .line 52
    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    .line 54
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCampaignAppLifeCycleListener()Lcom/helpshift/app/CampaignAppLifeCycleListener;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 56
    invoke-virtual {p2, p0}, Lcom/helpshift/app/CampaignAppLifeCycleListener;->addLifecycleListener(Lcom/helpshift/app/LifecycleListener;)V

    .line 58
    :cond_0
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    .line 59
    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    const-string p1, "__hs_switch_prev_user"

    .line 60
    invoke-interface {p3, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 61
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    const-string p3, "__hs_switch_current_user"

    invoke-interface {p2, p3}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    .line 62
    instance-of p3, p1, Ljava/lang/String;

    if-eqz p3, :cond_1

    .line 63
    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    .line 66
    :cond_1
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_2

    .line 67
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    :cond_2
    return-void
.end method


# virtual methods
.method public doneSwitch(Ljava/lang/String;)V
    .locals 3

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Switch user done : Id : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_SUControl"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, ""

    .line 78
    iput-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    .line 79
    iput-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 81
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    const-string v2, "__hs_switch_prev_user"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    const-string v2, "__hs_switch_current_user"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v1, v0}, Lcom/helpshift/storage/KeyValueStorage;->setKeyValues(Ljava/util/Map;)Z

    .line 84
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    invoke-interface {v0, p1}, Lcom/helpshift/controllers/DataSyncCoordinator;->switchUserComplete(Ljava/lang/String;)V

    return-void
.end method

.method public getRequest()Lcom/helpshift/network/request/Request;
    .locals 8

    .line 124
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    .line 125
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 127
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 129
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const-string v1, "did"

    .line 130
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    const-string/jumbo v1, "uid"

    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    const-string v1, "prev-uid"

    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    new-instance v0, Lcom/helpshift/network/request/Request;

    const/4 v2, 0x1

    new-instance v5, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;

    invoke-direct {v5, p0, p0}, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;-><init>(Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/campaigns/controllers/SwitchUserController;)V

    new-instance v6, Lcom/helpshift/campaigns/controllers/SwitchUserController$2;

    invoke-direct {v6, p0, p0}, Lcom/helpshift/campaigns/controllers/SwitchUserController$2;-><init>(Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/campaigns/controllers/SwitchUserController;)V

    new-instance v7, Lcom/helpshift/network/response/JsonArrayResponseParser;

    invoke-direct {v7}, Lcom/helpshift/network/response/JsonArrayResponseParser;-><init>()V

    const-string v3, "/ma/su/"

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/network/request/Request;-><init>(ILjava/lang/String;Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Lcom/helpshift/network/response/ResponseParser;)V

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestWithFullData()Lcom/helpshift/network/request/Request;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onBackground()V
    .locals 3

    .line 176
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 177
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 v1, 0x1

    const-string v2, "data_type_switch_user"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/controllers/SyncController;->setDataChangeCount(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public onForeground()V
    .locals 0

    return-void
.end method

.method public requestSwitch(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 95
    monitor-enter p0

    :try_start_0
    const-string v0, "Helpshift_SUControl"

    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requesting switch user : New Id : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", Old Id : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 98
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 99
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 100
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    goto :goto_0

    .line 103
    :cond_0
    invoke-virtual {p0, p2}, Lcom/helpshift/campaigns/controllers/SwitchUserController;->doneSwitch(Ljava/lang/String;)V

    .line 104
    monitor-exit p0

    return-void

    .line 108
    :cond_1
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    .line 109
    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    .line 111
    :goto_0
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "__hs_switch_prev_user"

    .line 112
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->prevUser:Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "__hs_switch_current_user"

    .line 113
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {p2, p1}, Lcom/helpshift/storage/KeyValueStorage;->setKeyValues(Ljava/util/Map;)Z

    .line 115
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string p2, "data_type_switch_user"

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Lcom/helpshift/controllers/SyncController;->incrementDataChangeCount(Ljava/lang/String;I)V

    .line 116
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->dataSyncCoordinator:Lcom/helpshift/controllers/DataSyncCoordinator;

    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/helpshift/controllers/DataSyncCoordinator;->switchUserPending(Ljava/lang/String;)V

    .line 118
    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setBatchSize(Ljava/lang/Integer;)V
    .locals 0

    return-void
.end method
