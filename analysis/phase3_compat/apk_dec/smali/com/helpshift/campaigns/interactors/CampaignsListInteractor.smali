.class public Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;
.super Ljava/lang/Object;
.source "CampaignsListInteractor.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignStorageObserver;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_CampListInt"


# instance fields
.field private allCampaigns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation
.end field

.field private campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

.field private campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

.field private campaignsToShow:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private observer:Lcom/helpshift/campaigns/observers/CampaignListObserver;

.field private searchStarted:Z

.field private undoPosition:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->searchStarted:Z

    .line 33
    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->context:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 35
    invoke-direct {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    .line 36
    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Campaigns to show : "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Helpshift_CampListInt"

    invoke-static {p2, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private deleteCampaignFromStorage()V
    .locals 4

    .line 86
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    if-eqz v0, :cond_1

    .line 87
    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 88
    iget-object v1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v1, v0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->deleteCampaign(Ljava/lang/String;)V

    .line 89
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    sget-object v2, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->MARK_AS_DELETE:Ljava/lang/Integer;

    const/4 v3, 0x0

    .line 92
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 90
    invoke-virtual {v1, v2, v0, v3}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 94
    iget-boolean v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->searchStarted:Z

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    iget-object v1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_0
    const/4 v0, 0x0

    .line 97
    iput-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    :cond_1
    return-void
.end method

.method private getAllActiveCampaigns()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 58
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    .line 59
    invoke-virtual {v2}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 57
    invoke-static {v0, v1, v2}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->cleanAndGetActiveCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private removeCampaignFromUi(Ljava/lang/String;)Z
    .locals 4

    .line 64
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 65
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    .line 67
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 68
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v1, v2

    :cond_1
    if-eqz v1, :cond_2

    .line 74
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->undoPosition:I

    .line 75
    iput-object v1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 76
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 77
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/helpshift/util/ApplicationUtil;->cancelNotification(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public campaignCoverImageFilePathUpdated(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignDeleted(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignDetailModelAdded(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V
    .locals 1

    .line 202
    invoke-direct {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    .line 203
    iget-boolean v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->searchStarted:Z

    if-nez v0, :cond_0

    .line 204
    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    .line 207
    :cond_0
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->observer:Lcom/helpshift/campaigns/observers/CampaignListObserver;

    if-eqz p1, :cond_1

    .line 208
    invoke-interface {p1}, Lcom/helpshift/campaigns/observers/CampaignListObserver;->campaignAdded()V

    :cond_1
    return-void
.end method

.method public campaignIconImageFilePathUpdated(Ljava/lang/String;)V
    .locals 4

    .line 214
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    if-eqz v0, :cond_3

    const/4 v1, -0x1

    const/4 v2, 0x0

    .line 217
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    add-int/lit8 v1, v1, 0x1

    .line 219
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    :cond_1
    if-ltz v1, :cond_2

    .line 225
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    .line 226
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    if-eqz v2, :cond_2

    .line 228
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    iget-object v2, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v2, p1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->getCampaign(Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 231
    :cond_2
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->observer:Lcom/helpshift/campaigns/observers/CampaignListObserver;

    if-eqz p1, :cond_3

    .line 232
    invoke-interface {p1}, Lcom/helpshift/campaigns/observers/CampaignListObserver;->campaignIconImageDownloaded()V

    :cond_3
    return-void
.end method

.method public campaignRead(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public campaignSeen(Ljava/lang/String;)V
    .locals 3

    .line 254
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 255
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 256
    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p1, 0x1

    .line 257
    invoke-virtual {v1, p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->setSeenStatus(Z)V

    .line 258
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->observer:Lcom/helpshift/campaigns/observers/CampaignListObserver;

    if-eqz p1, :cond_1

    .line 259
    invoke-interface {p1}, Lcom/helpshift/campaigns/observers/CampaignListObserver;->campaignMarkedAsSeen()V

    :cond_1
    return-void
.end method

.method public cleanUp()V
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->removeObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    return-void
.end method

.method public cleanUpExpiredCampaigns()V
    .locals 2

    .line 194
    invoke-direct {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    .line 195
    iget-boolean v1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->searchStarted:Z

    if-nez v1, :cond_0

    .line 196
    iput-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    :cond_0
    return-void
.end method

.method public deleteCampaign(Ljava/lang/String;Z)V
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    if-eqz v0, :cond_0

    .line 103
    invoke-direct {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->deleteCampaignFromStorage()V

    .line 106
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->removeCampaignFromUi(Ljava/lang/String;)Z

    if-nez p2, :cond_1

    .line 108
    invoke-direct {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->deleteCampaignFromStorage()V

    :cond_1
    return-void
.end method

.method public getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    if-ltz p1, :cond_0

    .line 42
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getCountOfCampaigns()I
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 51
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public markCampaignAsRead(Ljava/lang/String;)V
    .locals 3

    .line 124
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 125
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->markCampaignAsRead(Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 127
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 128
    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p1, 0x1

    .line 129
    invoke-virtual {v1, p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->setReadStatus(Z)V

    .line 130
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object p1

    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    sget-object v0, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->MARK_AS_READ:Ljava/lang/Integer;

    .line 132
    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 133
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 131
    invoke-virtual {p1, v0, v1, v2}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    :cond_1
    return-void
.end method

.method public performSearch(Ljava/lang/String;)V
    .locals 10

    .line 142
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->undoTimedOut()V

    .line 146
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_6

    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    if-eqz v0, :cond_6

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 148
    iget-object v1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 149
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 150
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 151
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\s+"

    .line 152
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 153
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getTitle()Ljava/lang/String;

    move-result-object v4

    .line 154
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBody()Ljava/lang/String;

    move-result-object v5

    .line 155
    array-length v6, v3

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v6, :cond_1

    aget-object v8, v3, v7

    if-eqz v5, :cond_2

    .line 156
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    :cond_2
    if-eqz v4, :cond_4

    .line 157
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 158
    :cond_3
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 163
    :cond_5
    iput-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    goto :goto_2

    .line 166
    :cond_6
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    .line 169
    :goto_2
    iget-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->observer:Lcom/helpshift/campaigns/observers/CampaignListObserver;

    if-eqz p1, :cond_7

    .line 170
    invoke-interface {p1}, Lcom/helpshift/campaigns/observers/CampaignListObserver;->searchResultsUpdated()V

    :cond_7
    return-void
.end method

.method public searchActionStarted()V
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    if-eqz v0, :cond_0

    .line 176
    invoke-virtual {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->undoTimedOut()V

    :cond_0
    const/4 v0, 0x1

    .line 179
    iput-boolean v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->searchStarted:Z

    return-void
.end method

.method public searchActionStopped()V
    .locals 1

    const/4 v0, 0x0

    .line 183
    iput-boolean v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->searchStarted:Z

    .line 185
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->undoTimedOut()V

    .line 189
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->allCampaigns:Ljava/util/List;

    .line 190
    iput-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    return-void
.end method

.method public setObserver(Lcom/helpshift/campaigns/observers/CampaignListObserver;)V
    .locals 0

    .line 268
    iput-object p1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->observer:Lcom/helpshift/campaigns/observers/CampaignListObserver;

    return-void
.end method

.method public setUp()V
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->addObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    return-void
.end method

.method public undoDeletedCampaign()V
    .locals 3

    .line 117
    iget-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    if-eqz v0, :cond_0

    .line 118
    iget-object v1, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignsToShow:Ljava/util/List;

    iget v2, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->undoPosition:I

    invoke-interface {v1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    const/4 v0, 0x0

    .line 119
    iput-object v0, p0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->campaignToUndoDelete:Lcom/helpshift/campaigns/models/CampaignDetailModel;

    :cond_0
    return-void
.end method

.method public undoTimedOut()V
    .locals 0

    .line 113
    invoke-direct {p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->deleteCampaignFromStorage()V

    return-void
.end method
