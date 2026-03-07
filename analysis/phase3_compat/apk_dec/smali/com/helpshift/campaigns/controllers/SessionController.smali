.class public Lcom/helpshift/campaigns/controllers/SessionController;
.super Ljava/lang/Object;
.source "SessionController.java"

# interfaces
.implements Lcom/helpshift/network/NetworkDataProvider;
.implements Lcom/helpshift/app/LifecycleListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "HelpshiftDebug"


# instance fields
.field private batchSize:Ljava/lang/Integer;

.field currentSession:Lcom/helpshift/campaigns/models/SessionModel;

.field public final storage:Lcom/helpshift/campaigns/storage/SessionStorage;

.field public final syncController:Lcom/helpshift/controllers/SyncController;

.field public final workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;


# direct methods
.method protected constructor <init>(Lcom/helpshift/controllers/SyncController;Lcom/helpshift/util/concurrent/DispatchQueue;Lcom/helpshift/campaigns/storage/SessionStorage;Ljava/lang/Integer;)V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SessionController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    .line 52
    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/SessionController;->storage:Lcom/helpshift/campaigns/storage/SessionStorage;

    .line 53
    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/SessionController;->batchSize:Ljava/lang/Integer;

    .line 54
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController;->syncController:Lcom/helpshift/controllers/SyncController;

    .line 56
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCampaignAppLifeCycleListener()Lcom/helpshift/app/CampaignAppLifeCycleListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 58
    invoke-virtual {p1, p0}, Lcom/helpshift/app/CampaignAppLifeCycleListener;->addLifecycleListener(Lcom/helpshift/app/LifecycleListener;)V

    .line 60
    :cond_0
    invoke-interface {p3}, Lcom/helpshift/campaigns/storage/SessionStorage;->cleanUpInvalidSessions()I

    .line 63
    sget-object p1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    invoke-interface {p3, p1}, Lcom/helpshift/campaigns/storage/SessionStorage;->getAllSessions(Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 64
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_2

    .line 65
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    .line 66
    new-array p3, p2, [Ljava/lang/String;

    const/4 p4, 0x0

    :goto_0
    if-ge p4, p2, :cond_1

    .line 68
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/models/SessionModel;

    iget-object v0, v0, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    aput-object v0, p3, p4

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    .line 70
    :cond_1
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController;->storage:Lcom/helpshift/campaigns/storage/SessionStorage;

    sget-object p2, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-interface {p1, p2, p3}, Lcom/helpshift/campaigns/storage/SessionStorage;->setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method private batchEvents(Ljava/util/ArrayList;Ljava/lang/Integer;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/campaigns/models/SessionModel;",
            ">;",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/SessionModel;",
            ">;"
        }
    .end annotation

    .line 154
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_1

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 158
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    mul-int/lit16 p2, p2, 0x400

    mul-int/lit16 p2, p2, 0x400

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 159
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/SessionModel;

    .line 160
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/SessionModel;->toData()Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 164
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 165
    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    array-length v1, v1

    .line 166
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v1, v2, :cond_2

    .line 167
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    div-int/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 168
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    div-int/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v0, 0x0

    .line 169
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, v0, p2}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p2

    const-string v0, "HelpshiftDebug"

    const-string v1, "Unsupported exception in batching events : "

    .line 173
    invoke-static {v0, v1, p2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    move-object p1, v0

    :cond_2
    :goto_1
    return-object p1
.end method


# virtual methods
.method public endSession()V
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/controllers/SessionController$2;

    invoke-direct {v1, p0, p0}, Lcom/helpshift/campaigns/controllers/SessionController$2;-><init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SessionController;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchSync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getCurrentSession()Lcom/helpshift/campaigns/models/SessionModel;
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    invoke-virtual {v0}, Lcom/helpshift/util/concurrent/DispatchQueue;->join()V

    .line 142
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    return-object v0
.end method

.method public getRequest()Lcom/helpshift/network/request/Request;
    .locals 13

    .line 188
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->storage:Lcom/helpshift/campaigns/storage/SessionStorage;

    sget-object v1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    .line 189
    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/SessionStorage;->getAllSessions(Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SessionController;->batchSize:Ljava/lang/Integer;

    invoke-direct {p0, v0, v1}, Lcom/helpshift/campaigns/controllers/SessionController;->batchEvents(Ljava/util/ArrayList;Ljava/lang/Integer;)Ljava/util/List;

    move-result-object v0

    .line 190
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_3

    .line 191
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 192
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 194
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v4

    iget-object v4, v4, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v4}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v4

    iget-object v4, v4, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 195
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v5

    iget-object v5, v5, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v5, v5, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v5}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    .line 197
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/helpshift/campaigns/models/SessionModel;

    .line 198
    iget-object v7, v6, Lcom/helpshift/campaigns/models/SessionModel;->userIdentifier:Ljava/lang/String;

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, v6, Lcom/helpshift/campaigns/models/SessionModel;->deviceIdentifier:Ljava/lang/String;

    .line 199
    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 200
    invoke-virtual {v6}, Lcom/helpshift/campaigns/models/SessionModel;->toData()Ljava/util/ArrayList;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 201
    iget-object v6, v6, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 204
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    return-object v2

    .line 207
    :cond_2
    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->fromListOfMaps(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object v0

    .line 208
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    const-string v1, "did"

    .line 209
    invoke-virtual {v9, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "uid"

    .line 210
    invoke-virtual {v9, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "e"

    invoke-virtual {v9, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 214
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SessionController;->storage:Lcom/helpshift/campaigns/storage/SessionStorage;

    sget-object v2, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    invoke-interface {v1, v2, v0}, Lcom/helpshift/campaigns/storage/SessionStorage;->setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;)V

    .line 216
    new-instance v10, Lcom/helpshift/campaigns/controllers/SessionController$4;

    invoke-direct {v10, p0, p0, v0}, Lcom/helpshift/campaigns/controllers/SessionController$4;-><init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SessionController;[Ljava/lang/String;)V

    .line 229
    new-instance v11, Lcom/helpshift/campaigns/controllers/SessionController$5;

    invoke-direct {v11, p0, p0, v0}, Lcom/helpshift/campaigns/controllers/SessionController$5;-><init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SessionController;[Ljava/lang/String;)V

    .line 237
    new-instance v2, Lcom/helpshift/network/request/Request;

    const/4 v7, 0x1

    new-instance v12, Lcom/helpshift/network/response/JsonArrayResponseParser;

    invoke-direct {v12}, Lcom/helpshift/network/response/JsonArrayResponseParser;-><init>()V

    const-string v8, "/ma/session/"

    move-object v6, v2

    invoke-direct/range {v6 .. v12}, Lcom/helpshift/network/request/Request;-><init>(ILjava/lang/String;Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Lcom/helpshift/network/response/ResponseParser;)V

    :cond_3
    return-object v2
.end method

.method public getRequestWithFullData()Lcom/helpshift/network/request/Request;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public isSessionActive()Z
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onBackground()V
    .locals 0

    .line 264
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/SessionController;->endSession()V

    return-void
.end method

.method public onForeground()V
    .locals 0

    .line 259
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/SessionController;->startSession()V

    return-void
.end method

.method public setBatchSize(Ljava/lang/Integer;)V
    .locals 0

    .line 254
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController;->batchSize:Ljava/lang/Integer;

    return-void
.end method

.method public startSession()V
    .locals 2

    .line 84
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/controllers/SessionController$1;

    invoke-direct {v1, p0, p0}, Lcom/helpshift/campaigns/controllers/SessionController$1;-><init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SessionController;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public storeSession()V
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->storage:Lcom/helpshift/campaigns/storage/SessionStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/SessionStorage;->storeSession(Lcom/helpshift/campaigns/models/SessionModel;)V

    return-void
.end method

.method public updateDurations()V
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/controllers/SessionController$3;

    invoke-direct {v1, p0, p0}, Lcom/helpshift/campaigns/controllers/SessionController$3;-><init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SessionController;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public updateSession()V
    .locals 2

    .line 137
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController;->storage:Lcom/helpshift/campaigns/storage/SessionStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/SessionStorage;->updateSession(Lcom/helpshift/campaigns/models/SessionModel;)V

    return-void
.end method
