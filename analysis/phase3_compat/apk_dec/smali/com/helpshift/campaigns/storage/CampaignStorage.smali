.class public interface abstract Lcom/helpshift/campaigns/storage/CampaignStorage;
.super Ljava/lang/Object;
.source "CampaignStorage.java"


# virtual methods
.method public abstract addCampaign(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V
.end method

.method public abstract addObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V
.end method

.method public abstract deleteCampaign(Ljava/lang/String;)V
.end method

.method public abstract deleteCampaigns([Ljava/lang/String;)V
.end method

.method public abstract getAllCampaigns(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAllCampaigns(ZLjava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getCampaign(Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignDetailModel;
.end method

.method public abstract markCampaignAsRead(Ljava/lang/String;)V
.end method

.method public abstract markCampaignAsSeen(Ljava/lang/String;)V
.end method

.method public abstract removeObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V
.end method

.method public abstract updateCampaignWIthCoverImageFilePath(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract updateCampaignWithIconImageFilePath(Ljava/lang/String;Ljava/lang/String;)V
.end method
