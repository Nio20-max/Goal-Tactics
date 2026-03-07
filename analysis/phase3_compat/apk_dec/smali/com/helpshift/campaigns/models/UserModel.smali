.class public Lcom/helpshift/campaigns/models/UserModel;
.super Ljava/lang/Object;
.source "UserModel.java"


# instance fields
.field public email:Ljava/lang/String;

.field public final identifier:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field properties:Ljava/util/Map;
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


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/helpshift/campaigns/storage/PropertyStorage;)V
    .locals 2

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    .line 33
    iput-object p2, p0, Lcom/helpshift/campaigns/models/UserModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    .line 34
    invoke-interface {p2, p1}, Lcom/helpshift/campaigns/storage/PropertyStorage;->getAllProperties(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 36
    iget-object v1, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    const-string v0, "name"

    .line 39
    invoke-interface {p2, v0, p1}, Lcom/helpshift/campaigns/storage/PropertyStorage;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/PropertyValue;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 41
    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/PropertyValue;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->name:Ljava/lang/String;

    :cond_1
    const-string v0, "email"

    .line 44
    invoke-interface {p2, v0, p1}, Lcom/helpshift/campaigns/storage/PropertyStorage;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/PropertyValue;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 46
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/PropertyValue;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/UserModel;->email:Ljava/lang/String;

    :cond_2
    return-void
.end method


# virtual methods
.method public addProperties(Ljava/util/HashMap;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 81
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 82
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-virtual {p0, v2, v3}, Lcom/helpshift/campaigns/models/UserModel;->addProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 83
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public addProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Z
    .locals 3

    .line 59
    iget-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/models/PropertyValue;

    if-eqz v0, :cond_2

    .line 63
    invoke-virtual {v0, p2}, Lcom/helpshift/campaigns/models/PropertyValue;->setValue(Lcom/helpshift/campaigns/models/PropertyValue;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_3

    .line 67
    iget-object v1, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    iget-object v1, p0, Lcom/helpshift/campaigns/models/UserModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    invoke-interface {v1, p1, p2, v2}, Lcom/helpshift/campaigns/storage/PropertyStorage;->setProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Ljava/lang/String;)V

    :cond_3
    return v0
.end method

.method public checkAndMarkPropertiesAsSynced(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 168
    iget-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    .line 169
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 170
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 171
    iget-object v2, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/PropertyValue;

    if-eqz v2, :cond_0

    .line 172
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 173
    sget-object v3, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCED:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Lcom/helpshift/campaigns/models/PropertyValue;->setIsSynced(Ljava/lang/Integer;)V

    .line 174
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 177
    :cond_1
    iget-object p1, p0, Lcom/helpshift/campaigns/models/UserModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    sget-object v1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCED:Ljava/lang/Integer;

    .line 178
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 177
    invoke-interface {p1, v1, v0, v2}, Lcom/helpshift/campaigns/storage/PropertyStorage;->setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public getAllProperties()Ljava/util/Map;
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

    .line 158
    iget-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    return-object v0
.end method

.method public getSyncedAndUnSyncedProperties()Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 116
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 118
    iget-object v1, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    if-eqz v1, :cond_2

    .line 119
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 120
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 121
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/PropertyValue;

    if-eqz v2, :cond_0

    .line 122
    sget-object v4, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object v5

    if-eq v4, v5, :cond_1

    sget-object v4, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCED:Ljava/lang/Integer;

    .line 123
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object v5

    if-ne v4, v5, :cond_0

    .line 124
    :cond_1
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public getSyncingProperties()Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 138
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 140
    iget-object v1, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    if-eqz v1, :cond_1

    .line 141
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

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

    check-cast v2, Ljava/util/Map$Entry;

    .line 142
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 143
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/PropertyValue;

    .line 144
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 145
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getUnsyncedProperties()Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 95
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 97
    iget-object v1, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    if-eqz v1, :cond_1

    .line 98
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

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

    check-cast v2, Ljava/util/Map$Entry;

    .line 99
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 100
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/PropertyValue;

    .line 101
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 102
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 211
    iput-object p1, p0, Lcom/helpshift/campaigns/models/UserModel;->name:Ljava/lang/String;

    .line 212
    iput-object p2, p0, Lcom/helpshift/campaigns/models/UserModel;->email:Ljava/lang/String;

    return-void
.end method

.method public setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 191
    iget-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    .line 192
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 193
    iget-object v2, p0, Lcom/helpshift/campaigns/models/UserModel;->properties:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/models/PropertyValue;

    if-eqz v1, :cond_0

    .line 195
    invoke-virtual {v1, p1}, Lcom/helpshift/campaigns/models/PropertyValue;->setIsSynced(Ljava/lang/Integer;)V

    goto :goto_0

    .line 198
    :cond_1
    iget-object v0, p0, Lcom/helpshift/campaigns/models/UserModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    .line 199
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 198
    invoke-interface {v0, p1, p2, v1}, Lcom/helpshift/campaigns/storage/PropertyStorage;->setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
