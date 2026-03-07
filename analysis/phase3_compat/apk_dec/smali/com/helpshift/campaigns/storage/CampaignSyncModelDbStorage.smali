.class public Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;
.super Ljava/lang/Object;
.source "CampaignSyncModelDbStorage.java"

# interfaces
.implements Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;


# static fields
.field private static final SYNC_MODEL_KEY_PREFIX:Ljava/lang/String; = "kCampaignSyncModels"


# instance fields
.field observers:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/helpshift/campaigns/observers/CampaignSyncModelStorageObserver;",
            ">;"
        }
    .end annotation
.end field

.field storage:Lcom/helpshift/storage/KeyValueStorage;

.field private workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;


# direct methods
.method public constructor <init>(Lcom/helpshift/storage/KeyValueStorage;Lcom/helpshift/util/concurrent/DispatchQueue;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    .line 23
    iput-object p2, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    .line 24
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object p1, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-void
.end method


# virtual methods
.method public addCampaign(Lcom/helpshift/campaigns/models/CampaignSyncModel;Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_1

    .line 34
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->creativeUrl:Ljava/lang/String;

    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 37
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$1;-><init>(Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;Ljava/lang/String;Lcom/helpshift/campaigns/models/CampaignSyncModel;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public addObserver(Lcom/helpshift/campaigns/observers/CampaignSyncModelStorageObserver;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 148
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public cleanUpSyncingModels(Ljava/lang/String;)V
    .locals 2

    .line 159
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;-><init>(Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public destroyStorage(Ljava/lang/String;)V
    .locals 3

    .line 29
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "kCampaignSyncModels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->removeKey(Ljava/lang/String;)V

    return-void
.end method

.method public getAllUnsyncedCampaigns(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignSyncModel;",
            ">;"
        }
    .end annotation

    .line 118
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "kCampaignSyncModels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 119
    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_1

    .line 123
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

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

    .line 124
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    if-eqz v2, :cond_0

    .line 125
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing()Z

    move-result v3

    if-nez v3, :cond_0

    .line 126
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getCampaign(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignSyncModel;
    .locals 3

    .line 137
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "kCampaignSyncModels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 138
    invoke-interface {v0, p2}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashMap;

    if-eqz p2, :cond_0

    .line 140
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public markCampaignAsSynced(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 61
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$2;-><init>(Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public markCampaignAsSyncing(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;

    invoke-direct {v1, p0, p2, p1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;-><init>(Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public markCampaignAsUnSynced(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 99
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$4;

    invoke-direct {v1, p0, p2, p1}, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$4;-><init>(Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public removeObserver(Lcom/helpshift/campaigns/observers/CampaignSyncModelStorageObserver;)V
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    return-void
.end method
