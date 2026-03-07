.class public Lcom/helpshift/campaigns/controllers/UserController;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Lcom/helpshift/network/NetworkDataProvider;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_UserControl"


# instance fields
.field private batchSize:Ljava/lang/Integer;

.field currentUser:Lcom/helpshift/campaigns/models/UserModel;

.field sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

.field private sessionController:Lcom/helpshift/campaigns/controllers/SessionController;

.field private storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

.field private switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

.field public final syncController:Lcom/helpshift/controllers/SyncController;

.field private workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;


# direct methods
.method protected constructor <init>(Lcom/helpshift/controllers/SyncController;Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/util/concurrent/DispatchQueue;Lcom/helpshift/campaigns/storage/PropertyStorage;Ljava/lang/Integer;Lcom/helpshift/model/SdkInfoModel;)V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/UserController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    .line 70
    iput-object p6, p0, Lcom/helpshift/campaigns/controllers/UserController;->batchSize:Ljava/lang/Integer;

    .line 71
    iput-object p7, p0, Lcom/helpshift/campaigns/controllers/UserController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    .line 72
    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController;->sessionController:Lcom/helpshift/campaigns/controllers/SessionController;

    .line 73
    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/UserController;->switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    .line 74
    iput-object p5, p0, Lcom/helpshift/campaigns/controllers/UserController;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    .line 78
    invoke-virtual {p7}, Lcom/helpshift/model/SdkInfoModel;->getCurrentLoggedInId()Ljava/lang/String;

    move-result-object p2

    .line 79
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 83
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {p2}, Lcom/helpshift/model/SdkInfoModel;->getDeviceId()Ljava/lang/String;

    move-result-object p2

    .line 86
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_1

    .line 89
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/controllers/UserController;->initializeForIdentifier(Ljava/lang/String;)V

    .line 90
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController;->syncController:Lcom/helpshift/controllers/SyncController;

    return-void

    .line 87
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Found no valid ID in user controller constructor."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private batchProperties(Ljava/util/HashMap;Ljava/lang/Integer;)Ljava/util/HashMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .line 330
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    .line 331
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    mul-int/lit16 p2, p2, 0x400

    mul-int/lit16 p2, p2, 0x400

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 333
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 334
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/campaigns/models/PropertyValue;

    .line 335
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/PropertyValue;->getValueInfo()Ljava/util/ArrayList;

    move-result-object v3

    .line 336
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 338
    :try_start_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    array-length v4, v4

    .line 339
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v5, v4

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-gt v5, v6, :cond_0

    .line 340
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    const-string v3, "Helpshift_UserControl"

    const-string v4, "Exception in batching : "

    .line 348
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private getAllPropertiesUnsafe()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 318
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/UserModel;->getAllProperties()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private initializeForIdentifier(Ljava/lang/String;)V
    .locals 2

    .line 104
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x0

    .line 106
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController;->currentUser:Lcom/helpshift/campaigns/models/UserModel;

    if-eqz v1, :cond_0

    .line 107
    iget-object v0, v1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 109
    :cond_0
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController;->currentUser:Lcom/helpshift/campaigns/models/UserModel;

    if-eqz v1, :cond_1

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 110
    :cond_1
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/storage/PropertyStorage;->initStorage(Ljava/lang/String;)V

    .line 111
    new-instance v0, Lcom/helpshift/campaigns/models/UserModel;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    invoke-direct {v0, p1, v1}, Lcom/helpshift/campaigns/models/UserModel;-><init>(Ljava/lang/String;Lcom/helpshift/campaigns/storage/PropertyStorage;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->currentUser:Lcom/helpshift/campaigns/models/UserModel;

    .line 112
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v0, p1}, Lcom/helpshift/model/SdkInfoModel;->setCurrentLoggedInId(Ljava/lang/String;)V

    .line 116
    :cond_2
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getSyncingPropertiesUnsafe()Ljava/util/HashMap;

    move-result-object p1

    .line 117
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-interface {v0, p1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 119
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object p1

    sget-object v1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/campaigns/models/UserModel;->setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V

    :cond_3
    return-void
.end method

.method private makeRequestForProperties(Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;)Lcom/helpshift/network/request/Request;
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
            ")",
            "Lcom/helpshift/network/request/Request;"
        }
    .end annotation

    .line 433
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 437
    :cond_0
    invoke-static {p1}, Lcom/helpshift/util/HSJSONUtils;->fromNestedMap(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    .line 438
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 439
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v1}, Lcom/helpshift/model/SdkInfoModel;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "did"

    invoke-virtual {v4, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    const-string/jumbo v2, "uid"

    invoke-virtual {v4, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "p"

    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    sget-object v1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/campaigns/models/UserModel;->setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V

    .line 444
    new-instance p1, Lcom/helpshift/network/request/Request;

    const/4 v2, 0x1

    new-instance v7, Lcom/helpshift/network/response/JsonArrayResponseParser;

    invoke-direct {v7}, Lcom/helpshift/network/response/JsonArrayResponseParser;-><init>()V

    const-string v3, "/ma/up/"

    move-object v1, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/network/request/Request;-><init>(ILjava/lang/String;Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Lcom/helpshift/network/response/ResponseParser;)V

    return-object p1
.end method


# virtual methods
.method public addProperties(Ljava/util/HashMap;)[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 263
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 264
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 265
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/SchemaUtil;->validatePropertyKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 269
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid property : Key : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", Value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Helpshift_UserControl"

    invoke-static {v2, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 272
    :cond_1
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/controllers/UserController$4;

    invoke-direct {v1, p0, v0, p0}, Lcom/helpshift/campaigns/controllers/UserController$4;-><init>(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/HashMap;Lcom/helpshift/campaigns/controllers/UserController;)V

    invoke-virtual {p1, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    .line 289
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    return-object p1
.end method

.method public addProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Z
    .locals 9

    .line 227
    invoke-static {p1}, Lcom/helpshift/util/SchemaUtil;->validatePropertyKey(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid property : Key : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", Value : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_UserControl"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    :cond_0
    iget-object v7, p0, Lcom/helpshift/campaigns/controllers/UserController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v8, Lcom/helpshift/campaigns/controllers/UserController$3;

    move-object v0, v8

    move-object v1, p0

    move v2, v6

    move-object v3, p1

    move-object v4, p2

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/campaigns/controllers/UserController$3;-><init>(Lcom/helpshift/campaigns/controllers/UserController;ZLjava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Lcom/helpshift/campaigns/controllers/UserController;)V

    invoke-virtual {v7, v8}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return v6
.end method

.method public getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->currentUser:Lcom/helpshift/campaigns/models/UserModel;

    return-object v0
.end method

.method public getRequest()Lcom/helpshift/network/request/Request;
    .locals 4

    .line 357
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getUnsyncedProperties()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController;->batchSize:Ljava/lang/Integer;

    invoke-direct {p0, v0, v1}, Lcom/helpshift/campaigns/controllers/UserController;->batchProperties(Ljava/util/HashMap;Ljava/lang/Integer;)Ljava/util/HashMap;

    move-result-object v0

    .line 358
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 360
    new-instance v2, Lcom/helpshift/campaigns/controllers/UserController$5;

    invoke-direct {v2, p0, p0, v1}, Lcom/helpshift/campaigns/controllers/UserController$5;-><init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;)V

    .line 367
    new-instance v3, Lcom/helpshift/campaigns/controllers/UserController$6;

    invoke-direct {v3, p0, p0, v1}, Lcom/helpshift/campaigns/controllers/UserController$6;-><init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;)V

    .line 373
    invoke-direct {p0, v0, v2, v3}, Lcom/helpshift/campaigns/controllers/UserController;->makeRequestForProperties(Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;)Lcom/helpshift/network/request/Request;

    move-result-object v0

    return-object v0
.end method

.method public getRequestWithFullData()Lcom/helpshift/network/request/Request;
    .locals 5

    .line 380
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/UserModel;->getSyncedAndUnSyncedProperties()Ljava/util/HashMap;

    move-result-object v0

    .line 381
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController;->batchSize:Ljava/lang/Integer;

    invoke-direct {p0, v0, v1}, Lcom/helpshift/campaigns/controllers/UserController;->batchProperties(Ljava/util/HashMap;Ljava/lang/Integer;)Ljava/util/HashMap;

    move-result-object v0

    .line 382
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 385
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getUnsyncedProperties()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 386
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 388
    new-instance v3, Lcom/helpshift/campaigns/controllers/UserController$7;

    invoke-direct {v3, p0, p0, v2}, Lcom/helpshift/campaigns/controllers/UserController$7;-><init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;)V

    .line 395
    new-instance v4, Lcom/helpshift/campaigns/controllers/UserController$8;

    invoke-direct {v4, p0, v2, v1, p0}, Lcom/helpshift/campaigns/controllers/UserController$8;-><init>(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/helpshift/campaigns/controllers/UserController;)V

    .line 406
    invoke-direct {p0, v0, v3, v4}, Lcom/helpshift/campaigns/controllers/UserController;->makeRequestForProperties(Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;)Lcom/helpshift/network/request/Request;

    move-result-object v0

    return-object v0
.end method

.method getSizeOfPropertiesMap(Ljava/util/Map;)Ljava/lang/Integer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;)",
            "Ljava/lang/Integer;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 199
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    if-eqz p1, :cond_1

    .line 200
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 201
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 202
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 203
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/campaigns/models/PropertyValue;

    .line 204
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/PropertyValue;->getValueInfo()Ljava/util/ArrayList;

    move-result-object v3

    .line 205
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 208
    :cond_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 210
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    array-length p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v1, "Helpshift_UserControl"

    const-string v2, "Exception while getting property size : "

    .line 213
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-object v0
.end method

.method getSizeOfUserProperties()Ljava/lang/Integer;
    .locals 1

    .line 195
    invoke-direct {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getAllPropertiesUnsafe()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/controllers/UserController;->getSizeOfPropertiesMap(Ljava/util/Map;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getSyncingPropertiesUnsafe()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 309
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/UserModel;->getSyncingProperties()Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public getUnsyncedProperties()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 299
    new-instance v0, Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/UserModel;->getUnsyncedProperties()Ljava/util/HashMap;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method handlePropertySyncFailure(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;Lcom/helpshift/network/errors/NetworkError;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/campaigns/controllers/UserController;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/helpshift/network/errors/NetworkError;",
            ")V"
        }
    .end annotation

    .line 426
    invoke-virtual {p1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    sget-object v1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-virtual {v0, v1, p2}, Lcom/helpshift/campaigns/models/UserModel;->setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V

    .line 427
    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/UserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string p2, "data_type_user"

    invoke-virtual {p1, p2, p3}, Lcom/helpshift/controllers/SyncController;->dataSyncFailed(Ljava/lang/String;Lcom/helpshift/network/errors/NetworkError;)V

    return-void
.end method

.method handlePropertySyncSuccess(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/campaigns/controllers/UserController;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 419
    iget-object v0, p1, Lcom/helpshift/campaigns/controllers/UserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string v1, "data_type_user"

    invoke-virtual {v0, v1, p3}, Lcom/helpshift/controllers/SyncController;->dataSynced(Ljava/lang/String;Z)V

    .line 420
    invoke-virtual {p1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/helpshift/campaigns/models/UserModel;->checkAndMarkPropertiesAsSynced(Ljava/util/List;)V

    .line 421
    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/UserController;->syncController:Lcom/helpshift/controllers/SyncController;

    .line 422
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->getUnsyncedProperties()Ljava/util/HashMap;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    move-result p2

    .line 421
    invoke-virtual {p1, v1, p2}, Lcom/helpshift/controllers/SyncController;->setDataChangeCount(Ljava/lang/String;I)V

    return-void
.end method

.method public login(Lcom/helpshift/HelpshiftUser;)Z
    .locals 3

    const/4 v0, 0x0

    const-string v1, ""

    const-string v2, "null"

    .line 168
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    .line 169
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/UserController;->logout()Z

    const/4 p1, 0x0

    return p1

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/controllers/UserController$2;

    invoke-direct {v1, p0, p0, p1}, Lcom/helpshift/campaigns/controllers/UserController$2;-><init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/HelpshiftUser;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchSync(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    return p1
.end method

.method public logout()Z
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->currentUser:Lcom/helpshift/campaigns/models/UserModel;

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v1}, Lcom/helpshift/model/SdkInfoModel;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/controllers/UserController$1;

    invoke-direct {v1, p0, p0}, Lcom/helpshift/campaigns/controllers/UserController$1;-><init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public setBatchSize(Ljava/lang/Integer;)V
    .locals 0

    .line 415
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController;->batchSize:Ljava/lang/Integer;

    return-void
.end method

.method public setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 462
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, v0

    :goto_0
    if-eqz p2, :cond_1

    .line 465
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 468
    :cond_1
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 469
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {p1}, Lcom/helpshift/util/HSPattern;->isValidName(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 470
    new-instance v1, Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-direct {v1, p1}, Lcom/helpshift/campaigns/models/PropertyValue;-><init>(Ljava/lang/Object;)V

    const-string v2, "name"

    .line 471
    invoke-virtual {p2, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {v0}, Lcom/helpshift/util/HSPattern;->isValidEmail(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 475
    new-instance v1, Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-direct {v1, v0}, Lcom/helpshift/campaigns/models/PropertyValue;-><init>(Ljava/lang/Object;)V

    const-string v2, "email"

    .line 476
    invoke-virtual {p2, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    :cond_3
    invoke-virtual {p0, p2}, Lcom/helpshift/campaigns/controllers/UserController;->addProperties(Ljava/util/HashMap;)[Ljava/lang/String;

    .line 480
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController;->currentUser:Lcom/helpshift/campaigns/models/UserModel;

    invoke-virtual {p2, p1, v0}, Lcom/helpshift/campaigns/models/UserModel;->setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method switchToUser(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 124
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 125
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->sessionController:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/SessionController;->isSessionActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController;->sessionController:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/controllers/SessionController;->endSession()V

    .line 129
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/controllers/UserController;->initializeForIdentifier(Ljava/lang/String;)V

    if-eqz v0, :cond_1

    .line 131
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->sessionController:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/SessionController;->startSession()V

    .line 135
    :cond_1
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController;->switchUserController:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/controllers/SwitchUserController;->requestSwitch(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
