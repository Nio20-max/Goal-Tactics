.class public Lcom/helpshift/campaigns/presenters/CampaignListPresenter;
.super Ljava/lang/Object;
.source "CampaignListPresenter.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignListObserver;
.implements Landroidx/appcompat/widget/SearchView$OnQueryTextListener;
.implements Landroidx/core/view/MenuItemCompat$OnActionExpandListener;
.implements Landroid/view/MenuItem$OnActionExpandListener;


# static fields
.field private static campaignClickedFromSearchResult:Z

.field private static currentQuery:Ljava/lang/String;

.field private static retainSearchState:Z


# instance fields
.field private final campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

.field private observers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addObserver(Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;)V
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public campaignAdded()V
    .locals 2

    .line 171
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;

    .line 172
    invoke-interface {v1}, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;->dataChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public campaignIconImageDownloaded()V
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;

    .line 179
    invoke-interface {v1}, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;->dataChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public campaignMarkedAsSeen()V
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;

    .line 186
    invoke-interface {v1}, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;->dataChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public cleanUp()V
    .locals 2

    .line 265
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->cleanUp()V

    .line 266
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->setObserver(Lcom/helpshift/campaigns/observers/CampaignListObserver;)V

    return-void
.end method

.method public cleanUpExpiredCampaigns()V
    .locals 1

    .line 270
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->cleanUpExpiredCampaigns()V

    return-void
.end method

.method public deleteRow(IZ)V
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 142
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->deleteCampaign(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public getBody(I)Ljava/lang/String;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 107
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBody()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    return-object p1
.end method

.method public getCampaignId(I)Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 55
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    return-object p1
.end method

.method public getCountOfCampaigns()I
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCountOfCampaigns()I

    move-result v0

    return v0
.end method

.method public getCurrentQuery()Ljava/lang/String;
    .locals 1

    .line 256
    sget-object v0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->currentQuery:Ljava/lang/String;

    return-object v0
.end method

.method public getIconImage(I)Ljava/util/HashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 62
    iget-object v1, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v1, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    const/4 v1, -0x1

    if-eqz p1, :cond_0

    .line 67
    iget-object v2, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/helpshift/util/ImageUtil;->getBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 68
    iget-object v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    const-string v3, ""

    :goto_0
    if-nez v2, :cond_2

    const/4 v2, 0x1

    .line 72
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v4, "default"

    invoke-virtual {v0, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v4, Lcom/helpshift/R$drawable;->hs__cam_inbox_default_icon:I

    invoke-static {v2, v4, v1}, Lcom/helpshift/util/ImageUtil;->getBitmap(Landroid/content/res/Resources;II)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz p1, :cond_3

    .line 77
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 78
    iget-object v1, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    .line 79
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 80
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 81
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 83
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 86
    :cond_1
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    .line 87
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    .line 86
    invoke-virtual {v1, v3, p1}, Lcom/helpshift/campaigns/controllers/InboxSyncController;->startIconImageDownload(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 97
    :cond_2
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object p1

    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    invoke-virtual {p1, v3}, Lcom/helpshift/campaigns/controllers/InboxSyncController;->resetCorruptImageDownloadRetryCount(Ljava/lang/String;)V

    :cond_3
    :goto_1
    const-string p1, "bitmap"

    .line 99
    invoke-virtual {v0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getReadStatus(I)Z
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 116
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getReadStatus()Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getRetainSearchState()Z
    .locals 1

    .line 225
    sget-boolean v0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->retainSearchState:Z

    return v0
.end method

.method public getSeenStatus(I)Z
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 125
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getSeenStatus()Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getTimestamp(I)J
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 134
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getCreatedAt()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public getTitle(I)Ljava/lang/String;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 46
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getTitle()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    return-object p1
.end method

.method public markCampaignAsRead(I)V
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->getCampaign(I)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 157
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->markCampaignAsRead(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onMenuItemActionCollapse(Landroid/view/MenuItem;)Z
    .locals 1

    .line 248
    iget-object p1, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;

    .line 249
    invoke-interface {v0}, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;->searchActionStopped()V

    goto :goto_0

    .line 251
    :cond_0
    iget-object p1, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->searchActionStopped()V

    const/4 p1, 0x1

    return p1
.end method

.method public onMenuItemActionExpand(Landroid/view/MenuItem;)Z
    .locals 1

    .line 238
    iget-object p1, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;

    .line 239
    invoke-interface {v0}, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;->searchActionStarted()V

    goto :goto_0

    .line 242
    :cond_0
    iget-object p1, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->searchActionStarted()V

    const/4 p1, 0x1

    return p1
.end method

.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 2

    .line 205
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;

    .line 206
    invoke-interface {v1}, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;->performedSearch()V

    goto :goto_0

    .line 210
    :cond_0
    sget-boolean v0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignClickedFromSearchResult:Z

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    .line 211
    sput-boolean p1, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignClickedFromSearchResult:Z

    goto :goto_1

    .line 214
    :cond_1
    sput-object p1, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->currentQuery:Ljava/lang/String;

    .line 215
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->performSearch(Ljava/lang/String;)V

    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public performSearch(Ljava/lang/String;)V
    .locals 1

    .line 221
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->performSearch(Ljava/lang/String;)V

    return-void
.end method

.method public removeObserver(Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;)V
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public searchResultsUpdated()V
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->observers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;

    .line 193
    invoke-interface {v1}, Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;->dataChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setCampaignClickedFromSearchResult(Z)V
    .locals 0

    .line 233
    sput-boolean p1, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignClickedFromSearchResult:Z

    return-void
.end method

.method public setRetainSearchState(Z)V
    .locals 0

    .line 229
    sput-boolean p1, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->retainSearchState:Z

    return-void
.end method

.method public setUp()V
    .locals 1

    .line 260
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->setUp()V

    .line 261
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->setObserver(Lcom/helpshift/campaigns/observers/CampaignListObserver;)V

    return-void
.end method

.method public undoDeletedCampaign()V
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->undoDeletedCampaign()V

    return-void
.end method

.method public undoTimedOut()V
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->campaignListInteractor:Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;->undoTimedOut()V

    return-void
.end method
