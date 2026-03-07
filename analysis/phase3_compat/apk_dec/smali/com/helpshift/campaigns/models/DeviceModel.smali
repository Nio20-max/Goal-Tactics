.class public Lcom/helpshift/campaigns/models/DeviceModel;
.super Ljava/lang/Object;
.source "DeviceModel.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_DeviceModel"


# instance fields
.field device:Lcom/helpshift/campaigns/models/Device;

.field identifier:Ljava/lang/String;

.field private properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation
.end field

.field storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

.field workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;


# direct methods
.method public constructor <init>(Lcom/helpshift/campaigns/models/Device;Lcom/helpshift/campaigns/storage/PropertyStorage;Lcom/helpshift/util/concurrent/DispatchQueue;)V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    .line 38
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v0}, Lcom/helpshift/model/SdkInfoModel;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 41
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v1, v0}, Lcom/helpshift/model/SdkInfoModel;->addDeviceId(Ljava/lang/String;)V

    .line 44
    :cond_0
    iput-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    .line 45
    iput-object p2, p0, Lcom/helpshift/campaigns/models/DeviceModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    .line 46
    invoke-interface {p2, v0}, Lcom/helpshift/campaigns/storage/PropertyStorage;->initSecondaryStorage(Ljava/lang/String;)V

    .line 47
    iput-object p1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->device:Lcom/helpshift/campaigns/models/Device;

    .line 48
    iput-object p3, p0, Lcom/helpshift/campaigns/models/DeviceModel;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/campaigns/models/DeviceModel;)Ljava/util/Map;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    return-object p0
.end method


# virtual methods
.method public checkAndMarkPropertiesAsSynced(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 236
    iget-object p1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v0, Lcom/helpshift/campaigns/models/DeviceModel$5;

    invoke-direct {v0, p0, p0}, Lcom/helpshift/campaigns/models/DeviceModel$5;-><init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;)V

    invoke-virtual {p1, v0}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getPropertyValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 113
    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v3, Lcom/helpshift/campaigns/models/DeviceModel$1;

    invoke-direct {v3, p0, p1, v0}, Lcom/helpshift/campaigns/models/DeviceModel$1;-><init>(Lcom/helpshift/campaigns/models/DeviceModel;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchSync(Ljava/lang/Runnable;)V

    .line 122
    aget-object p1, v0, v2

    return-object p1
.end method

.method public getSyncedAndUnSyncedProperties()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .line 193
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 195
    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v2, Lcom/helpshift/campaigns/models/DeviceModel$4;

    invoke-direct {v2, p0, p0, v0}, Lcom/helpshift/campaigns/models/DeviceModel$4;-><init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;Ljava/util/HashMap;)V

    invoke-virtual {v1, v2}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchSync(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method public getSyncingPropertiesUnsafe()Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .line 216
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 217
    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 218
    iget-object v3, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/campaigns/models/PropertyValue;

    if-eqz v3, :cond_0

    .line 219
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 220
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/PropertyValue;->getValueInfo()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getUnsyncedProperties()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation

    .line 169
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 171
    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v2, Lcom/helpshift/campaigns/models/DeviceModel$3;

    invoke-direct {v2, p0, p0, v0}, Lcom/helpshift/campaigns/models/DeviceModel$3;-><init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;Ljava/util/HashMap;)V

    invoke-virtual {v1, v2}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchSync(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method public init()V
    .locals 4

    .line 52
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/PropertyStorage;->getAllSecondaryProperties(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 54
    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    const-string v1, "ll"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 59
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/helpshift/campaigns/storage/PropertyStorage;->removePropertySecondaryStorage(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    const-string v1, "np"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_2

    .line 64
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    new-instance v2, Lcom/helpshift/campaigns/models/PropertyValue;

    const-string v3, "android"

    invoke-direct {v2, v3}, Lcom/helpshift/campaigns/models/PropertyValue;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    .line 66
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/PropertyValue;

    iget-object v3, p0, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    .line 65
    invoke-interface {v0, v1, v2, v3}, Lcom/helpshift/campaigns/storage/PropertyStorage;->setSecondaryProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Ljava/lang/String;)V

    .line 70
    :cond_2
    invoke-virtual {p0}, Lcom/helpshift/campaigns/models/DeviceModel;->rescanDevice()V

    return-void
.end method

.method public rescanDevice()V
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/models/DeviceModel$2;

    invoke-direct {v1, p0, p0}, Lcom/helpshift/campaigns/models/DeviceModel$2;-><init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setDevelopmentPlatform(Ljava/lang/String;)V
    .locals 1

    const-string v0, "dp"

    .line 160
    invoke-virtual {p0, v0, p1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    if-eqz p2, :cond_2

    .line 91
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/models/PropertyValue;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 93
    invoke-virtual {v0, p2}, Lcom/helpshift/campaigns/models/PropertyValue;->setValue(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    if-nez v0, :cond_1

    .line 97
    new-instance v0, Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-direct {v0, p2}, Lcom/helpshift/campaigns/models/PropertyValue;-><init>(Ljava/lang/Object;)V

    .line 98
    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/PropertyValue;->getType()Ljava/lang/String;

    move-result-object p2

    const-string/jumbo v1, "u"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    xor-int/lit8 v1, p2, 0x1

    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 102
    iget-object p2, p0, Lcom/helpshift/campaigns/models/DeviceModel;->properties:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object p2, p0, Lcom/helpshift/campaigns/models/DeviceModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    invoke-interface {p2, p1, v0, v1}, Lcom/helpshift/campaigns/storage/PropertyStorage;->setSecondaryProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Ljava/lang/String;)V

    .line 104
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/models/DeviceModel;->shouldDevicePropertySyncImmediately(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 105
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p1

    iget-object p1, p1, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/helpshift/model/SdkInfoModel;->setDevicePropertiesSyncImmediately(Ljava/lang/Boolean;)V

    :cond_2
    return-void
.end method

.method public setPushToken(Ljava/lang/String;)V
    .locals 1

    const-string v0, "pt"

    .line 151
    invoke-virtual {p0, v0, p1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 270
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/models/DeviceModel$6;

    invoke-direct {v1, p0, p0, p1, p2}, Lcom/helpshift/campaigns/models/DeviceModel$6;-><init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;Ljava/lang/Integer;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method shouldDevicePropertySyncImmediately(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "av"

    .line 288
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "os"

    .line 289
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pt"

    .line 290
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method
