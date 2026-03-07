.class public Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;
.super Ljava/lang/Object;
.source "CampaignDetailInteractor.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignStorageObserver;


# instance fields
.field private campaignDetailModel:Lcom/helpshift/campaigns/models/CampaignDetailModel;

.field private campaignId:Ljava/lang/String;

.field private observers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/observers/CampaignDetailObserver;",
            ">;"
        }
    .end annotation
.end field

.field private storage:Lcom/helpshift/campaigns/storage/CampaignStorage;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/helpshift/campaigns/storage/CampaignStorage;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p2, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->storage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 23
    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignId:Ljava/lang/String;

    .line 24
    invoke-interface {p2, p1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->getCampaign(Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignDetailModel:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 25
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->observers:Ljava/util/List;

    return-void
.end method

.method public static newInstance(Ljava/lang/String;Lcom/helpshift/campaigns/storage/CampaignStorage;Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;)Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;
    .locals 1

    .line 31
    invoke-interface {p1, p0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->getCampaign(Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-nez v0, :cond_1

    .line 34
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    .line 35
    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 32
    invoke-interface {p2, p0, v0}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->getCampaign(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignSyncModel;

    move-result-object p2

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p2, 0x1

    :goto_1
    if-eqz p2, :cond_2

    .line 38
    new-instance p2, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-direct {p2, p0, p1}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;-><init>(Ljava/lang/String;Lcom/helpshift/campaigns/storage/CampaignStorage;)V

    goto :goto_2

    :cond_2
    const/4 p2, 0x0

    :goto_2
    return-object p2
.end method


# virtual methods
.method public addObserver(Lcom/helpshift/campaigns/observers/CampaignDetailObserver;)V
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->observers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public campaignCoverImageFilePathUpdated(Ljava/lang/String;)V
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->storage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->getCampaign(Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignDetailModel:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 83
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->observers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/observers/CampaignDetailObserver;

    .line 84
    invoke-interface {v0}, Lcom/helpshift/campaigns/observers/CampaignDetailObserver;->campaignCoverImageDownloaded()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public campaignDeleted(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignDetailModelAdded(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V
    .locals 1

    .line 61
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 62
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->storage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignId:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->getCampaign(Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignDetailModel:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 63
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->observers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/observers/CampaignDetailObserver;

    .line 64
    invoke-interface {v0}, Lcom/helpshift/campaigns/observers/CampaignDetailObserver;->campaignDetailAdded()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public campaignIconImageFilePathUpdated(Ljava/lang/String;)V
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->storage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->getCampaign(Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignDetailModel:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 73
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->observers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/observers/CampaignDetailObserver;

    .line 74
    invoke-interface {v0}, Lcom/helpshift/campaigns/observers/CampaignDetailObserver;->campaignIconImageDownloaded()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public campaignRead(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignSeen(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public cleanUp()V
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->storage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->removeObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    return-void
.end method

.method public executeAction(ILandroid/app/Activity;)V
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignDetailModel:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->executeAction(ILandroid/app/Activity;)V

    return-void
.end method

.method public getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignDetailModel:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    return-object v0
.end method

.method public markCampaignAsSeen()V
    .locals 4

    .line 44
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->storage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignId:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->markCampaignAsSeen(Ljava/lang/String;)V

    .line 45
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    sget-object v1, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->VIEW:Ljava/lang/Integer;

    iget-object v2, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->campaignId:Ljava/lang/String;

    const/4 v3, 0x0

    .line 48
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 46
    invoke-virtual {v0, v1, v2, v3}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public removeObserver(Lcom/helpshift/campaigns/observers/CampaignDetailObserver;)V
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->observers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public setUp()V
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->storage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->addObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    return-void
.end method
