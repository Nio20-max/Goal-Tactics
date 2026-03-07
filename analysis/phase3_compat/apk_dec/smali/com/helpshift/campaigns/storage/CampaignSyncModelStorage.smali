.class public interface abstract Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;
.super Ljava/lang/Object;
.source "CampaignSyncModelStorage.java"


# virtual methods
.method public abstract addCampaign(Lcom/helpshift/campaigns/models/CampaignSyncModel;Ljava/lang/String;)V
.end method

.method public abstract addObserver(Lcom/helpshift/campaigns/observers/CampaignSyncModelStorageObserver;)V
.end method

.method public abstract cleanUpSyncingModels(Ljava/lang/String;)V
.end method

.method public abstract destroyStorage(Ljava/lang/String;)V
.end method

.method public abstract getAllUnsyncedCampaigns(Ljava/lang/String;)Ljava/util/List;
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
.end method

.method public abstract getCampaign(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignSyncModel;
.end method

.method public abstract markCampaignAsSynced(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract markCampaignAsSyncing(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract markCampaignAsUnSynced(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract removeObserver(Lcom/helpshift/campaigns/observers/CampaignSyncModelStorageObserver;)V
.end method
